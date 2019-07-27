<%@page import="com.wines.co.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>

<jsp:useBean id="joinMVO" class="com.wines.co.MVO"></jsp:useBean>
<jsp:setProperty property="*" name="joinMVO"></jsp:setProperty>

<% 
	int result = DAO.signUp(joinMVO);
	pageContext.setAttribute("result", result);
%>

<c:choose>
	<c:when test="${result > 0 }">
	<!-- 성공 메시지는 joinform 에서 띄우고 넘어옴 -->
		<script>
			location.href="mainPage.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("에러발생, 회원가입을 취소합니다. 잠시 후 다시 시도해주세요.");
			history.go(-1);
		</script>
	</c:otherwise>
</c:choose>

<title>Wines co.</title>