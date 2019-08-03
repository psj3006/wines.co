<%@page import="com.wines.co.DAO.ProductDAO"%>
<%@page import="com.wines.co.VO.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<%
	List<ProductVO> list = ProductDAO.getAllProducts();
	pageContext.setAttribute("list", list);
%>
<html>
<head>
  <title>Wines co.</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <jsp:include page="frame/stylesheets.jsp"></jsp:include>

</head>

<body>

    <jsp:include page="frame/header.jsp"></jsp:include>
                <li><a href="main_page.jsp" class="nav-link text-left">Home</a></li>
                <li class="active"><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
			<c:choose>
				<%-- 관리자계정으로 로그인시에 마이 페이지대신 매니지먼트 페이지 --%>
				<c:when test="${mvo.getId() != 'null' && mvo.getId() eq 'admin'}">
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="/wines.co/MController?type=logout" class="nav-link text-left">Logout</a></li>
		        </c:when>
		        <c:otherwise>
	        		<%-- 로그인이 되어있다면 마이 페이지 클릭시 마이 페이지로 이동, 아니면 로그인메뉴로 이동--%>  
	        		<%-- 로그인이 되어있다면 로그아웃메뉴, 아니면 로그인메뉴 --%>
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
    
    <div class="site-section mt-5">
      <div class="container">

        <div class="row mb-5">
          <div class="col-12 section-title text-center mb-5">
            <h2 class="d-block">환영합니다 !</h2>
            <p>엄선된 고품질의 상품만을 판매하고 있습니다.</p>
          </div>
        </div>
		
		<!-- 전체 product 테이블을 불러와서 비어있으면 준비중 메시지, 아니면 상품 표시 -->
		<c:choose>
			<c:when test="${empty list}">
			<div class="col-12 section-title text-center mb-5">
	            <h2 class="d-block"> 준비중입니다 </h2>
	        </div>
        	</c:when>
        	<c:otherwise>
	        <div class="row">
	          <c:forEach var="p" items="${list }">
	          <div class="col-lg-4 mb-5 col-md-6">
	            <div class="wine_v_1 text-center pb-4">
	            <c:choose>
	              <c:when  test="${!empty p.getP_image() }">
		              <a href="" class="thumbnail d-block mb-4"><img src="images/${p.getP_image() }" class="img-fluid" style="height:250px"></a>
	              </c:when>
	              <c:otherwise>
	              	  <a href="" class="thumbnail d-block mb-4"><img src="images/logo.png" class="img-fluid" style="height:250px"></a>
	              </c:otherwise>
	           </c:choose>
	              <div>
	                <h3 class="heading mb-1"><a href="">${p.getP_name() }</a></h3>
	                <c:choose>
	                	<c:when  test="${empty p.getP_saleprice()}">
	                		<span class="price d-block">￦ <fmt:formatNumber value="${p.getP_price() }" pattern="#,###"/></span>
	               		</c:when>
	               		<c:otherwise>
	               			<span class="price d-block">￦ <fmt:formatNumber value="${p.getP_saleprice() }" pattern="#,###"/>&nbsp;&nbsp;&nbsp;<del style="color:red">￦ <fmt:formatNumber value="${p.getP_price() }" pattern="#,###"/></del></span>
	               		</c:otherwise>
	                </c:choose>
	                <a href="" class="btn add"><span class="icon-shopping-bag mr-3"></span> Add to Cart</a>
	              </div>
	            </div>
	          </div>
	          </c:forEach>
	        </div>
          </c:otherwise>
        </c:choose>
        </div>
    </div>
    

    <div class="hero-2" style="background-image: url('images/img_1.jpg');">
     <div class="container">
        <div class="row justify-content-center text-center align-items-center">
          <div class="col-md-8">
            <span class="sub-title">Wines co.</span>
          </div>
        </div>
      </div>
    </div>
  			
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>

</html>