<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css" />
<style>

/*  input[type=text]{  */
/*    width: 100%;  */
/*    padding: 12px 20px;  */
/*    margin: 8px 0;  */
/*    display: inline-block;  */
/*    border: 1px solid #ccc;  */
/*    border-radius: 4px;  */
/*    box-sizing: border-box;  */
/*  }  */
</style>
<!-- <link rel="stylesheet" -->
<!--    href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<c:url value="/resources/assets/js/json.min.js"/>"></script>
<!-- 구글 차트  -->
<script src="//www.google.com/jsapi"></script>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">

<!--  data tables -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->

<title>AccountBook</title>







<script>


	//ready 이벤트 작성
	$(function() {
		getAccountBookList();

		insertAccountBook();

		deleteAccountBook();

		
		//updateAccountBook();
		//alert("dd");  


		
		
		
	 	$("#jb-radio-1,#jb-radio-2").click(function(){
		var submitSelect = $('#submitFrm [name="accountbookPurpose"]');
		submitSelect.empty();
	 		//수입 일 때 항목 변경
			if($("#jb-radio-1").prop('checked')){
				submitSelect.append("<option value=''>항목을 선택 해 주세요.</option>")
												.append("<option value='월급'>월급</option>")
												.append("<option value='용돈'>용돈</option>")
												.append("<option value='상여금'>상여금</option>")
												.append("<option value='사업수익'>사업수익</option>")
												.append("<option value='기타'>기타</option>")
			}
			//지출 일 때 항목 변경
			else{
				submitSelect.append("<option value=''>항목을 선택 해 주세요.</option>")
												.append("<option value='교통비'>교통비</option>")
												.append("<option value='식비'>식비</option>")
												.append("<option value='세금'>세금</option>")
												.append("<option value='경조사'>경조사</option>")
												.append("<option value='취미'>취미</option>")
												.append("<option value='기타'>기타</option>")
		 
			}
	 		
	 		
	 		
		});

	});

	/* 	function modalshow(){
	   
		  $('#updatemodal').show();
	}  */

	function madalhide() {
		$("#updatemodal").hide();
	}

	function mymodalshow() {
		$("#myModal").show();
	}

	function mymodalhide() {
		$("#myModal").hide();
	}
	

	

	//목록 조회 요청
	function getAccountBookList() {		

	
		// 특정 기간 / 항목별  / 특정기간+항목으로 내역 조회
		$("#updatemodal").hide();
		$('#btnIns').on('click', function() {
		var searchSelect = $('#searchfrm [name="accountbookPurpose"]');
			
 
			//날짜 잘못 입력했을 시 경고창 활성화
			var fdate = $('#accountbookFirstDate').val();
			var ldate = $('#accountbookLastDate').val();
			
			console.log(fdate);
			console.log(ldate);
			if (fdate > ldate) {
				alert('날짜 선택이 잘못 되었습니다. 날짜를 다시 확인해 주세요.');
				preventDefault();
			}
			
			//날짜 입력 하지 않았을 시 경고창 활성화
			if(fdate == "" || ldate == ""){
				alert("날짜를 선택해 주세요");
				preventDefault();
			}
			
			
		
			
			else {
				$("#searchfrm")
				$.ajax({
					url : "getAccountBookList.json",
					method : "POST",
					dataType : "json",
					data : $("#searchfrm").serialize(),
					success : getAccountBookListHandler
				});
			}
		});
		
		//메인에 출력되는 전체 내역 조회  
		$.ajax({
			url : "getAccountBookList.json",
			type : "json",
			//data : $("#searchfrm").serialize(),
			success : getAccountBookListHandler
		});

	}

	//목록 조회 결과 처리
	function getAccountBookListHandler(data) {
		$("tbody").empty();
		//List를 반복문으로 하나씩 찾아서 td태그 추가하면서 데이터 출력
		var sum = 0;
		
		for (i = 0; i < data.length; i++) {
			$("<tr>")
					.append($('<input type=\'hidden\' id=\'accountbookMenuid\'>').val(data[i].accountbookMenuid))
					.append($("<td>").html(data[i].accountbookSeq))
					.append($("<td>").html(data[i].accountbookDate))
					.append($("<td>").html(data[i].accountbookPurpose))
					.append($("<td>").html(data[i].accountbookPrice))
					.append($("<td>").html(data[i].accountbookTranslation))
					.append($('<td>').html('<button class="btn btn-danger" id=\'btnDelete\'>삭제</button>'))
					//.append($('<td>').html('<button class="btn btn-danger" id="btnDelete'+ i + '" onclick="deleteAccountBook(\'btnDelete' + i + '\')">삭제</button>'))
					.append($('<td>').html('<button class="btn btn-primary" name="btnUpdate", id="btnUpdate'
													+ i
													+ '" data-toggle="modal" data-target="updatemodal" onclick="updateAccountBook('
													+ data[i].accountbookSeq
													+ ','
													+ data[i].accountbookPrice
													+ ',\''
													+ data[i].accountbookTranslation
													+ '\',\''
													+ data[i].accountbookDate
													+ '\',\''
													+ data[i].accountbookPurpose
													+ '\' )">수정</button>'))
					//.append($('<td>').html('<button class="btn btn-primary" id="btnUpdate" data-toggle="modal" data-target="updatemodal" onclick="modalshow()">수정</button>'))
					.append($('<input type=\'hidden\' id=\'hidden_accountbookSeq\'>').val(data[i].accountbookSeq))
					.appendTo($("#tbodyList"))
					
					
					
			sum = sum + data[i].accountbookPrice;

			$('[name="consumption"]').attr('value', sum);

		}
		$("#myModal").hide();
		$('#accountBookTable').dataTable();
	}

	
	

	//등록
	function insertAccountBook() {
		var submitSelect = $('#submitFrm [name="accountbookPurpose"]');
		
		$("#insertBtn").click(function() {
			var a = $('#accountbookPrice').val();
			var d = $('#accountbookDate').val();
			var f = $('#accountbookPurpose').val();
			var priceCheck = $('#accountbookPrice').val();
			if (a == '') {
				alert("금액을 입력해 주세요.");
				preventDefault();
			} else if (d == '') {
				alert("날짜를 입력해 주세요.");
				preventDefault();
			}

			//     	else if(f == '항목을 선택해 주세요'){  
			//     		alert('항목을 선택해 주세요');
			//     		preventDefault();
			//     	}

			if (priceCheck == 0) {
				alert("금액을 정확하게 입력해 주세요");
				preventDefault();
			}

			var b = $('#jb-radio-2').prop('checked');
			var c = $('#accountbookPrice').val();
			if (b) {
				if ($('#accountbookPrice').val() > 0) {
					$('#accountbookPrice').val(c * -1);
				}

			}
			
			if($("#jb-radio-1").prop('checked')){
				if($('#accountbookPrice').val() < 0){
					alert("수입은 음수 입력 불가입니다.");
					preventDefault();
				}
			}
			
			if(submitSelect.val() == ''){
				alert("항목을 선택해 주세요.")
				preventDefault();
			} 
	
		
				
			
			
			
			var param = JSON.stringify($("#submitFrm").serializeObject());

			$.ajax({
				url : "insertAccountBook.json",
				method : "post",
				dataType : "json",
				data : param,
				contentType : "application/json"
			});
			location.reload();
		});
	}
	//삭제
	function deleteAccountBook() {
		//삭제 버튼 클릭
		$('body').on(
				'click',
				'#btnDelete',
				function() {
					//      var hidden_accountbookSeq = $('#' + btn_name + '').closest('tr').find('#hidden_accountbookSeq').val();
					var hidden_accountbookSeq = parseInt($(this).closest('tr')
							.find('#hidden_accountbookSeq').val());
					var result = confirm("기록을 정말로 삭제하시겠습니까?");
					console.log(typeof hidden_accountbookSeq)
					if (result) {
						$.ajax({
							url : 'deleteAccountBook.json',
							contentType : 'application/json',
							dataType : 'json',
							data : {

								accountbookSeq : hidden_accountbookSeq
							},
							success : getAccountBookList

						});
					}
					location.reload();
				});
	}



	//수정
	function updateAccountBook(accountbookSeq, accountbookprice,
			accountbooktranslation, accountbookdate, accountbookpurpose) {

		console.log(accountbookSeq);
		
		$("#updatemodal").show();
		$('[name="accountbookUpdateDate"]').val(accountbookdate);
		$('input:text[name="updatePrice"]').val(accountbookprice);
		$('input:text[name="updateTranslation"]').val(accountbooktranslation=="null"?"":accountbooktranslation);
		$('select[name="updateAccountBookPurpose"]').val(accountbookpurpose);
		
		
		
	 	$("#upd-radio-1,#upd-radio-2").click(function(){
			
			$('[name="updateAccountBookPurpose"]').empty();
	 		//수입 일 때 항목 변경
	 		
			if($("#upd-radio-1").prop('checked'))
			{
				$('[name="updateAccountBookPurpose"]')
												.append("<option value='월급'>월급</option>")
												.append("<option value='용돈'>용돈</option>")
												.append("<option value='상여금'>상여금</option>")
												.append("<option value='사업수익'>사업수익</option>")
												.append("<option value='기타'>기타</option>")
			}
	 		
			//지출 일 때 항목 변경
			else{
				$('[name="updateAccountBookPurpose"]')
												.append("<option value='교통비'>교통비</option>")
												.append("<option value='식비'>식비</option>")
												.append("<option value='세금'>세금</option>")
												.append("<option value='경조사'>경조사</option>")
												.append("<option value='취미'>취미</option>")
												.append("<option value='기타'>기타</option>")
	 		}
		});
	 	
		if(accountbookprice > 0){
			$('#upd-radio-1').attr("checked",true)
			$("#upd-radio-1").click();
			$('select[name="updateAccountBookPurpose"]').val(accountbookpurpose);
		}
		else{
			$("#upd-radio-2").attr("checked",true)
			$("#upd-radio-2").click();
			$('select[name="updateAccountBookPurpose"]').val(accountbookpurpose)
		}
		
// 		if($('input:text[name="updateTranslation"]').val(accountbooktranslation) == ""){
// 			$("#updateTranslation").val("asd")
// 		} 
		

		$("#updateAccountBookBtn").click(function() {
			var date = $('[name="accountbookUpdateDate"]').val();
			var purpose = $('select[name="updateAccountBookPurpose"]').val();
			var price = $('input:text[name="updatePrice"]').val();
 			var translation = $('input:text[name="updateTranslation"]').val();
 			var $menuId = $("#updateAccountbookMenuid").val();
			if (price == '') {
				alert('금액을 입력해 주세요.');
				preventDefault();

			} else if (date == '') {
				alert('날짜를 입력해 주세요.');
				preventDefault();
			}
			

			
			if($("#upd-radio-1").prop('checked')){
				if( price < 0){
					alert("수입은 음수 입력 불가입니다.");
					preventDefault();
				}
			}
			
			c = $('input:text[name="updatePrice"]').val();
			if ($("#upd-radio-2").prop('checked')) {
				if ($('input:text[name="updatePrice"]').val() > 0) {
					$('input:text[name="updatePrice"]').val(c * -1);
				}
			}
			
			

 			if(price == 0){
 				alert("금액을 확인해 주세요.");
 				preventDefault();
 			} 
			
 			console.log(price)
			
			$.ajax({
				url : "updateAccountBook.json",
				method : 'PUT',
				dataType : 'json',
				// 필드명 : 값
				data : JSON.stringify({
					accountbookDate : date,
					accountbookPurpose : purpose,
					accountbookPrice : $('input:text[name="updatePrice"]').val(),
					accountbookTranslation : translation,
					accountbookSeq : accountbookSeq,
					accountbookMenuid : $menuId
				}),
				contentType : 'application/json',
				success : function(){
					location.reload();
				}
			//date: accountbookUpdateDate, 

			});

		});

	}

	function updateAccountBookHandler() {
		$("<tr>").replaceAll($("<td>").html(data.accountbookDate)).replaceAll(
				$("<td>").html(data.accountbookPurpose)).replaceAll(
				$("<td>").html(data.accountbookPrice)).replaceAll(
				$("<td>").html(data.accountbookTranslation))
	}

	
