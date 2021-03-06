<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/bootstrap/css/bootstrap.min.css">
<!-- <link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"> -->
<!-- <link rel="stylesheet" href="/assets/fonts/fontawesome-all.min.css"> -->
<!-- <link href="assets/css/mainFont.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/assets/css/index.css" rel="stylesheet" type="text/css">
</head>

<script type="text/javascript">
	$(function(){		
		
		$('#translate').click(function(){
			var src_lang = document.getElementById('src_lang').value;
			var target_lang = document.getElementById('target_lang').value;
			var inputText = $('#inputText').val();
			console.log(src_lang);
			if(src_lang == target_lang){
				window.alert("언어를 다르게 선택해주세요 ^.^")
			}else{
				$.ajax({
					  method: "GET",
					  url: "https://kapi.kakao.com/v1/translation/translate",
					  data: {src_lang:src_lang, target_lang:target_lang, query: inputText },
					  headers: {Authorization: "KakaoAK 1418cab94ef4e9c25e2f9a7f1a0541e4"}	  
				  	
					})
					  .done(function( msg ) {
					    console.log(msg);
					    console.log(msg.translated_text[0]);				   
					    $('#outputText').val(msg.translated_text[0]);				    
					    
					  });
				
			}			
			
		})
	})
</script>
<!-- --user-data-dir="C:\chrome" -->
<body>
         
 <div class="container">
  <form>
	  <h2>HELLONOTE 번역기</h2>                                                                                     
	  <div class="table-responsive">
	    <table class="table table-bordered">
	      <thead>
	        <tr>
	          <th>
	          	  <div>
	          	  	<select id="src_lang" class="selectpicker" data-style="btn-primary">
	          	  		<option value="kr">한국어</option>
	          	  		<option value="en">영어</option>
	          	  		<option value="jp">일본어</option>
	          	  		<option value="cn">중국어</option>
	          	  		<option value="de">독일어</option>	          	  		
	          	  	</select>	          	  
	          	  </div>
			  </th>
	          <th>
		          	<div>
		          	  	<select id="target_lang" class="selectpicker" data-style="btn-primary">
		          	  		<option value="kr">한국어</option>
		          	  		<option value="en" selected>영어</option>
		          	  		<option value="jp">일본어</option>
		          	  		<option value="cn">중국어</option>
		          	  		<option value="de">독일어</option>	          	  		
		          	  	</select>	          	  
		          	  </div>
			  </th>          
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	          <td> <textarea class="form-control" rows="5" id="inputText" placeholder="Type Here">안녕하세요</textarea></td>
	          <td> <textarea class="form-control" rows="5" id="outputText" name="outputText" ></textarea></td>          
	        </tr>
	      </tbody>
	    </table>
	    	<div align="right">
	    		<input type="button" class="btn btn-dark" value="번역하기" id="translate">
	    	</div>
	  </div>
  </form>
</div>


</body>
</html>