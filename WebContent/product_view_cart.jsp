<%@page import="java.util.List"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="com.wines.co.DAO.CartDAO"%>
<%@page import="com.wines.co.VO.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- mypage 에서 넘어올 수 있는 장바구니 페이지 --%>

<%
	MemberVO mvo = (MemberVO) session.getAttribute("mvo");
	String id = mvo.getId();
	List<CartVO> list = CartDAO.getCart(id);
	pageContext.setAttribute("list", list);
	
	int totalprice = 0;
	for(CartVO cvo : list) {
		if (cvo.getP_saleprice() != null) {
			totalprice += Integer.parseInt(cvo.getP_saleprice()) * cvo.getAmount();
		} else {
			totalprice += Integer.parseInt(cvo.getP_price()) * cvo.getAmount();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>
<style>
	table {border-collapse: collapse; width:100%;}
	thead tr th, td {padding:10px}
	tr, td, th{ text-align: center; }
	a { text-decoration: none; color: black; }
	a:hover { text-weight: bold; }
	tr td input {
		color: #fff;
		line-height: 0.9;
		min-width:20px;
		height: 20px;
		background-color: #333333;
		border-radius: 10px;
		transition: all 0.4s;
	}
	tr td input:hover {
		background-color: red;
	}
	#orderbutton {
		color: #fff;
		line-height: 0.9;
		min-width:100px;
		height: 40px;
		background-color: #333333;
		border-radius: 27px;
		transition: all 0.4s;
	}
	#orderbutton:hover {
		background-color: #57b846;
	}
</style>
<script>
	function go_orderForm(f) {
		f.action = "product_orderForm.jsp";
		f.submit();
	}
</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
	
				<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
                <li class="active"><a href="mypage.jsp" class="nav-link text-left">My page</a></li>
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
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px; width:700px">
					<span>[ <%=id%> ] </span><span class="txt1 p-b-11"> 님의 장바구니</span>
					<hr/>
					<table>
						<thead>
							<tr>
								<th style="width:18%">이미지</th>
								<th>상품명</th>
								<th style="width:15%">수량</th>
								<th>가격</th>
								<th style="width:15%">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${!empty list }">
									<c:forEach var="c" items="${list }">
										<tr>
											<c:choose>
												<c:when test="${!empty c.getP_image() }">
													<td><a href="product_view_detail.jsp?p_num=${c.getP_num() }" class="thumbnail mb-4"><img src="images/${c.getP_image() }" class="img-fluid" style="height:70px"></a></td>
												</c:when>
												<c:otherwise>
													<td><a href="product_view_detail.jsp?p_num=${c.getP_num() }" class="thumbnail mb-4">이미지 없음</a></td>
												</c:otherwise>
											</c:choose>
											<td><a href="product_view_detail.jsp?p_num=${c.getP_num() }" class="thumbnail mb-4">${c.getP_name() }</a></td>
											<td>${c.getAmount() }</td>
											<c:choose>
												<c:when test="${!empty c.getP_saleprice() }">
													<td><fmt:formatNumber value="${c.getP_saleprice() * c.getAmount() }" pattern="#,###"/></td>
												</c:when>
												<c:otherwise>
													<td><fmt:formatNumber value="${c.getP_price() * c.getAmount() }" pattern="#,###"/></td>
												</c:otherwise>
											</c:choose>
											<td>
											<form class="login100-form validate-form flex-sb flex-w" method="post" action="/wines.co/PController?type=deleteCart">
												<input type="submit" value="X" style="margin:0 auto"/>
												<input type="hidden" name="c_num" value="${c.getC_num() }" />
											</form>	
											</td>
											
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">
											장바구니에 담긴 상품이 없습니다
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						
						<tfoot>
							<c:if test="${!empty list }">
								<tr>
									<td colspan="3">
										총 구매금액 &nbsp;&nbsp;￦ <fmt:formatNumber value="<%= totalprice %>" pattern="#,###"/>
									</td>
									<td colspan="2">
										<form class="login100-form validate-form flex-sb flex-w">
											<input id="orderbutton" type="button" value="주문하기" onclick="go_orderForm(this.form)"/>
											<input type="hidden" name="totalprice" value="<%= totalprice %>" />
										</form>	
									</td>
								</tr>
							</c:if>
						</tfoot>
					</table>
					<hr/>
					<br/>
					<input class="login100-form-btn" type="button" value="상품 보러가기" onclick="location.href='product_page.jsp'" style="margin-left:212.5px"/>
					

			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>