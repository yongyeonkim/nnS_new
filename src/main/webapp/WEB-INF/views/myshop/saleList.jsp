<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/views/myshop/orderReceipt.jsp" %>
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
   vertical-align: center;
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
	
	.hyperButton{
		color: #2478FF;
	}

/* 레이어 팝업 */

/* modal */
#modal {position: fixed; left:0; top:0; width: 100%; height: 100%; transform: scale(0); z-index:1; }
#modal .modal-bg {background: rgba(0,0,0,0.7); display:flex; align-items: center; justify-content: center; height: 100%; }
#modal .modal-bg .modal-cont {position:relative; background: #fff; padding: 40px; width:1000px; max-width: 1200px; display: inline-block; text-align:center;}
#modal .modal-bg .modal-cont h2 {font-size: 30px; margin:0;}
#modal .modal-bg .modal-cont p {font-size: 18px; }
#modal .modal-bg .modal-cont .close {position: absolute; top: 0; right:0; margin:20px; padding: 10px; background: #000; border-radius: 50%; }
#modal .modal-bg .modal-cont .close svg {width: 24px; fill: #fff; vertical-align: top;}

#modal.three {
    transform: scale(1);
}
#modal.three .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeIn 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal.three .modal-bg .modal-cont {
    opacity: 0;
    animation: scaleUp 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal.three.out {
    animation: quickScaleDown 0s .5s linear forwards;
}
#modal.three.out .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeOut 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal.three.out .modal-bg .modal-cont {
    opacity: 0;
    animation: scaleDown 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}

@keyframes fadeIn {
    0% {background: rgba(0,0,0,0)}
    100% {background: rgba(0,0,0,0.7)}
}
@keyframes fadeOut {
    0% {background: rgba(0,0,0,0.7)}
    100% {background: rgba(0,0,0,0)}
}
@keyframes scaleUp {
    0% {transform: scale(0.5) translatey(1000px); opacity:0}
    100% {transform: scale(1) translatey(0px); opacity:1}
}
@keyframes scaleDown {
    0% {transform: scale(1) translatey(0px); opacity:1}
    100% {transform: scale(0.5) translatey(1000px); opacity:0}
}
@keyframes quickScaleDown {
    0% {transform: scale(1);}
    99.9% {transform: scale(1); }
    100% {transform: scale(0); }
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
						<colgroup>
							<col width="10%" />
							<col width="*" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />  
							<col width="15%" />
						</colgroup>  
						<tbody>
						</tbody>
					</table>
					<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
				</div>
			<div id="goodsTab2" class="goodsTab_content">
				<table id="main_table2" class="tbl_type">
					<colgroup>
						<col width="13%" />
						<col width="10%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>  
					<tbody>
					</tbody>
				</table>
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
			</div>
			<div id="goodsTab3" class="goodsTab_content">
				<table id="main_table3" class="tbl_type">
					<colgroup>
						<col width="13%" />
						<col width="10%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="10%" />  
						<col width="15%" />
					</colgroup>  
					<tbody>
					</tbody>
				</table>
				<div id="PAGE_NAVI" align="center"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					
			</div>
			
		</div>
   		<h1 style="font-size:10px">※주문번호를 누르면 주문서를 확인하실 수 있습니다.</h1>
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
	
	$(".close").click(function(){
	    $("#modal").addClass("out");
	});
	
});

