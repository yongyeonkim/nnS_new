<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<style type="text/css">
/* UI Object */   
.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type{width:100%;border-bottom:1px solid #bbbbbb;font-family:Tahoma;font-size:11px;text-align:center}
.tbl_type caption{display:none}
.tbl_type th{padding:7px 0 4px;border-bottom:1px solid #949494;border-top:1px solid #949494;background-color:#e1e6e5;color:#666;}
.tbl_type tr{padding:7px 0 4px;border-bottom:1px solid #949494;border-top:1px solid #949494;background-color:#e1e6e5;color:#666;}
.tbl_type td{padding:6px 0 4px;border-top:1px dashed #cecece;color:#595959}

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
   margin: 70px 0 0 0;
   width: 126px;
}
#vertical_tab-container ul
{
   list-style: none;
   text-align: center;
}
#vertical_tab-container ul li
{
   border-top: 1px solid #fff;
   border-right: 1px solid #fff;
   border-bottom: 1px solid #595959;
   border-left: 4px solid #595959;   
   background-color: #fff;  
   margin: 8px 0;
}  
#vertical_tab-container ul li a,
#vertical_tab-container ul li a:visited
{
   text-decoration: none;
   color: #666;
   display: block;
 	padding: 3px 3px;
}
#vertical_tab-container ul li:hover
{
   border-left: 4px solid #ffd04a;
}
#vertical_tab-container ul li a:hover
{
   color: #333;
}
#vertical_tab-container ul li.selected
{
   border-right: none;
   background-color: #fff;
   border-left: 4px solid #ffd04a;
}
#main-container
{
   min-height: 400px;
   margin: 0 0 0 125px;
   padding: 20px;
   border-top: 1px solid #fff;  
   border-right: 1px solid #fff;     
   border-left: 1px solid #fff; 
   border-bottom: 1px solid #fff;    
}
</style>
<body>
<div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li class="selected"><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
      </ul>
   </div>
   <div id="main-container">

   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="tbl_type">
         <colgroup>
            <col width="15%">
            <col width="*"/>
         </colgroup>
         <center><h2>공지사항 작성</h2></center>
         <tbody>
         	<tr>
         		<td>제목</td>
         		<td style="background-color:#fff;"><input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" style="width:95%"/></td>
         		<td>작성자</td>
         		<td style="background-color:#fff;">${session_MEM_INFO.MEM_ID }<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEM_INFO.MEM_NUM }"/></td>
         	</tr>
         	<tr>
         		
         		<td colspan="4" class="view_text"  style="background-color:#fff;">
                  <textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT"></textarea>
               </td>
         	</tr>
         </tbody>
      </table>
      <br/><br/>
      <center>
	      <a href="#write" class="btn" id="write">작성하기</a>
	      <a href="#list" class="btn" id="list">목록으로</a>
      </center>
   </form>
   
   
   
  </div>
</div>
<script type="text/javascript">
      var gfv_count=1;
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openNoticeList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertNotice();
         });
         $("#addFile").on("click", function(e){
            e.preventDefault();
            fn_addFile();
         });
         $("#a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_deleteFile($(this));
         });
      });
      
      $(function(){
    		CKEDITOR.replace('NOTICE_CONTENT',{
                width:'100%',
                height:'600px',
    			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
    		});
    	});
      
      function fn_openNoticeList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/noticeList' />");
         comSubmit.submit();
      }
      
      function fn_insertNotice(){
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/community/noticeWrite' />");
         
         // 게시글 제목 필요
         if(!$("#NOTICE_TITLE").val()){
             alert("제목를 입력해주세요.");
             $("#NOTICE_TITLE").focus();
             return false;
         }
    	  // 게시글 내용 필요
         if(CKEDITOR.instances.NOTICE_CONTENT.getData() =='' 
                 || CKEDITOR.instances.NOTICE_CONTENT.getData().length ==0){
             alert("내용을 입력해주세요.");
             $("#NOTICE_CONTENT").focus();
             return false;
         }

         
         comSubmit.submit();
      }
      
      function fn_addFile(){
         var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
         $("#fileDiv").append(str);
         $("a[name='delete']").on("click", function(e){
            e.preventDefault();
            fn_deleteFile($(this));
         });
      }
      
      function fn_deleteFile(obj){
         obj.parent().remove();
      }
   </script>
   
   
</body>
</html>