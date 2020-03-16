<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/join.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/join2.css'/>" />
<link rel="stylesheet" type="text/css"/>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">

<style type="text/css">  
input[type=number]::-webkit-inner-spin-button,
input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;             
    margin: 0;         
} 
input[type=date]::-webkit-inner-spin-button,
input[type=date]::-webkit-outer-spin-button {
    -webkit-appearance: none;             
    margin: 0;         
} 
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

$(function(){
	$(document).on("click", "#emailBtn", function(){ //이메일 발송
		alert("이메일을 발송 중 입니다.\n확인 버튼을 눌러주세요.");
	$.ajax({
		type:"get",
		url : "<c:url value='/createEmailAuth'/>",
		data : "userEmail=" + $("#email1").val()+"@"+$("#email2").val() + "&random=" + $("#random").val(),
		success : function(data){
			if(data == true){
			alert("사용가능한 이메일입니다. 인증번호를 입력해주세요.");
			}else{
				alert("사용할 수 없는 이메일입니다.");
			}
		},
		error: function(data){
			alert("에러가 발생했습니다.");
			return false;
		}
	});
	});	
	
	$(document).on("click", "#emailAuthBtn", function(){ //인증번호 확인
		$.ajax({
			type:"get",
			url:"<c:url value='/emailConfirm'/>",
			data:"authCode="+$('#emailAuth').val()+"&random="+$("#random").val(),
			success:function(data){
				if(data=="complete"){
					alert("인증 완료되었습니다.");
					$('#chkEm').html("이메일 인증 완료").css("color", "blue");  
				}else if(data=="false"){
					alert("인증번호를 잘못 입력하셨습니다.");
				}
			},
			error:function(data){
				alert("에러가 발생했습니다.")
			}
		});
	});
});