function fn_receipt(num){
	$("#modal").removeAttr("class").addClass("three");
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/myshop/receipt?ORDERS_NUM="+num,
		dataType: "json",
		success:function(data){
				$('#GOODSTITLE').html(data.hashMap.GOODS_TITLE);
				$('#GOODSBRAND').html(data.hashMap.GOODS_BRAND);
				$('#ORDERSDATE').html(data.hashMap.ORDERS_DATE);
				$('#ORDERSNUM').html(data.hashMap.ORDERS_NUM);
				$('#ORDERSPRICE').html(data.hashMap.ORDERS_PRICE);
				$('#ORDERSDCOST').html(data.hashMap.ORDERS_DCOST);
				$('#ORDERSTCOST').html(data.hashMap.ORDERS_TCOST);
				$('#ORDERSUSER').html(data.hashMap.ORDERS_USER);
				$('#ORDERSPHONE').html(data.hashMap.ORDERS_PHONE);
				$('#ORDERSDADD').html(data.hashMap.ORDERS_DADD1+" "+data.hashMap.ORDERS_DADD2);
				$('#ORDERSDMEMO').html(data.hashMap.ORDERS_DMEMO);
				$('#ORDERSPAY').html(data.hashMap.ORDERS_PAY);

		},
		error: function(data){
			alert("에러가 발생했습니다. 다시 한번 시도해주세요.");
			return false;
		}
	});
}

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
	comSubmit.addParam("ORDERS_DNUM", $("#ORDERS_DNUM"+num).val());
	comSubmit.addParam("ORDERS_NUM", num);
	comSubmit.submit();
}

