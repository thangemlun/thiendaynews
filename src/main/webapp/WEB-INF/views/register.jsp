<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<c:url var="userRegisterURL" value="/dang-ky" />
<c:url var="userAPI" value="/api/user" />
<!DOCTYPE html>
<html>
<head>
<title>Đăng ký</title>
</head>
<body>

<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<c:if test="${not empty message}">
		<div id="alert" class="alert alert-${alert} alert-dismissible">${message}
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
	</c:if>	
	<h4 class="card-title mt-3 text-center"> Đăng ký người dùng </h4>
	<p class="text-center">Bắt đầu tạo tài khoản</p>
	<form id="registerForm" action='<c:url value ='/dang-ky'/>' method="post">
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input class="form-control" name="userName" placeholder="Tên đăng nhập" type="text" required="required">
    </div> <!-- form-group// -->
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input class="form-control" name="fullName" placeholder="Họ và Tên" type="text" required="required">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="" class="form-control" placeholder="Email " type="email" >
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
    	<input name="" class="form-control" placeholder="Số điện thoại" type="text">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input class="form-control" name="password" placeholder="Nhập mật khẩu" type="password" required="required">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input class="form-control" name="passwordConfirm"  placeholder="Xác nhận mật khẩu " type="password" required="required">
    </div> <!-- form-group// -->       
    <input type="hidden" value="1" id="status" name ="status" />
    <input type="hidden" value="2" id="roleId" name ="roleId"/>
    <input type="hidden" id="message" name="message" />                                
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Đăng Ký  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="<c:url value ='/dang-nhap'/>">Log In</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->
<article class="bg-secondary mb-3">  
<div class="card-body text-center">
    <h3 class="text-white mt-3">THIÊN ĐÂY NEWS</h3>
<p class="h5 text-white"> TRANG TIN TỨC <br> CẬP NHẬT TIN TRONG NƯỚC VÀ NGOÀI NƯỚC MỖI NGÀY  </p>   <br>
<p><a class="btn btn-warning" target="_blank" href="<c:url value ='/trang-chu'/>"> Trở về trang chủ  </a></p>
</div>
<br>
</article>
</body>
</html>