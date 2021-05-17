<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Trang chủ</title>

</head>

<body>
	<!-- Page Content -->
	<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light rounded">
        <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExample10" aria-controls="navbarsExample10" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
			
        <div class="navbar-collapse justify-content-md-center collapse" id="navbarsExample10" style="">
        <c:forEach var="item" items="${categoryMenu.listResult}" >
					        <c:url var="categoryURL" value="/danh-muc">
								<c:param name="code" value="${item.code}"/>
								<c:param name="page" value="1"/>
								<c:param name="limit" value="3"/>
							</c:url>
							<ul class="navbar-nav">
						            <li class="nav-item">
						              <a class="nav-link" href="${categoryURL}">${item.name}</a>
						            </li>
						     </ul>
				          </c:forEach>
          
        </div>
      </nav>
		<!-- Heading Row -->
		<c:url var="newsURL" value="/bai-viet">
					<c:param name="title" value="${newestNews.title}"/>
					<c:param name="page" value="1"/>
					<c:param name="limit" value="3"/>
		</c:url>
		
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<a href="${newsURL}"><img class="img-fluid rounded mb-4 mb-lg-0" src="${newestNews.thumbnail}" alt="" width="100%" height="360"></a>
			</div>
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<h1 class="font-weight-light"><a href="${newsURL}" class="text-info">${newestNews.title}</a></h1>
				<p><strong>${newestNews.shortDescription}</strong></p>
				<%-- <a class="btn btn-primary" href="${newsURL}">Xem</a> --%>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->
		<!-- Call to Action Well -->
		<div class="m-link" style="text-align:center; solid #2C79B8;border-radius:3px;margin-top:10px;">
        <iframe src="https://covid19.vnanet.vn/home/indexwigetsummary" width="100%" style="min-height:100px;padding-top:10px;"></iframe>
    </div>
    <br>
 
		<!-- Content Row -->
		
		<!-- THE THAO -->
		   
		<h3 class="pb-3 mb-4 font-italic border-bottom">
		<c:url var="categoryTheThaoUrl" value="/danh-muc" >
	      <c:param name="code" value="${categoryTheThao.code}"/>
	      <c:param name="page" value="1"/>
	      <c:param name="limit" value="3"/>
	    </c:url>
           	<a href="${categoryTheThaoUrl}" class="text-info">${categoryTheThao.name}</a>
          </h3>
          
     

        <div class="row">
        <c:forEach var="item" items="${newsModelTheThao.listResult}" >
			<div class="col-md-4">
              <div class="card mb-4 box-shadow">
              <c:url var="newsItemURL" value="/bai-viet">
					<c:param name="title" value="${item.title}"/>
					<c:param name="page" value="1"/>
			      	<c:param name="limit" value="3"/>
			  </c:url>
               <a href="${newsItemURL}"class="text-info"><img class="card-img-top" src="${item.thumbnail}" width="100%" height="200" data-holder-rendered="true"></a>
                <div class="card-body">
                  <p class="card-text" style="white-space:nowrap;width: 100%; overflow:hidden; text-overflow:ellipsis"><a href="${newsItemURL}"class="text-info">${item.title}</a></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted" id="timePosted_${item.id}"></small>                   
                  </div>
                </div>
              </div>
            </div>
             <script type="text/javascript">
	            $( document ).ready(function() {
	            	var newsDatePosted = moment('${item.timeNewsPosted}') ;
	                $('#timePosted_'+${item.id}).html(newsDatePosted.fromNow());
	                
	            });
            </script>
            </c:forEach>
		</div>
		
		<!-- CHINH TRI -->
		
		<h3 class="pb-3 mb-4 font-italic border-bottom">
			<c:url var="categoryChinhTriUrl" value="/danh-muc" >
			      <c:param name="code" value="${categoryChinhTri.code}"/>
			      <c:param name="page" value="1"/>
			      <c:param name="limit" value="3"/>
	      	</c:url>
            <a href="${categoryChinhTriUrl}" class="text-info">${categoryChinhTri.name}</a>
          </h3>
          
        
          
		<div class="row">
		<c:forEach var="item" items="${newsModelChinhTri.listResult}" >
			<div class="col-md-4">
              <div class="card mb-4 box-shadow">
              <c:url var="newsItemURL" value="/bai-viet">
					<c:param name="title" value="${item.title}"/>
					<c:param name="page" value="1"/>
			      	<c:param name="limit" value="3"/>
				  </c:url>
                  <a href="${newsItemURL}"class="text-info"><img class="card-img-top" src="${item.thumbnail}" width="100%" height="200" data-holder-rendered="true"></a>
                <div class="card-body">
                  <p class="card-text" style="white-space:nowrap;width: 100%;overflow:hidden; text-overflow:ellipsis"><a href="${newsItemURL}"class="text-info">${item.title}</a></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted" id="timePosted_${item.id}"></small>
                  </div>
                </div>
              </div>
            </div>
            <script type="text/javascript">
	            $( document ).ready(function() {
	            	var newsDatePosted = moment('${item.timeNewsPosted}') ;
	                $('#timePosted_'+${item.id}).html(newsDatePosted.fromNow());
	            });
            </script>
            </c:forEach>
		</div>
		
		<!-- THOI SU -->
		
		<h3 class="pb-3 mb-4 font-italic border-bottom">
		<c:url var="categoryThoiSuUrl" value="/danh-muc" >
		   <c:param name="code" value="${categoryThoiSu.code}"/>
		   <c:param name="page" value="1"/>
		   <c:param name="limit" value="3"/>
      	</c:url>
            <a href="${categoryThoiSuUrl}" class="text-info">${categoryThoiSu.name}</a>
        </h3>
       
        <!-- THOI SU -->
		
		<div class="row">
		<c:forEach var="item" items="${newsModelThoiSu.listResult}" >
			<div class="col-md-4">
              <div class="card mb-4 box-shadow">
              <c:url var="newsItemURL" value="/bai-viet">
					<c:param name="title" value="${item.title}"/>
					<c:param name="page" value="1"/>
			      	<c:param name="limit" value="3"/>
				  </c:url>
                  <a href="${newsItemURL}"class="text-info"><img class="card-img-top" src="${item.thumbnail}" width="100%" height="200" data-holder-rendered="true"></a>
                <div class="card-body">
                  <p class="card-text" style="white-space:nowrap;width: 100%;overflow:hidden; text-overflow:ellipsis"><a href="${newsItemURL}"class="text-info">${item.title}</a></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted" id="timePosted_${item.id}"></small>
                  </div>
                </div>
              </div>
            </div>
            
            <script type="text/javascript">
	            $( document ).ready(function() {
	            	var newsDatePosted = moment('${item.timeNewsPosted}') ;
	                $('#timePosted_'+${item.id}).html(newsDatePosted.fromNow());
	                
	            });
            </script>
            
            </c:forEach>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
</body>

</html>