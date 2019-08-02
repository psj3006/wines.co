<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
	* start_page.jsp 에서 시작할것.
	
	로그인 여부를 세션과 쿠키로 확인해서 로그인이 되어있으면 로그인메뉴대신 로그아웃메뉴가 나오고
 	마이 페이지를 눌렀을 때, 이동을 다르게 설정.
 --%>

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
                <li class="active"><a href="main_page.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
			<c:choose>
				<%-- 관리자계정으로 로그인시에 마이 페이지대신 매니지먼트 페이지 --%>
				<c:when test="${mvo.getId() != 'null' && mvo.getId() eq 'admin'}">
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="logout.jsp" class="nav-link text-left">Logout</a></li>
		        </c:when>
		        <c:otherwise>
	        		<%-- 로그인이 되어있다면 마이 페이지 클릭시 마이 페이지로 이동, 아니면 로그인메뉴로 이동--%>  
	        		<%-- 로그인이 되어있다면 로그아웃메뉴, 아니면 로그인메뉴 --%>
	        		<c:choose>
	        		<c:when test="${session_chk eq true || cookie_chk eq true}">
		        		<li><a href="mypage_chkpw.jsp" class="nav-link text-left">My page</a></li>
		        		<li><a href="logout.jsp" class="nav-link text-left">Logout</a></li>
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