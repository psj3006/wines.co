<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>

</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
	
				<li><a href="main_page.jsp" class="nav-link text-left">Home</a></li>
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
					<span class="login100-form-title p-b-32">
						장바구니
					</span>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="이동" onclick="" />
					</div>
					<br /><hr /><br />
					<span class="login100-form-title p-b-32">
						주문조회
					</span>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="이동" onclick="" />
					</div>
					<br /><hr /><br />
					<span class="login100-form-title p-b-32">
						회원 정보수정
					</span>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="이동" onclick="location.href='member_updateForm.jsp'" />
					</div>
					<br /><hr /><br />
					<span class="login100-form-title p-b-32">
						회원 탈퇴
					</span>
					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="이동" onclick="" />
					</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="frame/footer.jsp"></jsp:include>
	<jsp:include page="frame/jss.jsp"></jsp:include>

</body>
</html>

