<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
<script
	src='<c:url value="/resources/assets/bootstrap/js/bootstrap.min.js"/>'></script>
<script src='<c:url value="/resources/assets/js/jquery.min.js"/>'></script>
<script src='<c:url value="/resources/assets/js/chart.min.js"/>'></script>
<script src='<c:url value="/resources/assets/js/theme.js"/>'></script>
<script src='<c:url value="/resources/assets/js/json.min.js"/>'></script>
<script src='<c:url value="/resources/assets/pageJs/profile.js"/>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	
</script>

<body id="page-top">
	<div id="wrapper">
		<div class="d-flex flex-column" id="content-wrapper">
			<div id="content">
				<div class="container-fluid">
					<h3 class="text-dark mb-4">Profile</h3>
					<div class="row mb-3">
						<div class="col-lg-4">
							<div class="card mb-3">
								<div class="card-body text-center shadow">
									<img class="rounded-circle mb-3 mt-4"
										src="${pageContext.request.contextPath}/resources/assets/img/dogs/image2.jpeg"
										width="160" height="200">
									<div class="mb-3">
										<button class="btn btn-primary btn-sm" type="button">Change
											Photo</button>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="card shadow mb-3">
									<div class="card-header py-3">
										<p class="text-primary m-0 font-weight-bold">Change Info</p>
									</div>
									<div class="card-body">
										<form name="ChangeInfo" id="ChangeInfo" action='ChangeInfo'>

											<div class="form-row">
												<div class="col">
													<div class="form-group">
														<label for="hellonoteId"><strong>hellonoteId</strong></label><input
															class="form-control" type="text"
															value="<sec:authentication property="principal.hellonoteId" />"
															name="hellonoteId" id="hellonoteId" readonly>
													</div>
												</div>
												<div class="col">
													<div class="form-group">
														<label for="pw"><strong>PW</strong></label><input
															class="form-control" type="password" placeholder=******
															name="pw" id="pw">
													</div>
												</div>
												<div class="col">
													<div class="form-group">
														<label for="pwch"><strong>PWCH</strong></label><input
															class="form-control" type="password" placeholder=******
															name="pwch" id="pwch">
													</div>
												</div>
											</div>
											<div class="form-row">
												<div class="col">
													<div class="form-group">
														<label for="hellonoteId"><strong>Gender</strong></label><input
															class="form-control" type="text"
															value="<sec:authentication property="principal.gender" />"
															name="gender" id="gender" readonly>
													</div>
												</div>
												<div class="col">
													<div class="form-group">
														<label for="hellonoteId"><strong>hGrant</strong></label><input
															class="form-control" type="text"
															value="<sec:authentication property="principal.hGrant" />"
															name="hGrant" id="hGrant" readonly>
													</div>
												</div>
												<div class="col">
													<div class="form-group">
														<label for="hellonoteId"><strong>age</strong></label><input
															class="form-control" type="text"
															value="<sec:authentication property="principal.age" />"
															name="age" id="age" readonly>
													</div>

												</div>
											</div>
											<div class="form-row">
												<div class="col">
													<div class="form-group">
														<label for="hProfile"><strong>hProfile</strong></label> <br>
														<textarea
															style="resize: none; width: 100%; height: 100px;"
															name="hProfile"><sec:authentication
																property="principal.hProfile" /></textarea>
													</div>
												</div>
											</div>
											<div class="form-group">
												<button class="btn btn-primary btn-sm" name="updatebutton"
													id="updatebutton" type="button">Save Password</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>