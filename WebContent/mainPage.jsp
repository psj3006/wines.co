<%@page import="com.wines.co.DAO"%>
<%@page import="com.wines.co.MVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
	로그인 여부를 세션과 쿠키로 확인해서 로그인이 되어있으면 로그인메뉴대신 로그아웃메뉴가 나오고
 	마이 페이지를 눌렀을 때, 이동을 다르게 설정.
 	
 --%>
 <%
 	MVO mvo = null;
    // 세션확인으로 로그인 여부 체크
    boolean session_chk = false;
    if (session.getAttribute("mvo") != null) {
    	session_chk = true;
    	mvo = (MVO)session.getAttribute("mvo");
    }
                
    // 쿠키확인으로 로그인 여부 체크
    boolean cookie_chk = false;
    // 쿠키 갱신, 세션생성을 위한 변수
    String id = "";
    
	Cookie[] cookies = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (int i=0; i<cookies.length; i++) { 
			// id라는 이름의 쿠키가 존재하면
		   if (cookies[i].getName().equals("id")) { 
		   cookie_chk = true;
		   id = cookies[i].getValue();
		   }
		}
	}
	// 세션없이 쿠키만 존재할때 (브라우저를 껐다가 나중에 다시 켰을때)
	// 쿠키를 갱신하고(일주일유지) 세션을 다시 만들어줌.
	if (!session_chk && cookie_chk) {
		// 쿠키갱신 (일주일)
		Cookie cookie = new Cookie("id", id);
	    cookie.setPath("/");
	    cookie.setMaxAge(7*24*60*60);
	    response.addCookie(cookie);
	    
	    // 세션생성
		mvo = DAO.getOneMember(id);
	    session.setAttribute("mvo", mvo);
		}
%>
<!DOCTYPE html>
<html>
<head>
  <title>Wines co.</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <jsp:include page="frame/stylesheets.jsp"></jsp:include>

</head>

<body>

    <jsp:include page="frame/header.jsp"></jsp:include>
    
                <li class="active"><a href="mainPage.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
	        	<%-- 관리자계정으로 로그인시에 마이 페이지대신 매니지먼트 페이지 --%>
				<%if (session_chk && mvo.getId().equals("admin")) { %>
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="logout.jsp" class="nav-link text-left">Logout</a></li>
	        	<% } else { %>
	        		<%-- 로그인이 되어있다면 마이 페이지 클릭시 마이 페이지로 이동, 아니면 로그인메뉴로 이동--%>  
	        		<%-- 로그인이 되어있다면 로그아웃메뉴, 아니면 로그인메뉴 --%>
	        		<%if (session_chk || cookie_chk) { %>
		        		<li><a href="mypage_chkpw.jsp" class="nav-link text-left">My page</a></li>
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
  			
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>

</html>