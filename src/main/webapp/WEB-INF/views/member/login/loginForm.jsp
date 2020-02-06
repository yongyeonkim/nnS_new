<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>�α���</title>


   <style>
   @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   html {
      height: 100%;
   }
   
   body {
       width:100%;
       height:100%;
       margin: 0;
        padding-top: 80px;
        padding-bottom: 40px;
        font-family: "Nanum Gothic", arial, helvetica, sans-serif;
        background-repeat: no-repeat;
        background:linear-gradient(to bottom right, #f0e199, #f0e199);
   }
   
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
   <%-- <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script> --%>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script type="text/javascript">

      function begin(){
         document.myform.MEM_ID.focus();
       }
       function checkIt(){
         if(!document.myform.MEM_ID.value){
           alert("���̵� �Է����� �����̽��ϴ�.");
           document.myform.id.focus();
           return false;
         }
         if(!document.myform.MEM_PW.value){
           alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
           document.myform.passwd.focus();
           return false;
         }

       }
       
       function fsubmit(){
          var id = $("#MEM_ID")[0].value;
          var pw = $("#MEM_PW")[0].value;
          if(id==null || id==''){
             alert("���̵� �Է��ϼ���.");
             return false;
          }
          if(pw==null || pw==''){
             alert("��й�ȣ�� �Է��ϼ���.");
             return false;
          }
          myform.submit();
       }       
       
       $(document).ready(function(){
          
          // ����� ��Ű���� �����ͼ� ID ĭ�� �־��ش�. ������ �������� ��.
          var userInputId = getCookie("userInputId");
          $("#MEM_ID").val(userInputId);  
          
          if($("#MEM_ID").val() != ""){ // �� ���� ID�� �����ؼ� ó�� ������ �ε� ��, �Է� ĭ�� ����� ID�� ǥ�õ� ���¶��,
             $("#idSaveCheck").attr("checked", true); // ID �����ϱ⸦ üũ ���·� �α�.
          }
          
          $("#idSaveCheck").change(function(){ // üũ�ڽ��� ��ȭ�� �ִٸ�,
             if($("#idSaveCheck").is(":checked")){ // ID �����ϱ� üũ���� ��,
                var userInputId = $("#MEM_ID").val();
                setCookie("userInputId", userInputId, 7); // 7�� ���� ��Ű ����
             }else{ // ID �����ϱ� üũ ���� ��,
                deleteCookie("userInputId");
             }
          });
          
          // ID �����ϱ⸦ üũ�� ���¿��� ID�� �Է��ϴ� ���, �̷� ���� ��Ű ����.
          $("#MEM_ID").keyup(function(){ // ID �Է� ĭ�� ID�� �Է��� ��,
             if($("#idSaveCheck").is(":checked")){ // ID �����ϱ⸦ üũ�� ���¶��,
                var userInputId = $("#MEM_ID").val();
                setCookie("userInputId", userInputId, 7); // 7�� ���� ��Ű ����
             }
          });
       });
       
       
        
       function setCookie(cookieName, value, exdays){ //��Ű �����ϴ� �Լ�
           var exdate = new Date();
           exdate.setDate(exdate.getDate() + exdays); //���� �ϼ���ŭ ����ð��� ���ᰪ���� ����
           var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
           document.cookie = cookieName + "=" + cookieValue;
       }
        
       function deleteCookie(cookieName){ //��Ű ����
           var expireDate = new Date();
           expireDate.setDate(expireDate.getDate() - 1);
           document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
       }
        
       function getCookie(cookieName) { //��Ű �������� �Լ�
           cookieName = cookieName + '=';
           var cookieData = document.cookie;
           var start = cookieData.indexOf(cookieName);
           var cookieValue = '';
           if(start != -1){
               start += cookieName.length;
               var end = cookieData.indexOf(';', start);
               if(end == -1)end = cookieData.length;
               cookieValue = cookieData.substring(start, end);
           }
           return unescape(cookieValue);
       }
   </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
</head>
<body onload="begin()" cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
   <form name="myform" action="login" method="post" class="form-signin">
      <div class="card align-middle" style="width:20rem; border-radius:20px;">
         <div>
            <div class="card-title" style="margin-top:30px;">
               <h2 class="card-title text-center" style="color:#113366;">�α��� ��</h2>
            </div>
            
            <div class="card-body">   
               <INPUT type="text" name="MEM_ID" id="MEM_ID" size="15" maxlength="12" class="form-control" placeholder="Your ID"><br>  
            </div>
   
            <div class="card-body">
               <INPUT type=password name="MEM_PW" id="MEM_PW" size="15" maxlength="12" class="form-control" placeholder="Password"> <br>
            </div>
         
            <div class="card-body">
               <input type="button" class="btn btn-lg btn-primary btn-block" value="�α���" onclick="fsubmit();" style="background-color:#26a69a;">
            </div>
         
            <div align="center">
               <label>
                  <input type="checkbox" id ="idSaveCheck" value="idSaveCheck" >���̵�����
               </label>
            </div> 

    
         </div>
      </div>
   </form>
   
   <div align="center">
      <input type="button" value="ȸ������" onclick="location.href='/nnS/joinForm'"/><input type="button" value="ID/PW ã��" onclick="location.href='/nnS/findId'"/>
    </div>

</body>
</HTML>