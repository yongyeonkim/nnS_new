<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<meta charset="UTF-8">
<style type="text/css">

h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {width: 700px; margin: 10px auto;}
ul.goodsTabs {
   margin: 0;
   padding: 0;
   float: left;
   list-style: none;
   height: 32px;
   border-bottom: 1px solid #999;
   border-left: 1px solid #999;
   width: 100%;
}
ul.goodsTabs li {
   
   float: left;
   margin: 0;
   padding: 0;
   height: 31px;
   line-height: 31px;
   border: 1px solid #999;
   border-left: none;
   margin-bottom: -1px;
   background: #F0F0F0;
   overflow: hidden;
   position: relative;
}
ul.goodsTabs li a {
   text-decoration: none;
   color: #000;
   display: block;
   font-size: 1.2em;
   padding: 0 20px;
   border: 1px solid #fff;
   outline: none;
}
ul.goodsTabs li a:hover {
   background: #ccc;
}   
html ul.goodsTabs li.active, html ul.goodsTabs li.active a:hover  {
   background: #fff;
   border-bottom: 1px solid #fff;
}
.goodsTab_container {
   border: 1px solid #999;
   border-top: none;
   clear: both;
   float: left; 
   width: 100%;
   background: #fff;
   -moz-border-radius-bottomright: 5px;
   -khtml-border-radius-bottomright: 5px;
   -webkit-border-bottom-right-radius: 5px;
   -moz-border-radius-bottomleft: 5px;
   -khtml-border-radius-bottomleft: 5px;
   -webkit-border-bottom-left-radius: 5px;
}
.goodsTab_content {
   padding: 20px;
   font-size: 1.2em;
}
.goodsTab_content h2 {
   font-weight: normal;
   padding-bottom: 10px;
   border-bottom: 1px dashed #ddd;
   font-size: 1.8em;
}
.goodsTab_content h3 a{
   color: #254588;
}
.goodsTab_content img {
   float: left;
   margin: 0 20px 20px 0;
   border: 1px solid #ddd;
   padding: 5px;
}
 #content
{
   background-color: #ffffff;
   padding: 20px 10px;
   overflow: auto;
}
#vertical_tab-container
{
   float: left;
   margin: 50px 0 0 0;
   width: 126px;
}
#vertical_tab-container ul
{
   list-style: none;
   text-align: center;
}
#vertical_tab-container ul li
{
   border-top: 1px solid #666;
   border-right: 1px solid #666;
   border-bottom: 1px solid #666;
   border-left: 8px solid #666;
   background-color: #ddd;
   margin: 8px 0;
}
#vertical_tab-container ul li a,
#vertical_tab-container ul li a:visited
{
   text-decoration: none;
   color: #666;
   display: block;
   padding: 15px 5px;
}
#vertical_tab-container ul li:hover
{
   border-left: 8px solid #333;
}
#vertical_tab-container ul li a:hover
{
   color: #000;
}
#vertical_tab-container ul li.selected
{
   border-right: none;
   background-color: #fff;
   border-left: 8px solid #006699;
}
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
<link rel="stylesheet" type="text/css"/>
<script type="text/javascript">
$(document).ready(function() { //비밀번호 일치 확인
    //[1] lblError 레이어 클리어
    $('#MEM_TEMP_PW').keyup(function() {
        //$('#pwr').remove(); // 제거
        $('#pw').text(''); // 제거가 아니라 클리어
           $('#MEM_TEMP_PW2').val('');
    });
    //[2] 암호 확인 기능 구현
    $('#MEM_TEMP_PW2').keyup(function() {
        if ($('#MEM_TEMP_PW').val() != $('#MEM_TEMP_PW2').val()) {
            $('#pw').text(''); // 클리어
            $('#pw').html("암호가 일치하지 않습니다.").css("color", "red");          //레이어에 HTML 출력
        }
        else {
            $('#pw').text(''); // 클리어
            $('#pw').html("암호가 일치합니다.").css("color", "blue");
        }
    });
});

$(document).ready(function() { //id check
    $("#pwchange").on("click", function(e) {
       e.preventDefault();
       fn_pwchangeCheck();
    });
 });

function fn_pwchangeCheck(){ //pw check
    var MEM_PW = {MEM_PW : $('#MEM_PW').val()};
    $.ajax({
        url:"<c:url value='/myPage/pwchangeCheck'/>",
        type:'get',
        data: MEM_PW,
        success:function(data){              
            if($.trim(data)=="1"){
            	var comSubmit = new ComSubmit("pwchangeform");
            	comSubmit.setUrl("<c:url value='/myPage/modifySuccess'/>");
            	comSubmit.submit();
            }else{
               $('#pwc').html("비밀번호가 틀렸습니다.").css("color", "red");
            }
        },
        error:function(){
                alert("에러입니다");
        }
    });
};

$("#pwchangeform").on("submit",function(e){
	
});


</script>
<body>
  <div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="accountDetail">회원정보 변경</a></li>
         <li class="selected"><a href="pwModifyForm">비밀번호 변경</a></li>
         <li><a href="deleteAccount">회원탈퇴</a></li>
         <li><a href="reportList">신고내역</a></li>
         <li><a href="qnaList">Q&A</a></li>
      </ul>
   </div>
   <div id="main-container">
   <form id="pwchangeform" method="post">
         <table border="0" class="pwModify">
         <br/><br/><br/>
        <h2>비밀번호 변경</h2>
            <tbody>
            <tr>
            	<td>
               * 기존 비밀번호 &nbsp;&nbsp;&nbsp;   
               <input type="password" id="MEM_PW" name="MEM_PW">
               </td>
               </tr>
               <tr>
               <td>
               * 새 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input type="password" id="MEM_TEMP_PW" name="MEM_TEMP_PW">
               </td>
               </tr>

               <tr>
               <td>
               * 새 비밀번호 확인 <input type="password" id="MEM_TEMP_PW2" name="MEM_TEMP_PW2">
               </td>
               </tr>
               <tr><td><span id="pw"></span><tr><td>
               
            <br/><br/>
            <tr>
            <td align="center">
            <br/>
            <input type="button" value="변경 완료" id="pwchange"/>
            <input type="button" value="취소하기" onclick="document.location.href='/nnS/main'"/>
            </td>
            </tr>
            </tbody>
         </table>
         </form>
   </div>
  </div>
</body>
</html>