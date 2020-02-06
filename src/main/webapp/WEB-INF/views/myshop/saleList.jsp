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
   width: 1024px;
   overflow: auto;
}
#vertical_tab-container
{
   float: left;
   margin: 50px 0 0 0;
   width: 126px;
}
#vertical_tab-container ul
{
   list-style: none;
   text-align: center;
}
#vertical_tab-container ul li
{
   border-top: 1px solid #666;
   border-right: 1px solid #666;
   border-bottom: 1px solid #666;
   border-left: 8px solid #666;
   background-color: #ddd;
   margin: 8px 0;
}
#vertical_tab-container ul li a,
#vertical_tab-container ul li a:visited
{
   text-decoration: none;
   color: #666;
   display: block;
   padding: 15px 5px;
}
#vertical_tab-container ul li:hover
{
   border-left: 8px solid #333;
}
#vertical_tab-container ul li a:hover
{
   color: #000;
}
#vertical_tab-container ul li.selected
{
   border-right: none;
   background-color: #fff;
   border-left: 8px solid #006699;
}
#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   background-color: #fff;
   border: 1px solid #888;
}
</style>
</head>
<body>

  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="/nnS/myshop">주문내역 조회</a></li>
         <li class="selected"><a href="/nnS/myshop/saleList">판매내역 조회</a></li>
         <li><a href="goodsLikeList">좋아요</a></li>
         <li><a href="recentGoodsList">최근 본 상품</a></li>
      </ul>
   </div>
   
   
   
   
   
   <div id="main-container">
		<table border="1" align="center">
		<tbody>
			<tr>
				<td>
					<table  style="filter: alpha(opacity=60);" ffffff="" align="center">
								<tbody>
								<tr align="center">
								<td>판매상품</td>
								<td></td>
								<td>판매중</td>
								<td></td>
								<td>판매완료</td>
								</tr>
								<tr>
									<td>
										<a href="#goodsTab1">
											<img src="./../resources/images/payment.png" alt="" width="100" height="100"/>
										</a>
									</td>
									<td>
										<img src="./../resources/images/dots.png" alt="" width="50" height="50"/>
									</td>
									<td>
										<a href="#goodsTab2">
											<img src="./../resources/images/shipping.png" alt="" width="100" height="100"/>
										</a>
									</td>
									<td>
										<img src="./../resources/images/dots.png" alt="" width="50" height="50"/>
									</td>
									<td>
										<a href="#goodsTab3">
											<img src="./../resources/images/product.png" alt="" width="100" height="100"/>
										</a>
									</td>
								</tr>
								</tbody>
							</table>
					<div class="container">
					    <ul class="goodsTabs">
					        <li><a href="#goodsTab1">판매상품</a></li>
					        <li><a href="#goodsTab2">판매중</a></li>
					        <li><a href="#goodsTab3">판매완료</a></li>
					    </ul>
					    <div class="goodsTab_container">
					        <div id="goodsTab1" class="goodsTab_content">
					            <h2>판매상품</h2>
					      	      <table  style="filter: alpha(opacity=60);" ffffff="" align="center">
					      	      	<tr>
					      	      		<td width="200px" align="center">
					      	      			상품 번호
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			상품 이름
					      	      		</td>
					      	      		<td width="200px" align="center">
					      	      			상품이미지
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			등록 일자
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			상품 상태
					      	      		</td>
					      	      	</tr>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="low">
						<c:if test="${low.GOODS_STATUS eq '1'}">
					      	      	<tr>
					      	      		<td width="200px" align="center">
					      	      			${low.GOODS_NUM }
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			<a href="#this" id="title" name="title">${low.GOODS_TITLE }</a>		
					      	      			<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${low.GOODS_NUM }">
					      	      		</td>
					      	      		<td width="200px" align="center">
					      	      		<img alt='' width='50' height='50' src="/nnS/file/${low.GOODS_THUMBNAIL}">
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			${low.GOODS_DATE }
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			${low.GOODS_STATUS }
					      	      		</td>
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
					      	      </table>
					        </div>
					        <div id="goodsTab2" class="goodsTab_content">
					            <h2>판매중</h2>
					      	      <table  style="filter: alpha(opacity=60);" ffffff="" align="center">
					      	      	<tr>
					      	      		<td width="200px" align="center">
					      	      			상품 번호
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			상품 이름
					      	      		</td>
					      	      		<td width="200px" align="center">
					      	      			상품이미지
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			등록 일자
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			상품 상태
					      	      		</td>
					      	      	</tr>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="low">
						<c:if test="${low.GOODS_STATUS eq '2'}">
					      	      	<tr>
					      	      		<td width="200px" align="center">
					      	      			${low.GOODS_NUM }
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			<a href="#this" id="title" name="title">${low.GOODS_TITLE }</a>		
					      	      			<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${low.GOODS_NUM }">
					      	      		</td>
					      	      		<td width="200px" align="center">
					      	      			이미지
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			${low.GOODS_DATE }
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			${low.GOODS_STATUS }
					      	      		</td>
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
					      	      </table>
					        </div>
					        <div id="goodsTab3" class="goodsTab_content">
					             <h2>판매완료</h2>
					      	      <table  style="filter: alpha(opacity=60);" ffffff="" align="center">
					      	      	<tr>
					      	      		<td width="200px" align="center">
					      	      			상품 번호
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			상품 이름
					      	      		</td>
					      	      		<td width="200px" align="center">
					      	      			상품이미지
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			등록 일자
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			상품 상태
					      	      		</td>
					      	      	</tr>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="low">
						<c:if test="${low.GOODS_STATUS eq '3'}">
					      	      	<tr>
					      	      		<td width="200px" align="center">
					      	      			${low.GOODS_NUM }
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			<a href="#this" id="title" name="title">${low.GOODS_TITLE }</a>		
					      	      			<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${low.GOODS_NUM }">
					      	      		</td>
					      	      		<td width="200px" align="center">
					      	      			이미지
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			${low.GOODS_DATE }
					      	      		</td>
					      	      		<td width="100px" align="center">
					      	      			${low.GOODS_STATUS }
					      	      		</td>
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
					      	      </table>
					        </div>
					    </div>
					</div>
			</tr>
		</tbody>
	</table>
   </div>
</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
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
	comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
	comSubmit.submit();
}


</script>
</body>
</html>