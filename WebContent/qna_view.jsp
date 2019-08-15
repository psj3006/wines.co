<%@page import="com.wines.co.VO.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	tr, td, th { text-align: center; word-break:break-all }
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
<%
	String id = null;
	if (session.getAttribute("mvo")!=null) {
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		id = mvo.getId();
	}
%>
<script>
 // 수정 & 삭제 페이지
 	function up_del_qna(f) {
 		if (f.id.value == '<%=id %>' || '<%=id%>' == 'admin') {
			f.action = "qna_up_del_page.jsp";
			f.submit();
 		} else {
 			swal("자신이 등록한 게시물만 수정이 가능합니다", {
				button: "확인"
			});
			return;
 		}
 	}
 // 댓글 삭제 클릭시 아이디 맞는지 확인후 삭제
 	function delete_comment(f) {
		if (f.id.value == '<%=id %>' || '<%=id%>' == 'admin') {
			f.action = "/wines.co/QController?type=deleteCom";
			f.submit();
		} else {
			swal("자신이 등록한 댓글만 삭제할 수 있습니다", {
				button: "확인"
			});
			return;
		}
	}
 
 // 댓글 달기 클릭시 댓글 등록
 	function write_comment(f) {
	 	if ('<%=id %>' == 'null') {
	 		swal("댓글을 작성하려면 로그인이 필요합니다", {
				button: "확인"
			});
			return;
	 	}
	 	if (f.com_content.value == "") {
			swal("내용을 입력해주세요.", {
				button: "확인"
			});
			f.com_content.focus();
			return;
		}
	 	f.action = "/wines.co/QController?type=writeCom";
	 	f.submit();
 }
</script>
</head>
<body>
	<jsp:include page="frame/header.jsp"></jsp:include>
	<li><a href="/wines.co/MController?type=goMain" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li class="active"><a href="/wines.co/QController?type=goQna" class="nav-link text-left">Q & A</a></li>
			<c:choose>
				<c:when test="${mvo.getId() != 'null' && mvo.getId() eq 'admin'}">
					<li><a href="management.jsp" class="nav-link text-left">Management</a></li>
		        	<li><a href="/wines.co/MController?type=logout" class="nav-link text-left">Logout</a></li>
		        </c:when>
		        <c:otherwise>
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
				<p class="login100-form-title p-b-32" style="word-break:break-all">
					${qvo.getSubject() }
				</p>
				<form method="post">
					<div class="wrap-input100 validate-input m-b-36" style="padding:10px;">
					<jsp:scriptlet>
    					pageContext.setAttribute("cr", "\r");
					    pageContext.setAttribute("lf", "\n");
					    pageContext.setAttribute("crlf", "\r\n");
					</jsp:scriptlet>
						${fn:replace(qvo.getContent() , crlf, '</br>' )}
					</div>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="수정&삭제" onclick="up_del_qna(this.form)" />
						<input type="hidden" name="id" value="${qvo.getId() }" />
						<input class="login100-form-btn2" type="button" value="돌아가기" onclick="history.go(-1)" style="right:50px"/>
					</div>
				</form>
				<br/><hr/><br/>
				<c:if test="${empty cList }">
					댓글이 없습니다
				</c:if>
				<c:if test="${not empty cList }">
					<c:forEach var="c" items="${cList }">
						<form method="post">
							<table>
								<tr>
									<td style="width:20%">
										<c:set var="id" value="${fn:split(c.getId(), '@') }" />
										<c:forEach var="id" items="${id}" varStatus="i">
		      							  <c:if test="${i.count == 1}">${id }</c:if>
										</c:forEach> 
									</td>
									<td style="width:50%">${c.getCom_content() }</td>
									<td style="width:16%">${c.getCom_regdate()}</td>
									<td style="width:10%">
										<input type="button" value="X" style="margin:0 auto" onclick="delete_comment(this.form)"/>
										<input type="hidden" name="com_num" value="${c.getCom_num() }" />		<!-- 삭제를 위한 댓글번호 -->
										<input type="hidden" name="id" value="${c.getId() }" />				<!-- 본인이 쓴 댓글인지 확인 -->
										<input type="hidden" name="q_num" value="${qvo.getQ_num() }" />		<!-- 삭제 후 본 페이지로 돌아오기 위한 글번호 -->
									</td>
								</tr>
							</table>
						</form>
					</c:forEach>
				</c:if>
				<br/><hr/><br/>
				<form method="post">
					<table>
						<tbody>
							<tr>
								<th><input id="writebutton" type="button" value="댓글 달기" onclick="write_comment(this.form)" /></th>
								<td style="border:1px solid lightgray; width:370px"><textarea name="com_content" rows="5" cols="50" style="margin:0px; padding:10px"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="q_num" value="${qvo.getQ_num() }" />
					<input type="hidden" name="id" value="<%=id %>" />
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>