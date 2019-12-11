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
<script src='<c:url value="/resources/assets/pageJs/signup.js"/>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
	
</script>

<body>
	<div class="container">
		<div class="card shadow-lg o-hidden border-0 my-5">
			<div class="card-body p-0">
				<div class="row">
					<div class="col-lg-5 d-none d-lg-flex">
						<div class="flex-grow-1 bg-register-image"
							style="background-image: url(&quot;${pageContext.request.contextPath}/resources/assets/img/dogs/image2.jpeg&quot;);"></div>
					</div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h4 class="text-dark mb-4">Create an Account!</h4>
							</div>
							<form class="signUp" name="signUp" id="signUp"
								action="insertUserSignUp">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control form-control-user" type="text"
											id="hellonoteId" placeholder="hellonoteId" name="hellonoteId"
											onkeydown="inputIdChk()"> <input type="button"
											value="중복확인" onclick="openIdChk()"> <input
											type="hidden" name="idDuplication" value="idUncheck">
									</div>
									<div class="col-sm-6">
										<input class="form-control form-control-user" type="password"
											id="pw" placeholder="pw" name="pw"> <input
											class="form-control form-control-user" type="password"
											id="pwcheck" placeholder="pwcheck" name="pwcheck">
									</div>
								</div>
								<div class="form-group">
									<select name="gender">
										<option selected>선택</option>
										<option value="M">M</option>
										<option value="F">F</option>
									</select>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control form-control-user" type="text"
											id="age" placeholder="age" name="age">
									</div>
									<div class="col-sm-6">
										<input class="form-control form-control-user" type="text"
											id="hProfile" placeholder="hProfile" name="hProfile">
									</div>
								</div>
								<button class="btn btn-primary btn-block text-white btn-user"
									onclick="signupbutton()" type="button">Register
									Account</button>
								<hr>
								<a
									class="btn btn-primary btn-block text-white btn-google btn-user"
									role="button">&nbsp; Register with Google</a><a
									class="btn btn-primary btn-block text-white btn-facebook btn-user"
									role="button">&nbsp; Register with Facebook</a>
								<hr>
							</form>
							<div class="text-center">
								<a class="small" href="forgot-password.html">Forgot
									Password?</a>
							</div>
							<div class="text-center">
								<a class="small" href="login.html">Already have an account?
									Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>