<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<meta charset="UTF-8">
<style type="text/css">
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
	<div id="main-container">
		<h2 align="center">주문과 결제가 성공적으로 완료되었습니다.</h2>
		<h3 align="center">업체(브랜드)의 주문 확인 후 발송됩니다.</h3>
		<table border="1" height="100" class="tbl_type">
				<tr>
					<th style="width: 16.6667%;">상품 정보</th>
					<th style="width: 16.6667%;">상품브랜드</th>
					<th style="width: 16.6667%;">주문 일자</th>
					<th style="width: 16.6667%;">주문 번호</th>
					<th style="width: 16.6667%;">주문금액(수량)</th>
					<th style="width: 16.6667%;">배송비</th>
					<th style="width: 16.6667%;">최종 결제금액</th>
				</tr>
				<tr>
					<td style="width: 16.6667%;">${orderG.GOODS_TITLE}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_BRAND}</td>
					<td style="width: 16.6667%;">${orderG.ORDER_TIME}</td>
					<td style="width: 16.6667%;">${order.ORDERS_NUM}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_PRICE}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_DCOST}</td>
					<td style="width: 16.6667%;">${orderG.GOODS_PRICE+orderG.GOODS_DCOST}</td>
				</tr>
				<tr>
					<th>
						이름
					</th>
					<th>
						휴대전화
					</th>
					<th colspan="5">
						배송주소
					</th>
				</tr>
				<tr>
					<td>
						${orderM.MEM_NAME}
					</td>
					<td>
						${orderM.MEM_PHONE}
					</td>
					<td colspan="5"> 
						(${orderM.MEM_ZIP}) &nbsp; ${orderM.MEM_ADD1} &nbsp; ${orderM.MEM_ADD2}
					</td>
				</tr>
				<tr>
					<th colspan="7">
						배송 메모
					</th>
				</tr>
				<tr>
					<td colspan="7">
						${order.ORDERS_DMEMO }
					</td>
				</tr>
				<tr>
					<td colspan="5">
					</td>
					<th>
						결제수단
					</th>
					<td align="left">
						&nbsp; 카카오페이
					</td>
				</tr>
		</table>
		<br/>
		<p align="center">
			<input type="button" id="main" name="main" value="메인으로">
			<input type="button" id="list" name="list" value="주문내역">
		</p>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#list").on("click", function(e){ //목록으로 버튼
		e.preventDefault();
		fn_openGoodsList();
	});
	
	$("#main").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_goMain();
	});
	
});

function fn_openGoodsList(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/myshop' />");
	comSubmit.submit();
}

function fn_goMain(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/main' />");
	comSubmit.submit();
}
</script>
</body>
</html>