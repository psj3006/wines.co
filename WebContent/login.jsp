<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

<% 
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String chk = request.getParameter("ckb");
	
	// 로그인했음을 확인하기 위한 세션 생성
	session.setAttribute("id", id);
	
	// 로그인 유지 체크시에 쿠키 생성
	if (chk != null) {
		Cookie cookie = new Cookie("id", id);
		cookie.setPath("/");
		// 일주일간 유지 (일주일안에 다시 홈페이지 접속시 갱신)
		cookie.setMaxAge(7*24*60*60);
		response.addCookie(cookie);
	}
	response.sendRedirect("mainPage.jsp");
%>

<title>Wines co.</title>
