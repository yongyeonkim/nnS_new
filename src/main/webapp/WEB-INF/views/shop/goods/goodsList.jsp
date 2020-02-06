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
	<h2 align=center>상품목록</h2>
<div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li <c:if test="${sortType eq 'all'}">class="selected"</c:if>><a href=<c:url value="/shop/allGoodsList"/>>전체상품</a></li>
         <li <c:if test="${sortType eq 'like'}">class="selected"</c:if>><a href=<c:url value="/shop/likeGoodsList"/>>인기상품</a></li>
         <li <c:if test="${sortType eq 'new'}">class="selected"</c:if>><a href=<c:url value="/shop/newGoodsList"/>>신규상품</a></li>
         <li <c:if test="${sortType eq ''}">class="selected"</c:if>><a href=<c:url value="/shop"/>>카테고리</a></li>
      </ul>
   </div>
   <div id="main-container">
   
   		<table class="board_list">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<tr>
				<th bgcolor="#e9e9e9">글번호</th>
				<th bgcolor="#e9e9e9">이미지</th>
				<th bgcolor="#e9e9e9">제목</th>
				<th bgcolor="#e9e9e9">조회수</th>
				<th bgcolor="#e9e9e9">작성일</th>
				<th bgcolor="#e9e9e9">작성시간</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row">
						<tr>
							<td>${row.GOODS_NUM}</td>
							<td>${이미지}</td>
							<td class="title"><a href="#this" name="title">${row.GOODS_TITLE}</a>
								<input type="hidden" id="IDX" value="${row.GOODS_NUM}">
							<td>${row.GOODS_COUNT}</td>
							<td>${row.GOODS_DATE}</td>
							<td>${row.GOODS_TIME}</td>
						</tr>
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
		<form action="/nnS/shop" method="post">
			<fieldset>
				<legend>검색</legend>
				<select name="searchType" id="searchType">
					<option value="nothing">-----</option>
					<option value="title" <c:out value="${searchType eq 'title'?'selected':''}"/>>상품명</option>
					<option value="content" <c:out value="${searchType eq 'content'?'selected':''}"/>>내용</option>
					<option value="brand" <c:out value="${searchType eq 'brand'?'selected':''}"/>>브랜드</option>
				</select>
				<input type="text" class="txt" placeholder="Search" name="keyword" id="keyword" value="${keyword}"/>&nbsp;
				<input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
				<input type="hidden" id="path" value="${path}" />
				<input type="hidden" id="sortType" value="${sortType}" />
			</fieldset>
		</form>
		<div id="PAGE_NAVI" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
   
	
	<c:if test="${session_MEM_ID ne null }">
		<a href="#this" class="btn" id="write">글쓰기</a>
	</c:if>

   </div>
</div>
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
	


<script type="text/javascript">
		$(document).ready(function() {
			
			fn_selectGoodsList(1);
			
			$("#write").on("click", function(e) { //상품등록 버튼
				e.preventDefault();
				fn_goodsWrite();
			});

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});
			
		});
		
		function fn_goodsWrite() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsWriteForm' />");
			comSubmit.submit();
		}
	
		function fn_goodsDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
			comSubmit.addParam("GOODS_NUM", obj.parent().find("#IDX").val());
			comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
			comSubmit.submit();
		}
		
		function fn_selectGoodsList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/shop/selectGoodsList' />");
			comAjax.setCallback("fn_selectGoodsListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("path", $('#path').val());
			comAjax.ajax();
		}

		function fn_selectGoodsListCallback(data) {
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectGoodsList"
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(
								data.list,
								function(key, value) {
									str += "<tr>"
											+ "<td>"
											+ value.GOODS_NUM
											+ "</td>"
											+ "<td>"
											+ "<img alt='' width='50' height='50' src="
											+ $('#path').val()
											+ value.GOODS_THUMBNAIL
											+ ">"
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title'>"
											+ value.GOODS_TITLE
											+ "</a>"
											+ "<input type='hidden' id='IDX' value=" + value.GOODS_NUM + ">"
											+ "</td>" + "<td>" + value.GOODS_COUNT
											+ "</td>" + "<td>" + value.GOODS_DATE
											+ "</td>" + "<td>" + value.GOODS_TIME
											+ "</td>" + "</tr>";
								});
				body.append(str);

				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_goodsDetail($(this));
				});
			}
		}
	</script>
</body>
</html>