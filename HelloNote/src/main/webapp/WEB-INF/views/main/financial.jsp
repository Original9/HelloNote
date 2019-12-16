<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../assets/css/mainFont.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="container">
		<h3>Checking Ledger</h3>
		<div class="balance">
			<h5>
				Running Balance: <input type="text" id="balance" name="balance">
			</h5>
			<br>
		</div>

		<!--  <button type="button" class="btn btn-primary">New Transaction</button> -->

		<form id="new_transaction" class="form-inline">

			<label class="sr-only" for="example-date-input">Date</label> <input
				class="form-control mb-2 mr-sm-2 mb-sm-0" type="date" value=""
				id="date" name="date"> <label class="sr-only"
				for="inlineFormInput">Transaction</label> <input type="text"
				class="form-control mb-2 mr-sm-2 mb-sm-0" id="Transaction"
				name="Transaction" placeholder="Transaction"> <label
				class="sr-only" for="inlineFormInputGroup">Amount</label>
			<div class="input-group mb-2 mr-sm-2 mb-sm-0">
				<div class="input-group-addon">금액</div>
				<div class="input-group-addon">0.00</div>
				<input type="text" id="amount" name="amount" class="form-control"
					aria-label="Amount (to the nearest dollar)">
			</div>

			<button type="button" id="submit" name="submit" onclick="add_row()"
				class="btn btn-primary"
				style="background-color: #4e73df; border-color: #4e73df">Submit</button>
		</form>
		<!--   <button onclick="add_row()">행 추가하기</button> -->
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>날짜</th>
					<th>이용 목적</th>
					<th>금액</th>
					<th>잔고</th>
					<th>Action
					<th>
				</tr>
			</thead>
			<tbody id="my_tbody">

			</tbody>
		</table>
	</div>
</body>
<script src="../assets/pageJs/financial.js"></script>
</html>