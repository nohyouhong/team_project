package com.kh.team.controller;

import java.io.FileInputStream;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.MemberService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.MessageVo;
import com.kh.team.vo.PointVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/mapper", method=RequestMethod.GET) 
	public String home() {
		return "member/home";
	}
	
	@RequestMapping(value="/getMemberById", method=RequestMethod.GET) 
	public String getMemberById(String userid, Model model) {
		MemberVo memberVo = memberService.getMemberById(userid);
		model.addAttribute("memberVo", memberVo);
		return "member/info";
	}
	
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	@ResponseBody
	public int checkId(String userid) {
//		System.out.println("memberController 작동됨");
		int cnt = memberService.checkId(userid);
		return cnt;
	}
	
	@RequestMapping(value="/join_form", method=RequestMethod.GET)
	public String joinForm() {
		return "member/join_form";
	}

	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String loginForm() {
		return "member/login_form";
	}
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String info(String userid, Model model) {
		MemberVo memberVo = memberService.getMemberById(userid);
		model.addAttribute("memberVo", memberVo);
		return "member/info";
	}
	
	@RequestMapping(value="/point_list", method = RequestMethod.GET)
	public String pointList(String userid, Model model) {
		List<PointVo> point_list = memberService.getPoint_list(userid);
		model.addAttribute("point_list", point_list);
		return "point/point_list";
	};
	
	@RequestMapping(value="admin_page", method = RequestMethod.GET)
	public String adminPage(String userid, Model model) {
		return "member/admin_page";
	}
	
	@RequestMapping(value="/join_run", method=RequestMethod.POST)
	public String joinRun(MemberVo memberVo) {
		memberService.insertMember(memberVo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/login_run", method=RequestMethod.POST)
	public String login(String userid, String userpw, String saveId, 
			HttpSession session, RedirectAttributes rttr, HttpServletResponse response) {
		MemberVo memberVo = memberService.getMemberByIdAndPw(userid, userpw);
		System.out.println("memberVo" + memberVo);
		if(memberVo == null) {
			rttr.addFlashAttribute("login_result", "fail");
			return "redirect:/";
		} else {
			session.setAttribute("loginVo", memberVo);
			if(saveId != null && !saveId.equals("")) {
				Cookie cookie = new Cookie("saveId", userid);
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("saveId", userid);
				cookie.setPath("/");
				cookie.setMaxAge(0); 
				response.addCookie(cookie);
			}
			String targetLocation = (String)session.getAttribute("targetLocation");
			if(targetLocation == null || targetLocation.equals("")) {
				return "redirect:/";
			}else {
				return "redirect:" + targetLocation;
			}
		}
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/find_id_form", method=RequestMethod.GET)
	public String findId() {
		
		return "/member/find_id";
	}
	
	@RequestMapping(value="/find_id_run", method=RequestMethod.POST)
	@ResponseBody
	public List<String> findIdRun(String username, String email, String cellphone) {
		System.out.println("username: " + username);
		System.out.println("email: " + email);
		System.out.println("cellphone: " + cellphone);
		int count = memberService.recogExistId(username, email, cellphone);
		if (count > 0) {
			List<String> userids = memberService.findId(username, email, cellphone);
			return userids;				
		} else {
			return null;
		}
	}
	
	@RequestMapping(value="/find_pw_form", method=RequestMethod.GET)
	public String findPw() {
		
		return "/member/find_pw";
	}

	@RequestMapping(value="/chk_find_pw", method=RequestMethod.POST)
	@ResponseBody
	public String checkforFindPw(String userid, String username, String email) {
//		System.out.println("userid: " + userid);
//		System.out.println("username: " + username);
//		System.out.println("email: " + email);
		int count = memberService.recogId(userid, username, email);
		System.out.println("count: " + count);
		int rdKey = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		System.out.println("rdKey: " + rdKey);
		if (count > 0) {
			String subject = "비밀번호 재설정 안내 메일입니다."; // 메일 제목
			String content = "<html>"
					+ "<h1>비밀번호 재설정 인증번호입니다</h1>"
					+ "<label>비밀번호 재설정 번호: </label>"
					+ "<span>" + rdKey + "</span>"
					+ "<div>인증 번호를 입력하시면 비밀번호를 변경 가능합니다.</div>"
					+ "</html>"; // 메일 내용
			String from = "authorxzsad@gmail.com"; // 보내는사람 아이디@주소
			String to = ""; // 받는사람 아이디@주소
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); // true는 멀티파트 메세지를 사용하겠다는 의미
				mailHelper.setFrom(from);
				mailHelper.setTo(email);
				mailHelper.setSubject(subject);
				mailHelper.setText(content, true); // true는 html을 사용하겠다는 의미입니다.
				mailSender.send(mail);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			return String.valueOf(rdKey);			
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/find_pw_run", method=RequestMethod.POST)
	public String findPwRun(String userid, String username, String email, String verif_code, String rdKey) {
		System.out.println("userid: " + userid);
		System.out.println("username: " + username);
		System.out.println("email: " + email);
		System.out.println("verif_code: " + verif_code);
		System.out.println("rdKey: " + rdKey);
		if (verif_code == rdKey) {
			return "/member/";
		} else {
			return null;			
		}
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String filename) throws Exception{
		FileInputStream fis = new FileInputStream(filename);
		byte[] data = IOUtils.toByteArray(fis);
		fis.close();
		return data;
	}
	
	@RequestMapping(value="/updateUserImage", method = RequestMethod.POST)
	@ResponseBody
	public String updateUserImage(String filename, HttpSession session) {
		MemberVo loginVo = (MemberVo)session.getAttribute("loginVo");
		String userid = loginVo.getUserid();
		boolean result = memberService.updateUserImage(filename, userid);
		return String.valueOf(result);
	}
	
	@RequestMapping(value="/uploadFile", method=RequestMethod.POST)
	@ResponseBody
	public String uploadFile(MultipartFile file) throws Exception{
		System.out.println("file: " + file);
		String originalFilename = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach", originalFilename, fileData);
		System.out.println("saveFilename: " + saveFilename);
		
		return saveFilename;
	}
	
}
