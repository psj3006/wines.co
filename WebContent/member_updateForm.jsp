<%@page import="com.wines.co.VO.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="com.wines.co.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>
    

	<%
    	// 전화번호 중복확인을 위한 리스트
        List<MemberVO> list = MemberDAO.getAllMembers();

        // 
        MemberVO mvo = (MemberVO)session.getAttribute("mvo");
        String id = mvo.getId();
    %>

<script>
	
	
	// 유효성 검사
	function update(f) {
	
			// 각 항목들 입력확인
			// 이름, 주소는 input 태그에 maxlength로 제한
			
			// 두 비밀번호가 모두 공백이면 원래 비밀번호로 update에 전달
			if (f.pw.value == "" && f.pw2.value == "") {
				f.pw.value = "${mvo.getPw() }";
			// 그 외에 하나라도 입력이 되어있으면
			} else {
				// 비밀번호 정규 표현식 ( 영문(대소문자 무관)과 숫자 적어도 하나씩 포함, 8~20글자)
				var regExp2 = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]{8,20}$/g;
				if (f.pw.value.match(regExp2) == null) {
				    swal("비밀번호 형식이 올바르지 않습니다.", {
						button: "확인"
					});
				    f.pw.value = "";
				    f.pw.focus();
				    return;
				}
				
				if (f.pw.value != f.pw2.value) {
					swal("동일한 비밀번호를 입력해주세요.", {
						button: "확인"
					});
					f.pw.value = "";
					f.pw2.value = "";
					f.pw2.focus();
					return;
				}
			}
			// 공백이면 원래값 전달
			if (f.tel.value == "") {
				f.tel.value = "${mvo.getTel() }";
			// 전화번호를 입력했을때 유효성 검사
			} else {
				// 전화번호 형식확인 (숫자로만 11자리)
				var regExp3 = /^\d{11}$/g;
				if (f.tel.value.match(regExp3) == null) {
				    swal("전화번호 형식이 올바르지 않습니다.", {
						button: "확인"
					});
				    f.tel.value = "";
				    f.tel.focus();
				    return;
				}
				<%for (MemberVO chkTel:list) {%>
				 	if ( "<%=chkTel.getTel()%>" == f.tel.value) { 
				 		swal("이미 등록된 전화번호 !", "다른 전화번호를 사용해주세요.", "error", {
							button: "확인"
						});
				 		f.tel.value = "";
				 		f.tel.focus();
				 		return;
				 	}
				<% } %>
			}
			// 공백이면 원래값 전달
			if (f.name.value == "") {
				f.name.value = "${mvo.getName() }";
			}
			
			// 공백이면 원래값 전달
			if (f.addr.value == "") {
				f.addr.value = "${mvo.getAddr() }";
			}
			
			swal("회원 정보수정완료 !", "잠시 후 마이페이지로 돌아갑니다.", {
				  button: false,
			});
			// swal 은 alert 와 다르게 확인을 누르지않아도 자동으로 페이지가 이동해버려서
			// setTimeout 을 걸어서 1초뒤에 member_update.jsp로 넘어가게했음
			setTimeout(function(){
				f.action = "member_update.jsp";
				f.submit();
			}, 1000);
		}


</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="mainPage.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
                <li class="active"><a href="mypage.jsp" class="nav-link text-left">My page</a></li>
                <li><a href="logout.jsp" class="nav-link text-left">Logout</a></li>
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
				<form class="login100-form validate-form flex-sb flex-w" method="post">
					
					<span class="login100-form-title p-b-32">
						회원 정보수정
					</span>

					<span class="txt1 p-b-11">
						아이디
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" value="<%= id %>" disabled="disabled">
						<input type="hidden" name="id" value="<%= id %>">
					</div>
					<span class="txt1 p-b-11">
						비밀번호 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="password" name="pw" maxlength="20" placeholder="영문 숫자 필수, 8~20자 이내">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						비밀번호 확인
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="password" name="pw2" maxlength="20" placeholder="영문 숫자 필수, 8~20자 이내">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						이름
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="name" maxlength="20">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						주소
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="addr" maxlength="100">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						전화번호 ( ' - ' 제외 11자리 입력 )
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="tel" maxlength="11" placeholder="ex) 01012341234">
						<span class="focus-input100"></span>
					</div>
					

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="정보수정" onclick="update(this.form)" />
						<input class="login100-form-btn2" type="button" value="돌아가기" onclick="history.go(-1)" />
					</div>
					

				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>