<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<style type="text/css">

h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {width: 700px; margin: 10px auto;}
ul.goodsTabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}
ul.goodsTabs li {
	
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px;
	background: #F0F0F0;
	overflow: hidden;
	position: relative;
}
ul.goodsTabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff;
	outline: none;
}
ul.goodsTabs li a:hover {
	background: #ccc;
}	
html ul.goodsTabs li.active, html ul.goodsTabs li.active a:hover  {
	background: #fff;
	border-bottom: 1px solid #fff;
}
.goodsTab_container {
	border: 1px solid #999;
	border-top: none;
	clear: both;
	float: left; 
	width: 100%;
	background: #fff;
	-moz-border-radius-bottomright: 5px;
	-khtml-border-radius-bottomright: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-bottomleft: 5px;
	-khtml-border-radius-bottomleft: 5px;
	-webkit-border-bottom-left-radius: 5px;
}
.goodsTab_content {
	padding: 20px;
	font-size: 1.2em;
}
.goodsTab_content h2 {
	font-weight: normal;
	padding-bottom: 10px;
	border-bottom: 1px dashed #ddd;
	font-size: 1.8em;
}
.goodsTab_content h3 a{
	color: #254588;
}
.goodsTab_content img {
	float: left;
	margin: 0 20px 20px 0;
	border: 1px solid #ddd;
	padding: 5px;
}
 #content
{	 
   background-color: #ffffff;
   padding: 20px 10px;  
   overflow: auto;
}
#vertical_tab-container
{
   float: left;
   margin: 70px 0 0 0;
   width: 126px;
}
#vertical_tab-container ul
{
   list-style: none;
   text-align: center;
}
#vertical_tab-container ul li
{
   border-top: 1px solid #fff;
   border-right: 1px solid #fff;
   border-bottom: 1px solid #595959;
   border-left: 4px solid #595959;   
   background-color: #fff;  
   margin: 8px 0;
}  
#vertical_tab-container ul li a,
#vertical_tab-container ul li a:visited
{
   text-decoration: none;
   color: #666;
   display: block;
 	padding: 3px 3px;
}
#vertical_tab-container ul li:hover
{
   border-left: 4px solid #ffd04a;
}
#vertical_tab-container ul li a:hover
{
   color: #333;
}
#vertical_tab-container ul li.selected
{
   border-right: none;
   background-color: #fff;
   border-left: 4px solid #ffd04a;
}
#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   border-top: 1px solid #fff;  
   border-right: 1px solid #fff;     
   border-left: 1px solid #fff; 
   border-bottom: 1px solid #fff;    
}
</style>
</head>
<body>

	<div id="content">
   <div id="vertical_tab-container">
      <ul>
      	<li><a href="/nnS/myshop"><img src="/nnS/resources/images/myshop_tab1.png" width="100" height="30"></a></li>
         <li><a href="/nnS/myshop/saleList"><img src="/nnS/resources/images/myshop_tab2.png" width="100" height="30"></a></li>
         <li class="selected"><a href="/nnS/myshop/goodsLikeList"><img src="/nnS/resources/images/myshop_tab3.png" width="100" height="30">></a></li>
      </ul>
   </div>
   <div id="main-container">
		<table border="1" align="center">
			<li>
				좋아요
			</li>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list}" var="row" varStatus="rowS">
							<c:if test="${(rowS.index+1) % 3 eq 1}">
							<tr>
							</c:if>
								<td align="center">
								
					      	      	<input type="hidden" name="title2" id="title2" value="${row.GOODS_NUM}">
									<a href="#this" id="title" name="title"><img alt='' width='140' height='140' src="/nnS/file/${row.GOODS_THUMBNAIL}"></a><br/>
									${row.GOODS_TITLE}<br/>
									${row.GOODS_PRICE}<br/><br/>
								</td>
								
							<c:if test="${(rowS.index+1) % 3 eq 0}">
							</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			</table>
   </div>
</div>
<script type="text/javascript">

$(document).ready(function() {

	//Default Action
	$(".goodsTab_content").hide(); //Hide all content
	$("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
	$(".goodsTab_content:first").show(); //Show first goodsTab content
	
	//On Click Event
	$("ul.goodsTabs li").click(function() {
		$("ul.goodsTabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected goodsTab
		$(".goodsTab_content").hide(); //Hide all goodsTab content
		var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
		$(activegoodsTab).fadeIn(); //Fade in the active content
		return false;
	});
	
	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});

});

function fn_openBoardDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
	comSubmit.addParam("GOODS_NUM", $("#title2").val());
	comSubmit.submit();
}
</script>
</body>
</html>