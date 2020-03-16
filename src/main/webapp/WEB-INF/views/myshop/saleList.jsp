<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/views/myshop/orderReceipt.jsp" %>
<%@ include file="/WEB-INF/views/myshop/tTracker.jsp" %>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

/* 레이어 팝업 */

/* modal */
#modal1 {position: fixed; left:0; top:0; width: 100%; height: 100%; transform: scale(0); z-index:1; }
#modal1 .modal-bg {background: rgba(0,0,0,0.7); display:flex; align-items: center; justify-content: center; height: 100%; }
#modal1 .modal-bg .modal-cont {position:relative; background: #fff; padding: 40px; width:1000px; max-width: 1200px; display: inline-block; text-align:center;}
#modal1 .modal-bg .modal-cont h2 {font-size: 30px; margin:0;}
#modal1 .modal-bg .modal-cont p {font-size: 18px; }
#modal1 .modal-bg .modal-cont .close {position: absolute; top: 0; right:0; margin:20px; padding: 10px; background: #000; border-radius: 50%; }
#modal1 .modal-bg .modal-cont .close svg {width: 24px; fill: #fff; vertical-align: top;}

#modal1.three {
    transform: scale(1);
}
#modal1.three .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeIn 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal1.three .modal-bg .modal-cont {
    opacity: 0;
    animation: scaleUp 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal1.three.out {
    animation: quickScaleDown 0s .5s linear forwards;
}
#modal1.three.out .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeOut 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal1.three.out .modal-bg .modal-cont {
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

/* modal2 */
#modal2 {position: fixed; left:0; top:0; width: 100%; height: 100%; transform: scale(0); z-index:1; }
#modal2 .modal-bg {background: rgba(0,0,0,0.7); display:flex; align-items: center; justify-content: center; height: 100%; }
#modal2 .modal-bg .modal-cont {position:relative; background: #fff; padding: 40px; width:1000px; max-width: 1200px; max-height:90%;  display: inline-block; text-align:center;}
#modal2 .modal-bg .modal-cont h2 {font-size: 30px; margin:0;}
#modal2 .modal-bg .modal-cont p {font-size: 18px; }
#modal2 .modal-bg .modal-cont .close {position: absolute; top: 0; right:0; margin:20px; padding: 10px; background: #000; border-radius: 50%; }
#modal2 .modal-bg .modal-cont .close svg {width: 24px; fill: #fff; vertical-align: top;}

#modal2.three {
    transform: scale(1);
}
#modal2.three .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeIn 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal2.three .modal-bg .modal-cont {
    opacity: 0;
    animation: scaleUp 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal2.three.out {
    animation: quickScaleDown 0s .5s linear forwards;
}
#modal2.three.out .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeOut 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal2.three.out .modal-bg .modal-cont {
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
   		<h1 style="font-size:11px">※주문번호를 누르면 주문서를 확인하실 수 있습니다.</h1>
   		<h1 style="font-size:11px">※송장번호를 누르면 배송현황을 조회하실 수 있습니다.</h1>
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
	    $("#modal1").addClass("out");
	    $('body').css("overflow", "scroll");
	});
	$(".close").click(function(){
	    $("#modal2").addClass("out");
	    $('body').css("overflow", "scroll");
	});
	
});

function fn_receipt(num){
	$("#modal1").removeAttr("class").addClass("three");
	$('body').css("overflow", "hidden");
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
	 // 운송장번호 입력 확인 필요
    if(!$("#ORDERS_DNUM"+num).val()){
        alert("운송장번호를 올바르게 입력해주세요.");
        $("#ORDERS_DNUM"+num).focus();
        return false;
    }
	
	var comSubmit = new ComSubmit("");
	comSubmit.setUrl("<c:url value='/myshop/inputDnum' />");
	comSubmit.addParam("ORDERS_DNUM", $("#ORDERS_DNUM"+num).val());
	comSubmit.addParam("ORDERS_DCOM", $("#tekbeCompnayList"+num).val());
	comSubmit.addParam("ORDERS_DCOMNAME", $("#tekbeCompnayList"+num+" option:selected").attr('name'));
	comSubmit.addParam("ORDERS_NUM", num);
	comSubmit.submit();
}


