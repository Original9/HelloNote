<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/css/bootstrap.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>AccountBook</title>

<script>
	
	//ready 이벤트 작성
	$(function (){
		 getAccountBookList();
// 		 insertAccountBook();
	});
	
	//목록 조회 요청
	function getAccountBookList(){
		$.ajax({
			url : "ajax/getAccountBookList.json",
			type : "json",
			success : getBoardListHandler
		});
	}
	
	//목록 조회 결과 처리
	function getBoardListHandler(data){
		for(i = 0; i<data.length; i++){
			$("<div>").append($("<tr>").html(data[i].seq))
					  .append(data[i].title)
					  .appendTo($("#accountBookList"))
					  .attr("data",data[i].seq);
			}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</script>

</head>
<body>

<div class = "container">
<h3>Checking Ledger </h3>
<div class = "balance" >
  <h5> Balance: <input type="text" id="balance" name="balance">  My Budget : <input type="text" id="budget" name="budget"> 
  </h5> 
  </div>
  <input type="button" class="btn btn-primary" id="csutomcheck" name="csutomcheck" value="임의 내역 조회" data-toggle="modal" data-target="#myModal">
  <input type="button" class="btn btn-primary" id="final" name="final" value="결산">
  <input type="button" class="btn btn-primary" id="final" name="final" value="통계">
    
<!--     The Modal -->
<div class="container">
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title">기간 선택</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <label class="sr-only" for="example-date-input">Date</label>
		조회할 기간을 선택해 주세요
   		<input class="form-control mb-2 mr-sm-2 mb-sm-0" type="date" value="" id="firstdate" name="firstdate"><br/>
   		<input class="form-control mb-2 mr-sm-2 mb-sm-0" type="date" value="" id="firstdate" name="firstdate">
   		항목을 선택해 주세요
   		    <select class="custom-select custom-select-sm mb-1">
      <option selected>항목을 선택해 주세요</option>
      <option value="trans">교통비</option>
      <option value="foodexpense">식비</option>
      <option value="salary">급여</option>
      <option value="tax">세금</option>
      <option value="investigation">경조사</option>
      <option value="hobby">취미</option>
      <option value="other">기타</option>
    </select>
		   


        </div>
        
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Submit</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
 
  
  
  

<form id="new_transaction" class="form-inline">
 	
   <div class="input-group-addon">날짜</div>	  
  <label class="sr-only" for="example-date-input">Date</label>
   <input class="form-control mb-2 mr-sm-2 mb-sm-0" type="date" value="" id="date" name="date">
	&nbsp;
      
<!--   <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="Transaction" name="Transaction" placeholder="Transaction"> -->
	<div class="input-group-addon">항목</div>
    <select class="custom-select custom-select-sm mb-1">
      <option selected>항목을 선택해 주세요</option>
      <option value="trans">교통비</option>
      <option value="foodexpense">식비</option>
      <option value="salary">급여</option>
      <option value="tax">세금</option>
      <option value="investigation">경조사</option>
      <option value="hobby">취미</option>
      <option value="other">기타</option>
    </select>
    
    &nbsp;
    <div class="input-group-addon">비고</div>
      <label class="sr-only" for="inlineFormInput">Transaction</label>
  <input type="text" class="form-control mb-2 mr-sm-2 mb-sm-0" id="Transaction" name="Transaction">
  <label class="sr-only" for="inlineFormInputGroup">Amount</label>
  <div class="input-group mb-2 mr-sm-2 mb-sm-0">
    <div class="input-group-addon">금액</div>
    <input type="text" id="amount" name="amount" class="form-control" aria-label="Amount (to the nearest dollar)"> 
  </div> 
    
  <button type="button" id="submit" name="submit"  class="btn btn-primary">Submit</button>
</form>
<div id="accountBookList">
  <table class="table">
  <thead>
    <tr>
      <th>#</th>
      <th> 날짜 </th>
      <th>이용 목적</th>
      <th>금액</th>
      <th>비고</th>
    </tr>
  </thead>
  <tbody id="my_tbody">
  </tbody>
</table>
</div>
</div>
</body>

</html>