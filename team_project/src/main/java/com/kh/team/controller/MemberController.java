package com.kh.team.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
import com.kh.team.service.OrderService;
import com.kh.team.service.PointService;
import com.kh.team.util.MyFileUploader;
import com.kh.team.vo.MemberVo;
import com.kh.team.vo.PagingDto;
import com.kh.team.vo.PointVo;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private PointService pointService;
	
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
	
	@RequestMapping(value="/member_list", method=RequestMethod.GET)
	public String memberList(Model model, PagingDto pagingDto) {
		List<MemberVo> memberList = memberService.getMemberList(pagingDto);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingDto", pagingDto);
		return "member/member_list";
	}
	
	@RequestMapping(value="/user_ask_delete", method=RequestMethod.GET)
	public String userAskDelete() {
		return "member/delete_check_pw";
	}
	
	@RequestMapping(value="/user_delete", method=RequestMethod.GET)
	public String deleteUser(HttpSession session, String userid) {
		memberService.deleteMember(userid);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/member_delete", method=RequestMethod.GET)
	public String deleteMember(String userid) {
		memberService.deleteMember(userid);
		return "redirect:/member/member_list";
	}
	
	@RequestMapping(value="/member_modify", method=RequestMethod.POST)
	public String modifyMember(MemberVo memberVo) {
		System.out.println("실행됨");
		System.out.println("입력된 memberVo: " + memberVo);
		memberService.modifyMember(memberVo);
		return "redirect:/member/user_info?userid="+memberVo.getUserid();
	}
	
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	@ResponseBody
	public int checkId(String userid) {
		int cnt = memberService.checkId(userid);
		return cnt;
	}
	
	@RequestMapping(value="/checkNick", method=RequestMethod.POST)
	@ResponseBody
	public int checkNick(String nickname) {
		int cnt = memberService.checkNick(nickname);
		return cnt;
	}
	
	@RequestMapping(value="/checkPhoneNum", method=RequestMethod.POST)
	@ResponseBody
	public int checkPhoneNum(String cellphone) {
//		System.out.println("memberController 작동됨");
		int cnt = memberService.checkPhoneNum(cellphone);
		return cnt;
	}
	
	@RequestMapping(value="/join_form", method=RequestMethod.GET)
	public String joinForm() {
		return "member/join_form";
	}

	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String loginForm(HttpSession session, HttpServletRequest request) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		if(memberVo == null) {
			String targetLocation = request.getHeader("referer");
			if (targetLocation.equals("http://localhost/member/login_form")) {
				String original_targetLocation = String.valueOf(session.getAttribute("original_targetLocation"));
				if (original_targetLocation == null || original_targetLocation.equals("")) {
					session.setAttribute("targetLocation", "/");								
				} else {
					session.setAttribute("targetLocation", original_targetLocation);					
				}
			} else {
				session.setAttribute("targetLocation", targetLocation);
			}
		}
		return "member/login_form";
	}
	
	@RequestMapping(value="/admin_join_form", method=RequestMethod.GET)
	public String adminForm() {
		return "member/admin_join_form";
	}
	
	@RequestMapping(value="/user_info", method=RequestMethod.GET)
	public String info(String userid, Model model) {
		MemberVo memberVo = memberService.getMemberById(userid);
		model.addAttribute("memberVo", memberVo);
		return "member/user_info";
	}
	
	@RequestMapping(value="/point_list", method = RequestMethod.GET)
	public String pointList(PagingDto pagingDto, HttpSession session, Model model) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String userid = memberVo.getUserid();
		pagingDto.setCount(pointService.getPointCount(userid));
		pagingDto.setPerPage(10);
		pagingDto.setPage(pagingDto.getPage());
		System.out.println("pagingDto: " + pagingDto);
		List<PointVo> point_list = memberService.getPoint_list(userid, pagingDto);
		int allPoint = memberService.sumPoint(userid);
		int nowPoint = memberService.nowPoint(userid);
		model.addAttribute("point_list", point_list);
		session.setAttribute("allPoint", allPoint);
		session.setAttribute("nowPoint", nowPoint);
		return "point/point_list";
	};
	
	@RequestMapping(value="admin_page", method = RequestMethod.GET)
	public String adminPage(String userid, Model model) {
		return "member/admin_page";
	}
	
	@RequestMapping(value="/join_run", method=RequestMethod.POST)
	public String joinRun(MemberVo memberVo, MultipartFile file) {
		try {
			String originalFilename = file.getOriginalFilename();
			if(originalFilename != null && !originalFilename.equals("")) {
				String r_titlepic = MyFileUploader.uploadFile(
						"//192.168.0.110/boardattach", originalFilename, file.getBytes());
				memberVo.setM_picture(r_titlepic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		memberService.insertMember(memberVo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/admin_join_run", method=RequestMethod.POST)
	public String adminJoinRun(MemberVo memberVo) {
		memberService.insertAdmin(memberVo);
		return "redirect:/";
	}
	
	@RequestMapping(value="/login_run", method=RequestMethod.POST)
	public String login(String userid, String userpw, String saveId, 
			HttpSession session, RedirectAttributes rttr, HttpServletResponse response, HttpServletRequest request) throws IOException {
		MemberVo memberVo = memberService.getMemberByIdAndPw(userid, userpw);
//		System.out.println("memberVo" + memberVo);
		if(memberVo == null) {
			String original_targetLocation = String.valueOf(session.getAttribute("targetLocation"));
//			System.out.println("original_targetLocation: " + original_targetLocation);
			rttr.addFlashAttribute("login_result", "fail");
			session.setAttribute("original_targetLocation", original_targetLocation);
			return "redirect:/member/login_form";
		} else {
			//장바구니 없는사람 갱신해주기
			int myBasket = memberVo.getBasket();
			if(myBasket == 0) {
				orderService.create(userid);
			} 
			
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
//			System.out.println("targetLoc: " + targetLocation);
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
	public List<String> findIdRun(MemberVo memberVo) {
		int count = memberService.recogExistId(memberVo);
		if (count > 0) {
			List<String> userids = memberService.findId(memberVo);
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
	public String checkforFindPw(MemberVo memberVo) {
		int count = memberService.recogId(memberVo);
		int rdKey = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
//		System.out.println("rdKey: " + rdKey);
		if (count > 0) {
			String subject = "비밀번호 재설정 안내 메일입니다."; // 메일 제목
			String content = "<html>"
					+ "<h1>비밀번호 재설정 인증번호입니다</h1>"
					+ "<label>비밀번호 재설정 번호: </label>"
					+ "<span>" + rdKey + "</span>"
					+ "<div>인증 번호를 입력하시면 비밀번호를 변경 가능합니다.</div>"
					+ "</html>"; // 메일 내용
			String from = "teampro1234@naver.com"; // 보내는사람 아이디@주소
			String to = ""; // 받는사람 아이디@주소
			try {
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); // true는 멀티파트 메세지를 사용하겠다는 의미
				mailHelper.setFrom(from);
				mailHelper.setTo(memberVo.getEmail());
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
	public String findPwRun(MemberVo memberVo, Model model) {
		model.addAttribute("memberVo", memberVo);
		return "/member/modify_pw";			
		
	}

	@RequestMapping(value="/modi_pw_run", method=RequestMethod.POST)
	public String modiPwRun(MemberVo memberVo, RedirectAttributes rttr) {
//		System.out.println("memberVo: " + memberVo);
		boolean result = memberService.modifyPw(memberVo);
		rttr.addFlashAttribute("modi_pw_result", result);
		return "redirect:/member/login_form";
		
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
//		System.out.println("file: " + file);
		String originalFilename = file.getOriginalFilename();
		byte[] fileData = file.getBytes();
		String saveFilename = MyFileUploader.uploadFile("//192.168.0.110/boardattach", originalFilename, fileData);
//		System.out.println("saveFilename: " + saveFilename);
		
		return saveFilename;
	}
	
}
