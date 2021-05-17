<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
</head>
<body>
	<div id="login">
		<!-- <h3 class="text-center text-white pt-5">Login form</h3> -->
		<div class="container">
			<div id="login-row" class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6" >
					<c:if test="${param.incorrectAccount != null}">
						<div class="alert alert-danger" role="alert">
								Username or password is incorrect
						</div>
					</c:if>
					<c:if test="${param.accessDenied != null}">
						<div class="alert alert-danger" role="alert">
								You are not authorized
						</div>
					</c:if>
					<div id="login-box" class="col-md-12">
						<form id="formLogin" class="form" action="/j_spring_security_check" method="POST">
							<h3 class="text-center text-info">Đăng nhập</h3>
							<div class="form-group">
								<label for="username" class="text-info">Tên đăng nhập:</label><br>
								<input type="text" name="j_username" id="userName"
									class="form-control" placeholder="Tên đăng nhập">
							</div>
							<div class="form-group">
								<label for="password" class="text-info">Mật khẩu:</label><br>
								<input type="password" name="j_password" id="password" class="form-control" placeholder="Mật khẩu" >
							</div>
							<div class="form-group">
								<input type="submit"name="submit" class="btn btn-info btn-md" value="Đăng nhập">
								<label for="remember-me" class="text-info"><span><a href="<c:url value ='/trang-chu'/>" class="text-info">Trở về trang chủ</a></span></label>					
							</div> 
							 <div id="register-link" class="text-right">
								<a href="<c:url value ='/dang-ky'/>" class="text-info">Bạn chưa có tài khoản ?</br></a>
							</div> 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>