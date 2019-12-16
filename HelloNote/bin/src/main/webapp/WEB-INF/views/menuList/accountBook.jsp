<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="/DataTables/datatables.css">

input[type=text]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
</style>
<!-- <link rel="stylesheet" -->
<!--    href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/assets/js/json.min.js"/>"></script>
<!-- 구글 차트  -->
<script src="//www.google.com/jsapi"></script>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
 
 <!--  data tables -->
<script src="//cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<!-- <script type="text/javascript" charset="utf8" src="/DataTables/datatables.js"></script> -->


<title>AccountBook</title>







<script>

   //ready 이벤트 작성
   $(function() {
      getAccountBookList();
       
      insertAccountBook();
      
      deleteAccountBook();
      
      //updateAccountBook();
    
   });
   
   /* 	function modalshow(){
	   
		  $('#updatemodal').show();
	}  */

	
	function madalhide(){
		$("#updatemodal").hide();
	}
	
	
	function mymodalshow(){
		$("#myModal").show();
	}
	
	
	function mymodalhide(){
		$("#myModal").hide();
	}
	
   //목록 조회 요청
   function getAccountBookList() {
      // 특정 기간 / 항목별  / 특정기간+항목으로 내역 조회
      
      $("#updatemodal").hide();
     
      $('#btnIns').on('click', function() {
         //날짜 잘못 입력했을 시 경고창S
         var fdate = $('#accountbookFirstDate').val();
         var ldate = $('#accountbookLastDate').val();
         if (fdate > ldate) {
            alert('날짜 선택이 잘못 되었습니다. 날짜를 다시 확인해 주세요.');
         } else {
            $("#searchfrm")
            $.ajax({
               url : "getAccountBookList.json",
               method : "POST",
               dataType : "json",
               data :  $("#searchfrm").serialize(),
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
         $("<tr>").append($('<input type=\'hidden\' id=\'accountbookMenuid\'>').val(data[i].accountbookMenuid))
               .append($("<td>").html(data[i].accountbookSeq))
               .append($("<td>").html(data[i].accountbookDate))
               .append($("<td>").html(data[i].accountbookTranslation))
               .append($("<td>").html(data[i].accountbookPrice))
               .append($("<td>").html(data[i].accountbookPurpose))
               .append($('<td>').html('<button class="btn btn-danger" id=\'btnDelete\'>삭제</button>'))
               //.append($('<td>').html('<button class="btn btn-danger" id="btnDelete'+ i + '" onclick="deleteAccountBook(\'btnDelete' + i + '\')">삭제</button>'))
               .append($('<td>').html('<button class="btn btn-primary" name="btnUpdate", id="btnUpdate'+ i + '" data-toggle="modal" data-target="updatemodal" onclick="updateAccountBook('+data[i].accountbookSeq+','+data[i].accountbookPrice+',\''+data[i].accountbookTranslation+'\',\''+data[i].accountbookDate+'\',\''+data[i].accountbookPurpose+'\' )">수정</button>'))
               //.append($('<td>').html('<button class="btn btn-primary" id="btnUpdate" data-toggle="modal" data-target="updatemodal" onclick="modalshow()">수정</button>'))
               .append($('<input type=\'hidden\' id=\'hidden_accountbookSeq\'>').val(data[i].accountbookSeq))
               .appendTo($("#tbodyList"))
               sum += data[i].accountbookPrice;

               $('[name="balance"]').attr('value',sum);
               
      }
      $("#myModal").hide();
	   // $('#accountBookTable').dataTable();
   }

   //등록
   function insertAccountBook() {
      $("#insertBtn").click(function() {
         var param = JSON.stringify($("#submitFrm").serializeObject());
         $.ajax({
            url : "insertAccountBook.json",
            method : "post",
            dataType : "json",
            data : param,
            contentType : "application/json",
            success : getAccountBookList
         });

      });
   }
   //.append()menuId
   //등록 처리 결과
   function insertAccountBookHandler(data) {
      //입력할 데이터를 td태그로 추가하여 입력
      $("<tr>").append($('<input type=\'hidden\' id=\'accountbookMenuid\'>').val(data[i].accountbookMenuid))
      		 .append(parseDate($("<td>").html(data.accountbookSeq)))
             .append($("<td>").html(data.accountbookDate))
             .append($("<td>").html(data.accountbookTranslation))
             .append($("<td>").html(data.accountbookPrice))
             .append($("<td>").html(data.accountbookPurpose))
             .appendTo($("#tbodyList"));
   }

   //삭제
   function deleteAccountBook() {
      //삭제 버튼 클릭
      $('body').on('click','#btnDelete',function(){
//      var hidden_accountbookSeq = $('#' + btn_name + '').closest('tr').find('#hidden_accountbookSeq').val();
      var hidden_accountbookSeq = parseInt($(this).closest('tr').find('#hidden_accountbookSeq').val());
      var result = confirm("기록을 정말로 삭제하시겠습니까?");
      console.log(typeof hidden_accountbookSeq)      
      if(result){
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
      });
   }

//    function deleteAccountBookHandler(data) {
//       $("<tr>").remove($("<td>").html(data.accountbookSeq))
//              .remove($("<td>").html(data.accountbookDate))
//              .remove($("<td>").html(data.accountbookPurpose))
//              .remove($("<td>").html(data.accountbookPrice))
//              .remove($("<td>").html(data.accountbookTranslation))
//              .remove($("#tbodyList"));
//    }


	
	
	
	//modal show event
	
	
   //수정
   function updateAccountBook(accountbookSeq,price,translation,date_cal,purpose) {
	  
	
	   $("#updatemodal").show();
	   $('input:text[name="updatePrice"]').val(price);
	   $('input:text[name="updateTranslation"]').val(translation);
	   $('select[name="updateAccountBookPurpose"]').val(purpose);
	   
	   $("#updateAccountBookBtn").click(function() {     
		 
         var date = $('[name="accountbookUpdateDate"]').val();
         var purpose = $('select[name="updateAccountBookPurpose"]').val();
         var price = $('input:text[name="updatePrice"]').val();
         var translation = $('input:text[name="updateTranslation"]').val();
         $.ajax({ 
             url: "updateAccountBook.json", 
             method: 'PUT', 
             dataType: 'json', 
             // 필드명 : 값
             data: JSON.stringify({accountbookDate:date, accountbookPurpose:purpose , accountbookPrice:price , accountbookTranslation:translation, accountbookSeq:accountbookSeq }),
             contentType: 'application/json', 
             success: getAccountBookList
             //date: accountbookUpdateDate, 
             
         });
    
      });
   
	}
   
   
   function updateAccountBookHandler(){
      $("<tr>").replaceAll($("<td>").html(data.accountbookDate))
               .replaceAll($("<td>").html(data.accountbookPurpose))
             .replaceAll($("<td>").html(data.accountbookPrice))
             .replaceAll($("<td>").html(data.accountbookTranslation))
   }
   

//항목별 통계 차트

	


	var options = {
		title : '항목 통계',
		width : 200,
		height : 200,
		backgroundColor: '#f8f9fc'

		
	};
	google.load('visualization', '1.0', {
		'packages' : [ 'corechart' ]
	});
	google.setOnLoadCallback(function() {
//차트에 넣을 data를 ajax 요청해서 가져옴
	$.ajax({
			url : "chartAccountBook",
			method : "post",
			type : "json",
			success : function(data) {
				//ajax결과를 chart에 맞는 data 형태로 가공
				var chartData = [];
				chartData.push([ '항목', '비율' ])
				for (i = 0; i < data.length; i++) {
					var subarr = [ data[i].accountbookPurpose, (data[i].accountbookPercent) ];
					chartData.push(subarr);
				}
				//챠트 그리기
				var chart = new google.visualization.PieChart(document
						.querySelector('#piechart'));
				chart.draw(google.visualization.arrayToDataTable(chartData),
						options);
			}
		});
	});



</script>

</head>
<body>
<!-- <div id="chart_div"></div> -->

   <div id="piechart" align="right" style="width: 1px; height: 1px;"></div>
   <div class="container">
      <h3>가 계 부</h3>
      <div class="col-5">
         <h5>
            Balance: <input type="text" class="form-control" id="balance"
               name="balance" readonly>
         </h5>
			 
      </div>
      <input type="button" class="btn btn-primary" id="csutomcheck" name="csutomcheck" value="임의 내역 조회" onclick="mymodalshow()" data-toggle="modal" data-target="myModal"> 
      <input type="button" class="btn btn-primary" id="final" name="final" value="결산" onclick="location.href='downloadExcel'">
	  
      
		
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
                           <option selected>항목을 선택해 주세요</option>
                           <option value="교통비" id="trans" name="trans">교통비</option>
                           <option value="식비" id="foodExpense" name="foodExpense">식비</option>
                           <option value="급여" id="salary" name="salary">급여</option>
                           <option value="세금" id="tax" name="tax">세금</option>
                           <option value="경조사" id="event" name="event">경조사</option>
                           <option value="취미" id="hobby" name="hobby">취미</option>
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
                        <h4 class="modal-title">기간 선택</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
                     <div class="modal-body">
                        <label class="sr-only" for="example-date-input">Date</label>수정할 정보를 입력해 주세요
                        날짜   <input class="form-control mb-2 mr-sm-2 mb-sm-0"
                           type="date" value="" id="accountbookUpdateDate"
                           name="accountbookUpdateDate">
                        항목  <select class="custom-select custom-select-sm mb-1"
                           id="updateAccountBookPurpose" name="updateAccountBookPurpose">
                           <option selected>항목을 선택해 주세요</option>
                           <option value="교통비" id="trans" name="trans">교통비</option>
                           <option value="식비" id="foodExpense" name="foodExpense">식비</option>
                           <option value="급여" id="salary" name="salary">급여</option>
                           <option value="세금" id="tax" name="tax">세금</option>
                           <option value="경조사" id="event" name="event">경조사</option>
                           <option value="취미" id="hobby" name="hobby">취미</option>
                           <option value="기타" id="other" name="other">기타</option>
                        </select>
                        금액  <input type="text" class="form-control" id="updatePrice" name="updatePrice">
                        비고  <input type="text" class="form-control" id="updateTranslation" name="updateTranslation">
                        
                     </div>
                     <div class="modal-footer">
                        <button type="button" class="btn btn-danger"
                           id="updateAccountBookBtn" >수정</button>
                        <button type="button" class="btn btn-danger"
                           data-dismiss="modal" onclick="madalhide()">취소</button>
                     </div>
                  </div>
               </div>
         	</form>
            </div>
   
      <!--  수정 종료 -->




      <form id="submitFrm" name="submitFrm" class="form-inline">
		
		<input type="hidden" id="accountbookMenuid" name="accountbookMenuid" value="${param.menuId}">
         <div class="input-group-addon">날짜</div>
         <label class="sr-only" for="example-date-input">Date</label> <input
            class="form-control mb-2 mr-sm-2 mb-sm-0" type="date"
            id="accountbookDate" name="accountbookDate"> &nbsp;

         <!--   <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="Transaction" name="Transaction" placeholder="Transaction"> -->
         <div class="input-group-addon">항목</div>
         <select class="custom-select custom-select-sm mb-1"
            name="accountbookPurpose" id="accountbookPurpose">
            <option selected>항목을 선택해 주세요</option>
            <option value="교통비" id="trans" name="trans">교통비</option>
            <option value="식비" id="foodexpense" name="foodexpense">식비</option>
            <option value="급여" id="salary" name="salary">급여</option>
            <option value="세금" id="tax" name="tax">세금</option>
            <option value="경조사" id="event" name="event">경조사</option>
            <option value="취미" id="hobby" name="hobby">취미</option>
            <option value="기타" id="other" name="other">기타</option>
         </select> &nbsp;
         
          
          
         <div class="input-group-addon">비고</div>
         <label class="sr-only" for="inlineFormInput">Transaction</label> <input
            type="text" class="form-control mb-2 mr-sm-2 mb-sm-0"
            id="accountbookTranslation" name="accountbookTranslation"> <label
            class="sr-only" for="inlineFormInputGroup">Amount</label>
            
          
         
         <div class="input-group mb-2 mr-sm-2 mb-sm-0">
            <div class="input-group-addon">금액</div>
            <input type="text" id="accountbookPrice" name="accountbookPrice"
               class="form-control" aria-label="Amount (to the nearest dollar)">
         </div>
		
         <button type="button" id="insertBtn" name="insertBtn"
            class="btn btn-primary">Submit</button>
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
               <th>수정</th>
               <th>삭제</th>
            </tr>
            </thead>
            <tbody id="tbodyList">
            </tbody>
  
         </table>
      </div>
   </div>
<!-- <table id="sample-table"> -->
<!--     <thead> -->
<!--         <tr> -->
<!--             <th>title-1</th> -->
<!--             <th>title-2</th> -->
<!--         </tr> -->
<!--     </thead> -->
<!--     <tbody> -->
<!--         <tr> -->
<!--             <td>data-1</td> -->
<!--             <td>data-2</td> -->
<!--             <td>data-3</td> -->
<!--         </tr> -->
<!--     </tbody> -->
<!-- </table> -->
</body>


</html>