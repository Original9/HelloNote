<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value="/resources/assets/pageJs/recipe.js" />"></script>
<style>
.recipeBox {
	width: 275px;
	box-shadow: 8px 9px 10px 0px #858796;
	margin: 10px 10px;
	cursor: pointer;
}

#recipeSearchResult {
	min-height: 1000px;
}

.recipeModalContent {
	width: 80%;
}

.view_step_cont {
	padding: 50px;
}

.item {
	padding: 10px;
}
</style>
</head>
<body>
	<input type="text" id="recipeKeyword">
	<button id="recipeSearch">검색</button>
	<div id="recipeSearchResult"></div>

	<div class="modal" id="recipeModal" style="z-index: 6;">
		<div class="modal-content recipeModalContent" id="recipeModalContent">
			<span class="close" id="recipeModalClose"
				style="margin-left: auto; margin-right: 0; width: 30px;">&times;</span>
			<div id="recipeContainer"></div>
			<select id="recipeMenuSelector"></select>
			<button id="recipeMenuInsert">재료 담기</button>
		</div>
	</div>

</body>
</html>