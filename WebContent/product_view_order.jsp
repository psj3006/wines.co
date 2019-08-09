<%@page import="com.wines.co.VO.OrderVO"%>
<%@page import="com.wines.co.DAO.OrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="com.wines.co.DAO.CartDAO"%>
<%@page import="com.wines.co.VO.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<!-- 마이 페이지에서 넘어올 수 있는 주문조회페이지  -->

<%
	MemberVO mvo = (MemberVO) session.getAttribute("mvo");
	String id = mvo.getId();
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
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px; width:700px">
					<span>[ <%=id%> ] </span><span class="txt1 p-b-11"> 님의 주문내역</span>
					<hr/>
					<table>
						<thead>
							<tr>
								<th>주문번호</th>
								<th style="width:50%">상품명</th>
								<th>주문금액</th>
								<th>주문날짜</th>
							</tr>
						</thead>
						<tbody>
							<%	List<Integer> o_list = OrderDAO.getO_numbers(id);
								if (o_list!=null) {
									for(int i=0; i<o_list.size(); i++) { %>
									<tr>
										<td><a href="product_view order_detail.jsp?o_num=<%=o_list.get(i) %>" class="thumbnail mb-4"><%= o_list.get(i) %></a></td>
										
										<% OrderVO ovo = OrderDAO.getOrderInfoByO_num(o_list.get(i)); 
										   int totalprice = ovo.getTotalprice();
										   pageContext.setAttribute("totalprice", totalprice);
										// 상품이 한가지가 아닐경우 (상품1 외 ** 종) 출력을 위해 카운트 생성
										   int count = OrderDAO.getCountOfOrders((o_list.get(i))); %>
										
										<td><a href="product_view order_detail.jsp?o_num=<%=o_list.get(i) %>" class="thumbnail mb-4"><%= ovo.getP_name() %> <% if (count>1) { %> 외 <%=count-1 %> 종 <% } %></a></td>
										<td>￦ <fmt:formatNumber value="${totalprice }" pattern="#,###"/></td>
										<td><%= ovo.getOrder_date().substring(0, 10) %></td>
									</tr>
							<%  	} 
								} else { %>
									<tr>
										<td colspan="4">
											주문 내역이 없습니다.
										</td>
									</tr>
							<% } %>
						</tbody>
						
						<tfoot>
						</tfoot>
					</table>
					<hr/>
					<br/>
					<input class="login100-form-btn" type="button" value="돌아가기" onclick="history.go(-1)" style="margin-left:212.5px"/>
					

			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>