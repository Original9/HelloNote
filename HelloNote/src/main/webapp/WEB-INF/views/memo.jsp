<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/memo.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=480ceff9c2681fcc01d860ea5612d68e&libraries=services"></script>
<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="../assets/pageJs/memo.js"></script>
</head>
<body>
	<ul class="memoul" id="memoul">
		<li class="memoli" id="memoli"><a id="memo" class="memo">
				<div class="title-box">
					<h3 id="title" class="title">Title</h3>
				</div>
				<div class="text-box">
					<p id="text" class="text">Text</p>
				</div>
				<div class="location-box">
					<p id="location" class="text"></p>
				</div>

		</a></li>
	</ul>
	<div align="center">
		<a class="addButton" id="add">메모 추가</a>
	</div>
	<div class="modal" id="myModal" style="z-index: 6;">
		<div class="modal-content" id="modal-content">
			<span class="close" id="modalClose"
				style="float: right; width: 30px;">&times;</span>
		</div>
	</div>
</body>
</html>