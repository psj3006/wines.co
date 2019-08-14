<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	.disable { color: silver; }
	.now { font-weight: bold; }
	#writebutton {
		color: #fff;
		line-height: 0.9;
		min-width:100px;
		height: 40px;
		background-color: #333333;
		border-radius: 27px;
		transition: all 0.4s;
	}
	#writebutton:hover {
		background-color: #57b846;
	}
</style>
<script>
	function login_plz() {
		swal("로그인이 필요합니다 !", {
			button: "확인"
		});
	}
</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li class="active"><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
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
	
	<div class="limiter">
		<div class="container-login100" style="margin-top:50px;">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55" style="padding:55px 50px; width:700px">
			<c:if test="${!session_chk && !cookie_chk}">
	    		<div class="col-12 section-title text-center mb-5">
	           		<p>글 작성을 위해서는 로그인이 필요합니다.</p>
	         	</div>
			</c:if>
				<c:choose>
	        		<c:when test="${session_chk eq true || cookie_chk eq true}">
		        		<p style="text-align: right;"><input id="writebutton" type="button" value="글쓰기" onclick="location.href='qna_write.jsp'" /></p>
					</c:when>
					<c:otherwise>
		        		<p style="text-align: right;"><input id="writebutton" type="button" value="글쓰기" onclick="login_plz()"/></p>
		        	</c:otherwise>
		        </c:choose>
			<table>
				<thead>
					<tr>
						<td style="width:10%">번호</td>
						<td style="width:15%">작성자</td>
						<td style="width:40%">제목</td>
						<td style="width:20%">작성일</td>
						<td style="width:15%">조회수</td>
					</tr>
				</thead>
				<tbody>
				<!-- fn:split 을 이용해서 이메일 주소(id) 중에 '@' 앞부분만 작성자에 보이게 함 -->
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="q" items="${list }">
						<tr>
							<td>${q.getQ_num() }</td>
							<td>
								<c:set var="id" value="${fn:split(q.getId(), '@') }" />
								<c:forEach var="id" items="${id}" varStatus="i">
      							  <c:if test="${i.count == 1}">${id }</c:if>
								</c:forEach> 
							</td>
							<td><a class="thumbnail mb-4" href="/wines.co/QController?type=qna_view&q_num=${q.getQ_num() }&nowPage=${pvo.getNowPage() }">${q.getSubject() }</a></td>
							<td>
								<fmt:parseDate value="${q.getRegdate()}" var="dateFmt" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${dateFmt}" pattern="yyyy-MM-dd"/>
							</td>
							<td>${q.getHit() }</td>
						</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">게시물 없음</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
						<c:choose>
							<c:when test="${pvo.getBeginPage() <= pvo.getPagePerBlock() }">
								<span class="disable">◀&nbsp;</span>
							</c:when>
							<c:otherwise>
								<a href="/wines.co/QController?type=goQna&cPage=${pvo.getBeginPage() - 1 }">◀&nbsp;</a>
							</c:otherwise>
						</c:choose>
						<c:forEach var="p" begin="${pvo.getBeginPage() }" end="${pvo.getEndPage() }" step="1">
							<c:choose>
								<c:when test="${p eq pvo.getNowPage() }">
									<span class="now">${p }&nbsp;</span>
								</c:when>
								<c:otherwise>
									<a href="/wines.co/QController?type=goQna&nowPage=${p }">${p }&nbsp;</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pvo.getEndPage() >= pvo.getTotalPage() }">
								<span class="disable">&nbsp;▶</span>
							</c:when>
							<c:otherwise>
								<a href="/0805_MVC_BBS/Controller?type=allListView&cPage=${pvo.getBeginPage() + pvo.getPagePerBlock() }">&nbsp;▶</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</tfoot>
			</table>
			</div>
		</div>
	</div>
    
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>