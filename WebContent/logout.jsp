<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>Wines co.</title>

<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<% 
	// 세션 초기화
	session.invalidate();
	
	// 쿠키 소멸
	Cookie cookie = new Cookie("id", "");
	cookie.setPath("/");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	// 메인 페이지로 이동
	response.sendRedirect("mainPage.jsp");
%>
