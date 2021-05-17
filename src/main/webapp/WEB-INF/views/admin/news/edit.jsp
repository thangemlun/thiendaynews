<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<c:url var="newsURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="newsAPI" value="/api/news" />
<c:url var="editNewsUrl" value="/quan-tri/bai-viet/chinh-sua" />
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <c:if test="${not empty model.id}">
      		<title>Chỉnh sửa bài viết</title>
      </c:if>
      <c:if test="${empty model.id}">
      		<title>Thêm bài viết</title>
      </c:if>
   </head>
   <body>
      <div class="main-content">
         <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
               <ul class="breadcrumb">
                  <li>
                     <i class="ace-icon fa fa-home home-icon"></i>
                     <a href="/quan-tri/trang-chu">Home</a>
                  </li>
                  <li>
                     <a href="/quan-tri/bai-viet/danh-sach?page=1&limit=2">Danh sách bài viết</a>
                  </li>
                  <c:if test="${not empty model.id}">
                  <li class="active">Cập nhật bài viết</li>
                  </c:if>
                  <c:if test="${empty model.id}">
                  <li class="active">Thêm bài viết</li>
                  </c:if>
               </ul>
               <!-- /.breadcrumb -->
            </div>
            <div class="page-content">
               <div class="row">
                  <div class="col-xs-12">
                  		<c:if test="${not empty message}">
                  			<div class="alert alert-${alert}" role="alert">
  								${message}  
							</div>
						</c:if>
                     <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
                     <div class="form-group">
                           <label for="sel1" class="col-sm-3 control-label no-padding-right">Thể loại:</label>
                           <div class="col-sm-9">
                           <form:select path="categoryCode" id="categoryCode" cssClass="form-control">
                           		<form:option value="" label="--chọn thể loại--"/>
                           		<form:options items="${categories}"/>
                           </form:select>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tên bài viết </label>
                           <div class="col-sm-9">
                              <form:input path="title" cssClass="col-xs-10 col-sm-5"/>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Ảnh đại diện </label>
                           <div class="col-sm-9">
                              <form:input path="thumbnail" cssClass="col-xs-10 col-sm-5" placeholder="Nhúng đường link ảnh từ googledrive ..." />
                              <%-- <form:input class="col-xs-10 col-sm-5" path ="thumbnail" placeholder="nhúng ảnh từ google drive ..." /> --%>
                           </div>
                        </div>
                        <div class="form-group">
						  <label class="col-sm-3 control-label no-padding-right" for="shortDescription">Mô tả ngắn</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="shortDescription" cssClass="form-control" rows="5" cols="10" id="shortDescription"/> 
						  	</div>
						</div>
						<div class="form-group">
						  <label class="col-sm-3 control-label no-padding-right" for="content">Nội dung</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="content" cssClass="form-control" rows="" cols="" style="width: 820px ;height: 175px" id="content"/> 
						  	</div>
						</div>
						<form:hidden path="id" id="newsId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateNew">
									<i class="ace-icon fa fa-check bigger-110"></i>
										Xác nhận
								</button>
								
								&nbsp; &nbsp; &nbsp;
								
								<button class="btn" type="reset">
									<i class="ace-icon fa fa-undo bigger-110"></i>
										Hủy
								</button>
							</div>
						</div>
                     </form:form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script>
  			//CKeditor
		var editor = '';
		$(document).ready(function() {
			editor = CKEDITOR.replace('content');
		});
      $('#btnAddOrUpdateNew').click(function(e) {
    	  e.preventDefault();
    	 // var content = $('#content').val();
    	 // var shortDescription = $('#shortDescription').val();
    	 // Thay vì gán giá trị các phần từ trong form với jquery như trên thì ta sẽ dùng cách sau.
    	  var data = {};//data là 1 mảng để đưa các giá trị từ formData vào.
    	//lấy dữ liệu từ các field theo name của field trong form với form có id đã xác định là $('#formSubmit').
		  var formData = $('#formSubmit').serializeArray();
		  $.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
		  data["content"] = editor.getData();
		  var id = $('#newsId').val();//id này là id của News được tìm trong form
		  if($('#categoryCode').val() != '')
			  {
			  	if(id == "")
			  		{
						addNews(data);				  
				  	}else {
					  updateNews(data);
				  	} 
			  }else{
					Swal.fire({
						  icon: 'error',
						  title: 'Lỗi',
						  text: 'Bạn chưa chọn thể loại!'
						})
			  } 
		});
      	
      function addNews(data){
    	  $.ajax({
				url : '${newsAPI}',
				type : 'POST',
				contentType: 'application/json',
				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editNewsUrl}?&message=insert_success";
				},
				error : function(error) {
					window.location.href = "${newsURL}?page=1&limit=2&message=error_system"; 
				},
			});
      }
      function updateNews(data){
    	  $.ajax({
				url : '${newsAPI}',
				type : 'PUT',
				contentType: 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editNewsUrl}?id="+result.id+"&message=update_success";
				},
				error : function(error) {
					window.location.href = "${editNewsUrl}?id="+result.id+"&message=error_system";
				},
			});
      }
      </script> 
   </body>
</html>