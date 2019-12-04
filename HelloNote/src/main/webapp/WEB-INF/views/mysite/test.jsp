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
<script type="text/javascript">
	// 1.모두 체크
	function allChk(obj) {
		var chkObj = document.getElementsByName("rowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}

	//﻿2. 체크박스 선택된 것 삭제 처리 (N개) 
	function fn_userDel() {

		var userid = "";
		var memberChk = document.getElementsByName("rowCheck");
		var chked = false;
		var indexid = false;
		for (i = 0; i < memberChk.length; i++) {
			if (memberChk[i].checked) {
				if (indexid) {
					userid = userid + '-';
				}
				userid = userid + memberChk[i].value;
				indexid = true;
			}
		}
		if (!indexid) {
			alert("삭제할 사용자를 체크해 주세요");
			return;
		}
		

		var agree = confirm("삭제 하시겠습니까?");
		if (agree) {
			document.userForm.submit();
		}
	}﻿
</script>
</head>
<body>
	<!-- 목록 시작 -->
	<h3 align="center">My Site List</h3>
	<br>
	<form name="userForm" id="userForm" action='deleteMySite'>
		<table class="table table-black table-hover">
			<tr>
				<th scope="col" width="10"><input id="allCheck" type="checkbox"
					onclick="allChk(this);" /></th>
				<th align="center" width="100">MYSITE_SEQ</th>
				<th align="center" width="200">SITE_ID</th>
				<th align="center" width="200">SITE_PW</th>
				<th align="center" width="200">SITE_ADDR</th>
				<th align="center" width="200">SITE_MEMO</th>
				<th align="center" width="200">TITLE</th>
			</tr>
			<!-- 컨트롤러의 items key 값 -->
			<c:forEach items="${mySite }" var="mySite">
				<tr>
					<td><input ﻿name="rowCheck" type="checkbox"
						value="${mySite.mySiteSeq}" /></td>
					<td align="center" width="100">${mySite.mySiteSeq }</td>
					<td align="center" width="200">${mySite.siteId }</td>
					<td align="center" width="200">${mySite.sitePw }</td>
					<td align="center" width="200">${mySite.siteAddr }</td>
					<td align="center" width="200">${mySite.siteMemo }</td>
					<td align="center" width="200">${mySite.title }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
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
			<button class="btn btn-primary" type="button" onclick="fn_userDel()">삭제</button>
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
						<form action="insertMySite" method="post">
							<div class="top-row">
								<div class="field-wrap">
									<div class="field-wrap">
										<label> TITLE </label> <input type="text" required
											autocomplete="off" name="title" />
									</div>
									<div class="field-wrap">
										<label> ADDR </label> <input type="text" required
											autocomplete="off" name="siteAddr" />
									</div>
									<label> ID or Email </label> <input type="text" required
										autocomplete="off" name="siteId" />
								</div>
								<div class="field-wrap">
									<label>Password </label> <input type="password" required
										autocomplete="off" name="sitePw" />
								</div>
							</div>
							<div class="field-wrap">
								<label>Memo</label>
								<textarea name="siteMemo"></textarea>
							</div>
							<br>
							<div align="center">
								<button class="btn btn-primary">Add</button>
							</div>
						</form>
					</div>
				</div>
				<!-- tab-content -->
			</div>
			<!-- /form -->
		</div>
	</div>
	<!-- 입력 모달 창 끝-->
</body>
</html>