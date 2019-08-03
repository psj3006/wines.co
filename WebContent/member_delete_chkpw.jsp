<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberVO mvo = (MemberVO)session.getAttribute("mvo");
	String pw = mvo.getPw();
%>
<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>

<script>
	function chk_pw(f) {
		if (f.pw.value != "<%=pw%>") {
			swal("비밀번호가 일치하지 않습니다.", {
				button: "확인"
			});
			f.pw.value = "";
			return;
		}
		location.href="/wines.co/MController?type=delete";
	}
</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
	
				<li><a href="main_page.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
                <li class="active"><a href="mypage_chkpw.jsp" class="nav-link text-left">My page</a></li>
                <li><a href="/wines.co/MController?type=logout" class="nav-link text-left">Logout</a></li>
              </ul>                                                                                                                                                                                                                                                                                         
            </nav>

          </div>
         
        </div>
      </div>

    </div>
    
    </div>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<span class="login100-form-title p-b-32">
					회원 탈퇴
				</span>
				<form method="post">
					<span class="txt1 p-b-11">
						회원 탈퇴를 원하시면 비밀번호를 한번 더 입력해주세요.
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="password" name="pw" maxlength="20" placeholder="영문 숫자 필수, 8~20자 이내">
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="회원 탈퇴" onclick="chk_pw(this.form)" />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>