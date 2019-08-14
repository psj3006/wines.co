<%@page import="com.wines.co.DAO.OrderDAO"%>
<%@page import="com.wines.co.VO.OrderVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="com.wines.co.DAO.CartDAO"%>
<%@page import="com.wines.co.VO.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// 상품정보
	int o_num = Integer.parseInt(request.getParameter("o_num"));
	List<OrderVO> list = OrderDAO.getAllListByO_num(o_num);
	pageContext.setAttribute("list", list);
	
	// 총금액 
	OrderVO info = OrderDAO.getOrderInfoByO_num(o_num);
	pageContext.setAttribute("info", info);
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
	tr, td, th{ text-align: center; word-break:break-all }
	a { text-decoration: none; color: black; }
	a:hover { text-weight: bold; }
</style>
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
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<span class="txt1 p-b-11">성함&nbsp;&nbsp; : ${info.getO_name() }</span>
				<br/>
				<span class="txt1 p-b-11">배송지 : ${info.getO_addr() }</span>
				<br/>
				<span class="txt1 p-b-11">연락처 : ${info.getO_tel() }</span>
					<hr/>
					<span class="txt1 p-b-11">주문번호 : <%=o_num %></span>
					<table>
						<thead>
							<tr>
								<th style="width:18%">이미지</th>
								<th>상품명</th>
								<th style="width:15%">수량</th>
								<th>가격</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="o" items="${list }">
								<tr>
									<c:choose>
										<c:when test="${!empty o.getP_image() }">
											<td><a href="product_view_detail.jsp?p_num=${o.getP_num() }" class="thumbnail mb-4"><img src="images/${o.getP_image() }" class="img-fluid" style="height:70px"></a></td>
										</c:when>
										<c:otherwise>
											<td><a href="product_view_detail.jsp?p_num=${o.getP_num() }" class="thumbnail mb-4">이미지 없음</a></td>
										</c:otherwise>
									</c:choose>
									<td><a href="product_view_detail.jsp?p_num=${o.getP_num() }" class="thumbnail mb-4">${o.getP_name() }</a></td>
									<td>${o.getAmount() }</td>
									<c:choose>
										<c:when test="${!empty o.getP_saleprice() }">
											<td><fmt:formatNumber value="${o.getP_saleprice() * o.getAmount() }" pattern="#,###"/></td>
										</c:when>
										<c:otherwise>
											<td><fmt:formatNumber value="${o.getP_price() * o.getAmount() }" pattern="#,###"/></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4">
									총 구매금액 &nbsp;&nbsp;￦ <fmt:formatNumber value="${info.getTotalprice() }" pattern="#,###"/>
								</td>	
						</tfoot>
					</table>
					<hr/>
					<br/>
					<input class="login100-form-btn" type="button" value="돌아가기" onclick="history.go(-1)" style="margin-left:110px"/>
					

			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>