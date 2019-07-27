<%@page import="com.wines.co.MVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
    
<%
	List<MVO> list = DAO.getAllMembers();
%>
<script>
	// 최종 로그인 성공, 실패 확인을 위한 login_chk 변수
	var login_chk = false;
	function login_go(f) {
		if (f.id.value == "") {
			swal("이메일을 입력해주세요.");
			f.id.focus();
			return;
		} 
		if (f.pw.value == "") {
			swal("비밀번호를 입력해주세요.");
			f.pw.focus();
			return;
		}
		
		// 이메일 존재여부 & 비밀번호가 맞는지 체크
		<% for (MVO mvo:list) { %>
			// 이메일이 존재하면
		 	if ( "<%=mvo.getId()%>" == f.id.value) { 
		 		// 비밀번호가 맞는지 체크
		 		if ( "<%=mvo.getPw()%>" != f.pw.value) {
		 			swal("비밀번호가 틀렸습니다.");
		 			f.pw.value = "";
		 			f.pw.focus();
		 			return;
		 		// 비밀번호가 맞으면 login_chk를 true로 설정
		 		} else {
		 			login_chk = true;
		 		}
		 	
		 	}
		<% } %> 
		
		// 위의 for 문을 지나왔는데 login_chk가 false라면 존재하지 않는 이메일이란 뜻
		if (!login_chk) {
			swal("존재하지 않는 이메일입니다.");
			f.id.value = "";
			f.id.focus();
			return;
		}
		
		swal("로그인성공!", "잠시 후 메인페이지로 돌아갑니다.")
		// swal 은 alert 와 다르게 확인을 누르지않아도 자동으로 페이지가 이동해버려서
		// setTimeout 을 걸어서 1초뒤에 login.jsp로 넘어가게했음
		setTimeout(function(){
			f.action = "login.jsp";
			f.submit();
		}, 1000);
	}

</script>
</head>
<body>
<div></div>
	<div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>


    
    <div class="header-top">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-12 text-center">
            <a href="mainPage.jsp" class="site-logo">
              <img src="images/logo.png" alt="Image" class="img-fluid">
            </a>
          </div>
          <a href="#" class="mx-auto d-inline-block d-lg-none site-menu-toggle js-menu-toggle text-black"><span
                class="icon-menu h3"></span></a>
        </div>
      </div>
      


      
      <div class="site-navbar py-2 js-sticky-header site-navbar-target d-none pl-0 d-lg-block" role="banner">

      <div class="container">
        <div class="d-flex align-items-center">
          
          <div class="mx-auto">
            <nav class="site-navigation position-relative text-left" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mx-auto d-none pl-0 d-lg-block border-none">
                <li><a href="mainPage.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
                <%
                	// 쿠키 확인해서 로그인 시에는 마이페이지, 아니면 로그인창 이동
                %>
                <li><a href="" class="nav-link text-left">My page</a></li>
               	<%
               		// 쿠키 확인해서 로그인이 안되있으면 로그인, 되있으면 로그아웃이 나오게할것. 
               	%>
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
						이메일
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="id" maxlength=30>
					</div>
					
					<span class="txt1 p-b-11">
						비밀번호
					</span>
					<div class="wrap-input100 validate-input m-b-12">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="pw" maxlength="20">
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
	
	<div class="footer">
      <div class="container">
        
        
        <div class="row">
          <div class="col-12">
            <div class="copyright">
	            Wines co.
	            <span>&nbsp; | &nbsp;</span>사업자등록번호 : 111-11-11111
	            <span>&nbsp; | &nbsp;</span>주소 : 인천광역시 연수구 연수1동<br/>TEL : 032-123-4567
	            <span>&nbsp; | &nbsp;</span>FAX : 032-123-4568
	            <span>&nbsp; | &nbsp;</span>E-Mail : wines@wines.co<br />
          

            </div>
          </div>
        </div>
      </div>
    </div>
    
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<script src="js/login.js"></script>
	

</body>
</html>