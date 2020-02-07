<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
	<h5 align="center">주문번호 {orderNum}</h5>
	<h1 align="center">주문과 결제가 성공적으로 완료되었습니다.</h1>
	<h3 align="center">업체(브랜드)의 주문 확인 후 발송됩니다.</h3>
	<div id="main-container">
		결제정보
			<table border="1" height="100" style="width: 100%;">
				<tbody>
					<tr>
						<td style="width: 875px;">
							<li>
								결제 수단 
                           		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              	무통장입금
							</li>
							<li>
								입금 기간
                           		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              	가상계좌 발급 후 3시간 이내
							</li>
							<li>
								결제 금액
                           		   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              	67,500원
							</li>
						</td>
					</tr>
				</tbody>
			</table>
			배송지 정보
		<table border="1" height="100" style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 875px;">
						<li>
							이름 <input type="text" id="name" name="name" value="이름" style="margin-left:32px">
						</li>
						<li>
							휴대전화 <input type="text" id="phone" name="phone" value="휴대전화">
						</li>
						<li>
							배송주소 <input type="text" id="zipcode" name="zipcode" value="우편번호">
							<br/>
							<input type="text" id="addr1" name="addr1" size="50" value="주소1" style="margin-left:93px">
							<br/>
							<input type="text" id="addr2" name="addr2" size="50" value="주소2" style="margin-left:93px">
						</li>
						<li>
							배송 메모 <br/>
							<textarea cols="50" rows="10" name="content" style="margin-left:93px" readonly>불러올내용</textarea>
						</li>
					</td>
				</tr>
			</tbody>
		</table>
		<p align="center">
			<input type="button" id="submitPay" name="submitPay" value="메인으로" onclick="">
			<input type="button" id="submitPay" name="submitPay" value="주문내역" onclick="">
		</p>
	</div>
</div>
</body>
</html>