//  	google.load('visualization', '1.0', {
// 		'packages' : [ 'corechart' ]
// 	});

	
	//구글 차트 로드
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
		
// 	google.charts.setOnLoadCallback(chart1);
// 	google.charts.setOnLoadCallback(chart2);
	
	
	//항목별 통계 차트

	var options1 = {
		title : '수입 통계',
		width : 500,
		height : 300,
		backgroundColor : '#f8f9fc',
		colors: ['#2E64FE', '#2E2EFE', '#5858FA', '#5882FA', '#81BEF7']

	};
	google.setOnLoadCallback(function() {
		//차트에 넣을 data를 ajax 요청해서 가져옴
		$.ajax({
			url : "chartAccountBook",
			method : "post",
			type : "json",
			success : function(data) {
				//ajax결과를 chart에 맞는 data 형태로 가공
				var chartData1 = [];
				chartData1.push([ '항목', '비율' ])
				for (i = 0; i < data.length; i++) {
					var subarr = [ data[i].accountbookPurpose,
							data[i].accountbookPercent ];
					chartData1.push(subarr);
				}
				//챠트 그리기
				var chart = new google.visualization.PieChart(document
						.querySelector('#chart_div'));
				chart.draw(google.visualization.arrayToDataTable(chartData1),
						options1);
// 				window.addEventListener('resize', function() { chart.draw(chartData1, options1); }, false);
			}
		});
	});
	
	
	//지출 차트

		var options2 = {
				title : '지출 통계',
				width : 500,
				height : 300,
				backgroundColor : '#f8f9fc',
				colors: ['#FA5858', '#FF4000', '#DF0101', '#FA5858', '#F78181']
	 
			};
			google.setOnLoadCallback(function() {
				//차트에 넣을 data를 ajax 요청해서 가져옴
				$.ajax({
					url : "nagetiveChartAccountBook",
					method : "post",
					type : "json",
					success : function(data) {
						//ajax결과를 chart에 맞는 data 형태로 가공
						var chartData2 = [];
						chartData2.push([ '항목', '비율' ])
						for (i = 0; i < data.length; i++) {
							var subarr = [ data[i].accountbookPurpose,
									data[i].accountbookPercent ];
							chartData2.push(subarr);
						}
						//챠트 그리기
						var chart = new google.visualization.PieChart(document
								.querySelector('#nagetiveChart_div'));
						chart.draw(google.visualization.arrayToDataTable(chartData2),
								options2);
// 						 window.addEventListener('resize', function() { chart.draw(chartData2, options2); }, false);
					}
				});
			});

		
		
		
		
		
		
		
		
		
		
	 
		
	
	

