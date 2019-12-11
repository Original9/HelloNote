<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable - Constrain movement</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="<c:url value="/resources/assets/pageJs/mainPage.js"/>"></script>
<style>
#widgetContainer {
	width: 100%;
	height: 1000px;
	border: 2px solid #ccc;
	padding: 10px;
}
</style>



</head>

<body>
	<h2>접속 ID: "${hellonoteId}" 접속 pw: "${pw}"</h2>
	<h3>
		Widgets Moving<input type='button' id="addWidgets" value='버튼1' />
	</h3>
	<div id="widgetContainer"></div>


</body>
</html>