<%@page import="com.wines.co.DAO.CartDAO"%>
<%@page import="com.wines.co.VO.CartVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	MemberVO mvo = (MemberVO) session.getAttribute("mvo");
	String id = mvo.getId();
	List<CartVO> list = CartDAO.getCart(id);
	pageContext.setAttribute("list", list);
	
	int totalprice = Integer.parseInt(request.getParameter("totalprice"));
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
</style>
<script>
	function go_order(f) {
		var regExp3 = /^\d{11}$/g;
		if (f.o_tel.value.match(regExp3) == null) {
		    swal("전화번호 형식이 올바르지 않습니다.", {
				button: "확인"
			});
		    f.o_tel.value = "";
		    f.o_tel.focus();
		    return;
		}
		swal("상품주문 완료 !", {
			  button: false,
		});
		setTimeout(function(){
			f.action = "/wines.co/PController?type=addOrder";
			f.submit();
		}, 1000);
	}
</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="main_page.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
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
		<div class="container-login100" style="margin-top:50px;">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<span class="login100-form-title p-b-32">
					주문 페이지
				</span>
				<pre class="txt1 p-b-11">※배송지 주소와 회원정보가 다를 경우 수정해주세요
				</pre>
			<form class="login100-form validate-form flex-sb flex-w" method="post">
					<span class="txt1 p-b-11">이름</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="o_name" maxlength="20" value=<%=mvo.getName() %> />
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						배송지
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="o_addr" maxlength="100" value=<%=mvo.getAddr() %> />
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						연락처 ( ' - ' 제외 11자리 입력 )
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="o_tel" maxlength="11" placeholder="ex) 01012341234" value=<%=mvo.getTel() %> />
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
					<hr/>
						<input class="login100-form-btn" type="button" value="주문하기" onclick="go_order(this.form)" />
						<input type="hidden" name="totalprice" value="<%=totalprice %>" />
						<input class="login100-form-btn2" type="button" value="돌아가기" onclick="history.go(-1)" />
					</div>
			</form>
				<br/><hr/>
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
							<c:forEach var="c" items="${list }">
									<tr>
									<c:choose>
										<c:when test="${!empty c.getP_image() }">
											<td><img src="images/${c.getP_image() }" class="img-fluid" style="height:70px"></td>
										</c:when>
										<c:otherwise>
											<td>이미지 없음</td>
										</c:otherwise>
									</c:choose>
									<td>${c.getP_name() }</td>
									<td>${c.getAmount() }</td>
									<c:choose>
										<c:when test="${!empty c.getP_saleprice() }">
											<td><fmt:formatNumber value="${c.getP_saleprice() * c.getAmount() }" pattern="#,###"/></td>
										</c:when>
										<c:otherwise>
											<td><fmt:formatNumber value="${c.getP_price() * c.getAmount() }" pattern="#,###"/></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
						
						<tfoot>
							<tr>
								<td colspan="4">
									총 구매금액 &nbsp;&nbsp;￦ <fmt:formatNumber value="<%=totalprice %>" pattern="#,###"/>
								</td>
							</tr>
						</tfoot>
					</table>
				<hr/>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>