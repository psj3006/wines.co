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

<script>
	function write_qna(f) {
	
		if (f.subject.value == "") {
			swal("제목을 입력해주세요.", {
				button: "확인"
			});
			f.subject.focus();
			return;
		}
		if (f.content.value == "") {
			swal("내용을 입력해주세요.", {
				button: "확인"
			});
			f.content.focus();
			return;
		}
		swal("게시물 등록 성공 !", "잠시 후 목록으로 돌아갑니다.",  {
			  button: false,
		});
		setTimeout(function(){
			f.action = "/wines.co/QController?type=write";
			f.submit();
		}, 1000);
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
				<form class="login100-form validate-form flex-sb flex-w" method="post">
					
					<span class="login100-form-title p-b-32">
						Q & A 작성
					</span>

					<span class="txt1 p-b-11">
						제목 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="subject" maxlength="50" />
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						내용
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<textarea rows="10" cols="50" name="content" style="padding:10px"></textarea>
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="등록" onclick="write_qna(this.form)" />
						<input class="login100-form-btn2" type="button" value="돌아가기" onclick="history.go(-1)" />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>