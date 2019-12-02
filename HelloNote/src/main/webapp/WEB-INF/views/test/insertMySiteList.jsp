<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/insertBoard.jsp</title>
</head>
<body>
<h3>게시글 등록</h3>
<form action="insertMySite">
	SITE_userId<input name="userId"><br/>
	SITE_siteId<input name="siteId"><br/>
	SITE_sitePw<input name="sitePw"><br/>
	SITE_siteAddr<input name="siteAddr"><br/>
	SITE_siteMemo<input name="siteMemo"><br/>
	SITE_title<input name="title"><br/>
	SITE_menuId<input name="menuId"><br/>
	SITE_mySiteSeq<input name="mySiteSeq"><br/>
	<button>등록</button>
</form>
</body>
</html>