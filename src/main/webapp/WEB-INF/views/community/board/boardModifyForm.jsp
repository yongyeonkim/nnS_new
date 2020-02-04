<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
<body>
<div id="content">
   <div id="vertical_tab-container">
      <ul>
         <li><a href="noticeList">공지사항</a></li>
         <li class="selected"><a href="boardList">자유게시판</a></li>
         <li><a href="reportList">신고게시판</a></li>
         <li><a href="qnaList">Q&A게시판</a></li>
      </ul>
   </div>
   <div id="main-container">

   <form id="frm" name="frm" enctype="multipart/form-data">
      <table class="board_view">
         <colgroup>
            <col width="15%">
            <col width="*"/>
         </colgroup>
         <center><h2>자유게시판 수정</h2></center>
         <tbody>
         	<!-- <tr>
         		<td scope="row">분류</td>
         		<td>
            		<select name="keyField">
					<option value="choice">선택</option>
					<option value="board">자유게시판</option>
					<option value="report">신고게시판</option>
					<option value="qna">Q&A게시판</option>
				</select>
            	</td>
         	</tr> -->
<!--          	<tr>
         		<td>작성자</td>
         		<td><input type="text" id="writer" name="WRITER" class="wdp_90" value="${map.WRITER }"></input></td>         	
         	</tr>
         	 -->
         	<tr>
         		<td>제목</td>
         		<td colspan="3"><input type="text" id="title" name="BOARD_TITLE" class="wdp_90" value="${map.BOARD_TITLE}"/>
         		<input type="hidden" id="BOARD_NUM" name="BOARD_NUM" value="${map.BOARD_NUM }"/>
         		</td>
         	</tr>
         	
         	<tr>
         		<td>내용</td>
         		<td colspan="3" class="view_text">
                  <textarea rows="20" cols="100" title="내용" id="BOARD_CONTENT" name="BOARD_CONTENT">${map.BOARD_CONTENT }</textarea>
               </td>
         	</tr>
         	<tr>
         		<th scope="row">첨부파일</th>
         		<td colspan="3" >
         		<div id="fileDiv">
         			<c:forEach var="row" items="${list }" varStatus="var">
	        			<p>
	        				<input type="hidden" id="IDX" name="IDX_${var.index }" value="${row.FILES_NUM }">
	        				<a href="#this" id="name_${var.index }" name="name_${var.index }">${row.FILES_ORGNAME }</a>
	        				<input type="file" id="file_${var.index }" name="file_${var.index }">(${row.FILES_SIZE }kb)
	        				<a href="#this" class="btn" id="delete_${var.index}" name="delete_${var.index }">삭제</a>
	        			</p>
         			</c:forEach>
     			 </div>
     			 </td>
         	</tr>
            
         </tbody>
      </table>
      
      <br/><br/>
      <div align="center">
      <a href="#this" class="btn" id="addFile">파일추가</a>
      <a href="#this" class="btn" id="write">작성하기</a>
      <a href="#this" class="btn" id="list">목록으로</a>
      </div>
   </form>
   
   
   
  </div>
</div>
<script type="text/javascript">
		var gfv_count = '${fn:length(list)+1}';
		
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
         });
         
         $("#write").on("click", function(e){ //작성하기 버튼
            e.preventDefault();
            fn_insertBoard();
         });
         $("#addFile").on("click", function(e){
            e.preventDefault();
            fn_addFile();
         });
         
         $("a[name^='delete']").on("click",function(e){ // 파일 삭제버튼
             e.preventDefault();
             fn_deleteFile($(this));
          });
      });
      
      function fn_openBoardList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/boardList' />");
         comSubmit.submit();
      }
      
      function fn_insertBoard(){
         var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/community/boardModify' />");
         comSubmit.submit();
      }
      
      function fn_addFile(){
			var str = "<p>" + "<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+ "<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" + "</p>";
			$("#fileDiv").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼 
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