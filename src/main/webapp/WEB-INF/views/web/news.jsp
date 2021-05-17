<%@page import="com.thienday.service.ICommentService"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.thienday.util.SecurityUtils"%>
<%@ page import="com.thienday.service.impl.CommentService"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<c:url var="rateAPI" value="/api/rate" />
<c:url var="commentAPI" value="/api/comment" />
<c:url var="newsUrl" value="/bai-viet" />
<!DOCTYPE html>

<html>

<head>

<title>${model.title}</title>

</head>

<body>
	 <main role="main" class="container">
      <div class="row">
        <div class="col-md-8 blog-main">
        <br> 
        <p class="blog-post-meta"> <strong>${createdDate} </strong>, by <a href="#" class="text-info">${author}</a></p>
        <c:if test="${not empty message}">
			<div id="alert" class="alert alert-${alert} alert-dismissible">${message}
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
	 	</c:if> 
          	${model.content}
        </div><!-- /.blog-main -->
        <aside class="col-md-4 blog-sidebar">
        
          <div class="p-3">
            <h4 class="font-italic">Archives</h4>
            <ol class="list-unstyled mb-0">
              <c:forEach var="item" items="${categories}" >
              <c:url var="categoryUrl" value="/danh-muc" >
              	<c:param name="code" value="${item.code}"/>
              	<c:param name="page" value="1"/>
              	<c:param name="limit" value="3"/>
              </c:url>
              	<li><a href="${categoryUrl}" class="text-info">${item.name}</a></li>
              </c:forEach>
            </ol>
          </div>
          <br>
          <div class="p-3 mb-3 bg-light rounded">
			<iframe src="https://covid19.vnanet.vn/home/indexwigetsummary" width="100%" style="min-height:100px;padding-top:10px;"></iframe>
          </div>
          <security:authorize access = "isAnonymous()">
          	<div class="container d-flex justify-content-center mt-100">
				<div class="row">
			        <div class="col-md-6">
			            <div class="card">
			                <div class="card-body text-center"><span class="myratings">0</span>
			                    <h4 class="mt-1">Vui lòng đăng nhập để đánh giá bài viết</h4>
							  </div>
				          </div>
			        </div>
				</div>
			</div>
          </security:authorize>
          <security:authorize access = "isAuthenticated()">
          	<c:if test="${isRatedUser eq 1}">
          		<div class="container d-flex justify-content-center mt-100">
									<div class="row">
								        <div class="col-md-6">
								            <div class="card">
								                <div class="card-body text-center">						   
								                    	<h4 id="emote" class="mt-1">Bạn đã đánh giá ${ratedUser.ratenumber} ★ </h4>
								                    	<a class="text-info" id="fixRating"><i class="fa fa-pencil fa-fw"></i> Đánh giá lại bài viết </a>
								                    		<fieldset class="rating" style = "display:none" id ="ratingsection"> 
								                    		<form id="formRatingNews">
								                    			<input type="hidden" value="${ratedUser.ratenumber}" id="ratenumber" name="ratenumber" />
										                		<input type="hidden" value="${model.title}" id="newsTitle" name="newsTitle" /> 
																<input type="hidden" value="<%=SecurityUtils.getPrincipal().getUserName()%>" id="userName" name="userName" />
																<input type="hidden" value="${ratedUser.id}" id="id" name = "id" />
																<input type="hidden" value="${pagenow}" id="pageNow"/>
								                    		 </form>
									                    		<input type="radio" id="star5" name="rating" value="5" />
										                    	<label class="full" for="star5" title="Awesome - 5 stars"></label> 
											                    
											                    <input type="radio" id="star4" name="rating" value="4" />
											                    <label class="full" for="star4" title="Pretty good - 4 stars"></label> 
												                   
											                    <input type="radio" id="star3" name="rating" value="3" />
											                    <label class="full" for="star3" title="Meh - 3 stars"></label> 
												                  
												                <input type="radio" id="star2" name="rating" value="2" />
											                    <label class="full" for="star2" title="Kinda bad - 2 stars"></label> 
												                    
											                    <input type="radio" id="star1" name="rating" value="1" />
											                    <label class="full" for="star1" title="Sucks big time - 1 star"></label> 
												                   
											                    <input type="radio" class="reset-option" name="rating" value="reset" /> 
									                    	</fieldset>
									                   
												  </div>
									          </div>
								        </div>
									</div>
								</div>
								<script>
								$(document).ready(function(){
									$("#fixRating").one('click',function(){
										if(document.getElementById('ratingsection').style.display === "none")
											{
											document.getElementById('ratingsection').style.display = "block";
											$('#ratingsection').focus();
											$("#fixRating").hide();
											}
									});
									$("input[type='radio']").click(function(){
										//alert(sim);
										var sim = $("input[type='radio']:checked").val();
										$("#ratenumber").val(sim);
										if (sim<3) { 
											$('.myratings').css('color','red'); 
											$(".myratings").text(sim);
											}	
										else
											{
												$('.myratings').css('color','green'); 
												$(".myratings").text(sim); 
											} 
										$.confirm({
							  			    title: 'Đánh giá lại bài viết !',
							  			    content: 'Bạn muốn đánh giá bài viết này ' + sim + ' sao',
							  			    buttons: {
							  			        confirm:{
							  			        	action: function () {
							  			        		  	   var data = {};//data là 1 mảng để đưa các giá trị từ formData vào.
							  			        	    	//lấy dữ liệu từ các field theo name của field trong form với form có id đã xác định là $('#formComment').
							  			        			  var formData = $('#formRatingNews').serializeArray();
							  			        		  	  $("#ratenumber").val(sim);
							  			        			 $.each(formData, function(i, v) {
							  			        				data["" + v.name + ""] = v.value;
							  			        			});
							  			  				rateNews(data);				 						
							  			        	}
							  			        },
							  			        cancel: function () {
							  			            $.alert('Đã cancel thao tác!');
							  			        }
							  			    }
							  			}); 
										
										}); 
									});
								function rateNews(data){
									$.ajax({
						   				url : '${rateAPI}',
						   				type : 'PUT',
						   				contentType: 'application/json',
						   				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
						   				dataType : 'json',
						   				success : function(result) {
						   					window.location.href = "${newsUrl}?title="+$('#newsTitle').val()+"&page=${pagenow}&limit=3&message=rate_news_success";
						   				},
						   				error : function(error) {
						   					window.location.href = "${newsURL}?title="+$('#newsTitle').val()+"&page=${pagenow}&limit=3&message=rate_news_error"; 
						   				},
						   			});
								}
								</script>
          	</c:if>	
          	<c:if test="${isRatedUser eq 0}" >
					          	<div class="container d-flex justify-content-center mt-100">
									<div class="row">
								        <div class="col-md-6">
								            <div class="card">
								                <div class="card-body text-center">
								                	<form id="formRatingNews">
								                		<span class="myratings">0</span>
								                		<input type="hidden" value="" id="ratenumber" name="ratenumber" />
								                		<input type="hidden" value="${model.title}" id="newsTitle" name="newsTitle" /> 
														<input type="hidden" value="<%=SecurityUtils.getPrincipal().getUserName()%>" id="userName" name="userName" />
														<input type="hidden" value="${pagenow}" id="pageNow"/>
								                    	<h4 id="emote" class="mt-1">Đánh giá bài viết</h4>
								                	</form>
									                    	<fieldset class="rating"> 
									                    		<input type="radio" id="star5" name="rating" value="5" />
										                    	<label class="full" for="star5" title="Awesome - 5 stars"></label> 
											                    
											                    <input type="radio" id="star4" name="rating" value="4" />
											                    <label class="full" for="star4" title="Pretty good - 4 stars"></label> 
												                   
											                    <input type="radio" id="star3" name="rating" value="3" />
											                    <label class="full" for="star3" title="Meh - 3 stars"></label> 
												                  
												                <input type="radio" id="star2" name="rating" value="2" />
											                    <label class="full" for="star2" title="Kinda bad - 2 stars"></label> 
												                    
											                    <input type="radio" id="star1" name="rating" value="1" />
											                    <label class="full" for="star1" title="Sucks big time - 1 star"></label> 
												                   
											                    <input type="radio" class="reset-option" name="rating" value="reset" /> 
									                    	</fieldset>
												  </div>
									          </div>
								        </div>
									</div>
								</div>
							<script>
									$(document).ready(function(){
										$("input[type='radio']").click(function(){
										//alert(sim);
										var sim = $("input[type='radio']:checked").val();
										$("#ratenumber").val(sim);
										if (sim<3) { 
											$('.myratings').css('color','red'); 
											$(".myratings").text(sim);
											}	
										else
											{
												$('.myratings').css('color','green'); 
												$(".myratings").text(sim); 
											} 
										$.confirm({
							  			    title: 'Đánh giá bài viết !',
							  			    content: 'Bạn muốn đánh giá bài viết này ' + sim + ' sao',
							  			    buttons: {
							  			        confirm:{
							  			        	action: function () {
							  			        		  	   var data = {};//data là 1 mảng để đưa các giá trị từ formData vào.
							  			        	    	//lấy dữ liệu từ các field theo name của field trong form với form có id đã xác định là $('#formComment').
							  			        			  var formData = $('#formRatingNews').serializeArray();
							  			        		  	  $("#ratenumber").val(sim);
							  			        			 $.each(formData, function(i, v) {
							  			        				data["" + v.name + ""] = v.value;
							  			        			});
							  			  				rateNews(data);				 						
							  			        	}
							  			        },
							  			        cancel: function () {
							  			            $.alert('Đã cancel thao tác!');
							  			        }
							  			    }
							  			}); 
										
										}); 
									});
									
									function rateNews(data){
										$.ajax({
							   				url : '${rateAPI}',
							   				type : 'POST',
							   				contentType: 'application/json',
							   				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
							   				dataType : 'json',
							   				success : function(result) {
							   					window.location.href = "${newsUrl}?title="+$('#newsTitle').val()+"&page=${pagenow}&limit=3&message=rate_news_success";
							   				},
							   				error : function(error) {
							   					window.location.href = "${newsURL}?title="+$('#newsTitle').val()+"&page=${pagenow}&limit=3&message=rate_news_error"; 
							   				},
							   			});
									}
							</script>   
							</c:if>
							</security:authorize>
							<br>
							<h4>Thống kê đánh giá bài viết</h4>
								<div class="d-flex">
								  <div class="text-center">
								    <span class="display-4 font-weight-bolder"  >${rate.allRateNumber}</span><br>
								    <span class="text-black-50"> Người đánh giá bài viết này </span>
								  </div>
								  <div class="flex-grow-1">
								    <div class="row align-items-center">
								      <div class="col-4 text-right">
								        5☆
								      </div>
								      <div class="col-8">
								        <div class="progress" style="height: 2px;">
								          <div class="progress-bar" role="progressbar" style="width:${rate.perCent5Star}%" aria-valuenow="${rate.perCent5Star}" aria-valuemin="0" aria-valuemax="100"></div>								          
								        </div>
								      </div>
								    </div>
								    <div class="row align-items-center">
								    <div class="col-12 text-right">
								      <span class="badge rounded-pill bg-warning">${rate.rating5Number}</span> người đánh giá 5 sao 
								      </div>
								    </div>
								    <div class="row align-items-center">
								      <div class="col-4 text-right">
								        4☆
								      </div>
								      <div class="col-8">
								        <div class="progress" style="height: 2px;">
								          <div class="progress-bar" role="progressbar" style="width:${rate.perCent4Star}%" aria-valuenow="${rate.perCent4Star}" aria-valuemin="0" aria-valuemax="100"></div>
								        </div>
								      </div>
								    </div>
								      <div class="row align-items-center">
								    <div class="col-12 text-right">
								      <span class="badge rounded-pill bg-warning">${rate.rating4Number}</span> người đánh giá 4 sao 
								      </div>
								    </div>
								    <div class="row align-items-center">
								      <div class="col-4 text-right">
								        3☆
								      </div>
								      <div class="col-8">
								        <div class="progress" style="height: 2px;">
								          <div class="progress-bar" role="progressbar" style="width:${rate.perCent3Star}%" aria-valuenow="${rate.perCent3Star}" aria-valuemin="0" aria-valuemax="100"></div>
								        </div>
								      </div>
								    </div>  <div class="row align-items-center">
								    <div class="col-12 text-right">
								      <span class="badge rounded-pill bg-warning">${rate.rating3Number}</span> người đánh giá 3 sao 
								      </div>
								    </div>
								    <div class="row align-items-center">
								      <div class="col-4 text-right">
								        2☆
								      </div>
								      <div class="col-8">
								        <div class="progress" style="height: 2px;">
								          <div class="progress-bar" role="progressbar" style="width:${rate.perCent2Star}%" aria-valuenow="${rate.perCent2Star}" aria-valuemin="0" aria-valuemax="100"></div>
								        </div>
								      </div>
								    </div>
								      <div class="row align-items-center">
								    <div class="col-12 text-right">
								      <span class="badge rounded-pill bg-warning">${rate.rating2Number}</span> người đánh giá 2 sao 
								      </div>
								    </div>
								    <div class="row align-items-center">
								      <div class="col-4 text-right">
								        1☆
								      </div>
								      <div class="col-8">
								        <div class="progress" style="height: 2px;">
								          <div class="progress-bar" role="progressbar" style="width: ${rate.perCent1Star}%" aria-valuenow="${rate.perCent1Star}" aria-valuemin="0" aria-valuemax="100"></div>
								        </div>
								      </div>
								    </div>
								      <div class="row align-items-center">
								    <div class="col-12 text-right">
								      <span class="badge rounded-pill bg-warning">${rate.rating1Number}</span> người đánh giá 1 sao 
								      </div>
								    </div>
								  </div>
								</div>
							
							
				      </aside>
				      </div>
				      
				      <!-- /.row -->
				      
				      <!-- COMMENT SECTION -->
				      
				      <hr class="featurette-divider"> 
							 <form id="formComment">
								<div class="col-md-12 bootstrap snippets">
							    	<div class="panel">
							  			<div class="panel-body">
							    			<textarea class="form-control" rows="2" cols="2" placeholder="What are you thinking?" id="content" name="content"></textarea>
							    				<div class="mar-top clearfix">
							    					<br>
							    					<security:authorize access = "isAnonymous()">
							    					<a href="/dang-nhap" class="text-info"><i class="fa fa-pencil fa-fw"></i> vui lòng đăng nhập để bình luận và trả lời bình luận</a> 
							    					</security:authorize>
							      					<security:authorize access = "isAuthenticated()">
							      					<button class="btn btn-sm btn-primary pull-right" id="btnComment" type="button" onclick="warningBeforeComment()"><i class="fa fa-pencil fa-fw"></i> Bình luận </button>
							      					<input type="hidden" value="${model.id}" id="newsId" name="newsId" /> 
							      					<input type="hidden" value="${model.title}" id="newsTitle" name="newsTitle" /> 
													<input type="hidden" value="<%=SecurityUtils.getPrincipal().getUserName()%>" id="userName" name="userName" />
													</security:authorize>
							      				</div>	
							  			</div>
									</div>
								</div>
								<script>
						       	function trim(str)
					      		{
					      			return str.replace(/^\s+|\s+$/,'');
					      		}
					        	 
						       	
					      		function warningBeforeComment(){
					      		 $.confirm({
					 			    title: 'Bình luận!',
					 			    content: 'Xác nhận bình luận',
					 			    buttons: {
					 			        confirm:{
					 			        	action: function () {
					 			        		  	  var data = {};//data là 1 mảng để đưa các giá trị từ formData vào.
					 			        	    	//lấy dữ liệu từ các field theo name của field trong form với form có id đã xác định là $('#formComment').
					 			        			  var formData = $('#formComment').serializeArray();
					 			        			 $.each(formData, function(i, v) {
					 			        				data["" + v.name + ""] = v.value;
					 			        			});
					 			        			 if(trim($('#content').val()).length <1 ) 
					 			        				 {
						 			        				Swal.fire({
									        					  icon: 'error',
									        					  title: 'Lỗi',
									        					  text: 'Bạn chưa nhập bình luận !'
									        					})
					 			        					
					 			        				 }
					 			        			 else 
					 			        				 {
					 			        					addComment(data);
					 			        				 }
											
					 			        	}
					 			        },
					 			        cancel: function () {
					 			            $.alert('Đã cancel thao tác!');
					 			        }
					 			    }
					 			});
					 	 }
					      	 function addComment(data){
					       	  $.ajax({
					   				url : '${commentAPI}',
					   				type : 'POST',
					   				contentType: 'application/json',
					   				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
					   				dataType : 'json',
					   				success : function(result) {
					   					window.location.href = "${newsUrl}?title="+$('#newsTitle').val()+"&page=1&limit=3&message=create_comment_success";
					   				},
					   				error : function(error) {
					   					window.location.href = "${newsURL}?title="+$('#newsTitle').val()+"&page=1&limit=3&message=create_comment_error"; 
					   				},
					   			});
					         }
								</script>
							</form>
	<hr class="featurette-divider">	