function zipcode() {//우편번호 검색창
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var mem_ZIP = document.getElementById( 'zip' );
            var mem_ADD1 = document.getElementById( 'add' );
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('MEM_ZIP').value = data.zonecode;
                document.getElementById("MEM_ADD1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                mem_ZIP.classList.add( 'active' );
                mem_ADD1.classList.add( 'active' );
                document.getElementById("MEM_ADD2").focus();
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                alert("도로명 주소를 입력해주세요.");
            	return false;
            }
           
        }
    }).open();
}

   function back(){
      history.go(-1);
   }
   $(document).ready(function() { //id check
      $("#idCheck").on("click", function(e) {
         e.preventDefault();
         fn_idCheck();
      });
   });
 
   $(function(){ //email select  
   $(document).ready(function(){
      $('select[name=email]').change(function() {
         if($(this).val()=="self"){
            $('#email2').val("");
            $("#email2").attr("readonly", false);
            $('#email2').focus();
         } else {
            $('#email2').val($(this).val());
            $("#email2").attr("readonly", true);
         }
      });
   });
   });

   function fn_idCheck(){ //id check
       var MEM_ID = {MEM_ID : $('#MEM_ID').val()};
       $.ajax({
           url:"<c:url value='/join/idCheck'/>",
           type:'get',
           data: MEM_ID,
           success:function(data){              
               if($.trim(data)=="0"){
                  $('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");         
               }else{
                  $('#chkMsg').html("사용불가능한 아이디 입니다.(5~20자의 영문 소문자, 숫자만 사용 가능합니다.)").css("color", "red");
               }
           },
           error:function(){
                   alert("에러입니다");
           }
       });
   };
  
   $(document).ready(function(){ //email select value
         $("#email").change(function(){
            $("#email2").val($(this).val());
         });
      });

   $(document).ready(function() { //비밀번호 일치 확인
        //[1] lblError 레이어 클리어
        $('#MEM_PW').keyup(function() {
            //$('#pwr').remove(); // 제거
            $('#pw').text(''); // 제거가 아니라 클리어
               $('#password2').val('');
        });
        //[2] 암호 확인 기능 구현
        $('#password2').keyup(function() {
        	var pass = $('#MEM_PW').val();
        	
            if(pass.length < 4){
            	$('#pw').text(''); // 클리어
                $('#pw').html("4~16자 영문 대 소문자, 숫자, 특수문자를 사용해주세요.").css("color", "red"); 
            } else if ($('#MEM_PW').val() != $('#password2').val()) {
                $('#pw').text(''); // 클리어
                $('#pw').html("암호가 일치하지 않습니다.").css("color", "red");          //레이어에 HTML 출력
            } else {
                $('#pw').text(''); // 클리어
                $('#pw').html("암호가 일치합니다.").css("color", "blue");
            }
        });
    });
   
   $(document).ready(function() { //회원가입 버튼 클릭시
      $("#join").on("click", function(e) {
         e.preventDefault();
         fn_join();
      });
   });
   
   function fn_join(joinForm) { //회원가입 버튼 클릭시(유효성검증, 데이터입력)
      var chk = $("input[name=agree_required]");
      if(!$("#MEM_ID").val()){
         alert("아이디를 입력해주세요.");
         $("#MEM_ID").focus();
         return false;
      }
      if($("#chkMsg").html()!="사용가능한 아이디 입니다."){
         alert("아이디 중복확인을 해주세요.");
         return false;
      }
      if(!$("#MEM_PW").val()){
         alert("비밀번호를 입력해주세요.");
         $("#MEM_PW").focus();
         return false;
      }
      if(!$("#password2").val()){
         alert("비밀번호 확인을 입력해주세요.");
         $("#password2").focus();
         return false;
      }
      if($("#pw").html()!="암호가 일치합니다."){
         alert("암호가 일치하지 않습니다.");
         return false;
      }
      if(!$("#MEM_NAME").val()){
         alert("이름을 입력해주세요.");
         $("#MEM_NAME").focus();
         return false;
      }
      if(!$("#MEM_BIRTH").val()){
          alert("생년월일을 입력해주세요.");
          $("#MEM_BIRTH").focus();
          return false;
       }
      
      var MEM_GEN = $('#MEM_GEN_M');
       
      if($(':radio[name="MEM_GEN"]:checked').length < 1){
          alert('성별을 선택해주세요');                        
          MEM_GEN.focus();
          return false;
      }
      if(!$("#email1").val() || !$("#email2").val()){
         alert("이메일을 입력해주세요.");
         if(!$("#email1").val()){
            $("#email1").focus();
         }else{
            $("#email2").focus();
         }
         return false;
      }
      if($("#chkEm").html()!="이메일 인증 완료"){
          alert("이메일 인증을 해주세요.");
          return false;
       }
      if(!$("#phone2").val() || !$("#phone3").val()){
         alert("휴대전화를 입력해주세요.");
         if(!$("#phone2").val()){
            $("#phone2").focus();
         }else{
            $("#phone3").focus();
         }
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
      if(chk[0].checked==false){
         alert("서비스 이용약관에 동의해주세요.");
         return false;
      }
      var comSubmit = new ComSubmit("joinForm");
      comSubmit.setUrl("<c:url value='/memberVerify'/>");
      var email = $("#email1").val()+"@"+$("#email2").val();
      var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
      $("#MEM_EMAIL").val(email);
      $("#MEM_PHONE").val(phone);
      comSubmit.submit();
      
      alert("회원가입이 완료되었습니다.")
   }
   
   $("#joinForm").on("submit",function(e){
   });
   </script>
   <script>
   $(".joinForm").validate({
	   rules: {
	     username: {
	       required: true,
	       minlength: 4
	     },     
	     email: {
	       required: true,
	       email:true
	     },
	     password: {
	       required: true,
	       minlength: 5
	     },
	     cpassword: {
	       required: true,
	       minlength: 5,
	       equalTo: "#password"
	     }
	   },
	   //For custom messages
	   messages: {
	     username:{
	       required: "Enter a username",
	       minlength: "Enter at least 4 characters"
	     }
	   },
	   errorElement : 'div',
	   errorPlacement: function(error, element) {
	     var placement = $(element).data('error');
	     if (placement) {
	       $(placement).append(error)
	     } else {
	       error.insertAfter(element);
	     }
	   }
	 });

	 </script>
</head>


<body>

<div id="login-page" class="row" style="width:60%;">
  <div class="col s12 z-depth-4 card-panel" style="border-radius: 20px;">
    <form id="joinForm" method="post">
      <div class="row">
        <div class="input-field col s12 center">
          <h4><img src="/nnS/resources/images/join.png"></h4>
          <p class="center">Join to our community now !</p>
        </div>
      </div>
      
      <div class="row margin">
        <div class="input-field col s12">
          <input type="text" id="MEM_ID" name="MEM_ID"  style="width:83%;" maxlength="20">
          <label for="username">아이디</label>
          <input type="button" onclick="fn_idCheck();" value="아이디 중복 확인" class="btn btn-sm btn-primary" style="background-color:#26a69a; ">
            
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id = "chkMsg"></span>
      </div>
      
      <div class="row margin">
        <div class="input-field col s12">
          <input type="password" id="MEM_PW" name="MEM_PW" maxlength="16">
          <label for="username">비밀번호</label>
        </div>
      </div>
      
      <div class="row margin">
        <div class="input-field col s12">
          <input type="password" id="password2" maxlength="16"> 
          <label for="username">비밀번호 확인</label>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="pw"></span>
      </div>
      
       
      <div class="row margin">
        <div class="input-field col s12">
          <input type="text" id="MEM_NAME" name="MEM_NAME" maxlength="10">
          <label for="username">이름</label>
        </div>
      </div>
       
      <div class="row margin">
        <div class="input-field col s12">
         <!--  <input type="text" id="MEM_BIRTH" name="MEM_BIRTH" placeholder="ex)19950703" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
          --> 
          <input type="date" id="MEM_BIRTH" name="MEM_BIRTH" min="1900-01-01" max="2099-12-12">
          <label for="username" class="active">생년월일</label>
        </div>
      </div>
       
      <div class="row margin">
        <div class="input-field col s12">
             <input type="radio" id="MEM_GEN_M" name="MEM_GEN" value="남성"/>&nbsp;&nbsp;남성&nbsp;&nbsp;
             <input type="radio" id="MEM_GEN_F" name="MEM_GEN" value="여성"/>&nbsp;&nbsp;여성&nbsp;&nbsp;
             
        </div>
      </div>
       <br/>
      <div class="row margin">
        <div class="input-field col s12">
          	   <input type="hidden" id="MEM_EMAIL" name="MEM_EMAIL">
               <input type="text" id="email1" name="email1" style="width:38%;" > 
               @
               <input type="text" id="email2" name="email2" value="" style="width:38%;" > 
            	<!--
               <select id="email" name="email">
                  <option value="self">직접입력</option>
                  <option value="naver.com">naver.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="nate.com">nate.com</option>
               </select>
 				-->
               <button type="button" id="emailBtn" class="btn btn-sm btn-primary" style="background-color:#26a69a;">이메일 발송</button>
               <br/>
               <input type="text" id="emailAuth" name="emailAuth" placeholder="인증번호" style="width:79%;" />
               <button type="button" id="emailAuthBtn" class="btn btn-sm btn-primary" style="background-color:#26a69a;">이메일 인증</button>
               <input type="hidden" path="random" id="random" value="${random }"/>
          <label for="username">이메일</label>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id = "chkEm"></span>
      </div>
       
      <div class="row margin">
        <div class="input-field col s12">
          <input type="hidden" id="MEM_PHONE" name="MEM_PHONE">
          <input type="text" id="phone1" name="phone1" maxlength="3" style="width:30%;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
          <!-- 
          <select id="phone1" name="phone1">
             <option value="010">010</option>
             <option value="011">011</option>
             <option value="016">016</option>
             <option value="017">017</option>
             <option value="018">018</option>
             <option value="019">019</option>
          </select> 
           -->
          -<input type="text" id="phone2" name="phone2" maxlength="4" style="width:30%;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
          
          -<input type="text" id="phone3" name="phone3" maxlength="4" style="width:30%;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
          
          <label for="username">휴대전화</label>
        </div>
      </div>
       
      <div class="row margin">
        <div class="input-field col s12">
          <input type="text" id="MEM_ZIP" name="MEM_ZIP" readonly style="width:90%;">
           <input type="button" class="btn btn-sm btn-primary" onclick="zipcode()" value="주소 검색" style="background-color:#26a69a;"><br>
          <label for="username" id="zip">우편번호</label>
        </div>
      </div>
       
      <div class="row margin">
        <div class="input-field col s12">
          <input type="text" id="MEM_ADD1" name="MEM_ADD1" readonly style="width:90%;">
          <label for="username" id="add">주소</label>
        </div>
      </div>
       
      <div class="row margin">
        <div class="input-field col s12">
          <input type="text" id="MEM_ADD2" name="MEM_ADD2" style="width:90%;">
          <label for="username">상세주소</label>
        </div>
      </div>
      
      <div>
          <label>
          <fieldset>
          <legend>nns# 서비스 이용약관 동의</legend>
             <svg width="30" height="30" viewBox="0 0 31 31">
                <g fill="none" fill-rule="evenodd">
                   <g>
                      <circle class="Circle__fill" cx="15.5" cy="15.5" r="15.5"></circle>
                      <circle class="Circle__border" cx="15.5" cy="15.5" r="14.9" stroke-width="1.2"></circle>
                   </g>
                   <path stroke-width="2.4" d="M7.154 15.369l6.027 6.027L23.846 10.73"></path>
                </g>
             </svg>
          </label>
          <div class="lReCa">
             <iframe src="https://s3-ap-northeast-1.amazonaws.com/dabang-static/html/station3_180816_dabang_serviceaccessterms.html"
                scrolling="yes" width="100%" height="100%" frameborder="0" allowtransparency="true"></iframe>
          </div>
          <br/>
          <input type="checkbox" name="agree_required"> 동의합니다.
          </fieldset>
       </div>
      
      <div class="row">
        <div class="input-field col s12">
        	<button id="join" class="btn waves-effect waves-light col s12" style="width:60%; background-color:#26a69a; border-color:#26a69a;">회원가입</button>
         	<button onclick="back();" type="button" class="btn waves-effect waves-light col s12" style="width:35%; margin:0 0 0 20px; background-color:#26a69a; border-color:#26a69a;">취소</button>
          
          
        </div>
        <div class="input-field col s12">
          <p class="margin center medium-small sign-up">Already have an account? <a href="/nnS/loginForm">Login</a></p>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>