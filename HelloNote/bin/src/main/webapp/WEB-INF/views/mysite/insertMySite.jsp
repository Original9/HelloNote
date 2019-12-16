<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/mySiteList.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/mainFont.css">


<!-- MySiteList JS 파일 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src='<c:url value="/resources/assets/pageJs/mySiteList.js"/>'></script>
</head>
<body>
	<div class="modal" id="myModal">
		<div class="modal-content" id="modal-content">
			<span class="close">&times;</span>
			<div align="center">
				<div class="container">
					<div class="form">
						<div class="tab-content">
							<div id="signup">
								<h1>Add Site</h1>
								<form action="/" method="post">
									<div class="top-row">
										<div class="field-wrap">
											<label> ID or Email<span class="req">*</span>
											</label> <input type="text" required autocomplete="off" />
										</div>

										<div class="field-wrap">
											<label> Password<span class="req">*</span>
											</label> <input type="text" required autocomplete="off" />
										</div>
									</div>
									<div class="field-wrap">
										<label> Name<span class="req">*</span>
										</label> <input type="password" required autocomplete="off" />
									</div>
									<div class="field-wrap">
										<label> Memo<span class="req">*</span></label>
									</div>
									<div class="field-wrap">
										<textarea></textarea>
									</div>


									<button class="button button-block"
										style="width: 30% !important;">Add</button>
								</form>
							</div>
							<form action="/" method="post"></form>

						</div>
						<!-- tab-content -->
					</div>
					<!-- /form -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>