<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="login.css" type="text/css" />
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<title>Log In</title>
</head>
<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="assets/img/logo.png" class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form id="login-form" action="login" method="get">
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="username"
								class="form-control input_user" value="" placeholder="username" id="username">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password"
								class="form-control input_pass" value="" placeholder="password" id="password">
						</div>
						<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customControlInline"> <label
									class="custom-control-label" for="customControlInline">Remember
									me</label>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-3 login_container">
						
							<button name="button" class="btn login_btn" id="loginbutton">Login</button>
						</div>
							<span class="error" id="wrong_message"></span>
					</form>
				</div>
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Don't have an account? <a href="register.jsp" class="ml-2">Sign
							Up</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script>
$(function(){
	$("#loginbutton").click(function(){
		event.preventDefault();
		let usn = $("#username").val();
		let pwd =$("#password").val();
		$.get("login?username="+usn+"&password="+pwd, function(back){
			let flag = Number(back);
			if(flag!=1){
				$("#wrong_message").text("invalid username or password");
			}else{
				window.location.href="index?username="+usn;
			}
		})
	})
	
})
$("input[type=text]").focus(function(){
	$("#wrong_message").empty();
})
</script>
</html>