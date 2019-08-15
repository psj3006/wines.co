<%@page import="java.util.List"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		background-color: #57b846;
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
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px">
					<span>[ ${id } ] </span><span class="txt1 p-b-11"> 님의 주문내역</span>
					<hr/>
					<table>
						<thead>
							<tr>
								<th>주문번호</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${!empty o_list }">
									<c:forEach var="o" items="${o_list }">
										<tr>
											<td>${o }</td>
											<td>
												<form class="login100-form validate-form flex-sb flex-w" method="post" action="product_view_order_detail.jsp">
													<input type="submit" style="margin:0 auto" value=" "/>
													<input type="hidden" name="o_num" value="${o }" />
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="2">
											장바구니에 담긴 상품이 없습니다
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<hr/>
					<br/>
					<span>[ ${id } ] </span><span class="txt1 p-b-11"> 님의 게시글</span>
					<hr/>
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>작성일</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${!empty qvo }">
									<c:forEach var="q" items="${qvo }">
										<tr>
											<td>${q.getSubject() }</td>
											<td>${q.getRegdate() }</td>
											<td>
												<form class="login100-form validate-form flex-sb flex-w" method="post" action="/wines.co/QController?type=qna_view&q_num=${q.getQ_num() }">
													<input type="submit" style="margin:0 auto" value=" "/>
												</form>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="3">
											작성한 게시글이 없습니다
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<hr/>
					<br/>
					<input class="login100-form-btn" type="button" value="돌아가기" onclick="history.go(-1)" style="margin:0 auto"/>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>