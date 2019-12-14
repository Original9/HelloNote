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
					<p class="text-center dropdown-header">목록</p> <!-- 추가하기 버튼을 누르면 title 로 사이트목록을추가한다. -->
					<a class="dropdown-item" role="presentation" href="#">&nbsp;추가하기</a><a
						class="dropdown-item" role="presentation" href="#">&nbsp;Another
						action</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" role="presentation" href="#">&nbsp;상세보기
					</a>
				</div>
			</div>
		</h3>

	<!-- GO 누르면 SiteAddr 값받아와서 주소로 이동 SITE 에는 siteTitle 불러옴 클릭시 ID/PW 불러옴-->
		<!--select site_addr from master_mysite where title = 'master'; --사이트 주소 가져오기
select site_id, site_pw from master_mysite where title = 'master'; --사이트 ID PW 가져오기 위에 추가하기누르면 site title을가져와 cforeach로 추가한다-->
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
