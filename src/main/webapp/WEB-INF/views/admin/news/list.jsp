<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="newsAPI" value="/api/news" />
<c:url var="newsURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="searchNews" value="/quan-tri/bai-viet/tim-kiem"/>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Danh sách bài viết</title>
</head>

<body>
	<div class="main-content">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value ='/quan-tri/trang-chu'/>">Trang
								chủ</a></li>
						<li class="active">Danh sách bài viết</li>
					</ul>
					<!-- /.breadcrumb -->
						<div class="nav-search" id="nav-search">
							<form action="<c:url value ='/quan-tri/bai-viet/tim-kiem'/>" id="formSearch" method="get">
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
				  <form action="<c:url value ='/quan-tri/bai-viet/danh-sach'/>" id="formSubmit" method="get">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
										<c:url var="createNewsURL" value = "/quan-tri/bai-viet/chinh-sua" />
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm bài viết'
												href="${createNewsURL}"> <span>
													<i class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa bài viết' disabled =''>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
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
													<th style="width : 100px "> <input type="checkbox" id="checkAll"> Chọn tất cả</th>
													<th>Mã thể loại</th>
													<th>Tên bài viết</th>
													<th>Mô tả ngắn</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" name="checkid" id="checkbox_${item.id}" value="${item.id}" ></td>
															<td>${item.categoryCode}</td>
															<td>${item.title}</td>
															<td>${item.shortDescription}</td>
															<td>
																<c:url var="updateNewsURL" value="/quan-tri/bai-viet/chinh-sua">
																	<c:param name="id" value="${item.id}"/>															
																</c:url>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateNewsURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
	<c:if test="${not empty model.listResult}">
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
	 
/* 	function warningBeforeDelete(){
		 swal({
			  title: "Xác nhận xóa !",
			  text: "Bạn có chắc chắn muốn xóa không ?",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonClass: "btn-success",
			  cancelButtonClass: "btn-danger",
			  confirmButtonText: "Xác nhận",
			  cancelButtonText: "Hủy bỏ",
			}).then(function(isConfirm){
				  if (isConfirm) {
					  //call api delete
						var ids = $('tbody input[type=checkbox]:checked').map(function() {
							return $(this).val();
						}).get();
						deleteNews(ids);
				  }
			});
	 } */   
	 $("#checkAll").change(function () {
		    $("input:checkbox").prop('checked', $(this).prop("checked"));  
		});
	 
	 $("input[type='checkbox']").change(function(){
		 var result = "";
		 for(var i = 0 ; i < $("input[type='checkbox']").length ; i ++ ){
			 if($("input[type='checkbox']")[i].checked === true )
				 {
				 	if($("input[type='checkbox']").length > 1)
				 		{
				 			result += ' [' + $("input[type='checkbox']")[i].value + ']' ;
				 		}
				 }
		 }
		 if(result != '')
			 {
			 document.getElementById('btnDelete').disabled = null;
			 }
		 else {
			 document.getElementById('btnDelete').disabled = 'disabled';
		 }
	 });
	 
	 /* 
	 $("input[type='checkbox']").change(function() {
		    if(this.checked) {
		    	 document.getElementById('btnDelete').disabled = null ;
		    }
		    else {
		    	 document.getElementById('btnDelete');
		}); */
	 
	function warningBeforeDelete(){
		 $.confirm({
			    title: 'Xóa bài viết!',
			    content: 'Bạn có chắc chắn xóa không!',
			    buttons: {
			        confirm:{
			        	action: function () {
				        	var ids = $('tbody input[type=checkbox]:checked').map(function() {
								return $(this).val();
							}).get();
							deleteNews(ids);
				        }
			        },
			        cancel: function () {
			            $.alert('Đã cancel thao tác!');
			        }
			    }
			});
	 }

	 function deleteNews(data) {
			$.ajax({
						url : '${newsAPI}',
						type : 'DELETE',
						contentType : 'application/json',
						data : JSON.stringify(data),
						success : function(result) {
							window.location.href = "${newsURL}?page=1&limit=2&message=delete_success";
						},
						error : function(error) {
							window.location.href = "${newsURL}?page=1&limit=2&message=error_system";
						},
					});
		}
	</script>
	</c:if>
</body>

</html>