<%--       <div class="my-3 p-3 bg-white rounded box-shadow">
        <h6 class="border-bottom border-gray pb-2 mb-0">Mục bình luận</h6>
        <c:forEach var="item" items="${listComment.listResult}"> 
        <div class="media text-muted pt-3">
          <p class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
            <strong class="d-block text-gray-dark">${item.userName}</strong>
            		${item.content}
            		<button class="btn btn-sm btn-primary pull-right" name="buttonReplies" id="btnReply_${item.id}" type="button"><i class="fa fa-pencil fa-fw"></i> Reply </button>
           </p>
        </div>
        <security:authorize access = "isAuthenticated()"> 
         <form class="form-horizontal" role="form" id="formRepliedComment_${item.id}"> 
         <div class="post-comment">
         			<textarea name="content" class="form-control" rows="1" cols="2"id="replyComment_${item.id}"style="display:none"></textarea>
					<input type="hidden" value="${item.newsTitle}" name="newsTitle"/> 
					<input type="hidden" value="<%=SecurityUtils.getPrincipal().getUserName()%>" name="userName"/>
					<input type="hidden" value="${item.id}" id="repliedCommentId" name="repliedCommentId"/>  	       
         </div>
          <script>
         		$('#btnReply_'+ ${item.id}).one('click',function(){
         			if(document.getElementById('replyComment_'+ ${item.id}).style.display === "none")
         				{
         					document.getElementById('replyComment_'+ ${item.id}).style.display = "block";
         					if($('replyComment_'+${item.id}) !== '')
         						{
         						$('#btnReply_'+ ${item.id}).click(function(){
         							 $.confirm({
         				 			    title: 'Trả lời bình luận!',
         				 			    content: 'Xác nhận trả lời !',
         				 			    buttons: {
         				 			        confirm:{
         				 			        	action: function () {
         				 			        		  	  var data = {};//data là 1 mảng để đưa các giá trị từ formData vào.
         				 			        	    	//lấy dữ liệu từ các field theo name của field trong form với form có id đã xác định là $('#formComment').
         				 			        			  var formData = $('#formRepliedComment_'+${item.id}).serializeArray();
         				 			        			 $.each(formData, function(i, v) {
         				 			        				data["" + v.name + ""] = v.value;
         				 			        			});
         				 			        			 if($('#replyComment_'+${item.id}).val() != '')
         				 			        				 {
         				 			        					addRepliedComment(data);
         				 			        				 }
         				 			        			 else 
         				 			        				 {
         				 			        				Swal.fire({
         				 			        					  icon: 'error',
         				 			        					  title: 'Lỗi',
         				 			        					  text: 'Bạn chưa nhập trả lời bình luận !'
         				 			        					})
         				 			        				 }
         										
         				 			        	}
         				 			        },
         				 			        cancel: function () {
         				 			            $.alert('Đã cancel thao tác!');
         				 			        }
         				 			    }
         				 			});
         						});
         						}
         				}
         		});  
         		
         		function addRepliedComment(data)
         		{
         			$.ajax({
           				url : '${commentAPI}',
           				type : 'POST',
           				contentType: 'application/json',
           				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
           				dataType : 'json',
           				success : function(result) {
           					window.location.href = "${newsUrl}?title="+$('#newsTitle').val()+"&page=1&limit=3&message=create_comment_success";
           				},
           				error : function(error) {
           					window.location.href = "${newsURL}?title="+$('#newsTitle').val()+"&page=1&limit=3&message=create_comment_error"; 
           				},
           			});
         		}
         </script>
         </form>
         </security:authorize>	  
         </c:forEach> --%>
         
         <!--  Reply cmt -->

			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<h2 class="page-header">Comments</h2>
						<c:forEach var="item" items="${listComment.listResult}"> 
						<section class="comment-list">
							<!-- First Comment -->
							<div class="row">
								<div class="col-md-2 col-sm-2 hidden-xs">
									<figure class="thumbnail">
										<!-- <img class="img-responsive" src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" /> -->
										
										<figcaption class="text-center"> <small class="text-muted">${item.userRole}</small></figcaption>
										
									</figure>
								</div>
								<div class="col-md-10 col-sm-10">
									<div class="panel panel-default arrow left">
										<div class="panel-body">
											<header class="text-left">
												<div class="comment-user">
													<i class="fa fa-user"></i><strong> ${item.userName}</strong>
												</div>
												<time class="comment-date" datetime="${item.timeCommentPosted}">
													<i class="fa fa-clock-o"></i> ${item.timeCommentPosted}
												</time>
											</header>
											<br>
											<div class="comment-user">
													<i class="fa fa-comment"></i> ${item.content}
												</div>
											<%-- <div class="comment-post">
											<i class="fa fa-comment"></i><p>${item.content}</p>
											</div> --%>
											<p class="text-right">
												<a class="btn btn-default btn-sm" id="btnReply_${item.id}"><i
													class="fa fa-reply"></i> reply</a>
											</p>
											<security:authorize access = "isAnonymous()">
					    						<form class="form-horizontal" role="form" id="formRepliedComment_${item.id}"> 
										         <div class="post-comment">
										         			<textarea name="content" class="form-control" rows="1" cols="2"id="replyComment_${item.id}"style="display:none"></textarea>      
										         </div>
										         
										          <script>
										         		$('#btnReply_'+ ${item.id}).click(function(){
										         			Swal.fire({
       				 			        					  icon: 'error',
       				 			        					  title: 'Lỗi',
       				 			        					  text: 'Bạn chưa đăng nhập !'
       				 			        					})
										         		}); 
										         </script>
										         </form>
										    </security:authorize>	  	
											<security:authorize access = "isAuthenticated()"> 
										         <form class="form-horizontal" role="form" id="formRepliedComment_${item.id}"> 
										         <div class="post-comment">
										         			<textarea name="content" class="form-control" rows="1" cols="2"id="replyComment_${item.id}"style="display:none"></textarea>
															<input type="hidden" value="${item.newsTitle}" name="newsTitle"/> 
															<input type="hidden" value="<%=SecurityUtils.getPrincipal().getUserName()%>" name="userName"/>
															<input type="hidden" value="${item.id}" id="repliedCommentId" name="repliedCommentId"/>  	       
										         </div>
										         </form>
										         <br>
										         <script>
										         function trim(str)
									         		{
									         			return str.replace(/^\s+|\s+$/,'');
									         		}
										          
										         		$('#btnReply_'+ ${item.id}).one('click',function(){
										         			if(document.getElementById('replyComment_'+ ${item.id}).style.display === "none")
										         				{
										         					document.getElementById('replyComment_'+ ${item.id}).style.display = "block";
										         					$('#replyComment_'+ ${item.id}).focus();
										         					if($('replyComment_'+${item.id}) !== '')
										         						{
										         						$('#btnReply_'+ ${item.id}).click(function(){
										         							 $.confirm({
										         				 			    title: 'Trả lời bình luận!',
										         				 			    content: 'Xác nhận trả lời !',
										         				 			    buttons: {
										         				 			        confirm:{
										         				 			        	action: function () {
										         				 			        		  	  var data = {};//data là 1 mảng để đưa các giá trị từ formData vào.
										         				 			        	    	//lấy dữ liệu từ các field theo name của field trong form với form có id đã xác định là $('#formComment').
										         				 			        			  var formData = $('#formRepliedComment_'+${item.id}).serializeArray();
										         				 			        		  	  var str = $('#replyComment_'+${item.id}).val();
										         				 			        			 $.each(formData, function(i, v) {
										         				 			        				data["" + v.name + ""] = v.value;
										         				 			        			});
										         				 			        			 if(trim($('#replyComment_'+${item.id}).val()).length <1 ) 
										         				 			        				 {
										         				 			        				Swal.fire({
										         				 			        					  icon: 'error',
										         				 			        					  title: 'Lỗi',
										         				 			        					  text: 'Bạn chưa nhập trả lời bình luận !'
										         				 			        					})
										         				 			        					
										         				 			        					$('#replyComment_'+${item.id}).focus();
										         				 			        				 }
										         				 			        			  else{
										         				 			        					addRepliedComment(data);
										         				 			        			 	}
										         										
										         				 			        	}
										         				 			        },
										         				 			        cancel: function () {
										         				 			            $.alert('Đã cancel thao tác!');
										         				 			        }
										         				 			    }
										         				 			});
										         						});
										         						}
										         				}
										         		});
										         		
										         		function addRepliedComment(data)
										         		{
										         			$.ajax({
										           				url : '${commentAPI}',
										           				type : 'POST',
										           				contentType: 'application/json',
										           				data : JSON.stringify(data),//stringify dùng để chuyển đổi Javascript Object thành JSON.
										           				dataType : 'json',
										           				success : function(result) {
										           					window.location.href = "${newsUrl}?title="+$('#newsTitle').val()+"&page=${pagenow}&limit=3&message=create_comment_success";
										           				},
										           				error : function(error) {
										           					window.location.href = "${newsURL}?title="+$('#newsTitle').val()+"&page=${pagenow}&limit=3&message=create_comment_error"; 
										           				},
										           			});
										         		}
										         </script>
										    </security:authorize>	  
										</div>
									</div>
								</div>
							</div>
						</section>
									<c:if test='${item.countRepliedComments != 0}'>
										<a class="btn btn-default btn-sm" id="showRepliesList_${item.id}"><i
																class="fa fa-reply"></i> Bình luận có ${item.countRepliedComments} trả lời </a>
									</c:if>
										<div id="listReplies_${item.id}" class="my-3 p-3 bg-white rounded box-shadow" style="display:none">
											<c:forEach var="repliedItem" items="${item.listRepliedComment}">	
												<div class="media text-muted pt-3">
													<p
														class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
														<strong class="d-block text-gray-dark">${repliedItem.userName} - <small class="text-muted"> ${repliedItem.timeCommentPosted} </small> </strong>
														${repliedItem.content}
													</p>
												</div>
											</c:forEach>
										</div>
						     <script>
										            
										         	
										         		$('#showRepliesList_'+${item.id}).one('click',function(){
															if(document.getElementById('listReplies_'+ ${item.id}).style.display === "none")
																{
																	document.getElementById('listReplies_'+ ${item.id}).style.display = "block";
																	$('#showRepliesList_'+${item.id}).hide();
																}else
																	{
																	document.getElementById('listReplies_'+ ${item.id}).style.display = "none";
																	}
														});
										         		    	
							</script>
						</c:forEach>
					</div>
				</div>
			</div>  
			<!-- End Reply and Comment section  -->    	
		<br>
	      <form action="<c:url value ='/bai-viet'/>" id="formListComment"  method="get">
         	  <c:if test="${not empty listComment}">
     			<ul class="pagination" id="pagination"></ul>
     			<input type="hidden" value="${model.title}" id="title" name="title" /> 
       			<input type="hidden" value="" id="page" name="page" /> 
				<input type="hidden" value="" id="limit" name="limit" />
	  	</c:if>
	    <c:if test="${empty listComment.listResult}" >
		<p class="lead">
		  Bài viết chưa có bình luận.
		</p>
	  </c:if>
   </form>
    </main>
    <!-- /.container -->
      <script type="text/javascript">
        	 var totalPages = ${listComment.totalPage};
        	 var currentPage = ${listComment.page};
        	 $(function () {
        	        window.pagObj = $('#pagination').twbsPagination({
        	            totalPages: totalPages,
        	            visiblePages: 4,
        	            startPage:currentPage,
        	            onPageClick: function (event, page) {
        	            if (currentPage != page){
        	            	$('#limit').val(3);
        	            	$('#page').val(page);
        	            	$('#formListComment').submit();
        	            	}
        	            }
        	        });
        	    });
    </script>
</body>
</html>