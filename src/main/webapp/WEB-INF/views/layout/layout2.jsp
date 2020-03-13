<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 이미지 롤오버효과 스크립트입니다. -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/a.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/reset.css"/>" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/layout.css"/>" />


<title>nnS#</title>
</head>
<body>
<div id="wrapper">
	<div id="header">
		<tiles:insertAttribute name="header"/><!-- // header -->
	</div>
	<div style="width:100%; height:300px; margin:auto;">
		<tiles:insertAttribute name="body"/><!-- // container -->
	</div> 	
	<!-- container --> 
	<div id="container" style="width:30%; margin:10px 10px 10px 9%; float:left;">
		<div style="border: 1px dashed; margin-top:30px;">
			<tiles:insertAttribute name="body2"/><!-- // container -->
		</div>
	</div>
	<div id="container" style="width:50%; margin:10px 9% 10px 10px; float:right;">
		<div style="border: 1px dashed; margin-top:30px;">
			<tiles:insertAttribute name="body3"/><!-- // container -->
		</div>
		<div style="border: 1px dashed; margin-top:10px;">
			<tiles:insertAttribute name="body4"/><!-- // container -->
		</div>
		<div style="border: 1px dashed; margin-top:10px;">
			<tiles:insertAttribute name="body5"/><!-- // container -->
		</div>
		<div style="border: 1px dashed; margin-top:10px;">
			<tiles:insertAttribute name="body6"/><!-- // container -->
		</div>
	</div>
	<!-- footer --> 
		<tiles:insertAttribute name="footer"/><!-- // footer -->
</div>
</body>
</html>