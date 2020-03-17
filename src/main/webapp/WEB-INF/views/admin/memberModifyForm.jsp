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
    if(!$("#MEM_PW").val()){
        alert("비밀번호를 입력해주세요.");
        $("#MEM_PW").focus();
        return false;
     }
    if(!$("#MEM_NAME").val()){
        alert("이름을 입력해주세요.");
        $("#MEM_NAME").focus();
        return false;
     }
    if(!$("#MEM_BIRTH").val()){
        alert("생일을 입력해주세요.");
        $("#MEM_BIRTH").focus();
        return false;
     }
    if(!$("#MEM_GEN").val()){
        alert("성별을 입력해주세요.");
        $("#MEM_GEN").focus();
        return false;
     }
    if(!$("#MEM_EMAIL").val()){
       alert("이메일을 입력해주세요.");
       $("#MEM_EMAIL").focus();
       return false;
    }
    
    if(!$("#MEM_PHONE").val()){
        alert("휴대전화를 입력해주세요.");
        $("#MEM_PHONE").focus();
        return false;
     }

    if(!$("#MEM_ZIP").val()){
        alert("우편번호를 입력해주세요.");
        $("#MEM_ZIP").focus();
        return false;
     }
    if(!$("#MEM_ADD1").val()){
        alert("집주소 입력해주세요.");
        $("#MEM_ADD1").focus();
        return false;
     }
    if(!$("#MEM_ADD2").val()){
        alert("상세주소를 입력해주세요.");
        $("#MEM_ADD2").focus();
        return false;
     }
    if(!$("#MEM_LEVEL").val()){
        alert("회원레벨을 입력해주세요.");
        $("#MEM_LEVEL").focus();
        return false;
     }

    var comSubmit = new ComSubmit("memberModifyForm");
    comSubmit.setUrl("<c:url value='/admin/memberModifyPro'/>");
    comSubmit.submit();
 }
 
 $("#memberModifyForm").on("submit",function(e){
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
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("MEM_ADD2").focus();
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
   <h1 class="page-header">회원수정</h1>
</div>

<div class="row" style="padding-left:15px;width:700px;">
   <div class="panel panel-default">
      <div class="panel-heading" >회원수정 페이지입니다.</div>
         <div class="panel-body">
            <form id="memberModifyForm" method="post">    
                        <div class="form-group">
                            <label>아이디</label>                            
                            <input type="text" class="form-control" name="MEM_ID" id="MEM_ID" value="${map.MEM_ID}" style="width:initial;" readonly/>                            
                        </div>
                       
                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="text" class="form-control" name="MEM_PW" id="MEM_PW"  value="${map.MEM_PW}" style="width:initial;"/>
                        </div>
                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" value="${map.MEM_NAME}" name="MEM_NAME" id="MEM_NAME" style="width:100px;"/>
                        </div>
                        <div class="form-group">
                            <label>생년월일</label><br/>
                            <input type="text" class="form-control" value="<fmt:formatDate value='${map.MEM_BIRTH}' pattern='YY.MM.dd'/>" name="MEM_BIRTH" id="MEM_BIRTH" style="width:250px;"/>                                                   
                        </div>
                        <div class="form-group">
                            <label>성별</label>
                            <input type="text" class="form-control" value="${map.MEM_GEN}" name="MEM_GEN" id="MEM_GEN" style="width:100px;"/>
                        </div>
                         <div class="form-group">
                            <label>이메일</label>
                            <input type="text" class="form-control" value="${map.MEM_EMAIL}" name="MEM_EMAIL" id="MEM_EMAIL" style="width:250px;"/>
                        </div>
                        <div class="form-group">
                            <label>휴대전화</label>
                            <input type="text" class="form-control" value="${map.MEM_PHONE}" name="MEM_PHONE" id="MEM_PHONE" style="width:initial;"/>
                            <p class="help-block">01000000000  ,- 없이 입력합니다</p>
                        </div>
                        <div class="form-group">
                            <label>우편번호</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-sm btn-primary" onclick="zipcode()" value="주소 검색" style="background-color:#5cb85c; border-color: #4cae4c;">
                            <input type="text" class="form-control" value="${map.MEM_ZIP}" name="MEM_ZIP" id="MEM_ZIP" style="width:100px;"/>
                            <p class="help-block">12345 형식 입니다</p>
                        </div>
                        <div class="form-group">
                            <label>주소</label>
                            <input type="text" class="form-control" value="${map.MEM_ADD1}" name="MEM_ADD1" id="MEM_ADD1" style="width:250px;"/>
                        </div>
                        <div class="form-group">
                            <label>상세주소</label>
                            <input type="text" class="form-control" value="${map.MEM_ADD2}" name="MEM_ADD2" id="MEM_ADD2" style="width:250px;"/>
                        </div>

                        <div class="form-group">
                            <label>가입일자</label>
                            <input type="text" class="form-control" value="<fmt:formatDate value='${map.MEM_JOINDATE}' pattern='YY.MM.dd'/>" name="MEM_JOINDATE" id="MEM_JOINDATE" style="width:250px;"/>                                                   
                        </div>
                        <div class="form-group">
                            <label>레벨</label>
                            <input type="text" class="form-control" value="${map.MEM_LEVEL}" name="MEM_LEVEL" id="MEM_LEVEL" style="width:250px;"/>
                        </div>
                  <button type="button" class="btn btn-success" id="modify">회원수정</button>
                  <button type="reset" class="btn btn-default" onclick="back();">작성취소</button>               
            </form>
         </div>
   </div>
</div>






<!-- // container -->