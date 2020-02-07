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
	<h1 align="center">주문서 작성</h1>
	<div id="main-container">
		상품정보
			<table border="1" height="100" style="width: 100%;">
				<tbody>
					<tr>
						<td style="width: 875px;">
							<table border="1" style="border-collapse: collapse; width: 100%;">
								<tbody>
									<tr>
										<td style="width: 16.6667%;">상품 정보</td>
										<td style="width: 16.6667%;">주문 일자</td>
										<td style="width: 16.6667%;">주문 번호</td>
										<td style="width: 16.6667%;">주문금액(수량)</td>
										<td style="width: 16.6667%;">배송비</td>
										<td style="width: 16.6667%;">최종 결제금액</td>
									</tr>
									<tr>
										<td style="width: 16.6667%;">개쩌는 후드티</td>
										<td style="width: 16.6667%;">2020.01.23</td>
										<td style="width: 16.6667%;">2020012312345</td>
										<td style="width: 16.6667%;">65,000원(1개)</td>
										<td style="width: 16.6667%;">2,500원</td>
										<td style="width: 16.6667%;">67,500원</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
			수령자 정보
		<table border="1" height="100" style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 875px;">
						<input type="radio" id="addr" name="addr" value="used" checked="checked">기존 배송지
						<input type="radio" id="addr" name="addr" value="new">신규 배송지
					<li>
						이름 <input type="text" id="name" name="name" style="margin-left:32px">
					</li>
					<li>
						휴대전화 <input type="text" id="phone" name="phone">
					</li>
					<li>
						배송주소 <input type="text" id="zipcode" name="zipcode">&nbsp;
						<input type="button" id="searchAddr" name="searchAddr" value="검색">
						<br/>
						<input type="text" id="addr1" name="addr1" size="50" style="margin-left:93px">
						<br/>
						<input type="text" id="addr2" name="addr2" size="50" style="margin-left:93px">
					</li>
					<li>
						배송 메모 <br/>
						<textarea cols="50" rows="10" name="content" style="margin-left:93px"></textarea>
					</li>
					</td>
				</tr>
			</tbody>
		</table>
		결제 정보
		<table border="1" height="100" style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 875px;">
						<li>
							결제수단 <input type="radio" id="payment" name="payment" value="kakaopay"> 카카오페이
						</li>
						<li>
							결제안내 <input type="text" id="payinto" name="payinto">
						</li>
						<li>
							주문자 동의 <input type="checkbox" id="terms" name="terms" value="checked">
							개인정보 제 3자 제공 동의(필수)
							<br/>
							<textarea cols="50" rows="20" name="termsContent" readonly style="margin-left:93px" >
							약관에 대한 내용이 들어감
							</textarea>
						</li>
					</td>
				</tr>
			</tbody>
		</table>
		<p align="center">
			<input type="button" id="submitPay" name="submitPay" value="결제하기" align="center">
		</p>
	</div>
</div>
</body>
</html>