</script>


</head>
<body>	
					
					      
		<div id="chart_div" style="position: absolute; left: 77.5%; transform: translateX(-80%);" ></div>
		<div id="nagetiveChart_div" style="position: absolute; left: 57%; transform: translateX(-55%); row: 60%; transform: translateY(100%);"></div>
		<div id="test" ></div>   
	<div class="container"> 
		<h3>가 계 부</h3> 
		<div class="col-5">
			<h5>
				소 비 금 액: <input type="text" class="form-control" id="consumption"
					name="consumption" readonly><br/>
				계 좌 잔 액 : <input type="text" class="form-control" id="balance" readonly> <br/>
				최 종 잔 액 : <input type="text" class="form-control" id="finalBalance" readonly>
			</h5>


		</div>

			



		<!--  기간조회 및 항목 모달구현 -->
		<div class="container">
			<form id="searchfrm" name="searchfrm">
				<%--          <input type="hidden" id="accountbookMenuid" value="${param.menuId}"> --%>
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">기간 선택</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>
							<div class="modal-body">
								<label class="sr-only" for="example-date-input">Date</label> 조회할
								기간을 선택해 주세요 <input class="form-control mb-2 mr-sm-2 mb-sm-0"
									type="date" value="" id="accountbookFirstDate"
									name="accountbookFirstDate"><br /> <input
									class="form-control mb-2 mr-sm-2 mb-sm-0" type="date" value=""
									id="accountbookLastDate" name="accountbookLastDate">

								항목을 선택해 주세요 <select class="custom-select custom-select-sm mb-1"
									id="accountbookPurpose" name="accountbookPurpose">
									<option selected value=''>항목을 선택해 주세요</option>
									<option value="교통비" >교통비</option>
									<option value="식비">식비</option>
									<option value="급여">급여</option>
									<option value="세금">세금</option>
									<option value="월급">월급</option>
									<option value="용돈">용돈</option>
									<option value="상여금">상여금</option>
									<option value="사업수익">사업수익</option>
									<option value="기타">기타</option>
									
								</select>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal" id="btnIns" name="btnIns">조회</button>
								<button type="button" class="btn btn-danger" id="madalcancel"
									data-dismiss="modal" onclick="mymodalhide()">취소</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!--  기간조회 및 항목 모달구현 종료 -->



		<!--  수정 -->

		<div class="modal" id="updatemodal">
			<form id="updatefrm" name="updatefrm">
				<div class="modal-dialog"> 
					<div class="modal-content">
						<div class="modal-header">
									<input type="hidden" id="updateAccountbookMenuid" name="updateAccountbookMenuid"
										value="${param.menuId}">
						
							<h4 class="modal-title">기간 선택</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<label class="sr-only" for="example-date-input">Date</label>수정할
							정보를 입력해 주세요 <br>
							<div class="custom-control custom-radio">
								<input type="radio" name="upd-radio" id="upd-radio-1"
									class="custom-control-input"> <label
									class="custom-control-label" for="upd-radio-1">수입</label>
							</div>


							<div class="custom-control custom-radio">
								<input type="radio" name="upd-radio" id="upd-radio-2"
									class="custom-control-input" checked="checked"> <label
									class="custom-control-label" for="upd-radio-2">지출</label>
							</div>

							날짜 <input class="form-control mb-2 mr-sm-2 mb-sm-0" type="date"
								value="" id="accountbookUpdateDate" name="accountbookUpdateDate">




							항목 <select class="custom-select custom-select-sm mb-1"
								id="updateAccountBookPurpose" name="updateAccountBookPurpose">
								<!--                            <option selected>항목을 선택해 주세요</option> -->
								<option selected value="교통비" id="trans" name="trans">교통비</option>
								<option value="식비" id="foodExpense" name="foodExpense">식비</option>
