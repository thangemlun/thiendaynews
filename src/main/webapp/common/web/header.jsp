<%@ page import="com.thienday.util.SecurityUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/trang-chu'/>">Thiên Đây NEWS</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" href="<c:url value='/trang-chu'/>">Trang chủ
						<span class="sr-only">(current)</span>
				</a></li>
				<security:authorize access = "isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/dang-nhap'/>">Đăng nhập</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value ='/dang-ky'/>">Đăng ký</a></li>
				</security:authorize>
				<security:authorize access = "isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="#">Welcome <%=SecurityUtils.getPrincipal().getUserName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/thoat'/>">Thoát</a></li>
				</security:authorize>
					<li class="nav-item">
						<form action="<c:url value ='/tim-kiem'/>" class="form-inline mt-2 mt-md-0">
				            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="keyWord" required="required"/>
				            <input type="hidden" value="1" name="page" /> 
							<input type="hidden" value="3" name="limit" />
				            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				        </form>
				    </li>
			</ul>
		</div>
	</div>	
</nav>
