<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<style type="text/css">
 @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
html, body, div, span, applet, object, iframes, h1, h2, h3, h4, h5, h6,
   p, blockquote, pre, a, abbr, acronym, address, big, quotes, code, del,
   dfn, em, img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, u,
   i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
   caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
   details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
   output, ruby, section, summary, time, mark, audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   
   do: inherit;
   vertical-align: baseline;
}
   html {
      height: 100%;
   }
   
   body {
        background:linear-gradient(to bottom right, #f0e199, #f0e199);
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
   .goodsTab_content img {
	float: none;
	margin: auto;
	border: 0px;
	padding: 5px;
}
</style>
</head>
<body>
<div class="card align-middle" style="border-radius:20px; background-color:#fff; margin-top:50px;">
  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="/nnS/myshop"><img src="/nnS/resources/images/myshop_tab1.png" width="100" height="30"></a></li>
         <li class="selected"><a href="/nnS/myshop/saleList"><img src="/nnS/resources/images/myshop_tab2.png" width="100" height="30"></a></li>
         <li><a href="/nnS/myshop/goodsLikeList"><img src="/nnS/resources/images/myshop_tab3.png" width="100" height="30"></a></li>
      </ul>
   </div>
   <div id="main-container">
   		<table>
   		<tr>
			<td>
			<a href="#goodsTab1">
			<img src="../resources/images/d_money.png" alt="" width="100" height="100"/>
			</a>
			</td>
			<td>
			<img src="../resources/images/d_dot.png" alt="" width="50" height="50"/>
			</td>
			<td>
			<a href="#goodsTab2">
			<img src="../resources/images/d_truck.png" alt="" width="100" height="100"/>
			</a>
			</td>
			<td>
			<img src="../resources/images/d_dot.png" alt="" width="50" height="50"/>
			</td>
			<td>
			<a href="#goodsTab3">
			<img src="../resources/images/d_hand.png" alt="" width="100" height="100"/>
			</a>	
			</td>
			</tr>
   		</table>
   		<div class='container' style="width:100%;">
			<ul class='goodsTabs'>
				<li class='selected'><a href='#goodsTab1'><img src="../resources/images/mysale_tab_1.png" alt="" width="90" height="30"/></a></li>
				<li><a href='#goodsTab2'><img src="../resources/images/mysale_tab_2.png" alt="" width="90" height="30"/></a></li>
				<li><a href='#goodsTab3'><img src="../resources/images/mysale_tab_3.png" alt="" width="90" height="30"/></a></li>
			</ul>
			<div class='goodsTab_container'>
				<div id="goodsTab1" class="goodsTab_content">
					<table id="main_table1" class="tbl_type">
						<tbody>
						</tbody>
					</table>
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
				</div>
			<div id="goodsTab2" class="goodsTab_content">
				<table id="main_table2" class="tbl_type">
					<tbody>
					</tbody>
				</table>
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
			</div>
			<div id="goodsTab3" class="goodsTab_content">
				<table id="main_table3" class="tbl_type">
					<tbody>
					</tbody>
				</table>
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
			</div>
			
		</div>
   </div>
</div>
</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	fn_selectMySaleList(1,1);
	
	//Default Action
	$(".goodsTab_content").hide(); //Hide all content
	$("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
	$(".goodsTab_content:first").show(); //Show first goodsTab content
	
	//On Click Event
	$("ul.goodsTabs li").click(function() {
		$("ul.goodsTabs li").removeClass("selected active"); //Remove any "active" class
		$(this).addClass("selected active"); //Add "active" class to selected goodsTab
		$(".goodsTab_content").hide(); //Hide all goodsTab content
		var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
		
		if($(this).find("a").attr("href") == "#goodsTab2"){
			fn_selectMySaleList(1,2);
		}else if($(this).find("a").attr("href") == "#goodsTab3"){
			fn_selectMySaleList(1,3);
		}
		$(activegoodsTab).fadeIn(); //Fade in the active content
		return false;
	});
	
	
	$("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openGoodsDetail($(this));
	});
	
	/* $("#DNUM_IN").on("click", function(e) { // 송장번호 입력버튼
		e.preventDefault();
		fn_dnum_in($(this));	
	}); */
	
});
function fn_goodsDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
	comSubmit.addParam("GOODS_NUM", obj.parent().find("#title2").val());
	comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
	comSubmit.submit();
}

