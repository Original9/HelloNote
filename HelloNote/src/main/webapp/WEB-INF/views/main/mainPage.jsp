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
	<!-- 로그인 정보 print -->
	<sec:authentication property="principal.hellonoteId" />
	<br>
	<sec:authentication property="principal.pw" />
	<br>
	<sec:authentication property="principal.hGrant" />
	<br>
	<sec:authorize access="isAuthenticated()">
   로그인 중
   </sec:authorize>

	<div id="widgetContainer"></div>

</body>
</html>