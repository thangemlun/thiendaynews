<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<title>Tìm kiếm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
</head>

<body>
<div class="container">
<form action="/tim-kiem" id="formSubmit" method="get">
			<header class="blog-header py-3">
			        <div class="row flex-nowrap justify-content-between align-items-center">
			          <div class="col-4 pt-1">
			          </div>
			          <div class="col-4 text-center">
			            <h2 class="featurette-heading">Tìm kiếm</h2>
			            <input type="hidden" value="${keyWord}" id="search" name="keyWord" />
			          </div>
			          <div class="col-4 d-flex justify-content-end align-items-center">
			          </div>
			        </div>
			</header>
			 
			 
			 <main role="main">   
			     
		      <!-- Wrap the rest of the page in another container to center all the content. -->
		      <div class="container marketing">
				     <hr class="featurette-divider">
				     <c:if test="${not empty keyWord}">
					      <c:forEach var="item" items="${listNews.listResult}" >
					        <div class="row featurette">
					          <div class="col-md-7 order-md-2">
					           <c:url var="newsItemURL" value="/bai-viet">
									<c:param name="title" value="${item.title}"/>
									<c:param name="page" value="1"/>
							      	<c:param name="limit" value="3"/>
							   </c:url>
					            <h2 class="featurette-heading"><a href="${newsItemURL}" class="text-info">${item.title}</a></h2>
					            <p class="lead">${item.shortDescription}</p>
					          </div>
					          <div class="col-md-5 order-md-1">
					            <img class="card-img-top" src="${item.thumbnail}" width="100%" height="200" data-holder-rendered="true">
					          </div>
					        </div>
					      <hr class="featurette-divider">    
					      </c:forEach>
						      <ul class="pagination" id="pagination"></ul>
							  <input type="hidden" value="" id="page" name="page" /> 
							  <input type="hidden" value="" id="limit" name="limit" />  
				     </c:if>
			  </div><!-- /.container -->
		   </main>
		</form>				
    </div>
       <script>
        $(document).ready(function() {
       	 var totalPages = ${listNews.totalPage};
       	 var currentPage = ${listNews.page};
       	 $(function () {
       	        window.pagObj = $('#pagination').twbsPagination({
       	            totalPages: totalPages,
       	            visiblePages: 4,
       	            startPage:currentPage,
       	            onPageClick: function (event, page) {
       	            if (currentPage != page){	
       	            	$('#limit').val(3);
       	            	$('#page').val(page);
       	            	$('#formSubmit').submit();
       	            	}
       	            }
       	        });
       	    });
        });
    </script>
</body>
</html>