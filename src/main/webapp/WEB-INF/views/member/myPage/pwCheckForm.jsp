<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">

   <style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
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

   
   </style>
</head>
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
      <div class="card align-middle" style="width:20rem; border-radius:20px; background-color:#fff; margin-top:50px;">
         <div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;"><img src="./resources/images/mypage_pwcheck.png"></h2>
            </div>
            <div class="card-body">
               <img src="/nnS/resources/images/mypage_pw.png"> <input type="password" id="MEM_PW" name="MEM_PW" class="form-control" placeholder="Password">
            </div>
         
            <div class="card-body">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="확인" onclick="fn_pwCheck();" style="background-color:#26a69a;">
            	<input type="button" class="btn btn-lg btn-primary btn-block" value="취소" onclick="back();" style="background-color:#26a69a;">
				<span id="pwc"></span>
				<br>
            </div>
         </div>
      </div>
</body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() { //id check
    $("#pwCheck").on("click", function(e) {
       e.preventDefault();
       fn_pwCheck();
    });
 });

function fn_pwCheck(){ //pw check
    var MEM_PW = {MEM_PW : $('#MEM_PW').val()};
    $.ajax({
        url:"<c:url value='/myPage/pwCheck'/>",
        type:'get',
        data: MEM_PW,
        success:function(data){              
            if($.trim(data)=="1"){
            	document.location.href= "/nnS/myPage/accountDetail";   
            }else{
               $('#pwc').html("비밀번호가 틀렸습니다.").css("color", "red");
            }
        },
        error:function(){
                alert("에러입니다");
        }
    });
};

function back(){
	history.go(-1);
}
</script>
</html>