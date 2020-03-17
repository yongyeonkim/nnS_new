<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<style type="text/css">
	.error p{
	font-size:30px;
	margin:30px;
	}
</style>
<meta charset="UTF-8">
<title>errorPage</title>
</head>
<body>
<div class="error" align="center">
	<img src="${context}/resources/images/errorPage.png" width="200px" height="200px">
	<c:choose>
		<c:when test="${requestScope['javax.servlet.error.status_code'] == 400}"> 
			<p>잘못 된 요청입니다.</p> 
		</c:when> 
		
		<c:when test="${requestScope['javax.servlet.error.status_code'] == 404}"> 
			<p>요청하신 페이지를 찾을 수 없습니다.</p> 
		</c:when> 
		
		<c:when test="${requestScope['javax.servlet.error.status_code'] == 405}"> 
			<p>요청된 메소드가 허용되지 않습니다.</p> 
		</c:when> 
		
		<c:when test="${requestScope['javax.servlet.error.status_code'] == 500}"> 
			<p>서버에 오류가 발생하여 요청을 수행할 수 없습니다.</p> 
		</c:when>
		 
		<c:when test="${requestScope['javax.servlet.error.status_code'] == 503}"> 
			<p>서비스를 사용할 수 없습니다.</p> 
		</c:when>
		<c:otherwise>
			<p>잘못된 요청이거나 처리할 수 없는 요청입니다. 다시 시도해주세요.</p>
		</c:otherwise>
	</c:choose>
	 
	<a href="/nnS/main" style="color:blue; font-size:20px;">
		main
	</a>
</div>
</body>
</html>