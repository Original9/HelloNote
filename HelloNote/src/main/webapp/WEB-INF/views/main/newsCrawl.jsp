<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$('#crawlContainer').find('img').each(function(){
		$(this).width('100');
		$(this).height('70');
	})
</script>
</head>
<body>
	<div id="crawlContainer">${crawl}</div>
</body>
</html>