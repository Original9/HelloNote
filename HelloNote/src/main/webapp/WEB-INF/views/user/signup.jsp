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
<title>회원가입</title>
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
								<h4 class="text-dark mb-4">회원 가입</h4>
								<br>
							</div>
							<form class="signUp" name="signUp" id="signUp"
								action="insertUserSignUp">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control form-control-user" type="text"
											id="hellonoteId" placeholder="아이디" name="hellonoteId">
									</div>
									<div class="col-sm-6">
										<button type="button" class="idCheck">중복 체크</button>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">

										<input class="form-control form-control-user" type="password"
											id="pw" placeholder="비밀번호" name="pw">
									</div>

									<div class="col-sm-6">
										<input class="form-control form-control-user" type="password"
											id="pwcheck" placeholder="비밀번호 체크" name="pwcheck">

									</div>
								</div>

								<br>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input class="form-control form-control-user" type="text"
											id="age" placeholder="나이" name="age">
									</div>
									<div class="col-sm-6">
										<input class="form-control form-control-user" type="text"
											id="hProfile" placeholder="자기소개" name="hProfile">
									</div>

								</div>
								<br>
								<div class="col-sm-6">
									<label for="성별"><strong>성별:&nbsp;</strong></label> <select
										name="gender">
										<option selected>선택</option>
										<option value="M">남자</option>
										<option value="F">여자</option>
									</select>
								</div>
								<br>
								<hr>
								<br>
								<button class="btn btn-primary btn-block text-white btn-user"
									onclick="signupbutton()" type="button" disabled="disabled"
									id="btnSign">회원가입 완료</button>
								<button id="user" name="user"
									class="btn btn-primary btn-block text-white btn-user"
									type="button" onclick="location.href='/hellonote/'">로그인</button>
								<br>
								<hr>
							</form>
							<div class="text-center">
								<a class="small" href="https://www.google.com">Click Go Site
									=> www.google.co.kr</a>
							</div>
							<div class="text-center">
								<a class="small" href="https://www.naver.com">Click Go Site
									=> www.naver.com</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>