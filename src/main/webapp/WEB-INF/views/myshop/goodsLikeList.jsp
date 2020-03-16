<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>

<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/card.css"/>" rel="stylesheet">
<style type="text/css">
td{
	margin:0 0 0 10px
}
td img
{
	width:250px; 
	height:250px;
	margin:10px 10px 10px 0px; 
	border:3px solid #000; 

}

   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   html {
      height: 100%;
   }
   
   body {
        background:linear-gradient(to bottom right, #f0e199, #f0e199);
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   
   }
</style>

<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div style="border-radius:20px; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); background-color:#fff; margin:50px 0 80px 0; width:100%; height:100%;">
<div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="/nnS/myshop"><img src="/nnS/resources/images/myshop_tab1.png" width="100" height="30"></a></li>
         <li><a href="/nnS/myshop/saleList"><img src="/nnS/resources/images/myshop_tab2.png" width="100" height="30"></a></li>
         <li class="selected"><a href="/nnS/myshop/goodsLikeList"><img src="/nnS/resources/images/myshop_tab3.png" width="100" height="30"></a></li>
      </ul>
   </div>
   <div id="main-container">
   		<form action="/nnS/myshop/goodsLikeList" method="post">
	      <select name="tstatus" id="tstatus">
	               <option value="0">전체보기</option>
	               <option value="1" <c:out value="${tstatus eq '1' ? 'selected' :''}"/>>거래가능</option>
	               <option value="2" <c:out value="${tstatus eq '2' ? 'selected' :''}"/>>거래중</option>
	               <option value="3" <c:out value="${tstatus eq '3' ? 'selected' :''}"/>>거래완료</option>
	      </select>
	      <input type="submit" value="분류" class="search_btn" onClick="onSearch()"/>
   		<table class="board_list">
		<colgroup>
			<col width="100%" />
		</colgroup>
		<thead>
			<tr>
			</tr>
		</thead>
		<tbody>
		</tbody>
		</table>
		
		<div align="center">
			<fieldset>
				
				<select name="searchType" id="searchType">
					<option value="nothing">-----</option>
					<option value="title" <c:out value="${searchType eq 'title'?'selected':''}"/>>상품명</option>
					<option value="content" <c:out value="${searchType eq 'content'?'selected':''}"/>>내용</option>
					<option value="brand" <c:out value="${searchType eq 'brand'?'selected':''}"/>>브랜드</option>
					<option value="hash" <c:out value="${searchType eq 'hash'?'selected':''}"/>>해시태그</option>
				</select>
				<input type="text" class="txt" placeholder="Search" name="keyword" id="keyword" value="${keyword}"/>&nbsp;
				<input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
				<input type="hidden" id="path" value="${path}" />
				<input type="hidden" id="sortType" value="${sortType}" />
			</fieldset>
		</form>
		</div>
		<div id="PAGE_NAVI" align="center"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		<input type="hidden" id="path" value="${path}" />
   </div>
</div>
</div>
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
	


<script type="text/javascript">
		$(document).ready(function() {
			
			fn_selectGoodsList(1);

			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});
			
		});

		function fn_hashSearch(keyword){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/myshop/selectGoodsList' />");
			comAjax.setCallback("fn_selectGoodsListCallback");
			comAjax.addParam("PAGE_INDEX", 1);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", keyword);
			comAjax.addParam("searchType", "hash");
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("path", $('#path').val());
			comAjax.addParam("tstatus", $('#tstatus').val());
			comAjax.ajax();
			return true;
		}
	
		function fn_goodsDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
			comSubmit.addParam("GOODS_NUM", obj.parent().find("#IDX1").val());
			comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
			comSubmit.submit();
		}
		
		function fn_selectGoodsList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/myshop/selectGoodsList' />");
			comAjax.setCallback("fn_selectGoodsListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("keyword", $('#keyword').val());
			comAjax.addParam("searchType", $('#searchType').val());
			comAjax.addParam("sortType", $('#sortType').val());
			comAjax.addParam("path", $('#path').val());
			comAjax.addParam("tstatus", $('#tstatus').val());
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
									var title = value.GOODS_TITLE;
									if(title.length > 10){
										title = title.substring(0, 9) + "...";
									}
									var imgpath = "";
									var tstatus = "";
									var hashStr = "";
									var hashAdd = "";
									
									if(value.GOODS_HASH != null){
										hashStr = value.GOODS_HASH.split("#");
									}
									for(var i=0; i < hashStr.length; i++){
										//alert(hashStr[i]);
										if(hashStr[i] == ""){
											continue;
										}
										if(hashStr[i].substring(0,1) == "#"){
											hashAdd += "<a href='#' onClick='fn_hashSearch(\"" + hashStr[i] + "\")'>"
												+  "<b class='card-body-hashtag'>"
												+  hashStr[i]
												+  "</b>"
												+  "</a>";
										}else{
											hashAdd += "<a href='#' onClick='fn_hashSearch(\"#" + hashStr[i] + "\")'>"
												+  "<b class='card-body-hashtag'>"
												+  "#" + hashStr[i]
												+  "</b>"
												+  "</a>";
										}
									}
									
									if(value.GOODS_THUMBNAIL == null){
										imgpath = 	"<div class='card-header'>"
									}else{
										imgpath = "<div class='card-header' style='background-image:url(\"" + $('#path').val() + value.GOODS_THUMBNAIL + "\");'>"
										//alert(imgpath);
									}
									if(value.GOODS_TSTATUS == 'N'){
										tstatus += "<div class = 'card-header-is_closed2' >" 
										 	     + "<div class = 'card-header-text' >" 
												 + "거래가능";
									}else if (value.GOODS_TSTATUS == 'ING'){
										tstatus += "<div class = 'card-header-is_closed' >" 
										 	     + "<div class = 'card-header-text' >" 
										 	     + "거래중";
									}
									
									str +=  "<div class='card'>"
										+		"<a href='#this' name='title'>"
										+	      imgpath
										+ 					tstatus
										+ 					"</div >"
										+	                "<div class = 'card-header-number' >"
										+					value.GOODS_NUM + "번"
										+					"</div >" 
										+	            "</div >"
										+	      "</div>"
										+	      "<div class='card-body'>"
										+	         "<div class='card-body-header'>"
										+	            "<p class='card-body-hashtag'>"
										//+				value.GOODS_HASH
										+				hashAdd
										+				"</p>"
										+	            "<h1>"
										+				title
										+				"</h1>"
										+	            "<p class = 'card-body-nickname'>"
										+					value.GOODS_PRICE + "원&nbsp;&nbsp;&nbsp;"
										+	                "판매자: " + value.MEM_ID
										+	            "</p>"
										+	         "</div>"
										//+	         "<p class='card-body-description'>"
										//+	            value.GOODS_CONTENT
										//+	         "</p>"
										+	         "<div class='card-body-footer'>"
										+	            "<hr style='margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31'>"
										+	            "<i class='icon icon-view_count'>"
										+"<img src='../resources/images/goods_count.png' style='width: 17px;height: 17px;'>"
										+				"</i>"
										+				value.GOODS_COUNT
										+				"회"
										+	            "<i class='icon icon-comments_count'>"
										+"<img src='../resources/images/goods_heart.png' style='width: 17px;height: 17px;'>"
										+				"</i>"
										+				value.TOTAL_COUNT2
										+				"개"
										+	            "<i class='reg_date'>"
										+				new Date(value.GOODS_DATE).toLocaleString()
										+				"</i>"
										+	         "</div>"
										+	      "</div>"
										+ 	   "<input type='hidden' id='IDX1' value=" + value.GOODS_NUM + ">"
										+	   "</a>"
										+	   "</div>";
										
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