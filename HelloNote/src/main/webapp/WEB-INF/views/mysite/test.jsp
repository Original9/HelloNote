<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/getBoardList.jsp</title>
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/mySiteList.css">
<!-- JS -->
<script src='<c:url value="/resources/assets/pageJs/mySiteList.js"/>'></script>
</head>
<body>
	<!-- 목록 시작 -->
	<h3 align="center">게시판</h3>
	<table border="1">
		<tr>
			<th>CHECK_BOX</th>
			<th>MYSITE_SEQ</th>
			<th>SITE_ID</th>
			<th>SITE_PW</th>
			<th>SITE_ADDR</th>
			<th>SITE_MEMO</th>
			<th>TITLE</th>
		</tr>

		<!-- 컨트롤러의 items key 값 -->
		<c:forEach items="${mySite }" var="mySite">
			<tr>
				<td><input type="checkbox"></td>
				<td align="center" width="100">${mySite.mySiteSeq }</td>
				<td align="center" width="200">${mySite.siteId }</td>
				<td align="center" width="200">${mySite.sitePw }</td>
				<td align="center" width="200">${mySite.siteAddr }</td>
				<td align="center" width="200">${mySite.siteMemo }</td>
				<td align="center" width="200">${mySite.title }</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 목록 끝 -->

	<br>

	<!-- 검색폼 시작 -->
	<div align="center">
		<form action="getMySiteList" name="mySiteForm">
			<input type="hidden" name="page" value="1" /> <select
				name="searchCondition">
				<option value="">선택</option>
				<option value="title"
					<c:if test="${mySiteSearchVO.searchCondition=='title'}">selected</c:if>>제목</option>
				<option value="siteAddr"
					<c:if test="${mySiteSearchVO.searchCondition=='siteAddr'}">selected</c:if>>주소</option>
			</select> <input name="keyword" value="${mySiteSearchVO.keyword }">
			<button class="btn btn-primary">검색</button>
			<button class="btn btn-primary" id="specification" type="button">추가하기</button>
			<button class="btn btn-primary" type="button"
				onclick="location.href='getMySiteList'">전체목록보기</button>
		</form>
	</div>
	<!-- 검색폼 끝 -->

	<br>

	<!-- 페이징 -->
	<script>
		function go_page(p) {
			document.mySiteForm.page.value = p;
			document.mySiteForm.submit();
		}
	</script>
	<div style="margin: 0 auto;">
		<my:paging paging="${paging }"></my:paging>
	</div>
	<!-- 페이징 끝 -->

	<!-- 입력 모달 창 -->
	<div class="modal" id="mySiteModal">
		<div class="modal-content" id="modal-content">
			<div class="form">
				<span class="close">&times;</span>
				<div class="tab-content">
					<div id="signup">
						<h1>Add Site</h1>
						<form action="/" method="post">
							<div class="top-row">
								<div class="field-wrap">
									<div class="field-wrap">
										<label> TITLE </label> <input type="text" required
											autocomplete="off" />
									</div>
									<div class="field-wrap">
										<label> ADDR </label> <input type="text" required
											autocomplete="off" />
									</div>
									<label> ID or Email </label> <input type="text" required
										autocomplete="off" />
								</div>
								<div class="field-wrap">
									<label>Password </label> <input type="password" required
										autocomplete="off" />
								</div>
							</div>
							<div class="field-wrap">
								<label>Memo</label>
								<textarea></textarea>
							</div>
							<br>
							<div align="center">
								<button class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
					<form action="/" method="post"></form>
				</div>
				<!-- tab-content -->
			</div>
			<!-- /form -->
		</div>
	</div>
	<!-- 입력 모달 창 끝-->
</body>
</html>