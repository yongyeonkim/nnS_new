<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<html lang="ko">
<head>
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
</head>
<body>
<div id="content">
   <div id="vertical_tab-container">
   <ul>
      <li><a href="accountDetail"><img src="./../resources/images/mypage_tab1.png" width="100" height="30"></a></li>
      <li><a href="pwModifyForm"><img src="./../resources/images/mypage_tab2.png" width="100" height="30"></a></li>
      <li><a href="deleteAccount"><img src="./../resources/images/mypage_tab3.png" width="100" height="30"></a></li>
      <li class="selected"><a href="reportList"><img src="./../resources/images/mypage_tab4.png" width="100" height="30"></a></li>
      <li><a href="qnaList"><img src="./../resources/images/mypage_tab5.png" width="100" height="30"></a></li>
   </ul>
   </div>
   <div id="main-container">
   <table border="1" align="center" class="board_view">
      <colgroup>
         <col width="15%"/>
         <col width="35%"/>
         <col width="15%"/>
         <col width="35%"/>
      </colgroup>
      <caption><h2>신고게시판</h2></caption>
      <p/>
      <tbody>
         <tr>
            <th scope="row">글 번호</th>
            <td>${map.REPORT_NUM }
            <input type="hidden" id="REPORT_NUM" name="REPORT_NUM" value="${map.REPORT_NUM }"></td>
            <th scope="row">조회수</th>
            <td>${map.REPORT_COUNT }</td>
         </tr>
         <tr>
            <th scope="row">작성자</th>
            <td>${map.MEM_ID }</td>
            <th scope="row">작성일자</th>
            <td>${map.REPORT_DATE }</td>
         </tr>
         <tr>
            <th scope="row">제목</th>
            <td colspan="3">${map.REPORT_TITLE }</td>
         </tr>
         <tr>
            <td colspan="4"><pre>${map.REPORT_CONTENT }</pre></td>
         </tr>
         <tr>
			<th scope="row">첨부파일</th>
			<td colspan="3">
				<c:forEach var="row" items="${list }">
					<div>
						<input type="hidden" id="FILES_NUM" value="${row.FILES_NUM }">
						<a href="#this" name="file">${row.FILES_ORGNAME }</a>
						(${row.FILES_SIZE}kb)
					</div>
				</c:forEach>
			</td>
		</tr>
      </tbody>
   </table>
   <a href="#this" class="btn" id="list">목록으로</a>
   <a href="#this" class="btn" id="delete">삭제하기</a>
   </div>
</div>
   
   
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
      $(document).ready(function(){
         $("#list").on("click", function(e){ //목록으로 버튼
            e.preventDefault();
            fn_openBoardList();
         });
         
         $("#delete").on("click", function(e){ //삭제하기 버튼
            e.preventDefault();
            fn_deleteBoard();
         });
         $("a[name='file']").on("click", function(e){
            e.preventDefault();
            fn_downloadFile($(this));
         });
      });
      
      function fn_openBoardList(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/reportList' />");
         comSubmit.submit();
      }
      
   
      function fn_deleteBoard(){
    	 var idx="${map.REPORT_NUM}";
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/community/reportDelete' />");
         comSubmit.addParam("REPORT_NUM",idx);
         comSubmit.submit();
         
      }
      function fn_downloadFile(obj){
			var idx=obj.parent().find("#FILES_NUM").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile'/>");
			comSubmit.addParam("FILES_NUM",idx);
			comSubmit.submit();
	}
   </script>
</body>
</html>