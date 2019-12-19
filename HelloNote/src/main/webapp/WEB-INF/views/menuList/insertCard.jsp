<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<c:url value="/resources/assets/js/json.min.js"/>"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">

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
		<input type="hidden" id="bankAccountMenuid" name="bankAccountMenuid"
			value="${param.menuId}"> 은 행 :&nbsp;<input type="text"
			class="form-control-sm-7" id="bankName" name="bankName"><br>
		<br> 계 좌 이 름 :&nbsp;<input type="text" class="form-control-sm-7"
			id="accountName" name="accountName"><br> <br> 계 좌 번
		호 :&nbsp;<input type="text" class="form-control-sm-7"
			id="accountNumber" name="accountNumber"><br> <br> <input
			type="button" id="insertBtn" value="등록">&nbsp;&nbsp;&nbsp; <input
			type="button" id="noInsertBtn" value="미등록">
	</form>




</body>
</html>