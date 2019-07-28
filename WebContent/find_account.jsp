<%@page import="com.wines.co.DAO"%>
<%@page import="com.wines.co.MVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

	 // 전화번호에도 unique 속성이 있기때문에 전화번호만으로 id 검색가능
	function find_id(f) {
		 
		var id = "";
		
		// 전화번호 입력확인
		if (f.tel.value == "") {
			swal("전화번호를 입력해주세요.")
			f.tel.focus();
			return;
		} 
		
		var tel_chk = false;
		
	<% for (MVO mvo:list) { %>
		// 전화번호가 db에 존재하면
	 	if ( "<%=mvo.getTel()%>" == f.tel.value) {
	 		tel_chk = true;
	 		id = "<%=mvo.getId()%>";
	 	}
	<% } %>
	
		// tel_chk가 false이면 가입되지않은 사용자
		if (!tel_chk) {
			swal("가입되지 않은 사용자입니다.");
			f.tel.value = "";
			f.tel.focus();
			return;
		}
		
		f.tel.value = "";
		swal("가입된 아이디", id, {
			button: "확인"
		});
	}
	
	
	function find_password(f) {
			
			// 아이디 입력확인
			if (f.id.value == "") {
				swal("아이디를 입력해주세요.")
				f.id.focus();
				return;
			} 
			// 아이디 형식 확인을 위한 정규 표현식 (이메일)
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				
			if (f.id.value.match(regExp) == null) {
				swal("아이디 형식이 올바르지 않습니다.")
				f.id.value = "";
				f.id.focus();
				return;
			}
			
			// 전화번호 입력확인
			if (f.tel.value == "") {
				swal("전화번호를 입력해주세요.")
				f.tel.focus();
				return;
			} 
			
			var id_chk = false;
			var pw = "";
		<% for (MVO mvo:list) { %>
			// 아이디가 db에 존재하면
		 	if ( "<%=mvo.getId()%>" == f.id.value) { 
		 		// 전화번호가 맞는지 체크
		 		 if ( "<%=mvo.getTel()%>" != f.tel.value) {
		 			swal("아이디에 등록된 전화번호와 다릅니다.");
		 			f.tel.value = "";
		 			f.tel.focus();
		 			return;
		 		} else {
		 			id_chk = true;
		 			pw = "<%=mvo.getPw()%>";
		 			
		 		}
		 	}
		 	
		 <% } %>
			// id_chk가 false이면 가입되지않은 아이디
			if (!id_chk) {
				swal("가입되지 않은 아이디입니다.");
				f.id.value = "";
				f.id.focus();
				return;
			}
			
			f.id.value = "";
			f.tel.value = "";
			swal("비밀번호", pw, {
				button: "확인"
			});
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
						 아이디 찾기
					</span>

					<span class="txt1 p-b-11">
						전화번호 ( ' - ' 제외 11자리 입력 ex)&nbsp;01012341234 )
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="tel" maxlength="11">
						<span class="focus-input100"></span>
					</div>
					

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="아이디 찾기" onclick="find_id(this.form)" />
						<input class="login100-form-btn2" type="button" value="돌아가기" onclick="history.go(-1)" />
					</div>

				</form>
				<br /><hr /><br />
				<form class="login100-form validate-form flex-sb flex-w" method="post">
					<span class="login100-form-title p-b-32">
						비밀번호 찾기
					</span>

					<span class="txt1 p-b-11">
						아이디(이메일)
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="id" maxlength="30">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						전화번호 ( ' - ' 제외 11자리 입력 ex)&nbsp;01012341234 )
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="tel" maxlength="11">
						<span class="focus-input100"></span>
					</div>
					

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="비밀번호 찾기" onclick="find_password(this.form)" />
						<input class="login100-form-btn2" type="button" value="돌아가기" onclick="history.go(-1)" />
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