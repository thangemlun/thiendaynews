<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="userAPI" value="api/user" />
<c:url var="userURL" value="/quan-tri/nguoi-dung/danh-sach" />
<c:url var="searchUser" value="/quan-tri/nguoi-dung/tim-kiem"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Tìm kiếm</title>
</head>

<body>
	<div class="main-content">
			<div class="main-content-inner">
			<form action="<c:url value ='/quan-tri/nguoi-dung/tim-kiem'/>" id="formSubmit" method="get">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value ='/quan-tri/trang-chu'/>">Trang
								chủ</a></li>
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value ='/quan-tri/nguoi-dung/danh-sach?page=1&limit=2'/>">Danh sách người dùng</a></li>
						<li class="active">Tìm kiếm</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
				  	
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
										<c:url var="createUserURL" value = "/quan-tri/nguoi-dung/chinh-sua" />
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm bài viết'
												href="${createUserURL}"> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th>Username</th>
													<th>Tên người dùng</th>
													<th>Password</th>
													<th>Trạng thái</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
														<tr>
														    <td>${item.userName}</td>
															<td>${item.fullName}</td>
															<td>${item.password}</td>
															<c:if test="${item.status == 1}" >
																<td>Đang hoạt động</td>
															</c:if>
															<c:if test="${item.status != 1}" >
																<td>Không hoạt động</td>
															</c:if>
															<td>
																<c:url var="updateUserURL" value="/quan-tri/nguoi-dung/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateUserURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="pageSearch" name="pageSearch" /> 
										<input type="hidden" value="" id="limitSearch" name="limitSearch" />
										<input type="hidden" value="${model.keyWord}" id="keyWord" name="keyWord" />
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>
			</form>
		</div>		
	</div>

	<!-- /.main-content -->
	<script type="text/javascript">
	 var totalPages = ${model.totalPage};
	 var currentPage = ${model.page};
	 $(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 10,
	            startPage:currentPage,
	            onPageClick: function (event, page) {
	            if (currentPage != page){	
	            	$('#pageSearch').val(page);
	            	$('#limitSearch').val(2);
	            	$('#formSubmit').submit();
	            	}
	            }
	        });
	    });
	</script>
</body>

</html>