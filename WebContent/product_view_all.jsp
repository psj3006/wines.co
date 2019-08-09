<%@page import="com.wines.co.DAO.ProductDAO"%>
<%@page import="com.wines.co.VO.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%-- 관리자 메뉴에서 이동할 수 있는 전체 상품 목록 페이지 --%>
<%
	List<ProductVO> list = ProductDAO.getAllProducts();
	pageContext.setAttribute("list", list);
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
</style>

</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
                <li class="active"><a href="management.jsp" class="nav-link text-left">Management</a></li>
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
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px; width:700px">
					  * 상품클릭시 수정페이지로 이동합니다
					 <hr/>
					<table>
						<thead>
							<tr>
								<th style="width:18%">이미지</th>
								<th>상품명</th>
								<th>가격</th>
								<th>할인 여부</th>
								<th style="width:15%">삭제</th>
							</tr>
						</thead>
						<tbody>
							<!-- 상품 리스트 출력 -->
							<!-- 상품 이미지나 이름 클릭시 수정페이지로 이동 -->
							<!-- 상품 삭제 버튼 클릭시 삭제 -->
							<c:choose>
								<c:when test="${!empty list }">
									<c:forEach var="p" items="${list }">
										<tr>
											<c:choose>
												<c:when test="${!empty p.getP_image() }">
													<td><a href="product_updateForm.jsp?p_num=${p.getP_num() }"><img src="images/${p.getP_image() }" class="img-fluid" style="height:70px"></a></td>
												</c:when>
												<c:otherwise>
													<td><a href="product_updateForm.jsp?p_num=${p.getP_num() }">이미지 없음</a></td>
												</c:otherwise>
											</c:choose>
											<td><a href="product_updateForm.jsp?p_num=${p.getP_num() }">${p.getP_name() }</a></td>
											<td>${p.getP_price() }</td>
											<c:choose>
												<c:when test="${!empty p.getP_saleprice() }">
													<td>${p.getP_saleprice() }</td>
												</c:when>
												<c:otherwise>
													<td>할인 X</td>
												</c:otherwise>
											</c:choose>
											<td>
											<form class="login100-form validate-form flex-sb flex-w" method="post" action="/wines.co/PController?type=delete">
												<input type="submit" value="X" style="margin:0 auto"/>
												<input type="hidden" name="p_num" value="${p.getP_num() }" />
											</form>	
											</td>
											
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">
											준비된 상품이 없습니다
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<br/><hr/><br/>
				<input class="login100-form-btn" type="button" value="돌아가기" onclick="history.go(-1)" style="margin-left:212.5px"/>

			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>