<!-- 								<option value="급여" id="salary" name="salary">급여</option> -->
								<option value="세금" id="tax" name="tax">세금</option>
								<option value="경조사" id="event" name="event">경조사</option>
								<option value="취미" id="hobby" name="hobby">취미</option>
								<option value="기타" id="other" name="other">기타</option>
							</select> 금액 <input type="text" class="form-control" id="updatePrice"
								name="updatePrice"> 비고 <input type="text"
								class="form-control" id="updateTranslation"
								name="updateTranslation">

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="updateAccountBookBtn">수정</button>
	
							<button type="button" class="btn btn-danger" data-dismiss="modal"
								onclick="madalhide()">취소</button>
						</div>
					</div>
				</div>
			</form>
		</div>

		<!--  수정 종료 -->


		<!-- 기본적인 내역 등록 폼 -->

		<form id="submitFrm" name="submitFrm">

			<input type="hidden" id="accountbookMenuid" name="accountbookMenuid"
				value="${param.menuId}">
				
			<div class="custom-control custom-radio custom-control-inline">
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="jb-radio" id="jb-radio-1"
					class="custom-control-input"> <label id="incomeLabel"
					class="custom-control-label" for="jb-radio-1">수입</label>
			</div>
			<div class="custom-control custom-radio custom-control-inline">
				<input type="radio" name="jb-radio" id="jb-radio-2"
					class="custom-control-input" checked="checked"> <label
					class="custom-control-label" for="jb-radio-2">지출</label>
		</div>
	     <div class="col-7">
			<div class="input-group-addon">날짜</div>
			<label class="sr-only" for="example-date-input">Date</label> <input
				class="form-control mb-2 mr-sm-2 mb-sm-0" type="date"
				id="accountbookDate" name="accountbookDate"> 
				<!-- 디폴드값 오늘날짜 자동으로 들어감 -->
				<script>
				document.getElementById('accountbookDate').valueAsDate = new Date();
				</script>
			
			<!--   <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="Transaction" name="Transaction" placeholder="Transaction"> -->
			<div class="input-group-addon">항목</div>
			<select class="custom-select custom-select-sm mb-1"
				name="accountbookPurpose" id="accountbookPurpose">
				<option selected value="">항목을 선택 해 주세요.</option>
				<option value="교통비">교통비</option>
				<option value="식비">식비</option>
				<option value="세금">세금</option>
				<option value="경조사" >경조사</option>
				<option value="취미">취미</option>
				<option value="기타">기타</option>
			</select>



			<div class="input-group-addon">비고</div>
			<label class="sr-only" for="inlineFormInput">Transaction</label> <input
				type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
				id="accountbookTranslation" name="accountbookTranslation"
				placeholder="특이사항을 입력 하세요."> <label class="sr-only"
				for="inlineFormInputGroup">Amount</label>



<!-- 			<div class="input-group mb-2 mr-sm-2 mb-sm-0"> -->
				<div class="input-group-addon">금액</div>
				<input type="text" id="accountbookPrice" name="accountbookPrice"
					class="form-control" aria-label="Amount (to the nearest dollar)"
					placeholder="금액을 입력하세요.">
<!-- 			</div> -->
			</div>

			<br/>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
			
							 <input type="button"
			class="btn btn-primary" id="csutomcheck" name="csutomcheck"
			value="임의 내역 조회" onclick="mymodalshow()" data-toggle="modal"
			data-target="myModal"> <input type="button"
			class="btn btn-primary" id="final" name="final" value="결산"
			onclick="location.href='downloadExcel2'">
			<button type="button" id="insertBtn" name="insertBtn"
				class="btn btn-primary">등록</button>
		</form>
		<div id="accountBookList">
			<table class="table" id="accountBookTable">
				<thead>
					<tr id="tr">
						<th>#</th>
						<th>날짜</th>
						<th>이용 목적</th>
						<th>금액</th>
						<th>비고</th>
						<th>삭제</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody id="tbodyList">
				</tbody>
			</table>
		</div>
	</div>

</body>
<!--  기본적인  내역등록 종료 -->

</html>