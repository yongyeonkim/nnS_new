<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/member/login/userIdSearchModal.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <style>
  
  html {
      height: 100%;
   }
   
   body {
        background:linear-gradient(to bottom right, #f0e199, #f0e199);
   }
   body,table,input,select,textarea,button,h1,h2,h3,h4,h5,h6,a{font-family:'맑은 고딕',Malgun Gothic,sans-serif;font-size:12px;color:#666;font-weight:400;}


/* 레이어 팝업 */

/* modal */
#modal {position: fixed; left:0; top:0; width: 100%; height: 100%; transform: scale(0); z-index:1; }
#modal .modal-bg {background: rgba(0,0,0,0.7); display:flex; align-items: center; justify-content: center; height: 100%; }
#modal .modal-bg .modal-cont {position:relative; background: #fff; padding: 40px; width:500px; max-width: 1000px; display: inline-block; text-align:center;}
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

/*끝*/

/* #modal {
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}     */
.card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
   }
</style>
</head>
<script>
function search_check(num) {
	if (num == '1') {
		document.getElementById("searchP").style.display = "none";
		document.getElementById("searchI").style.display = "";	
	} else {
		document.getElementById("searchI").style.display = "none";
		document.getElementById("searchP").style.display = "";
	}
}

$(document).ready(function() {
	/* /////////모///달///기///능///////////
	// 1. 모달창 히든 불러오기
	$('#background_modal').hide();
	$(document).on("click", "#searchBtn", function(){
		$('#background_modal').show();
		$(".className").remove(); 
	});
	// 2. 모달창 닫기 버튼
	$('.close').on('click', function() {
		$('#background_modal').hide();
	});
	// 3. 모달창 위도우 클릭 시 닫기
	$(window).on('click', function() {
		if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
         }
	}); */
	$("#searchBtn").click(function(){
	    $("#modal").removeAttr("class").addClass("three");
	});

	$(".close").click(function(){
	    $("#modal").addClass("out");
	});
	
});

//아이디 & 스토어 값 저장하기 위한 변수
var idV = "";
// 아이디 값 받고 출력하는 ajax
var idSearch_click = function(){
	var name = $('#MEM_NAME').val();
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/findIdResult?MEM_NAME="
				+name+"&MEM_EMAIL="+$('#MEM_EMAIL').val(),
		success:function(data){
			if(data == "0"){
				$('#MEMID').html("회원 정보가 틀렸습니다!").css("color", "blue");
				
			} else{
				$('#MEMID').text(data); 
				// 아이디값 별도로 저장
				idV = data;
			}
		}
	});
}

var pwSearch_click = function(){
	var id = $('#MEM_ID').val();
	alert("요청하신 정보를 확인 중 입니다..\n최대 10초의 시간이 소요될 수 있습니다.\n확인 버튼을 눌러주세요.");
	$.ajax({
		type:"get",
		url : "<c:url value='/findPwResult'/>",
		data : "MEM_ID="+ $("#MEM_ID").val() + "&MEM_EMAIL=" + $("#MEM_EMAIL2").val() + "&random=" + $("#random").val(),
		success : function(data){
			if(data == true){
			alert("임시비밀번호를 발송하였습니다.");
			}else{
				alert("아이디 혹은 이메일을 잘못 입력하셨습니다.\n다시 한번 입력 바랍니다.");
			}
		},
		error: function(data){
			alert("에러가 발생했습니다.");
			return false;
		}
	});
	
}


//https://www.phpschool.com/gnuboard4/bbs/board.php?bo_table=qna_html&wr_id=144669 ->script 충돌
//https://lsk925.tistory.com/32 -> ajax 참고
</script>
<body>
	<div class="full">
		<div class="container card" style="width:500px; padding:30px; border-radius: 20px; background-color:#fff;">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-black">
					<h3>아이디/비밀번호 찾기</h3>
					<p>인증된 이메일만 정보 찾기가 가능합니다 :)</p>
					<br/>
				</div>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-black"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-black" for="search_2">비밀번호 찾기</label>
				</div>
				
				<!-- 아이디 찾기 -->
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="MEM_NAME" name="MEM_NAME" placeholder="ex) 스머프">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_1">이메일</label>
						<div>
							<input type="email" class="form-control" id="MEM_EMAIL" name="MEM_EMAIL" placeholder="ex) E-mail@gmail.com"">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block" style="background-color:#26a69a; border-color:#26a69a;">확인</button>
						<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}" style="background-color:#26a69a; border-color:#26a69a;">취소</a>
					</div>
				</div>
				
				
				<!-- 비밀번호 찾기 -->
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="MEM_ID" name="MEM_ID" placeholder="ex) space">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-black" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="MEM_EMAIL2" name="MEM_EMAIL2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwSearch_click()" class="btn btn-primary btn-block" style="background-color:#26a69a; border-color:#26a69a;">확인</button>
						<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}" style="background-color:#26a69a; border-color:#26a69a;">취소</a>
						<input type="hidden" path="random" id="random" value="${random}"/>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

