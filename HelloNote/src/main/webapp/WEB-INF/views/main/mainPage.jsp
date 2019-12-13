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
<style>
#widgetContainer {
	width: 100%;
	height: 1000px;
	border: 2px solid #ccc;
	padding: 10px;
}
</style>
<script src="<c:url value="/resources/assets/pageJs/mainPage.js" />"></script>
</head>

<body>
	<h2>
		접속 ID:
		<sec:authentication property="principal.hellonoteId" />
		접속 pw:
		<sec:authentication property="principal.pw" />
		접속 GRANT:
		<sec:authentication property="principal.hGrant" />
	</h2>
	<div id="widgetContainer">
		<div id="deleteHolder" class="deleteHolder"
			style="position: absolute; bottom: 80px; right: 0px;">
			<i class="fas fa-trash fa-lg trashbin"></i>
		</div>
	</div>

	<div id="widgetContainer"></div>

</body>
</html>