// 판매취소 버튼
function fn_deleteGoods(num){
	var comSubmit = new ComSubmit();
	var CONFIRM = confirm("정말로 삭제하시겠습니까?");
	if(CONFIRM==true){
		comSubmit.setUrl("<c:url value='/shop/goodsDelete' />");
		comSubmit.addParam("GOODS_NUM", $("#IDX").val());
		comSubmit.submit();
	}
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
	var dnum1 = "";
	var dnum2 = "";
	var dnum3 = "";
	
	if(tabNo == 1){
		body = $("#main_table1 tbody");
		dnum3 += "<th align='center'><img src=<c:url value='/resources/images/myshop_sstatus.png'/>></th>";
	}else if(tabNo == 2){
		body = $("#main_table2 tbody");	
		dnum1 += "<th align='center'><img src=<c:url value='/resources/images/myorder_list1.png'/>></th>";
		dnum2 += "<th align='center'><img src=<c:url value='/resources/images/myshop_dnum.png'/>></th>";
		dnum3 += "<th align='center'><img src=<c:url value='/resources/images/myshop_sstatus.png'/>></th>";
	}else if(tabNo == 3){
		body = $("#main_table3 tbody");
		dnum1 += "<th align='center'><img src=<c:url value='/resources/images/myorder_list1.png'/>></th>";
		dnum2 += "<th align='center'><img src=<c:url value='/resources/images/myshop_dnum.png'/>></th>";
	}
	var str1 = "";	
	body.empty();
	str1 	+= 	"<tr>"
		+ dnum1
		+		"<th align='center'><img src=<c:url value='/resources/images/mysale_list1.png'/>></th>"
		+		"<th align='center'><img src=<c:url value='/resources/images/mysale_list2.png'/>></th>"
		+		"<th align='center'><img src=<c:url value='/resources/images/mysale_list3.png'/>></th>"
		+		"<th align='center'><img src=<c:url value='/resources/images/mysale_list5.png'/>></th>"
		+ dnum2
		+ dnum3
		+		"<th align='center'><img src=<c:url value='/resources/images/mysale_list4.png'/>></th>"
		+	"</tr>";
	if (total == 0) {
		if(tabNo == 1){
			str1 += "<tr align=\"center\">" 
				+	"<td colspan='6'>조회된 결과가 없습니다.</td>"
				+	"</tr>";			
		}else if(tabNo == 3){
			str1 += "<tr align=\"center\">" 
				+	"<td colspan='7'>조회된 결과가 없습니다.</td>"
				+	"</tr>";			
		}else{
			str1 += "<tr align=\"center\">" 
				+	"<td colspan='8'>조회된 결과가 없습니다.</td>"
				+	"</tr>";
		}
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
						var title = value.GOODS_TITLE;
						if(title.length > 20){
							title = title.substring(0, 19) + "...";
						}
						var onumber = "";
						var dnumber = "";
						if(tabNo == 2 || tabNo == 3){
							if(value.ORDERS_STATUS == "배송중" || value.ORDERS_STATUS == "주문/결제" || value.ORDERS_STATUS == "거래완료"){
								onumber += "<td><input type='button' id='receipt' name='receipt' value='"+value.ORDERS_NUM+"' onclick='fn_receipt("+value.ORDERS_NUM+")'>";
								} else {
								onumber += "<td>-</td>";
								}
			  	      	} else {
			  	      		onumber += "";
			  	      		dnumber += "";
			  	      	}
/*
						str1 +=	"<tr>"
						if(value.ORDERS_STATUS == "배송중" || value.ORDERS_STATUS == "주문/결제" || value.ORDERS_STATUS == "거래완료"){
						str1 += "<td><input type='button' id='receipt' name='receipt' value='"+value.ORDERS_NUM+"' onclick='fn_receipt("+value.ORDERS_NUM+")'>";
						} else {
						str1 += "<td>-</td>";
						}
*/
				    	str1 += onumber
				    		+	"<td align='center'>"
							+	value.GOODS_NUM
							+	"</td>"
		      	      		+	"<td align='center'>"
		      	      		+	"<a href='#this' id='title' name='title'>"
	      	      			+	title
	      	      			+	"</a>"
	      	      			+	"<input type='hidden' id='title2' name='title2' value="+value.GOODS_NUM+">"
		      	      		+	"</td>"
		      	      		+	"<td align='center'>";
		      	      	if(value.GOODS_THUMBNAIL==null){
		      	      		str1+="-"
		      	      	} else{
		      	      		str1+="<img alt='' width='50' height='50' src=/nnS/file/"+value.GOODS_THUMBNAIL+">"
		      	      	}
		      	      		str1+=	"</td>"
		      	      	if(value.ORDERS_STATUS == "배송중") {
		      	      	str1 += "<td align='center'>"
		      	      		+	value.ORDERS_STATUS	
		      	      		+	"</td>"
							+	"<td align='center'>"+value.ORDERS_DNUM+"</td>"+"<td>-</td>"
		      	      		+	"<td align='center'>"
		      	      		+	new Date(value.ORDERS_DATE).toLocaleString()
		      	      		+	"</td>";
						} else if(value.ORDERS_STATUS == "주문/결제") {
							str1 +=	"<td align='center'>"
			      	      		 +	value.ORDERS_STATUS	
			      	      		 +	"</td>"
								 +  "<td align='center'>"
		      	      			 +	"<input type='text' id='ORDERS_DNUM"+value.GOODS_NUM+"' name='ORDERS_DNUM'>"
		      	      			 +	"</td>"
		      	      			 +  "<td align='center'>"
	      	      				 +	"<input class='hyperButton' type='button' id='DNUM_IN' name='DNUM_IN' value='송장번호 입력' onclick='fn_dnum_in("+value.GOODS_NUM+")' >" 
		      	      			 +	"</td>"
		      	      			 +	"<td align='center'>"
			       	      		 +	new Date(value.ORDERS_DATE).toLocaleString()
			      	       		 +	"</td>";
		      	      	}else if(value.ORDERS_STATUS == "거래완료"){
		      	      		str1 += "<td align='center'>"
			      	      		 +	value.ORDERS_STATUS	
			      	      		 +	"</td>"
			      	      		 +	"<td align='center'>"+value.ORDERS_DNUM+"</td>"
		      	      			 +	"<td align='center'>"
			       	      		 +	new Date(value.ORDERS_DATE).toLocaleString()
			      	       		 +	"</td>";
		      	      	} else {
		      	      	str1 +=   "<td align='center'>"
		      	      		+	"판매대기"
		      	      		+	"</td>"	
							+	"<td>"
							+   "<input class='hyperButton' type='button' id='deleteGoods' name='deleteGoods' value='판매 취소' onclick='fn_deleteGoods("+value.GOODS_NUM+")' >"
		      	      		+   "</td>"
		      	      		+	"<td align='center'>"
		      	      		+	new Date(value.GOODS_DATE).toLocaleString()
		      	      		+	"</td>";

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