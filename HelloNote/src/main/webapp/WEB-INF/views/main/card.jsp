<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>


<!-- card css -->
<link href="../assets/css/card.css" rel="stylesheet" type="text/css">

<!-- dragable css -->
<link
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<!-- <link href="bank_account_source/dragable.css" rel="stylesheet" -->
<!-- 	type="text/css"> -->
<!--  -->

<link href="../assets/css/mainFont.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
</head>
<!-- Josh Channin -->
<body>
	<div class="container">
		<div class="wallet">
			<aside class="left-wallet">
				<div class="wallet-head">
					<h1>나의 지갑</h1>
					<i class="copy-clip fas fa-copy fa-2x"></i>
					<i class="list-remove fas fa-minus fa-2x" style="margin-right: 10px;"></i>
					<i class="modal-open fas fa-plus fa-2x" style="margin-right: 10px;"></i>

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
			<h3>카드추가</h3>
			<h5>추가할 카드를 입력해주세요</h5>
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
				<input type="text" id="ccnum" disabled> <select name="month"
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
			<h5>드래그해서 순서를 바꾸세요</h5>
			<div class="modal-list-close">x</div>
			<div id="divMain">
				<div id="divOuter1" class="droppable">
					<!-- card-1 in cc-img,cc-num-cc-date  example-->
					<!-- 					<div id="card-1" class="cc visa cc-active"> -->
					<!-- 						<div class="cc-img-main"></div> -->
					<!-- 						<div class="cc-num">**** **** **** 2562</div> -->
					<!-- 						<div class="cc-date">Valid Thru: 12/17</div> -->
					<!-- 					</div> -->
				</div>
			</div>
			<div class="modal-list-apply">적용</div>

		</div>

	</div>

	<div class="modal-passwordinput">

		<div class="modal-body">
			<h3>카드인증</h3>
			<h5>카드 비밀번호를 입력해주세요</h5>
			<div class="modal-passwordinput-close" align="right">x</div>
			<div class="modal-cards">
				<div class="">
					카드번호 : <input type="text" id="innerCardNum" disabled>
				</div>
				<div class="">
					비밀번호 : <input type="password">
				</div>
			</div>
			<div id="selectBankTransactionalInfo" class="modal-list-apply">조회</div>
		</div>


	</div>


	<!-- card javascript modal-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="../assets/pageJs/card.js"></script>
	<!-- dragable javascript-->
	<!-- 	<script type="text/javascript" src="bank_account_source/dragable.js"></script> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

</body>


</html>
