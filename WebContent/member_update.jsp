<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="updateMVO" class="com.wines.co.VO.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="updateMVO"></jsp:setProperty>

<%
	int result = MemberDAO.updateMember(updateMVO);
	pageContext.setAttribute("result", result);
%>

<c:choose>
	<c:when test="${result > 0 }">
	<!-- 성공 메시지는 updateForm 에서 띄우고 넘어옴 -->
		<script>
			location.href="mypage.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			location.href="error_page.jsp";
		</script>
	</c:otherwise>
</c:choose>


