<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Wines co.</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<jsp:include page="frame/stylesheets.jsp"></jsp:include>

<script>
	function add_product(f) {
	
		if (f.p_name.value == "") {
			swal("상품 이름을 입력해주세요.", {
				button: "확인"
			});
			f.p_name.focus();
			return;
		}
		if (f.p_price.value == "") {
			swal("가격을 입력해주세요.", {
				button: "확인"
			});
			f.p_price.focus();
			return;
		}
		if (f.p_price.value < f.p_saleprice.value) {
			swal("세일가격이 원가격보다 비쌉니다.", {
				button: "확인"
			});
			f.p_price.value="";
			f.p_saleprice.value = "";
			f.p_price.focus();
			return;
		}
		if (f.p_content.value == "") {
			swal("상품 소개를 입력해주세요.", {
				button: "확인"
			});
			f.p_content.focus();
			return;
		}
		f.action="/wines.co/PController?type=add"
		f.submit();
	}
</script>
</head>
<body>

	<jsp:include page="frame/header.jsp"></jsp:include>
				<li><a href="main_page.jsp" class="nav-link text-left">Home</a></li>
                <li><a href="product_page.jsp" class="nav-link text-left">Shop</a></li>
                <li><a href="" class="nav-link text-left">Q & A</a></li>
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
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w" method="post" enctype="multipart/form-data">
					
					<span class="login100-form-title p-b-32">
						상품 등록
					</span>

					<span class="txt1 p-b-11">
						상품 이름
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="p_name" maxlength="50">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						가격 ( ￦ ) 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						 <input class="input100" type="text" name="p_price" maxlength="10">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						할인 가격 ( ￦ ) 
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="p_saleprice" maxlength="10" placeholder="할인가를 적용하려면 입력하세요">
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						상품 소개
					</span>
					<div class="wrap-input100 validate-input m-b-36">
						<textarea rows="10" cols="50" name="p_content"></textarea>
					</div>
					<span class="txt1 p-b-11">
						상품 이미지
					</span>
						<input class="input100" type="file" name="p_image" >

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" type="button" value="상품 등록" onclick="add_product(this.form)" />
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