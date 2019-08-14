<%@page import="com.wines.co.DAO.ProductDAO"%>
<%@page import="com.wines.co.VO.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>
<style>
	#goBackButton {
		color: #fff;
		line-height: 0.9;
		min-width:100px;
		height: 40px;
		background-color: #333333;
		border-radius: 27px;
		transition: all 0.4s;
	}
	#goBackButton:hover {
		background-color: #57b846;
	}
</style>
<script>
	function update_go(f) {
		f.action = "/wines.co/QController?type=update";
		f.submit();
	}
	function delete_go(f) {
		f.action = "/wines.co/QController?type=delete";
		f.submit();
	}
</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li class="active"><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
                <c:choose>
				<c:when test="${mvo.getId() != 'null' && mvo.getId() eq 'admin'}">
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="/wines.co/MController?type=logout" class="nav-link text-left">Logout</a></li>
		        </c:when>
		        <c:otherwise>
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
		<div class="container-login100" style="margin-top:50px;">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<span class="login100-form-title p-b-32">
					게시글 수정 & 삭제
				</span>
				<p style="text-align: right;"><input id="goBackButton" type="button" value="돌아가기" onclick="history.go(-1)" /></p>
				<form class="login100-form validate-form flex-sb flex-w" method="post">
					<span class="txt1 p-b-11">
						제목 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="subject" maxlength="50" value="${qvo.getSubject() }"/>
					</div>
					<span class="txt1 p-b-11">
						내용
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<textarea rows="10" cols="50" name="content" style="padding:10px">${qvo.getContent() }</textarea>
					</div>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="수정" onclick="update_go(this.form)" />
						<input class="login100-form-btn2" type="button" value="삭제" onclick="delete_go(this.form)" />
						<input type="hidden" value="${qvo.getQ_num() }" name="q_num"/>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>