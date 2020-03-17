<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<style type="text/css">
  .receipt {
    width: 100%;

    border-collapse: collapse;
    text-align: center;    
    vertical-align: center;
  }
  .receipt tr {
    border-top: 1px solid #444444;
  }
  .receipt td {
  	padding: 20px
  }
</style>
</head>
<body>
<div id="modal1">
	<div class="modal-bg">
	 <div class="modal-cont">
	 	<table class="receipt">
				<tr>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">상품 이름</th>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">상품브랜드</th>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">주문 일자</th>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">주문 번호</th>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">주문금액</th>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">배송비</th>
					<th style="width: 16.6667%; text-align:center; vertical-align:middle;">최종 결제금액</th>
				</tr>
				<tr>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="GOODSTITLE"></td>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="GOODSBRAND"></td>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="ORDERSDATE"></td>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="ORDERSNUM"></td>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="ORDERSPRICE"></td>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="ORDERSDCOST"></td>
					<td style="width: 16.6667%; text-align:center; vertical-align:middle;" id="ORDERSTCOST"></td>
				</tr>
				<tr >
					<th style="text-align:center; vertical-align:middle;">
						이름
					</th>
					<th style="text-align:center; vertical-align:middle;">
						휴대전화
					</th>
					<th colspan="5" style="text-align:center; vertical-align:middle;">
						배송주소
					</th>
				</tr>
				<tr>
					<td id="ORDERSNAME" style="text-align:center; vertical-align:middle;"></td>
					<td id="ORDERSPHONE" style="text-align:center; vertical-align:middle;"></td>
					<td colspan="5" id="ORDERSDADD" style="text-align:center; vertical-align:middle;"></td>
				</tr>
				<tr>
					<th colspan="7" style="text-align:center; vertical-align:middle;">
						배송 메모
					</th>
				</tr>
				<tr>
					<td colspan="7" id="ORDERSDMEMO" style="text-align:center; vertical-align:middle;"></td>
				</tr>
				<tr>
					<td colspan="1">
					</td>
					<th>
						결제수단
					</th>
					<td colspan="6" id="ORDERSPAY"></td>
				</tr>
	 	</table>
		<a href="#" class="close close1">
                <svg viewBox="0 0 24 24">
                    <path d="M14.1,12L22,4.1c0.6-0.6,0.6-1.5,0-2.1c-0.6-0.6-1.5-0.6-2.1,0L12,9.9L4.1,2C3.5,1.4,2.5,1.4,2,2C1.4,2.5,1.4,3.5,2,4.1
    L9.9,12L2,19.9c-0.6,0.6-0.6,1.5,0,2.1c0.3,0.3,0.7,0.4,1.1,0.4s0.8-0.1,1.1-0.4l7.9-7.9l7.9,7.9c0.3,0.3,0.7,0.4,1.1,0.4
    s0.8-0.1,1.1-0.4c0.6-0.6,0.6-1.5,0-2.1L14.1,12z"/>
</svg>
            </a>
		</div>
	</div>
</div>
</body>
</html>