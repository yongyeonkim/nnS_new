<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
  	<script>
  		$(document).ready(function(){ 
  			$('.bxslider').bxSlider({ 
  				auto: true, 
  				speed: 500, 
  				pause: 4000, 
  				mode:'fade', 
  				autoControls: true, 
  				pager:true, 
			}); 
		});
	</script>
<meta charset="UTF-8">
</head>
<body>
<ul class="bxslider"> 
	 <li>
	 	<img alt="" style="width:100%; height:250px;" src=<c:url value="/resources/images/main_banner1.png"/>/>
	 </li>
	 <li>
	 	<img alt="" style="width:100%; height:250px;" src=<c:url value="/resources/images/main_banner2.png"/>/>
	 </li>
</ul>
</body>
</html>