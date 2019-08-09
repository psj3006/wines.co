<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>
<style>
	table {border-collapse: collapse; width:100%;}
	thead tr th, td {padding:10px}
	tr, td, th{ text-align: center; }
	a { text-decoration: none; color: black; }
	a:hover { text-weight: bold; }
	#writebutton {
		color: #fff;
		line-height: 0.9;
		min-width:100px;
		height: 40px;
		background-color: #333333;
		border-radius: 27px;
		transition: all 0.4s;
	}
	#writebutton:hover {
		background-color: #57b846;
	}
</style>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li class="active"><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
			<c:choose>
				<%-- 관리자계정으로 로그인시에 마이 페이지대신 매니지먼트 페이지 --%>
				<c:when test="${mvo.getId() != 'null' && mvo.getId() eq 'admin'}">
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="/wines.co/MController?type=logout" class="nav-link text-left">Logout</a></li>
		        </c:when>
		        <c:otherwise>
	        		<%-- 로그인이 되어있다면 마이 페이지 클릭시 마이 페이지로 이동, 아니면 로그인메뉴로 이동--%>  
	        		<%-- 로그인이 되어있다면 로그아웃메뉴, 아니면 로그인메뉴 --%>
	        		<c:choose>
	        		<c:when test="${session_chk eq true || cookie_chk eq true}">
		        		<li><a href="mypage_chkpw.jsp" class="nav-link text-left">My page</a></li>
		        		<li><a href="/wines.co/MController?type=logout" class="nav-link text-left">Logout</a></li>
					</c:when>
					<c:otherwise>
		        		<li><a href="loginForm.jsp" class="nav-link text-left">My page</a></li>
		        		<li><a href="loginForm.jsp" class="nav-link text-left">Login</a></li>
		        	</c:otherwise>
		        	</c:choose>
	        	</c:otherwise>
	        </c:choose>
              </ul>                                                                                                                                                                                                                                                                                         
            </nav>

          </div>
         
        </div>
      </div>

    </div>
    
    </div>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px; width:700px">
				
				<p style="text-align: right;"><input id="writebutton" type="button" value="글쓰기" onclick="" /></p>
			<table>
				<tr>
					<td style="width:10%">번호</td>
					<td style="width:25%">작성자</td>
					<td style="width:45%">제목</td>
					<td style="width:30%">작성일</td>
				</tr>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="q" items="${list }">
						<tr>
							<td>${q.getQ_num() }</td>
							<td>${q.getId() }</td>
							<td><a class="thumbnail mb-4" href="">${q.getSubject() }</a></td>
							<td>
								<fmt:parseDate value="${q.getRegdate()}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">게시물 없음</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			</div>
		</div>
	</div>
    
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>