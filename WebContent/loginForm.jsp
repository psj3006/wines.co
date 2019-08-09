<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>
    
	<%
    	List<MemberVO> list = MemberDAO.getAllMembers();
    %>
<script>
	
	function login_go(f) {
		if (f.id.value == "") {
			swal("아이디를 입력해주세요.", {
				button: "확인"
			});
			f.id.focus();
			return;
		} 
		if (f.pw.value == "") {
			swal("비밀번호를 입력해주세요.", {
				button: "확인"
			});
			f.pw.focus();
			return;
		}
		// 최종 로그인 성공, 실패 확인을 위한 login_chk 변수
		var login_chk = false;
		
		// 아이디 존재여부 & 비밀번호가 맞는지 체크
		<%for (MemberVO mvo:list) {%>
			// 아이디가 db에 존재하면
		 	if ( "<%=mvo.getId()%>" == f.id.value) { 
		 		// 비밀번호가 맞는지 체크
		 		if ( "<%=mvo.getPw()%>" != f.pw.value) {
		 			swal("비밀번호가 틀렸습니다.", {
						button: "확인"
					});
		 			f.pw.value = "";
		 			f.pw.focus();
		 			return;
		 		// 비밀번호가 맞으면 login_chk를 true로 설정
		 		} else {
		 			login_chk = true;
		 		}
		 	}
		<% } %> 
		
		// 위의 for 문을 지나왔는데 login_chk가 false라면 가입되지 않은 아이디란 뜻
		if (!login_chk) {
			swal("가입되지 않은 아이디입니다.", {
				button: "확인"
			});
			f.id.value = "";
			f.pw.value = "";
			f.id.focus();
			return;
		}
		
		swal("로그인성공!", "잠시 후 메인페이지로 돌아갑니다.", {
			  button: false,
		});
		setTimeout(function(){
			f.action = "/wines.co/MController?type=login";
			f.submit();
		}, 1000);
	}

</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
                <li><a href="loginForm.jsp" class="nav-link text-left">My page</a></li>
                <li class="active"><a href="loginForm.jsp" class="nav-link text-left">Login</a></li>
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
				<form class="login100-form validate-form flex-sb flex-w" method="post">
					<span class="login100-form-title p-b-32">
						Welcome !
					</span>

					<span class="txt1 p-b-11">
						아이디(이메일)
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="id" maxlength="30">
						<span class="focus-input100"></span>
					</div>
					
					<span class="txt1 p-b-11">
						비밀번호
					</span>
					<div class="wrap-input100 validate-input m-b-12">
						<input class="input100" type="password" name="pw" maxlength="20">
						<span class="focus-input100"></span>
					</div>
					
					<div class="flex-sb-m w-full p-b-48">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb" type="checkbox" name="ckb" value="chk">
							<label class="label-checkbox100" for="ckb">
								로그인 유지
							</label>
						</div>

						<div>
							<a href="find_account.jsp" class="txt3">
								아이디/비밀번호 찾기
							</a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="로그인" onclick="login_go(this.form)" />
						<input class="login100-form-btn2" type="button" value="회원가입" onclick="location.href='joinForm.jsp'" />
					</div>

				</form>
			</div>
		</div>
	</div>
    
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>