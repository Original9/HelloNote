<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>
<body>

	<div class="col-lg-3 col-xl-3 col-md-3 col-sm-3 col-bg-3 card shadow-lg o-hidden border-0 my-5">
		<h3
			class="card-header d-flex justify-content-between align-items-center">
			Site List
			<div class="dropdown no-arrow">
				<button class="btn btn-link btn-sm dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false" type="button">
					<i class="fas fa-ellipsis-v text-gray-400"></i>
				</button>
				<div
					class="dropdown-menu shadow dropdown-menu-right animated--fade-in"
					role="menu">
					<p class="text-center dropdown-header">목록</p>
					<a class="dropdown-item" role="presentation" href="#">&nbsp;추가하기</a><a
						class="dropdown-item" role="presentation" href="#">&nbsp;Another
						action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" role="presentation" href="#">&nbsp;상세보기
					</a>
				</div>
			</div>
		</h3>


		<div class="card-body" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingOne">
					<h4 class="panel-title">
						<a role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne"> SITE </a><button type="button" class="p-1 btn btn-primary btn-xs">GO</button>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">ID/PW</div>
				</div>
			</div>
			<!-- end of panel -->
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo"
							aria-expanded="false" aria-controls="collapseTwo"> SITE </a><button class="p-1 btn btn-primary btn-xs">GO</button>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">ID/PW</div>
				</div>
			</div>
			<!-- end of panel -->
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingThree">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"
							aria-expanded="false" aria-controls="collapseThree"> SITE </a><button class="p-1 btn btn-primary btn-xs">GO</button>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingThree"> 
					<div class="panel-body">ID/PW</div>
				</div>
			</div>
			<!-- end of panel -->
			<div class="panel">
				<div class="panel-heading" role="tab" id="headingFour">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse"
							data-parent="#accordion" href="#collapseFour"
							aria-expanded="false" aria-controls="collapseFour"> SITE </a><button class="p-1 btn btn-primary btn-xs">GO</button>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse"
					role="tabpanel" aria-labelledby="headingFour">
					<div class="panel-body">ID/PW</div>
				</div>
			</div>
			<!-- end of panel -->
		</div>
		<!-- end of #accordion -->
	</div>
	<!-- end of wrap -->

</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/chart.min.js"></script>
<script src="assets/js/bs-charts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="assets/js/theme.js"></script>
</html>