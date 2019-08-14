<%@page import="java.util.List"%>
<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px; width:1000px">
					<table>
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>주소</th>
								<th>전화번호</th>
								<th>상세보기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="m" items="${list }">
								<tr>
									<td>${m.getId() }</td>
									<td>${m.getName() }</td>
									<td>${m.getAddr() }</td>
									<td>
										<c:set var="tel" value="${m.getTel() }"/> 
										${fn:substring(tel,0,3) } - ${fn:substring(tel,3,7) } - ${fn:substring(tel,7,11) }
									</td>
									<td>
										<form class="login100-form validate-form flex-sb flex-w" method="post" action="/wines.co/MController?type=goMemberDetail">
											<input type="submit" style="margin:0 auto" value=" "/>
											<input type="hidden" name="id" value="${m.getId() }" />
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>