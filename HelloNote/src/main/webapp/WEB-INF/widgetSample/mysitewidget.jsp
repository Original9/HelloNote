<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet"
	href="<c:url value="/assets/fonts/fontawesome-all.min.css"/>">
</head>
<body>

	<div
		class="col-lg-3 col-xl-3 col-md-3 col-sm-3 col-bg-3 card shadow-lg o-hidden border-0 my-5">
		<h3
			class="card-header d-flex justify-content-between align-items-center">
			Site List</h3>

		<div class="card-body" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel">
				<!-- content -->
			</div>

		</div>
	</div>



		<div class="panel-heading" role="tab" id="headingOne">
			<h4 class="panel-title">
				<a role="button" data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					SITE </a>
				<button type="button" class="p-1 btn btn-primary btn-xs">GO</button>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingOne">
			<div class="panel-body">ID/PW</div>
		</div>
</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-charts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>
</html>
