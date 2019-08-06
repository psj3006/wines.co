<%@page import="com.wines.co.DAO.ProductDAO"%>
<%@page import="com.wines.co.VO.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- product_page 에서 넘어올 수 있는 제품 상세보기 페이지 --%>

<!DOCTYPE html>
<%
	int p_num = Integer.parseInt(request.getParameter("p_num"));
	ProductVO pvo = ProductDAO.getOneProduct(p_num);
	pageContext.setAttribute("pvo", pvo);
%>
<html>
<head>
  <title>Wines co.</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <jsp:include page="frame/stylesheets.jsp"></jsp:include>
  <style>
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		}
		#deletebutton {
		color: #fff;
		line-height: 0.9;
		min-width:20px;
		height: 20px;
		background-color: #333333;
		border-radius: 10px;
		transition: all 0.4s;
		}
		#deletebutton:hover {
		background-color: red;
		}
  </style>
  <script>
  		// 장바구니에 담을 상품의 갯수와 총금액
  		var amount = 0;
  		var totalprice = 0;
  		// 금액의 형식을 맞춰주는 addComma 함수
		function addComma(num) {
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			return num.toString().replace(regexp, ',');
		}
  		// 금액과 갯수 표시
  		function show(f) {
  			amount += Number(f.count.value);
  			totalprice = f.p_saleprice.value * amount;
  			if (f.p_saleprice.value == 0) {
  				totalprice = f.p_price.value * amount;
  			}
  			var result = addComma(totalprice);
  			document.getElementById("result").innerHTML= "￦ " + result;
  			document.getElementById("pricecount").innerHTML= "수량 : " + amount + " 개";
  			document.getElementById("cartbutton").setAttribute("style", 'display:inline');
  			document.getElementById("deletebutton").setAttribute("style", 'display:inline');
  		}
  		// 금액과 갯수 제거
  		function remove() {
  			amount = 0;
  			totalprice = 0;
  			document.getElementById("result").innerHTML= "";
  			document.getElementById("pricecount").innerHTML= "";
  			document.getElementById("cartbutton").setAttribute("style", 'display:none');
  			document.getElementById("deletebutton").setAttribute("style", 'display:none');
  		}
  		// 카트에 담기
  		function add_cart() {
  			// 빨간줄은 그어지는데 동작은 잘됨
  			if (${session_chk || cookie_chk}) {
  				if (amount <= 0) {
  					swal("상품을 담은 후에 추가해주세요.", {
  						button: "확인"
  					});
  				} else {
  					swal("장바구니에 추가 완료 !", "잠시 후 장바구니로 이동합니다.", {
  					  button: false,
	  				});
	  				setTimeout(function(){
	  					location.href = "/wines.co/PController?type=addCart&amount=" + amount + "&p_num=<%= pvo.getP_num() %>";
	  				}, 1000);
  					
  				}
  			} else {
  				swal("로그인이 필요합니다", "잠시 후 로그인 페이지로 이동합니다.",  {
  				  button: false,
  				});
  				setTimeout(function(){
  					location.href = "loginForm.jsp";
  				}, 1500);
  				
  			}
  			
  		}
  </script>
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
        <div class="row">
        <%-- 로그인확인 후 상단에 메세지 출력 --%>
        	<c:if test="${!session_chk && !cookie_chk}">
	    		<div class="col-12 section-title text-center mb-5">
	           		<p>상품 구매를 위해서는 로그인이 필요합니다.</p>
	         	</div>
			</c:if>
          <div class="col-lg-6">
            <div>
            <c:choose>
	              <c:when  test="${!empty pvo.getP_image() }">
		              <img src="images/${pvo.getP_image() }" class="img-fluid">
	              </c:when>
	              <c:otherwise>
	              	  <img src="images/logo.png" class="img-fluid">
	              </c:otherwise>
	        </c:choose>
            </div>
          </div>
          <div class="col-lg-5 ml-auto">
            <h2 class="text-primary">${pvo.getP_name() }</h2>
            <p>${pvo.getP_content() }</p>
			<form class="login100-form validate-form flex-sb flex-w">
            <div class="mb-5">
              <div class="input-group mb-3" style="max-width: 200px;">
                <div class="input-group-prepend">
                  <button class="btn btn-outline-primary js-btn-minus" type="button" style="z-index:10">&minus;</button>
                  <%-- 담기버튼 클릭시에 금액계산을 위한 히든타입 인풋 --%>
                  <input type="hidden" id="p_price" name="p_price" value="${pvo.getP_price() }" />
                  <input type="hidden" id="p_saleprice" name="p_saleprice" value="${pvo.getP_saleprice() }" />
                </div>
                <input type="number" class="form-control text-center border mr-0" name="count" value="1" max="100" min="1" >
                <div class="input-group-append">
                  <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
                </div>
         	   </div>
         	<c:choose>
	        	<c:when  test="${empty pvo.getP_saleprice()}">
	        		<span class="price d-block">개당 가격 : ￦ <fmt:formatNumber value="${pvo.getP_price() }" pattern="#,###"/></span>
	        	</c:when>
	        	<c:otherwise>
	        		<span class="price d-block">개당 가격 : ￦ <fmt:formatNumber value="${pvo.getP_saleprice() }" pattern="#,###"/>&nbsp;&nbsp;&nbsp;<del style="color:red">￦ <fmt:formatNumber value="${pvo.getP_price() }" pattern="#,###"/></del></span>
	        	</c:otherwise>
	        </c:choose>
            </div>
            
            <p><input type="button" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary" onclick="show(this.form)" value="담기"></p>
			</form>
			<%-- 줄이 안맞아서 줄맞추기위해 폼하나더 추가 --%>
			<form class="login100-form validate-form flex-sb flex-w">
			<%-- 담기버튼 클릭시에 총 금액과 갯수 표시 --%>
	        <span id="pricecount"></span>
	        <span class="price d-block" id="result"></span>
	        <%-- X 버튼 클릭시 총 금액과 갯수 리셋 --%>
	        <input type="button" id="deletebutton" onclick="remove()" value="X" style="display:none" />
	        <%-- 최종적으로 장바구니에 담는 버튼 --%>
			<input type="button" id="cartbutton" class="buy-now btn btn-sm height-auto px-4 py-3 btn-primary" onclick="add_cart()" value="장바구니 추가" style="display:none" />
			
	        </form>
	        </div>
	        <br/>
	       
			
          </div>
        </div>
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