// 입력확인 버튼
function fn_dnum_in(num) {
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/inputDnum' />");
	comSubmit.addParam("ORDERS_DNUM", $("#ORDERS_DNUM").val());
	comSubmit.addParam("ORDERS_NUM", num);
	comSubmit.submit();
}

function fn_selectMySaleList(pageNo, tabNo) {
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/myshop/selectSaleList' />");
	comAjax.setCallback("fn_selectMySaleListCallback1");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.addParam("MEM_ID", "${MEM_ID}");
	comAjax.addParam("tabNo", tabNo);
	comAjax.ajax();
}

function fn_selectMySaleListCallback1(data) {
	var total = data.TOTAL;
	var tabNo = data.tabNo;
	var body = "";
	
	if(tabNo == 1){
		body = $("#main_table1 tbody");	
	}else if(tabNo == 2){
		body = $("#main_table2 tbody");	
	}else if(tabNo == 3){
		body = $("#main_table3 tbody");	
	}
	var str1 = "";	
	body.empty();
	str1 	+= 	"<tr>"
		+		"<th width='200px' align='center'><img src=<c:url value='/resources/images/mysale_list1.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/mysale_list2.png'/>></th>"
		+		"<th width='200px' align='center'><img src=<c:url value='/resources/images/mysale_list3.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/mysale_list4.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/mysale_list5.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myshop_dnum.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myshop_sstatus.png'/>></th>"
		+	"</tr>";
	if (total == 0) {
		str1 += "<tr align=\"center\">" 
			+	"<td colspan='7'>조회된 결과가 없습니다.</td>"
			+	"</tr>";
		body.append(str1);
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			recordCount : 15,
			eventName : "fn_selectMySaleList"
			
		};
		gfn_renderPaging(params);
			
		$.each(data.list, 
				function(key, value) {
						str1 +=	"<tr>"
				    		+	"<td width='200px' align='center'>"
							+	value.GOODS_NUM
							+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	"<a href='#this' id='title' name='title'>"
	      	      			+	value.GOODS_TITLE
	      	      			+	"</a>"
	      	      			+	"<input type='hidden' id='title2' name='title2' value="+value.GOODS_NUM+">"
		      	      		+	"</td>"
		      	      		+	"<td width='200px' align='center'>"
		      	      		+	"<img alt='' width='50' height='50' src=/nnS/file/"+value.GOODS_THUMBNAIL+">"
		      	      		+	"</td>"
		      	      	    +   "<td width='100px' align='center'>"
		      	      		+	new Date(value.ORDERS_DATE).toLocaleString()
		      	      		+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	value.ORDERS_STATUS	
		      	      		+	"</td>";
		      	      	if(value.ORDERS_STATUS == "배송중") {
							str1 += "<td width='200px' align='center'>"+value.ORDERS_DNUM+"</td>"+"<td></td>";
						} else if(value.ORDERS_STATUS == "주문/결제") {
							str1 +=	"<td width='200px' align='center'>"
		      	      			 +	"<input type='text' id='ORDERS_DNUM' name='ORDERS_DNUM'>"
		      	      			 +	"</td>"
		      	      			 +  "<td>"
	      	      				 +	"<input type='button' id='DNUM_IN' name='DNUM_IN' value='입력확인' onclick='fn_dnum_in("+value.GOODS_NUM+")' >" 
		      	      			 +	"</td>";
		      	      	}else{
		      	      		str1 += "<td></td><td></td>";
		      	      	}	
		      	      	str1 +=	"</tr>";
					
		});
							body.append(str1);
							
			$("a[name='title']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_goodsDetail($(this));
			});
			
				
	}
} 
 
</script>
</body>
</html>