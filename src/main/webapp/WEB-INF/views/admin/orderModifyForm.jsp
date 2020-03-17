<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>  
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() { //회원가입 버튼 클릭시
    $("#modify").on("click", function(e) {
       e.preventDefault();
       fn_check();
    });
 });
function fn_check() { //변경 버튼 클릭시(유효성검증, 데이터입력)
    var chk = $("input[name=agree_required]");
    
    
    if(!$("#ORDERS_PHONE").val()){
        alert("휴대전화를 입력해주세요.");
        $("#ORDERS_PHONE").focus();
        return false;
     }

    if(!$("#ORDERS_DZIPCODE").val()){
        alert("우편번호를 입력해주세요.");
        $("#ORDERS_DZIPCODE").focus();
        return false;
     }
    if(!$("#ORDERS_DADD1").val()){
        alert("집주소 입력해주세요.");
        $("#ORDERS_DADD1").focus();
        return false;
     }
    if(!$("#ORDERS_DADD2").val()){
        alert("상세주소를 입력해주세요.");
        $("#ORDERS_DADD2").focus();
        return false;
     }

    var comSubmit = new ComSubmit("orderModifyForm");
    comSubmit.setUrl("<c:url value='/admin/orderModifyPro'/>");
    comSubmit.submit();
 }
 
 $("#orderModifyForm").on("submit",function(e){
 });


function back(){
   history.go(-1);
}
function zipcode() {//우편번호 검색창
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('ORDERS_DZIPCODE').value = data.zonecode;
                document.getElementById("ORDERS_DADD1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("ORDERS_DADD2").focus();
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                alert("도로명 주소를 입력해주세요.");
            	return false;
            }
           
        }
    }).open();
}
</script>
</head>

<!-- 메뉴 시작 -->

<div class="row" style="padding-left:15px;width:700px;">    
   <h1 class="page-header">주문수정</h1>
</div>

<div class="row" style="padding-left:15px;width:700px;">
   <div class="panel panel-default">
      <div class="panel-heading" >주문 정보확인/수정페이지입니다.</div>
         <div class="panel-body">
            <form id="orderModifyForm" method="post">
              
                        <div class="form-group">
                            <label>주문번호</label>
                            <input type="text" class="form-control" value="${map.ORDERS_NUM}" name="ORDERS_NUM" id="ORDERS_NUM" style="width:initial;"readonly/>
                        </div>
                        <div class="form-group">
                            <label>아이디</label>                            
                            <input type="text" class="form-control" name="ORDERS_USER_ID" id="ORDERS_USER_ID" value="${map.ORDERS_USER_ID}" style="width:initial;" readonly/>                            
                        </div>
                       
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" value="${map.ORDERS_USER_NAME}" name="ORDERS_USER_NAME" id="ORDERS_USER_NAME" style="width:100px;" readonly/>
                        </div>
                        <div class="form-group">
                            <label>휴대전화</label>
                            <input type="text" class="form-control" value="${map.ORDERS_PHONE}" name="ORDERS_PHONE" id="ORDERS_PHONE" style="width:initial;"/>
                            <p class="help-block">01000000000  ,- 없이 입력합니다</p>
                        </div>
                        
                         <div class="form-group">
                            <label>주문일</label><br/>
                            <input type="text" class="form-control" value="<fmt:formatDate value='${map.ORDERS_DATE}' pattern='YY.MM.dd'/>" name="ORDERS_DATE" id="ORDERS_DATE" style="width:250px;"readonly/>                                                   
                        </div>
                        <div class="form-group">
                            <label>우편번호</label>&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-sm btn-primary" onclick="zipcode()" value="주소 검색" style="background-color:#5cb85c; border-color: #4cae4c">
                            <input type="text" class="form-control" value="${map.ORDERS_DZIPCODE}" name="ORDERS_DZIPCODE" id="ORDERS_DZIPCODE" style="width:100px;"/>
                            <p class="help-block">12345 형식 입니다</p>
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" class="form-control" value="${map.ORDERS_DADD1}" name="ORDERS_DADD1" id="ORDERS_DADD1" style="width:250px;"/>
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" class="form-control" value="${map.ORDERS_DADD2}" name="ORDERS_DADD2" id="ORDERS_DADD2" style="width:250px;"/>
                        </div>
                        <div class="form-group">
                            <label>상품명</label>
                            <input type="text" class="form-control" value="${map.GOODS_TITLE}" name="GOODS_TITLE" id="GOODS_TITLE" style="width:250px;"readonly/>                                                   
                        </div>
                        <div class="form-group">
                            <label>상품 가격</label>
                            <input type="text" class="form-control" value="${map.ORDERS_PRICE}" name="ORDERS_PRICE" id="ORDERS_PRICE" style="width:250px;"readonly/>                                                   
                        </div>
                        <div class="form-group">
                            <label>택배비</label>
                            <input type="text" class="form-control" value="${map.ORDERS_DCOST}" name="ORDERS_DCOST" id="ORDERS_DCOST" style="width:250px;"readonly/>
                        </div>
                        <div class="form-group">
                            <label>총 결제가</label>
                            <input type="text" class="form-control" value="${map.ORDERS_TCOST}" name="ORDERS_TCOST" id="ORDERS_TCOST" style="width:250px;"readonly/>
                        </div>
                   <div style="text-align:center;"><label>※판매자 정보※</label></div>
                        <div class="form-group">
                            <label>아이디</label>                            
                            <input type="text" class="form-control" name="GOODS_SELLER_ID" id="GOODS_SELLER_ID" value="${map.GOODS_SELLER_ID}" style="width:initial;" readonly/>                            
                        </div>
                       
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" value="${map.GOODS_SELLER_NAME}" name="GOODS_SELLER_NAME" id="GOODS_SELLER_NAME" style="width:100px;"readonly/>
                        </div>
                        <div class="form-group">
                            <label>휴대전화</label>
                            <input type="text" class="form-control" value="${map.GOODS_SELLER_PHONE}" name="GOODS_SELLER_PHONE" id="GOODS_SELLER_PHONE" style="width:initial;"readonly/>
                        </div>
                  <button type="button" class="btn btn-success" id="modify">주문수정</button>
                  <button type="reset" class="btn btn-default" onclick="back();">작성취소</button>               
            </form>
         </div>
   </div>
</div>






<!-- // container -->