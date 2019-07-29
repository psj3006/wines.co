<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	로그인 여부를 세션과 쿠키로 확인해서 로그인이 되어있으면 로그인메뉴대신 로그아웃메뉴가 나오고
 	마이 페이지를 눌렀을 때, 이동을 다르게 설정.
 	
 	아래쪽 메뉴부분에 처리함.
 --%>
<!DOCTYPE html>
<html>
<head>
  <title>Wines co.</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
  <link rel="stylesheet" href="fonts/icomoon/style.css">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/jquery.fancybox.min.css">
  <link rel="stylesheet" href="css/bootstrap-datepicker.css">
  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="css/aos.css">
  <link href="css/jquery.mb.YTPlayer.min.css" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/style.css">

</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

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
                <li class="active"><a href="mainPage.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
                <%
                	// 세션확인으로 로그인 여부 체크
                	boolean session_chk = false;
                	if (session.getAttribute("id") != null) {
                		session_chk = true;
                	}
                
                	// 쿠키확인으로 로그인 여부 체크
               		boolean cookie_chk = false;
                	// 쿠키 갱신을 위한 변수
                	String id = "";
					Cookie[] cookies = request.getCookies();
	            	
					if (cookies != null && cookies.length > 0) {
		        		for (int i=0; i<cookies.length; i++) { 
		        			if (cookies[i].getName().equals("id")) { 
		        				cookie_chk = true;
		        				id = cookies[i].getValue();
		        			}
		        		}
					}
					// 세션없이 쿠키만 존재할때 (브라우저를 껐다가 나중에 다시 켰을때)
					// 쿠키를 갱신하고(일주일유지) 세션을 다시 만들어줌.
					if (!session_chk && cookie_chk) {
	        			Cookie cookie = new Cookie("id", id);
	        			cookie.setPath("/");
	        			cookie.setMaxAge(7*24*60*60);
	        			response.addCookie(cookie);
	        				
	        			session.setAttribute("id", id);
					}
	        	%>
	        	<%-- 로그인이 되어있다면 마이 페이지 클릭시 마이 페이지로 이동, 아니면 로그인창으로 이동--%>  
	        	<%-- 로그인이 되어있다면 로그아웃메뉴, 아니면 로그인메뉴 --%>
				<%if (session_chk && session.getAttribute("id").equals("admin")) { %>
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="logout.jsp" class="nav-link text-left">Logout</a></li>
	        	<% } else { %>
	        		<%if (session_chk || cookie_chk) { %>
		        		<li><a href="mypage.jsp" class="nav-link text-left">My page</a></li>
		        		<li><a href="logout.jsp" class="nav-link text-left">Logout</a></li>
		        	<% } else { %>
		        		<li><a href="loginForm.jsp" class="nav-link text-left">My page</a></li>
		        		<li><a href="loginForm.jsp" class="nav-link text-left">Login</a></li>
		        	<% } %>
	        	<% } %>
              </ul>                                                                                                                                                                                                                                                                                         
            </nav>
          </div>
        </div>
      </div>
    </div>
    </div>
    
    <div class="owl-carousel hero-slide owl-style">
      <div class="intro-section container" style="background-image: url('images/hero_1.jpg');">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">훌륭한 와인의 비결</span>
            <h1>고품질의 원재료</h1>
          </div>
        </div>
      </div>

      <div class="intro-section container" style="background-image: url('images/img_3.jpg');">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">Welcome !</span>
            <h1>Wines For Everyone</h1>
          </div>
        </div>
      </div>

    </div>
    
    

    <div class="site-section mt-5">
      <div class="container">

        <div class="row mb-5">
          <div class="col-12 section-title text-center mb-5">
            <h2 class="d-block">Our Products</h2>
            <pre>We stock one of the finest selections of wines and spirits that Lancashire has to offer,
             all meticulously hand selected by our knowledgeable staff.</pre>
            <p><a href="#">View All Products <span class="icon-long-arrow-right"></span></a></p>
          </div>
        </div>
        
      </div>
    </div>

    <div class="hero-2" style="background-image: url('images/hero_2.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">Welcome</span>
            <h2>Wines For Everyone</h2>
          </div>
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
    

  </div>


  <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#ff5e15"/></svg></div>

  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.countdown.min.js"></script>
  <script src="js/bootstrap-datepicker.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.fancybox.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/jquery.mb.YTPlayer.min.js"></script>




  <script src="js/main.js"></script>

</body>

</html>