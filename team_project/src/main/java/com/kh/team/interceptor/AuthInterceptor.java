package com.kh.team.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.team.vo.MemberVo;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
		throws Exception{
		HttpSession session = request.getSession();
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		if(memberVo == null) {
			String uri = request.getRequestURI();
			String queryString = request.getQueryString();
			String targetLocation = uri + "?" + queryString;
			session.setAttribute("targetLocation", targetLocation);
			response.sendRedirect("/member/login_form");
			return false;
		}
		return true;
	}
}
