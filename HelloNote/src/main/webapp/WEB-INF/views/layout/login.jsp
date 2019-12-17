<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Login - Brand</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/fonts/fontawesome-all.min.css">
<link href="resources/assets/css/mainFont.css" rel="stylesheet"
	type="text/css">
</head>

<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-9 col-lg-12 col-xl-10">
				<div class="card shadow-lg o-hidden border-0 my-5">
					<div class="card-body p-0">
						<div class="row">
							<div class="col-lg-6 d-none d-lg-flex">
								<div class="flex-grow-1 bg-login-image"
									style="background-image: url(&quot;resources/assets/img/dogs/image3.jpeg&quot;);"></div>
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h4 class="text-dark mb-4">Hello Note Login ~ !</h4>
									</div>
									<form class="user" action="processLogin" method="POST">
										<div class="form-group">
											<input class="form-control form-control-user" id="userID"
												aria-describedby="emailHelp" placeholder="Enter ID..."
												name="paramLoginId">
										</div>
										<div class="form-group">
											<input class="form-control form-control-user" type="password"
												id="pw" placeholder="Password" name="paramPassword">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<div class="form-check">
													<input class="form-check-input custom-control-input"
														type="checkbox" id="formCheck-1"><label
														class="form-check-label custom-control-label"
														for="formCheck-1">Remember Me</label>
												</div>
											</div>
											<hr>
										</div>
										<button class="btn btn-primary btn-block text-white btn-user"
											type="submit">Login</button>
										<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
											<script>
												alert("잘못 된 회원정보 입니다.")
											</script>
											<c:remove var="SPRING_SECURITY_LAST_EXCEPTION"
												scope="session" />
										</c:if>
										<hr> 
									</form>
									<div class="text-center">
										<a class="small" href="forgot-password.html">시간보고 Password
											찾기 추가 </a>
									</div>
									<div class="text-center">
										<a class="small" href="signup">회원가입</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script
		src="<c:url value="/resources/assets/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/chart.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/bs-charts.js"/>"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
	<script src="<c:url value="/resources/assets/js/theme.js"/>"></script>
</body>

</html>