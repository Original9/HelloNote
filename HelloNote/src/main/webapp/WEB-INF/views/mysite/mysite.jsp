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
	<!-- 헤더 시작 -->
	<div class="card-header py-3">
		<h3 class="text-dark mb-4">My Site List</h3>
	</div>
	<!-- 헤더 끝 -->

	<!-- 리스트 DIV 시작 -->
	<div class="card shadow">
		<div class="card-header py-3">
			<p class="text-primary m-0">My Site List</p>
		</div>
		<div class="card-body">
			<!-- 목록 시작 -->
			<form name="userForm" id="userForm" action='deleteMySite'>
				<div class="table-responsive table mt-2">
					<table class="table dataTable my-0 table-hover">
						<thead>
							<tr>
								<th scope="col" width="10"><input id="allCheck"
									type="checkbox" onclick="allChk(this);" /></th>
							<!--<th align="center" width="80">시퀀스</th>  -->	
								<th align="center" width="150">저장날짜</th>
								<th align="center" width="200">제목</th>
								<th align="center" width="100">아이디</th>
								<!-- <th align="center" width="200">SITE_PW</th>  -->
								<th align="center" width="200">메모</th>
								<th align="center" width="200">사이트 주소</th>
							</tr>
						</thead>
							<tbody>
							<!-- 컨트롤러의 items key 값 -->
							<c:forEach items="${mySite }" var="mySite">
								<tr>
									<td><input name="rowCheck" class="rowCheck"
										type="checkbox" value="${mySite.mySiteSeq }" /></td>
									<!--	<td class="getMySite" align="center" width="80">${mySite.mySiteSeq }</td> -->
									<td class="getMySite" align="center" width="150">${mySite.siteDate }</td>
									<td class="getMySite" align="center" width="200">${mySite.title }</td>
									<td class="getMySite" align="center" width="100">${mySite.siteId }</td>
									<!-- <td class="getMySite" align="center" width="200">${mySite.sitePw }</td> -->
									<td class="getMySite" align="center" width="200">${mySite.siteMemo }</td>
									<td align="center" width="200"><a
										href="${mySite.siteAddr }">${mySite.siteAddr }</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 목록 끝 -->
				</div>
			</form>
			<!-- 버튼 시작 -->
			<div align="right">
				<button class="btn btn-primary" id="specification" type="button">추가하기</button>
				<button class="btn btn-primary" type="button" onclick="fn_userDel()">삭제</button>
				<button class="btn btn-primary" type="button"
					onclick="location.href='downloadExcel'">엑셀 다운로드</button>
			</div>
			<!-- 버튼 끝 -->
			<br>
			<!-- 검색폼 시작 -->
			<div align="center">
				<form action="getMySiteList" name="mySiteForm">
					<input type="hidden" name="page" value="1" /> <select
						class="custom-select" style="width: 80px" name="searchCondition">
						<option value="">선택</option>
						<option value="title"
							<c:if test="${mySiteSearchVO.searchCondition=='title'}">selected</c:if>>제목</option>
						<option value="siteAddr"
							<c:if test="${mySiteSearchVO.searchCondition=='siteAddr'}">selected</c:if>>주소</option>
					</select> <input name="keyword" value="${mySiteSearchVO.keyword }"
						class="form-control" style="width: 200px">
					<button class="btn btn-primary">검색</button>
					<button class="btn btn-primary" type="button"
						onclick="location.href='mysite'">전체목록보기</button>
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
			<div>
				<my:paging paging="${paging }"></my:paging>
			</div>
			<!-- 페이징 끝 -->
		</div>
	</div>
	<!-- 리스트 DIV 끝 -->

	<!-- 입력 모달 창 -->
	<div class="modal" id="mySiteModal">
		<div class="modal-content" id="modal-content">
			<div class="form">
				<span class="close">&times;</span>
				<div class="tab-content">
					<div id="signup">
						<h1>Add Site</h1>
						<br>
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
								<button class="btn btn-primary" type="submit">Add</button>
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

	<!-- 상세보기 모달 창 -->
	<div class="modal" id="getMySiteModal">
		<div class="modal-content" id="modal-content">
			<div class="form">
				<span class="close">&times;</span>
				<div class="tab-content">
					<div id="select" class="select" align="center">
						<h1>My Site List</h1>
						<br>
						<form name="dele" id="dele" action="getMySitedelete" method="post">
							<!-- hidden input tag 로 seq 값을 담음 -->
							<input type="hidden" name="mySiteSeq" id="mySiteSeq">
							<div class="top-row">
								<div class="field-wrap">
									<div class="field-wrap">
										<label> TITLE : </label> <span id="title"></span>
									</div>
									<div class="field-wrap">
										<label> ADDR : </label> <span id="siteAddr"></span>
									</div>
									<label> ID or Email : </label> <span id="siteId"></span>
								</div>
								<div class="field-wrap">
									<label>Password : </label> <span id="sitePw"></span>
								</div>
							</div>
							<div class="field-wrap">
								<label>Memo : </label> <span id="siteMemo"></span>
							</div>
							<br>
							<div align="center">
								<button class="btn btn-primary" name="change" id="change"
									type="button">수정</button>
								<button class="btn btn-primary" name="del"
									onclick="fn_userDel2()" type="button">삭제</button>
							</div>
						</form>

					</div>
					<!-- 수정 폼 체인지 -->
					<div id="changeform" class="changeform" style="display: none"
						align="center">
						<h1>Update mySite</h1>
						<br>
						<form action="updateMySite" id="UpdForm" name="UpdForm">
							<input type="hidden" name="mySiteSeq" id="mySiteSeq">
							<div class="field-wrap">
								<div class="field-wrap">
									<label> TITLE : </label> <input type="text" required
										autocomplete="off" name="title" />
								</div>
								<div class="field-wrap">
									<label> ADDR : </label> <input type="text" required
										autocomplete="off" name="siteAddr" />
								</div>
								<label> ID or Email : </label> <input type="text" required
									autocomplete="off" name="siteId" />
							</div>
							<div class="field-wrap">
								<label>Password : </label> <input type="password" required
									autocomplete="off" name="sitePw" />
							</div>
							<div class="field-wrap">
								<label>Memo : </label>
								<textarea name="siteMemo"></textarea>
							</div>
							<br>
							<div align="center">
								<button class="btn btn-primary" name="updatebutton"
									id="updatebutton" type="button">수정</button>
								<button class="btn btn-primary" name="change2" id="change2"
									type="button">취소</button>
							</div>
						</form>
					</div>
					<!-- 수정 폼 체인지  끝-->
				</div>
				<!-- tab-content -->
			</div>
			<!-- /form  -->
		</div>
	</div>
	<!-- 상세보기 모달 창 끝  -->
</body>
</html>