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
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

<!-- JS -->
<script src='<c:url value="/resources/assets/js/chart.min.js"/>'></script>
<script src='<c:url value="/resources/assets/js/theme.js"/>'></script>
<script src='<c:url value="/resources/assets/js/json.min.js"/>'></script>
<script src='<c:url value="/resources/assets/pageJs/user.js"/>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	
</script>
<body id="page-top">
	<div id="wrapper">
		<div class="container-fluid">
			<h3 class="text-dark mb-4">회원 목록</h3>
			<div class="card shadow">
				<div class="card-header py-3">
					<p class="text-primary m-0 font-weight-bold">회원 정보</p>
				</div>
				<!-- 리스트 DIV 시작 -->
				<div class="card-body">
					<div class="row">
						<div class="col-md-6 text-nowrap"></div>
					</div>
					<!-- 목록 시작 -->
					<form name="userForm" id="userForm" action='deleteUserListProc'>
						<input type="hidden" name="hellonoteId1">
						<div class="table-responsive table mt-2" id="dataTable"
							role="grid" aria-describedby="dataTable_info">
							<table class="table dataTable my-0 table-hover" id="tabledata">
								<thead>
									<tr>
										<th scope="col" width="10" align="center"><input
											id="allCheck" type="checkbox" onclick="allChk(this);" /></th>
										<th align="center" width="80">아이디</th>
										<th align="center" width="50">성별</th>
										<th align="center" width="50">권한</th>
										<th align="center" width="50">나이</th>
										<th align="center" width="200">자기소개</th>
									</tr>
								</thead>
								<tbody>
									<!-- 컨트롤러의 items key 값 -->
									<c:forEach items="${user}" var="user">
										<tr>
											<td align="center"><input name="rowCheck"
												class="rowCheck" type="checkbox"
												value="${user.hellonoteId }" /></td>
											<td class="getUser" align="center">${user.hellonoteId }</td>
											<td class="getUser" align="center">${user.gender }</td>
											<td class="getUser" align="center">${user.hGrant }</td>
											<td class="getUser" align="center">${user.age }</td>
											<td class="getUser" align="center">${user.hProfile }</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
							<!-- 목록 끝 -->
							<br>
							<!-- 버튼 시작 -->
							<div align="right">
								<button class="btn btn-primary" type="button"
									onclick="fn_userDel()">삭제</button>
								<button class="btn btn-primary" type="button"
									onclick="location.href='downloadExcel1?menuId=${menuId}'">엑셀 다운로드</button>
							</div>
							<!-- 버튼 끝 -->
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세보기 모달 창 -->
	<div class="modal" id="getUserModal">
		<div class="modal-content" id="modal-content">
			<div class="form">
				<span class="close">&times;</span>
				<div class="tab-content">
					<div id="select" class="select" align="center">
						<h1>회원 보기</h1>
						<br>
						<form name="dele" id="dele" action="deleteUserProc" method="post">
							<input type="hidden" name="hellonoteId">
							<div class="top-row">
								<div class="field-wrap">
									<div class="field-wrap">
										<label for="ID"><strong>아이디 :&nbsp;</strong></label><span
											id="hellonoteId"></span>
									</div>
									<label for="Gender"><strong>성별 :&nbsp;</strong></label><span
										id="gender"></span>
								</div>
								<div class="field-wrap">
									<label for="Grant"><strong>권한 :&nbsp;</strong></label><span
										id="hGrant"></span>
								</div>
							</div>
							<div class="field-wrap">
								<label for="Age"><strong>나이 :&nbsp;</strong></label><span
									id="age"></span>
							</div>
							<div class="field-wrap">
								<label for="Profile"><strong>자기소개 :&nbsp;</strong></label><span
									id="hProfile"></span>
							</div>
							<br>
							<div class="form-group">
								<button class="btn btn-primary btn-sm" name="change" id="change"
									type="button">수정</button>
								<button class="btn btn-primary btn-sm" name="del"
									onclick="fn_userDel2()" type="button">취소</button>
							</div>

						</form>

					</div>
					<!-- 수정 폼 체인지 -->
					<div id="changeform" class="changeform" style="display: none"
						align="center">
						<h1>회원 권한 수정</h1>
						<br>
						<form action="updateUser" id="UpdForm" name="UpdForm">
							<div class="field-wrap">
								<div class="field-wrap">
									<label for="ID"><strong>아이디 :&nbsp;</strong></label><span
										id="hellonoteId"></span>
								</div>
								<label for="Gender"><strong>성별 :&nbsp;</strong></label><span
									id="gender"></span>
							</div>
							<div class="field-wrap">
								<label for="HGRANT"><strong>권한 :&nbsp;</strong></label><select
									name="hGrant">
									<option value="M">M</option>
									<option value="U">U</option>

								</select>
							</div>
							<div class="field-wrap">
								<label for="Age"><strong>나이 :&nbsp;</strong></label><span
									id="age"></span>
							</div>

							<div class="form-row">
								<div class="col">
									<div class="form-group">
										<label for="HPROFILE"><strong>자기소개</strong></label><br>
										<textarea style="resize: none; width: 100%; height: 100px;"
											name="hProfile" readonly></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-sm" name="updatebutton"
									id="updatebutton" type="button">저장</button>
								<button class="btn btn-primary btn-sm" name="change2"
									id="change2" type="button">취소</button>
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