package com.kh.team.controller;



import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.service.CalService;
import com.kh.team.service.MemberService;
import com.kh.team.vo.DateData;
import com.kh.team.vo.MemberVo;


@Controller
@RequestMapping("/cal")
public class CalendarController {
	
	@Autowired
	private CalService calService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/chkAttendance", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData, String userid){
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		//검색 날짜
		if(dateData.getDate().equals("") && dateData.getMonth().equals("")){
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		//검색 날짜 end

		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			String attend_date = "";
			if (Integer.parseInt(dateData.getMonth()) < 10) {
				attend_date = dateData.getYear() + "0" + String.valueOf(Integer.parseInt(dateData.getMonth()) + 1);
			} else {
				attend_date = dateData.getYear() + String.valueOf(Integer.parseInt(dateData.getMonth()) + 1);
			}
			if (i < 10) {
				attend_date += "0" + i;
			} else {
				attend_date += i;
			}
//			System.out.println("attend_date: " + attend_date);
			DateData attendData = calService.getAttendDate(userid, attend_date);
//			System.out.println("attendData: " + attendData);			
			if(i==today_info.get("today")){
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
				if (attendData != null) {
					calendarData.setAno(attendData.getAno());
					calendarData.setUserid(attendData.getUserid());
					calendarData.setAttend_date(attendData.getAttend_date());
				}
			}else{
				calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
				if (attendData != null) {
					calendarData.setAno(attendData.getAno());
					calendarData.setUserid(attendData.getUserid());
					calendarData.setAttend_date(attendData.getAttend_date());
				}
			}
			System.out.println("calendarData: " + calendarData);
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			for (int i = 0; i < index; i++) {
				calendarData= new DateData(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		
		
		//배열에 담음
		model.addAttribute("dateList", dateList);		//날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "/calendar/attendance_cal";
	}
	
	@RequestMapping(value="/insertAttendance", method=RequestMethod.GET)
		public String insertAttendance(String userid, HttpSession session, RedirectAttributes rttr) {
		System.out.println("userid: " + userid);
		Date sysdate = Date.valueOf(LocalDate.now());
		int count = calService.isAttend(userid, sysdate);
		if (count > 0) {
			rttr.addFlashAttribute("attend_fail", false);
		} else {
			calService.insertAttend(userid);
			calService.updateMemberTattend(userid);
			rttr.addFlashAttribute("attend_success", true);
		}
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		MemberVo loginVo = memberService.getMemberByIdAndPw(memberVo.getUserid(), memberVo.getUserpw());
		session.setAttribute("loginVo", loginVo);
		return "redirect:/cal/chkAttendance?userid=" + userid;
	}
	
}
