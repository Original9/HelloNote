<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/fullcalendar.min.css" /> --%>
<!-- card css -->
<link href="${pageContext.request.contextPath}/resources/assets/bankaccount/css/card.css" rel="stylesheet" type="text/css">

<!-- dragable css -->
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/assets/bankaccount/css/dragable.css" rel="stylesheet" type="text/css">
<!--  -->

</head>
<!-- Josh Channin -->
<body>
	<div class="container">
	
					<div class="copy-clip">☞</div>
					<div class="list-remove">-</div>
					<div class="modal-list-open">▤</div>
					<div class="modal-open">+</div>
		<div class="wallet">
			<aside class="left-wallet">
				<div class="wallet-head">
					<h1>나의 계좌</h1>
					
				</div>
				<div class="cc-select"></div>
			</aside>
			<aside class="left-wallet">
				<div class="wallet-head">
					<h1>송금 계좌</h1>
				</div>
				<div class="cc-select"></div>
			</aside>
			<content class="right-trans">
			<h1>현재잔액</h1>
			<h4 id="balance"></h4>
			<div class="trans-list"></div>
			</content>
		</div>
	</div>
	
	<div class="modal">
		<div class="modal-body">
			<h3>계좌추가</h3>
			<h5>추가할 계좌를 입력해주세요</h5>
			<div class="modal-close">x</div>
			<div class="modal-cards">
				<div class="md-cc visa">
					<div class="cc-img visa"></div>
				</div>
				<div class="md-cc amex">
					<div class="cc-img amex"></div>
				</div>
				<div class="md-cc mc">
					<div class="cc-img mc"></div>
				</div>
			</div>
			<form>
				계좌번호<input type="text" id="ccnum" disabled>
				계좌주 <input type="text" id="">
				<select name="ismine">
					<option value="T" selected="selected">나의계좌</option>
					<option value="F"> 타인계좌 </option>
				</select> 
				<select name="month"
					id="month" required disabled>
					<option value="">Month</option>
					<option value="01">Janaury</option>
					<option value="02">February</option>
					<option value="03">March</option>
					<option value="04">April</option>
					<option value="05">May</option>
					<option value="06">June</option>
					<option value="07">July</option>
					<option value="08">August</option>
					<option value="09">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select> <select name="year" id="year" required disabled>
					<option value="">Year</option>
					<option value="16">2016</option>
					<option value="17">2017</option>
					<option value="18">2018</option>
					<option value="19">2019</option>
					<option value="20">2020</option>
					<option value="21">2021</option>
					<option value="22">2022</option>
					<option value="23">2023</option>
					<option value="24">2024</option>
				</select>
			</form>
			<button class="modal-add-cc">Add</button>
		</div>
	</div>

	<div class="modal-cardlist-change">
		<div class="modal-body">
			<h3>카드리스트 순서번경</h3>
			<h5>드래그해서 순서를 바꾸세요</h5><div class="modal-list-close">x</div>
			<div id="divMain">
				<div id="divOuter1" class="droppable">	
				</div>
			</div>
			<div class="modal-list-apply">적용</div>
			
		</div>

	</div>
	
	<div class="modal-passwordinput">
		
		<div class="modal-body">
		<h3>비밀번호인증</h3>
			<h5>비밀번호를 입력해주세요</h5>
			<div class="modal-passwordinput-close" align="right">x</div>
			<div class="modal-cards">
				<div class=""> <input type="text" id="innerCardNum" disabled hidden=""></div>
				<div class="">비밀번호 : <input type="password"></div>
			</div>
			<div id="selectBankTransactionalInfo" class="modal-list-apply" >조회</div>
		</div>
		
		
	</div>


<%-- <script src="<c:url value="/resources/calendar/js/moment.min.js"/>"></script>	  --%>

	<!-- card javascript modal-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src='<c:url value="/resources/assets/bankaccount/js/card.js" />'></script>
	<!-- 	bank_account_source//card.js -->
	
	
	<!-- dragable javascript-->
	<script type="text/javascript" src='
	<c:url value ="/resources/assets/bankaccount/js/dragable.js"/>'></script>
<!-- 	bank_account_source/dragable.js -->

<!-- v/resources/assets -->

<!-- 	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script> --> <!-- 돌아갈지는 모르겟다. -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

</body>


</html>
