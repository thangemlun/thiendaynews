<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<c:url var="userURL" value="/quan-tri/nguoi-dung/danh-sach" />
<c:url var="userAPI" value="/api/user" />
<c:url var="editUserUrl" value="/quan-tri/nguoi-dung/chinh-sua" />
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <c:if test="${not empty model.id}"><title>Chỉnh sửa người dùng</title></c:if>
      <c:if test="${empty model.id}"><title>Thêm người dùng</title></c:if>
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
                     <a href="/quan-tri/nguoi-dung/danh-sach?page=1&limit=2">Danh sách người dùng</a>
                  </li>
                  <c:if test="${not empty model.id}">
                  <li class="active">Chỉnh sửa người dùng</li>
                  </c:if>
                  <c:if test="${empty model.id}">
                  <li class="active">Thêm người dùng</li>
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
                           <label for="sel1" class="col-sm-3 control-label no-padding-right">Vai trò người dùng</label>
                           <div class="col-sm-9">
                           <form:select path="roleId" id="roleId" cssClass="form-control">
                           		<form:option value="" label="--chọn vai trò người dùng--"/>
                           		<form:options items="${roles}" required="required"/>
                           </form:select>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Tên người dùng </label>
                           <div class="col-sm-9">
                              <form:input path="userName" cssClass="col-xs-10 col-sm-5"/>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Ảnh đại diện </label>
                           <div class="col-sm-9">
                              <input type="file" class="col-xs-10 col-sm-5" id="thumbnail" name="thumbnail" />
                           </div>
                        </div>
                        <div class="form-group">
						  <label class="col-sm-3 control-label no-padding-right" for="fullName">Họ và tên</label>
						  <div class="col-sm-9">
						  	<form:input path="fullName" cssClass="col-xs-10 col-sm-5"/>
						  	</div>
						</div>
						<c:if test="${empty model.id}">
							<div class="form-group">
							 <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Mật khẩu </label>
	                           <div class="col-sm-9">
	                              <form:input type="password" path="password" cssClass="col-xs-10 col-sm-5"/>
	                           </div>
							</div>
						</c:if>
						<c:if test ="${not empty model.id}" >
							<form:input type="hidden" path="password" cssClass="col-xs-10 col-sm-5"/>
						</c:if>
						<div class="form-group">
                           <label for="sel1" class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                           <div class="col-sm-9">
                           <form:select path="status" id="status" cssClass="form-control">
                           		<form:option value="" label="--chọn trạng thái hoạt động--"/>
                           		<form:option value="1">Đang hoạt động</form:option>
                           		<form:option value="0">Không hoạt động</form:option>
                           </form:select>
                           </div>
                        </div>
						<form:hidden path="id" id="userId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
								<button class="btn btn-info" type="button" id="btnAddOrUpdateUser" onclick="warningBeforeAddUser()">
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
    		  $('#btnAddOrUpdateUser').click(function(e) {
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
    			  var id = $('#userId').val();//id này là id của user được tìm trong form
    	    	  var roleId = $('#roleId').val();
    	    	  var status = $('#status').val();
    	    	  if(roleId == ''){
    	    		  Swal.fire({
    	    			  title: 'Error!',
    	    			  text: 'Bạn chưa chọn vai trò cho người dùng',
    	    			  icon: 'error',
    	    			  confirmButtonText: 'OK'
    	    			})
    	    	  }else if(status == '' ){
    	    		  Swal.fire({
    	    			  title: 'Error!',
    	    			  text: 'Bạn chưa chọn trạng thái người dùng ',
    	    			  icon: 'error',
    	    			  confirmButtonText: 'OK'
    	    			})
    	    	  }
    	    	  else if(id == ""){
    					addUser(data);				  
    				  }else {
    					  updateUser(data);
    				  }
    			});
      function addUser(data){
    	  $.ajax({
				url : '${userAPI}',
				type : 'POST',
				contentType: 'application/json',
				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editUserUrl}?&message=insert_success";
				},
				error : function(error) {
					window.location.href = "${userURL}?page=1&limit=2&message=error_system"; 
				},
			});
      }
      function updateUser(data){
    	  $.ajax({
				url : '${userAPI}',
				type : 'PUT',
				contentType: 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					window.location.href = "${editUserUrl}?id="+result.id+"&message=update_success";
				},
				error : function(error) {
					window.location.href = "${editUserUrl}?id="+result.id+"&message=error_system";
				},
			});
      }
      </script> 
   </body>
</html>