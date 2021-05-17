<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title><dec:title/></title>
<meta charset="UTF-8">		

<!-- Rating -->
<link href="<c:url value='/template/web/rating/rating.css'/>" rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- Custom styles for this template -->
<link href="<c:url value='/template/web/css/small-business.css'/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<!-- Paging -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</head>
<body>
	<!-- Navigation -->
	
	<%@ include file="/common/web/header.jsp"%>
	
	<dec:body/>
	
	<!-- Footer -->
	<%@ include file="/common/web/footer.jsp"%>

	<!-- Rating -->
	
	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value= '/template/web/vendor/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value= '/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<!-- Paging script -->
	<script src="<c:url value='/template/web/js/moment.js' />"></script>
	<script src="<c:url value='/template/web/js/moment-with-locales.js' />"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js' />"></script>
	<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.min.js' />"></script>
</body>
</html>