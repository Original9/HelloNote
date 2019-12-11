<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<div id="widgetContainer"></div>
	<!-- 로그인 정보 print -->
	<sec:authentication property="principal.username" />
	<br>
	<sec:authentication property="principal.hellonoteId" />
	<br>
	<sec:authentication property="principal.pw" />
	<br>
	<sec:authentication property="principal.hGrant" />
	<br>
	<sec:authorize access="isAuthenticated()">
	로그인 중
	</sec:authorize>
	<!-- admin 권한만 보이게 -->
	<sec:authorize access="hasAuthority('M')">
		<button type="button" onclick="location.href='/user/getUserList'">버튼이보이면
			ADMIN 이다~ 누르면 유저리스트로 간다</button>
	</sec:authorize>
	<!-- admin 권한만 보이게 -->
	<h2>접속 ID: "${hellonoteId}" 접속 pw: "${pw}"</h2>
	<h3>
		Widgets Moving<input type='button' id="addWidgets" value='버튼1' />
	</h3>
</body>
</html>