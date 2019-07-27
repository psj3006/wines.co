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
<style>
	/* 중복체크 버튼 스타일 */
	div.valid {
		position: absolute;
		top: 213px;
		right: 84px;
		z-index: 9999;
	}
	div.valid input {
		color: #fff;
		line-height: 0.9;
		min-width:100px;
		height: 40px;
		background-color: #333333;
		border-radius: 10px;
		transition: all 0.4s;
	}
	div.valid input:hover {
		background-color: #57b846;
	}
</style>
<%
	// 아이디 중복체크를 위해 전체 리스트를 불러서 아이디를 확인
	List<MVO> list = DAO.getAllMembers();
	
	// jstl로 시도해보려했으나 실패
	// pageContext.setAttribute("list", list);
	
%>

<script>
	// 중복체크를 했는지 확인하는 변수
	var valid_chk = false;
	
	// 중복체크 당시의 아이디 ( 중복체크후 아이디 수정방지용 )
	var old_id = "";
	
	// 아이디(이메일) 중복체크
	function valid_id_test(f) {
		
		// 이메일 입력확인
		if (f.id.value == "") {
			swal("이메일을 입력해주세요.")
			f.id.focus();
			return;
		} 
		
		// 이메일 형식 확인을 위한 정규 표현식 
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
		if (f.id.value.match(regExp) == null) {
			swal("이메일 형식이 올바르지 않습니다.")
			f.id.value = "";
			f.id.focus();
			return;
		}
	
		// 올바른 형식까지 확인 후 중복 검사
		<% for (MVO mvo:list) { %>
		 	if ( "<%=mvo.getId()%>" == f.id.value) { 
		 		swal("이미 가입된 이메일 !", "다른 이메일을 사용해주세요.", "error");
		 		f.id.value = "";
		 		f.id.focus();
		 		return;
		 	} else {
		 		valid_chk = true;
		 		old_id = f.id.value;
		  		swal("사용 가능한 이메일 !", "", "success");
		 	}
		<% } %> 
	}
		<%--   
		jstl로 해보려고 했으나 모르겠음
		
		<c:forEach var="list" items="${list }">
			<c:if test="${list.id eq 'f.id.value'}">
				swal("이미 가입된 이메일 !", "다른 이메일을 사용해주세요.", "error")
				
				return;
			</c:if>
		</c:forEach>
		--%>
	
	
	// 유효성 검사
	function sign_up(f) {
	
		
		// 중복체크여부 검사
		if (!valid_chk) {
			swal("이메일 중복체크를 해주세요.");
			return;
		}
		// 중복검사 당시 이메일과 현재 이메일이 다르면 
		if (old_id != f.id.value) {
		// 중복체크 여부를 false 값으로 되돌려서 다시 중복체크 하게함.
			valid_chk = false;
			swal("이메일 중복체크를 해주세요");
			return;
		}
		
		// 각 항목들 입력확인
		// 이름, 주소는 input 태그에 maxlength로 제한
		
		// 이메일은 중복체크당시 확인했으므로 체크 X
		
		if (f.pw.value == "") {
			swal("비밀번호를 입력해주세요.");
			f.pw.focus();
			return;
		}
		// 비밀번호 정규 표현식 ( 영문(대소문자무관)과 숫자 적어도 하나씩 포함, 영문 숫자 특수문자 !@#$%^&* 사용가능, 8~20글자)
		var regExp2 = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*]{8,20}$/g;
		if (f.pw.value.match(regExp2) == null) {
		    swal("비밀번호 형식이 올바르지 않습니다.")
		    f.pw.value = "";
		    f.pw.value.focus();
		    return;
		}
		
		if (f.pw.value != f.pw2.value) {
			swal("동일한 비밀번호를 입력해주세요.");
			f.pw2.value = "";
			f.pw2.focus();
			return;
		}
		
		if (f.name.value == "") {
			swal("이름을 입력해주세요.");
			f.name.focus();
			return;
		}
		
		if (f.addr.value == "") {
			swal("주소를 입력해주세요.");
			f.addr.focus();
			return;
		}
		
		if (f.tel.value == "") {
			swal("전화번호를 입력해주세요.");
			f.tel.focus();
			return;
		}
		
		// 전화번호 형식확인 (숫자로만 11자리)
		var regExp3 = /^\d{11}$/g;
		if (f.tel.value.match(regExp3) == null) {
		    swal("전화번호 형식이 올바르지 않습니다.")
		    f.tel.value = "";
		    f.tel.value.focus();
		    return;
		}
		
		swal("회원가입 성공 !", "잠시 후 메인페이지로 돌아갑니다.", "success")
		// swal 은 alert 와 다르게 확인을 누르지않아도 자동으로 페이지가 이동해버려서
		// setTimeout 을 걸어서 1초뒤에 join.jsp로 넘어가게했음
		setTimeout(function(){
			f.action = "join.jsp";
			f.submit();
		}, 1000);
	}


</script>
</head>
<body>
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
						아이디(이메일)
					</span>
					<div class="container-login100-form-btn">
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="id" maxlength=30>
					</div>
					<div class="valid">
							<input type="button" value="중복체크" onclick="valid_id_test(this.form)"/>
					</div>
	
					</div>
					<span class="txt1 p-b-11">
						비밀번호 (영문 숫자 필수, 8~20자 이내)
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="password" name="pw" maxlength="20">
					</div>
					<span class="txt1 p-b-11">
						비밀번호 확인
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="password" name="pw2" maxlength="20">
					</div>
					<span class="txt1 p-b-11">
						이름
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="name" maxlength="20">
					</div>
					<span class="txt1 p-b-11">
						주소
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="addr" maxlength="100">
					</div>
					<span class="txt1 p-b-11">
						전화번호 ( ' - ' 제외 11자리 입력 ex)&nbsp;01012341234 )
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="tel" maxlength="11">
					</div>
					

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="회원가입" onclick="sign_up(this.form)" />
						<input type="hidden" value="0" name="admin"/>
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

</body>
</html>