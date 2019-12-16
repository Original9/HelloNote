<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/getMySiteList.jsp</title>
</head>
<body>
<!-- 검색폼 시작 -->
<div>
	<form action="getBoardList" name="boardForm">
		<input type="hidden" name="page" value="1" />
		<select name="searchCondition">
			<option value="">선택</option>
			<option value="title" <c:if test="${boardSearchVO.searchCondition=='title'}">selected</c:if>>제목</option>
			<option value="content" <c:if test="${boardSearchVO.searchCondition=='content'}">selected</c:if>>내용</option>
		</select>
		<input name="keyword" value="${boardSearchVO.keyword }">
		<button>검색</button>
		<button type="button" onclick="location.href='getBoardList'">전체목록보기</button>
	</form>
</div>
<!-- 검색폼 끝 -->

<!-- 목록 시작 -->
	<h3>게시판</h3>
	<table border="1">
	<tr>
	<th>seq</th>
	<th>title</th>
	<th>content</th>
	</tr>
	
	<c:forEach var="board" items="${boardList }">
	<tr>
	<td align="center">${board.seq }</td>
	<td align="center" width="100">${board.title }</td>
	<td align="center" width="200">${board.content }</td>
	</tr>
	</c:forEach>
	</table>
<!-- 목록 끝 -->
	
	<script>
		function go_page(p) {
			document.boardForm.page.value = p;
			document.boardForm.submit();
		}
	</script>
	<my:paging paging="${paging }"></my:paging>
	
</body>
</html>