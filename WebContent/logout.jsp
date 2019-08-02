<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	// 세션 초기화
	session.invalidate();
	
	// 쿠키 소멸
	Cookie cookie = new Cookie("id", "");
	cookie.setPath("/");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	// 메인 페이지로 이동
	response.sendRedirect("main_page.jsp");
%>
