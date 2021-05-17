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
<title>Danh sách người dùng</title>
</head>

<body>
	<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value ='/quan-tri/trang-chu'/>">Trang
								chủ</a></li>
						<li class="active">Danh sách người dùng</li>
					</ul>
					<!-- /.breadcrumb -->
						<div class="nav-search" id="nav-search">
							<form action="<c:url value ='/quan-tri/nguoi-dung/tim-kiem'/>" id="formSearch" method="get">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="keyWord" name="keyWord" autocomplete="off" />
									<input type="hidden" value="1" id="pageSearch" name="pageSearch" /> 
									<input type="hidden" value="2" id="limitSearch" name="limitSearch" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>	
							</form>
						</div><!-- /.nav-search -->		
				</div>
				<div class="page-content">
				  <form action="<c:url value ='/quan-tri/nguoi-dung/danh-sach'/>" id="formSubmit" method="get">	
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
													<th>Tên người dùng</th>
													<th>Username</th>
													<th>Trạng thái</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td>${item.fullName}</td>
															<td>${item.userName}</td>
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
										<input type="hidden" value="" id="page" name="page" /> 
										<input type="hidden" value="" id="limit" name="limit" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
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
	            	$('#limit').val(2);
	            	$('#page').val(page);
	            	$('#formSubmit').submit();
	            	}
	            }
	        });
	    });
	</script>
</body>

</html>