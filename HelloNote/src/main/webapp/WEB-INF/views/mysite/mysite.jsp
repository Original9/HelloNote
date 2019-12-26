<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>User-Table</title>
</head>
<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/mySiteList.css">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

<!-- JS -->
<script src='<c:url value="/resources/assets/js/chart.min.js"/>'></script>
<script src='<c:url value="/resources/assets/js/json.min.js"/>'></script>
<script src='<c:url value="/resources/assets/pageJs/mySiteList.js"/>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

</head>
<body>
		<div id="wrapper">
			<div class="container-fluid">
				<h3 class="text-dark mb-4">사이트관리</h3>
				<div class="card shadow">
					<div class="card-header py-3">
						<p class="text-primary m-0 font-weight-bold">사이트 관리</p>
					</div>
					<!-- 리스트 DIV 시작 -->
					<div class="card-body">
						<div class="row">
							<div class="col-md-6 text-nowrap"></div>
						</div>
						<!-- 목록 시작 -->
						<form name="userForm" id="userForm" action='deleteMySite'>
							<input type="hidden" name="menuId" value="${menuId }" />
							<div class="table-responsive table mt-2">
								<table class="table dataTable my-0 table-hover" id="tabledata">
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
													href="${mySite.siteAddr }" target="_blank">${mySite.siteAddr }</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
								<div align="right">
									<button class="btn btn-primary" id="specification"
										type="button">추가하기</button>
									<button class="btn btn-primary" type="button"
										onclick="fn_userDel()">삭제</button>
									<button class="btn btn-primary" type="button"
										onclick="location.href='downloadExcel?menuId=${menuId}'">엑셀 다운로드</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	<!-- 입력 모달 창 -->
	<div class="modal" id="mySiteModal">
		<div class="modal-content" id="modal-content">
			<div class="form">
				<span class="close">&times;</span>
				<div class="tab-content">
					<div id="signup">
						<h1>사이트 추가</h1>
						<br>
						<form action="insertMySite" method="post" id="good" name="good">
							<div class="top-row">
								<div class="field-wrap">
									<div class="field-wrap">
										<label for="Title"><strong>사이트 이름&nbsp;</strong></label><input
											type="text" required autocomplete="off" name="title" />
									</div>
									<div class="field-wrap">
										<label for="Address"><strong>사이트 주소&nbsp;</strong></label> <input
											type="text" required autocomplete="off" name="siteAddr" />
									</div>
									<label for="ID OR Email"><strong>아이디 혹은 이메일
											&nbsp;</strong></label><input type="text" required autocomplete="off"
										name="siteId" />
								</div>
								<div class="field-wrap">
									<label for="Password"><strong>비밀번호&nbsp;</strong></label><input
										type="text" required autocomplete="off" name="sitePw" />
								</div>
							</div>
							<div class="field-wrap">
								<label for="MEMO"><strong>메모&nbsp;</strong></label>
								<textarea name="siteMemo"></textarea>
							</div>
							<br>
							<div align="center">
								<button class="btn btn-primary btn-sm" type="submit">추가</button>
							</div>
							<input type="hidden" id="menuIda" name="menuId" value="${menuId}" />
							<script type="text/javascript">
								$('#good')
										.submit(
												function() {

													if (!good.siteAddr.value
															.startsWith("https://")
															&& !good.siteAddr.value
																	.startsWith("http://")) {
														alert("https:// , http:// 를 넣어주세요.")
														$("#good #siteAddr")
																.focus();
														return false;
													}
												})
							</script>
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
						<h1>사이트 관리</h1>
						<br>
						<form name="dele" id="dele" action="getMySitedelete" method="post">
							<!-- hidden input tag 로 seq 값을 담음 -->
							<input type="hidden" name="mySiteSeq" id="mySiteSeq"> <input
								type="hidden" name="menuId" value="${menuId }" />
							<div class="top-row">
								<div class="field-wrap">
									<div class="field-wrap">
										<label for="Title"><strong>사이트 이름 :&nbsp;</strong></label><span
											id="title"></span>
									</div>
									<div class="field-wrap">
										<label for="Address"><strong>사이트 주소 :&nbsp;</strong></label><span
											id="siteAddr"></span>
									</div>
									<label for="ID OR Email"><strong>아이디 혹은 이메일
											:&nbsp;</strong></label><span id="siteId"></span>
								</div>
								<div class="field-wrap">
									<label for="Password"><strong>패스워드 :&nbsp;</strong></label><span
										id="sitePw"></span>
								</div>
							</div>
							<div class="field-wrap">
								<label for="Memo"><strong>메모 :&nbsp;</strong></label><span
									id="siteMemo"></span>
							</div>
							<br>
							<div class="form-group">
								<button class="btn btn-primary btn-sm" name="change" id="change"
									type="button">수정</button>
								<button class="btn btn-primary btn-sm" name="del"
									onclick="fn_userDel2()" type="button">삭제</button>
							</div>

						</form>

					</div>
					<!-- 수정 폼 체인지 -->
					<div id="changeform" class="changeform" style="display: none"
						align="center">
						<h2>사이트 관리 수정</h2>
						<br>
						<form action="updateMySite" id="UpdForm" name="UpdForm">
							<input type="hidden" name="mySiteSeq" id="mySiteSeq">
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="Title"><strong>사이트 이름</strong></label><input
											class="form-control" type="text" autocomplete="off"
											name="title">
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="Address"><strong>사이트 주소</strong></label><input
											class="form-control" type="text" autocomplete="off"
											name="siteAddr">
									</div>
								</div>
								<div class="form-row">
									<div class="col">
										<div class="form-group">
											<label for="ID OR Email"><strong>아이디 혹은 이메일</strong></label><input
												class="form-control" type="text" autocomplete="off"
												name="siteId">
										</div>
									</div>
								</div>
								<div class="form-row">
									<div class="col">
										<div class="form-group">
											<label for="Password"><strong>비밀번호</strong></label><input
												class="form-control" type="text" autocomplete="off"
												name="sitePw">
										</div>
									</div>
								</div>
							</div>
							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="MEMO"><strong>메모</strong></label><br>
										<textarea style="resize: none; width: 100%; height: 100px;"
											name="siteMemo"></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-sm" name="updatebutton"
									id="updatebutton" type="button">저장</button>
								<button class="btn btn-primary btn-sm" name="change2"
									id="change2" type="button">취소</button>
							</div>
							<input type="hidden" name="menuId" value="${menuId }" />
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
	<input type="hidden" id="menuId" value="${menuId }" />
</body>
</html>