//택배추적
function fn_sweetTracker(Dnum){
	$("#modal2").removeAttr("class").addClass("three");
	$('body').css("overflow", "hidden");
	var myKey = "bqA8XxpgqFb6zqtIp4TEqA";
	var t_com;
	var t_ok;

	  $("#myPtag").html("");
	  $("#myPtag2").html("");
	  $("#myPtag3").html("");
	
	//택배사 조회
	$.ajax({
		type:"GET",
		dataType : "json",
		url:"https://info.sweettracker.co.kr/api/v1/recommend?t_key="+myKey+"&t_invoice="+Dnum,
		success:function(data){
			$.each(data.Recommend, function(key, value){
				var t_code = value.Code;
				$.ajax({
					type:"GET",
					dataType:"json",
					async:false,
					url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+Dnum,
					success:function(data2){
						if(data2.result == 'Y'){
							t_com=value.Name;
							t_ok=data2;
						}
					},
					error:function(){
						alert("두번째 실패")
					}
				});
			});
			var myInvoiceData = "";
			if(t_ok ==null){
                    alert("잘못된 송장번호입니다.\n판매자에게 문의해주세요.");
                    
                    
			}else if(t_ok.result=='Y'){
                myInvoiceData += ('<div class="col-xs-12 info-area center-block" style="width:920px;">');                
                myInvoiceData += ('<div class="form-group row">');                     
                myInvoiceData += ('<label for="invoice" class="col-xs-4 label-style">택배사</label>');                     
                myInvoiceData += ('<div id="invoice" class="col-xs-8 info-style">'+t_com+'</div>');                     
                myInvoiceData += (' </div>');                     
                myInvoiceData += ('<div class="form-group row">');                     
                myInvoiceData += ('<label for="invoice" class="col-xs-4 label-style">운송장번호</label>');                     
                myInvoiceData += ('<div id="invoice" class="col-xs-8 info-style">'+t_ok.invoiceNo+'</div>');                     
                myInvoiceData += (' </div>');                     
                
                
                $("#myPtag").html(myInvoiceData)
                
                var trackingDetails = t_ok.trackingDetails;
                
                
                var myTracking="";
                var header ="";
                                
                header += ('<div class="col-xs-12 info-area center-block" style="width:920px;">');                
                header += (' <div class="info-back-line">');                
                header += ('<div class="col-xs-15 text-center">');                
                header += (' <img id="level1_img" src="/nnS/resources/images/delivery_step1.png" class="parcel-img">');                
                header += ('<div id="level1" class="info-parcel-text-none">상품인수</div>');                
                header += ('</div>');                
                header += ('<div class="col-xs-15 text-center">');                
                header += (' <img id="level2_img" src="/nnS/resources/images/delivery_step2.png" class="parcel-img">');                
                header += ('<div id="level2" class="info-parcel-text-none">상품이동중</div>');                
                header += ('</div>');                
                header += ('<div class="col-xs-15 text-center">');                
                header += (' <img id="level3_img" src="/nnS/resources/images/delivery_step3.png" class="parcel-img">');                
                header += ('<div id="level3" class="info-parcel-text-none">배송지도착</div>');                
                header += ('</div>');                
                header += ('<div class="col-xs-15 text-center">');                
                header += (' <img id="level4_img" src="/nnS/resources/images/delivery_step4.png" class="parcel-img">');                
                header += ('<div id="level4" class="info-parcel-text-none">배송출발</div>');                
                header += ('</div>');                
                header += ('<div class="col-xs-15 text-center">');                
                header += (' <img  id="level5_img" src="/nnS/resources/images/delivery_step5.png" class="parcel-img">');                
                header += ('<div id="level5" class="info-parcel-text-none">배송완료</div>');                
                header += ('</div>');                
                header += ('</div>');                
                header += ('</div>');  
                                
                header += ('<tr>');                
                header += ('<th style="text-align:center;">'+"시간"+'</th>');
                header += ('<th style="text-align:center;">'+"장소"+'</th>');
                header += ('<th style="text-align:center;">'+"유형"+'</th>');
                header += ('<th style="text-align:center;">'+"전화번호"+'</th>');                     
                header += ('</tr>');     

                $("#myPtag2").html(header);
                
                if(t_ok.firstDetail==null){
                    myTracking += ('<tr>');                
                    myTracking += ('<td colspan="4">상품을 인수 대기중입니다.</td>');
                    myTracking += ('<tr>');                
                }else{
	                $.each(trackingDetails,function(key,value) {
	                    myTracking += ('<tr>');                
	                    myTracking += ('<td>'+value.timeString+'</td>');
	                    myTracking += ('<td>'+value.where+'</td>');
	                    myTracking += ('<td>'+value.kind+'</td>');
	                    myTracking += ('<td>'+value.telno+'</td>');                     
	                    myTracking += ('</tr>');                                    
		            });
                }
                
                $("#myPtag3").html(myTracking);
                
                fn_selectDstat(t_ok.level);
                
                }
		},
		error:function(){
			alert("실패");
		}
	})
}

