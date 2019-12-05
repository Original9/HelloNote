﻿<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="co.yedam.hellonote.mysite.paging.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty jsFunc}">
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>
<ul class="pagination">
	<li class="page-item"><a class="page-link"  
 href="javascript:${jsFunc}(${paging.startPage>2?paging.startPage-1:1})">이전</a>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
		<c:if test="${i != paging.page}">
			<li><a class="page-link" href="javascript:${jsFunc}(${i})">${i}</a>
		</c:if>
		<c:if test="${i == paging.page}">
			<li class="page-link active">${i}
		</c:if>
	</c:forEach>
	<li class="page-item"><a class="page-link" href="javascript:${jsFunc}(${paging.endPage<paging.lastPage?paging.endPage+1:paging.endPage})">다음</a>
</ul>