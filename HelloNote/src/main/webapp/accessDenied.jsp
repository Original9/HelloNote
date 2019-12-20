<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/mainFont.css">

</head>
<body>
	<br>
	<br>
	<div align="center">
		<h1>액세스 거부</h1>
		액세스가 거부되었습니다. 권한을 확인 해주세요.
	</div>
	<br> 
	<div class="container show-grid" style="width: 200px;">
		<img
			src='${pageContext.request.contextPath}/resources/assets/img/kakao_img1.jpg' style="max-width: 100%; height: auto;"/>
	<br>
	<p>라이언 : 안녕~~~~</p>
	<hr>
	<button id="gopage" name="gopage"
		class="btn btn-primary btn-block text-white" type="button"
		onclick="location.href='./mainPage'">페이지 나가기</button>
	<hr>
	</div>
</body>
</html>
