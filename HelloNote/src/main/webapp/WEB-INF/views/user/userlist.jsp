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
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/mySiteList.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome-all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/mainFont.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet"
	href="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">

<!-- JS -->
<script
	src='<c:url value="/resources/assets/bootstrap/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/resources/assets/js/jquery.min.js"/>'></script>
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
			<h3 class="text-dark mb-4">User List</h3>
			<div class="card shadow">
				<div class="card-header py-3">
					<p class="text-primary m-0 font-weight-bold">User Info</p>
				</div>
				<!-- 리스트 DIV 시작 -->
				<div class="card-body">
					<div class="row">
						<div class="col-md-6 text-nowrap"></div>
					</div>
					<!-- 목록 시작 -->
					<form name="userForm" id="userForm" action='deleteUser'>
						<div class="table-responsive table mt-2" id="dataTable"
							role="grid" aria-describedby="dataTable_info">
							<table class="table dataTable my-0" id="tabledata">
								<thead>
									<tr>
										<th scope="col" width="10"><input id="allCheck"
											type="checkbox" onclick="allChk(this);" /></th>
										<th align="center" width="150">id</th>
										<th align="center" width="200">pw</th>
										<th align="center" width="100">gender</th>
										<th align="center" width="200">hgrant</th>
										<th align="center" width="200">age</th>
										<th align="center" width="200">hprofile</th>
									</tr>
								</thead>
								<tbody>
									<!-- 컨트롤러의 items key 값 -->
									<c:forEach items="${user}" var="user">
										<tr>
											<td><input name="rowCheck" class="rowCheck"
												type="checkbox" value="${user.hellonoteId }" /></td>
											<td class="getMySite" align="center" width="150">${user.hellonoteId }</td>
											<td class="getMySite" align="center" width="200">${user.pw }</td>
											<td class="getMySite" align="center" width="100">${user.gender }</td>
											<td class="getMySite" align="center" width="200">${user.hGrant }</td>
											<td align="center" width="200">${user.age }</td>
											<td align="center" width="200">${user.hProfile }</td>
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
									onclick="location.href='downloadExcel'">엑셀 다운로드</button>
							</div>
							<!-- 버튼 끝 -->
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>

</body>

</html>