<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Constrain movement</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <style>
  .draggable { width: 150px; height:150px; padding: 0.5em; float: left; margin: 0 10px 10px 0; }
  #draggable, #draggable2 { margin-bottom:20px; }
  #draggable { cursor: n-resize; }
  #draggable2 { cursor: e-resize; }
  #containment-wrapper { width: 100%; height:1000px; border:2px solid #ccc; padding: 10px; }
  h3 { clear: left; }
  </style>
  

  
</head>

<body>
<h2>접속 ID: "${hellonoteId}" 접속 pw: "${pw}"</h2>   
<h3>Widgets Moving<input type='button' id="addWidgets" value='버튼1'/></h3>
<div id="containment-wrapper">

  <div id="draggable1" class="draggable ui-widget-content">
    <p>I'm contained within the box</p>
  </div>
  
  
  <div id="draggable2" class="draggable ui-widget-content">
    <p>I'm contained within the box</p>
  </div>
  
  
  
  
</div>
 
 
</body>
<script>
// aja로 사용자가 가지고 있는 widgets 목록에서 위젯들 불러오고 화면에 뿌려준다.

$("#addWidgets").click(function() { // 위젯 아이디를 div id로 넣고 script에도 id 값으로 넣는다.
	var add = $('<div id="draggable3" class="draggable ui-widget-content" >').html('<p>test</p>');
	add.draggable({ containment: "#containment-wrapper", scroll: true });
	$('#containment-wrapper').append(add);
});



$(function(){
	$( "#draggable1" ).draggable({ containment: "#containment-wrapper", scroll: true });
	$( "#draggable2" ).draggable({ containment: "#containment-wrapper", scroll: true });
	
})
</script>
</html>