<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	type="text/css" />
<style>

</style>
<!-- <link rel="stylesheet" -->
<!--    href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<%-- <script src="<c:url value="/resources/assets/js/json.min.js"/>"></script> --%>
<!-- 구글 차트  -->
<script src="//www.google.com/jsapi"></script>

<meta charset="UTF-8">
<!-- <meta name="viewport" -->
<!-- 	content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> -->
<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"> -->

<!--  data tables -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
<script src="//cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script>

$(function(){
   
insertBankAccount();

noInsertBankAccount();

})



function insertBankAccount(){
   
   $("#insertBtn").click(function() {
	   var bankName = $("#bankName").val();
       var accountName = $("#accountName").val();
       var accountNumber = $("#accountNumber").val();
       var menuId = $("#bankAccountMenuid").val();

		if (bankName == '') {
			alert("은행이름을 입력해 주세요.");
			preventDefault();
			
		} else if (accountName == '') {
			alert("계좌이름을 입력해 주세요.");
			preventDefault();
		}
		
		else if (accountNumber == ''){
			alert("계좌번호를 입력해 주세요.");
			preventDefault();
		}
		
		  var result = confirm('카드를 등록 하시겠습니까?');
		  
		  if(result){
			
		  
		 
       
   $.ajax({
      url : "insertBankAccount.json",
      method : "post",
      dataType : "json",
       data : JSON.stringify({
         bankaccountBankname : bankName,
         bankaccountAccountname : accountName,
         bankaccountAccountnumber : accountNumber,
         menuId : menuId,
      }),
      contentType : "application/json",
       success : function(){
    	   location.href="accountBook?menuId="+menuId;
       }
       
      });
      }
   });
}
   
function noInsertBankAccount(){
	  $("#noInsertBtn").click(function() {
	   	   
		  var result = confirm('카드를 등록하지 않으시겠습니까?');
		  
		  if(result){

		  
	       var bankName = $("#bankName").val();
	       var accountName = $("#accountName").val();
	       var accountNumber = $("#accountNumber").val();
	       var menuId = $("#bankAccountMenuid").val();
	   $.ajax({
	      url : "noInsertBankAccount.json",
	      method : "post",
	      dataType : "json",
	      data : JSON.stringify({
	         bankaccountBankname : bankName,
	         bankaccountAccountname : accountName,
	         bankaccountAccountnumber : accountNumber,
	         menuId : menuId
	      }),
	      contentType : "application/json",
	       success : function(){
	    	   location.href="accountBookNoCard?menuId="+menuId;
	       }
	   
	      });
	   
	   
	     
	      }
});
}

   

</script>

</head>
<body>
	<form id="insertCard" name="insertCard">
	<div class="col-2">
		<input type="hidden" id="bankAccountMenuid" name="bankAccountMenuid"
			value="${param.menuId}"> 은 행 :&nbsp;<input type="text"
			class="form-control" id="bankName" name="bankName"><br>
		<br> 계 좌 이 름 :&nbsp;<input type="text" class="form-control"
			id="accountName" name="accountName"><br> <br> 계 좌 번
		호 :&nbsp;<input type="text" class="form-control"
			id="accountNumber" name="accountNumber"><br> <br> <input
			type="button" id="insertBtn" class="btn btn-primary" value="등록">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
			type="button" id="noInsertBtn" class="btn btn-danger" value="미등록">
	</div>
	</form>




</body>
</html>