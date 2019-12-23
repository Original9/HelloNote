<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable - Constrain movement</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="<c:url value="/resources/assets/js/json.min.js" />"></script>
<style>
#widgetContainer {
	width: 1700px;
	height: 1000px;
	border: 2px solid #ccc;
	padding: 10px;
}

.text-box {
	-webkit-line-clamp: 5;
	height : 150px;
	white-space : nowrap;
}

.memo:hover {
	box-shadow: 5px 5px 7px rgba(33, 33, 33, .7);
	-webkit-box-shadow: 5px 5px 7px rgba(33, 33, 33, .7);
	-moz-box-shadow: none;
	-webkit-transform: none;
	-moz-transform: none;
	-o-transform: none;
	position: absolute;
	z-index: 2;
}
</style>
<script src="<c:url value="/resources/assets/pageJs/mainPage.js" />"></script>
</head>

<body>
	<!-- admin 권한만 보이게 -->
	<h2>
		접속 ID:
		<sec:authentication property="principal.hellonoteId" />
		접속 GRANT:
		<sec:authentication property="principal.hGrant" />
	</h2>
	<div id="widgetContainer" style="position: relative;">
		<div id="deleteHolder" class="deleteHolder"
			style="position: absolute; bottom: 10px; padding: 60px 0; width: 98.7%; text-align: center;">
			<i class="fas fa-trash fa-lg trashbin"></i>
		</div>
	</div>

</body>
</html>