function fn_selectDstat(level){
    if(level=='1'||level=='2'){
    	$("#level1").attr('class','info-parcel-text-active');
    	$("#level1_img").attr('class','parcel-img-select');
    } else if(level=='3'){
    	$("#level2").attr('class','info-parcel-text-active');
    	$("#level2_img").attr('class','parcel-img-select');
    } else if(level=='4'){
    	$("#level3").attr('class','info-parcel-text-active');
    	$("#level3_img").attr('class','parcel-img-select');
    } else if(level=='5'){
    	$("#level4").attr('class','info-parcel-text-active');
    	$("#level4_img").attr('class','parcel-img-select');
    } else if(level=='6'){
    	$("#level5").attr('class','info-parcel-text-active');
    	$("#level5_img").attr('class','parcel-img-select');
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
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myorder_list1.png'/>></th>"
		+		"<th width='150px' align='center'><img src=<c:url value='/resources/images/mysale_list1.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/mysale_list2.png'/>></th>"
		+		"<th width='150px' align='center'><img src=<c:url value='/resources/images/mysale_list3.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/mysale_list4.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/mysale_list5.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myshop_dnum.png'/>></th>"
		+		"<th width='100px' align='center'><img src=<c:url value='/resources/images/myshop_sstatus.png'/>></th>"
		+	"</tr>";
	if (total == 0) {
		str1 += "<tr align=\"center\">" 
			+	"<td colspan='8'>조회된 결과가 없습니다.</td>"
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
						if(value.ORDERS_STATUS == "배송중" || value.ORDERS_STATUS == "주문/결제" || value.ORDERS_STATUS == "거래완료"){
						str1 += "<td><input type='button' id='receipt' name='receipt' value='"+value.ORDERS_NUM+"' onclick='fn_receipt("+value.ORDERS_NUM+")'>";
						} else {
						str1 += "<td>-</td>";
						}
				    	str1 +=	"<td width='200px' align='center'>"
							+	value.GOODS_NUM
							+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	"<a href='#this' id='title' name='title'>"
	      	      			+	value.GOODS_TITLE
	      	      			+	"</a>"
	      	      			+	"<input type='hidden' id='title2' name='title2' value="+value.GOODS_NUM+">"
		      	      		+	"</td>"
		      	      		+	"<td width='200px' align='center'>";
		      	      	if(value.GOODS_THUMBNAIL==null){
		      	      		str1+="-"
		      	      	} else{
		      	      		str1+="<img alt='' width='50' height='50' src=/nnS/file/"+value.GOODS_THUMBNAIL+">"
		      	      	}
		      	      		str1+=	"</td>"
		      	      	if(value.ORDERS_STATUS == "배송중") {
		      	      	str1 +=   "<td width='100px' align='center'>"
		      	      		+	new Date(value.ORDERS_DATE).toLocaleString()
		      	      		+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	value.ORDERS_STATUS	
		      	      		+	"</td>"
							+	"<td width='200px' align='center'>"
							+	"<a href='#this' id='DTracker' onclick='fn_sweetTracker("+value.ORDERS_DNUM+")'>"+value.ORDERS_DNUM+"</a>"
							+	"</td>"+"<td>-</td>";
						} else if(value.ORDERS_STATUS == "주문/결제") {
							str1 +=	"<td width='100px' align='center'>"
			       	      		 +	new Date(value.ORDERS_DATE).toLocaleString()
			      	       		 +	"</td>"
			      	       		 +	"<td width='100px' align='center'>"
			      	      		 +	value.ORDERS_STATUS	
			      	      		 +	"</td>"
								 +  "<td width='200px' align='center'>"
		      	      			 +	"<input type='text' id='ORDERS_DNUM"+value.GOODS_NUM+"' name='ORDERS_DNUM' maxlength='18' oninput='this.value = this.value.replace(/[^0-9.]/g, \"\").replace(\/(\\..*)\\.\/g, \"$1\");'>"
		      	      			 +	"</td>"
		      	      			 +  "<td>"
	      	      				 +	"<input type='button' id='DNUM_IN' name='DNUM_IN' value='입력확인' onclick='fn_dnum_in("+value.GOODS_NUM+")' >" 
		      	      			 +	"</td>";
		      	      	}else if(value.ORDERS_STATUS == "거래완료"){
		      	      		str1 += "<td width='100px' align='center'>"
			       	      		 +	new Date(value.ORDERS_DATE).toLocaleString()
			      	       		 +	"</td>"
			      	       		 +	"<td width='100px' align='center'>"
			      	      		 +	value.ORDERS_STATUS	
			      	      		 +	"</td>"
				 				 +	"<td width='200px' align='center'>"
				 				 +	"<a href='#this' id='DTracker' onclick='fn_sweetTracker("+value.ORDERS_DNUM+")'>"+value.ORDERS_DNUM+"</a>"
								 +	"</td>"+"<td>-</td>";
		      	      	} else {
		      	      	str1 +=   "<td width='100px' align='center'>"
		      	      		+	new Date(value.GOODS_DATE).toLocaleString()
		      	      		+	"</td>"
		      	      		+	"<td width='100px' align='center'>"
		      	      		+	"판매대기"	
		      	      		+	"</td>"
							+	"<td width='200px' align='center'>"+"-"+"</td>"
							+	"<td>-</td>";

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