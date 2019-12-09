<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=480ceff9c2681fcc01d860ea5612d68e&libraries=services"></script>
<script src="<c:url value="/resources/assets/pageJs/memo.js" />"></script>
<link rel="stylesheet"
	href="<c:url value="/resources/assets/css/memo.css"/>">
</head>
<body>
	<ul class="memoul" id="memoul">
		<c:forEach items="${memoList}" var="list">
			<li class="memoli" id="memoli${list.memoSeq}"><a id="memo${list.memoSeq}"
				class="memo">
					<div class="title-box">
						<h3 id="title${list.memoSeq}" class="title">${list.memoTitle}</h3>
					</div>
					<div class="text-box">
						<p id="text${list.memoSeq}" class="text">${list.memoText}</p>
					</div>
					<div class="location-box">
						<p id="location${list.memoSeq}" class="text">${list.memoPlace}</p>
					</div>

			</a></li>
		</c:forEach>
	</ul>
	<div id="deleteHolder" class="deleteHolder">
		<i class="fas fa-trash fa-lg trashbin"></i>
	</div>
	<div align="center">
		<a class="addButton" id="add">메모 추가</a>
	</div>
	<div class="modal" id="myModal" style="z-index: 6;">
		<div class="modal-content1" id="modal-content">
			<span class="close" id="modalClose"
				style="float: right; width: 30px;">&times;</span>
		</div>
	</div>
	<input type="hidden" id="menuId" value="${memoList[0].menuId}"/>
</body>
</html>