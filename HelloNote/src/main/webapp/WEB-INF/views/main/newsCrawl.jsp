<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function() {

		$('#crawlContainer').find('img').each(function() {
			$(this).css({
				'width' : '20%',
				'height' : 'auto'
			});
		})
	})
</script>
</head>
<body>
	<div id="crawlContainer">${crawl}</div>
</body>
</html>