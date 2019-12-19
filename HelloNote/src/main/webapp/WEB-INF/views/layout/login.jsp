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
									style="background-image: url(&quot;resources/assets/img/dogs/image3.jpeg&quot;);">
								</div>
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h4 class="text-dark mb-4">Hello Note Login ~ !</h4>
									</div>
									<form id="user" name="user" class="user" action="processLogin"
										method="POST">
										<div class="form-group">
											<input class="form-control form-control-user" id="userID"
												aria-describedby="emailHelp" placeholder="Enter ID..."
												name="paramLoginId">
										</div>
										<div class="form-group">
											<input class="form-control form-control-user" type="password"
												id="pw" placeholder="Password" name="paramPassword">
										</div>
										<br>
										<div class="form-group">
											<button id="user" name="user"
												class="btn btn-primary btn-block text-white btn-user"
												type="submit">Login</button>
											<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
												<script>
													alert("잘못 된 회원정보 입니다.")
												</script>
												<c:remove var="SPRING_SECURITY_LAST_EXCEPTION"
													scope="session" />
											</c:if>
										</div>
										<hr>
										<!-- 네이버 로그인 창으로 이동 -->
										<div class="form-group">
											<div id="naver_id_login" style="text-align: center">
												<a href="${url}"> <img width="250"
													src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
											</div>
										</div>
										<hr>
										<br>
									</form>
									<!-- 									<div class="text-center">
										<a class="small" href="forgot-password.html">시간보고 Password
											찾기 추가 </a>
									</div> -->
									<div class="text-center">
										<a class="small" href="signup">회원가입</a>
									</div>
									<div class="text-center">
										<p class="small" onclick="init()">관리자 접속</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="webcam-container" align='center'
		style="position: relative; top: -360px; left: -240px;"></div>
	<div id="label-container"></div>
	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
	<script type="text/javascript">
		// More API functions here:
		// https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

		// the link to your model provided by Teachable Machine export panel
		const URL = "./resources/ai/";

		let model, webcam, labelContainer, maxPredictions;

		// Load the image model and setup the webcam
		async
		function init() {
			const modelURL = URL + "model.json";
			const metadataURL = URL + "metadata.json";

			// load the model and metadata
			// Refer to tmImage.loadFromFiles() in the API to support files from a file picker
			// or files from your local hard drive
			// Note: the pose library adds "tmImage" object to your window (window.tmImage)
			model = await
			tmImage.load(modelURL, metadataURL);
			maxPredictions = model.getTotalClasses();

			// Convenience function to setup a webcam
			const flip = true; // whether to flip the webcam
			webcam = new tmImage.Webcam(200, 200, flip); // width, height, flip
			await
			webcam.setup(); // request access to the webcam
			await
			webcam.play();
			window.requestAnimationFrame(loop);

			// append elements to the DOM
			document.getElementById("webcam-container").appendChild(
					webcam.canvas);
			labelContainer = document.getElementById("label-container");
			for (let i = 0; i < maxPredictions; i++) { // and class labels
				labelContainer.appendChild(document.createElement("div"));
			}
		}

		async
		function loop() {
			webcam.update(); // update the webcam frame
			await
			predict();
			window.requestAnimationFrame(loop);
		}

		// run the webcam image through the image model
		async
		function predict() {
			// predict can take in an image, video or canvas html element
			const prediction = await
			model.predict(webcam.canvas);
			for (let i = 0; i < maxPredictions; i++) {
				const classPrediction = prediction[i].className + ": "
						+ prediction[i].probability.toFixed(2);
				labelContainer.childNodes[i].innerHTML = classPrediction;
			}
			if (prediction[1].className == "admin"
					&& prediction[1].probability.toFixed(2) > 0.9) {
				document.getElementById("userID").value = "kwon";
				document.getElementById("pw").value = "1234k";
				//document.user.action="processLogin";
				document.user.submit();
			} else {
				document.getElementById("userID").value = "";
				document.getElementById("pw").value = "";
			}
		}
	</script>
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