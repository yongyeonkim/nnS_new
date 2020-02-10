<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<style type="text/css">
/* UI Object */   
.tbl_type,.tbl_type th,.tbl_type td{border:0}
.tbl_type{width:100%;border-bottom:1px solid #bbbbbb;font-family:Tahoma;font-size:11px;text-align:center}
.tbl_type caption{display:none}
.tbl_type th{padding:7px 0 4px;border-bottom:1px solid #949494;border-top:1px solid #949494;background-color:#e1e6e5;color:#666;}
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
</head>
<body>
<div id="content">
	<div id="vertical_tab-container">
	<ul>
		<li><a href="noticeList"><img src="./../resources/images/tab_notice.png" width="100" height="30"></a></li>
         <li class="selected"><a href="boardList"><img src="./../resources/images/tab_board.png" width="100" height="30"></a></li>
         <li><a href="reportList"><img src="./../resources/images/tab_report.png" width="100" height="30"></a></li>
         <li><a href="qnaList"><img src="./../resources/images/tab_qna.png" width="100" height="30"></a></li>
	</ul>
	</div>
		<div id="main-container">
		<img src="./../resources/images/board_writeForm.png" width="100" height="30">
			<table border="1" align="center" class="tbl_type">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tr>
					<th scope="row"><img src="./../resources/images/commu_num.png" height="25"></th>
					<td>${map.BOARD_NUM }<input type="hidden" id="BOARD_NUM"
						name="BOARD_NUM" value="${map.BOARD_NUM }"></td>
					<th scope="row"><img src="./../resources/images/commu_hit.png" height="25"></th>
					<td>${map.BOARD_COUNT }</td>
				</tr>
				<tr>
					<th scope="row"><img src="./../resources/images/commu_writer.png" height="25"></th>
					<td>${map.MEM_ID }</td>
					<th scope="row"><img src="./../resources/images/commu_date.png" height="25"></th>
					<td>${map.BOARD_DATE }</td>
				</tr>
				<tr>
					<th scope="row"><img src="./../resources/images/commu_title.png" height="25"></th>
					<td colspan="3">${map.BOARD_TITLE }</td>
				</tr>
				<tr>
					<td colspan="4" height="600px" style="vertical-align: top;"><pre
							style="overflow: hidden; white-space: pre-wrap">${map.BOARD_CONTENT }</pre></td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3"><c:forEach var="row" items="${list }">
							<div>
								<input type="hidden" id="FILES_NUM" value="${row.FILES_NUM }">
								<a href="#this" name="file">${row.FILES_ORGNAME }</a>
								(${row.FILES_SIZE}kb)
							</div>
						</c:forEach></td>
				</tr>
			</table>
			
			<br />
			<div align="center"></div>
			<div align="center">
			<br/>
			<form id="frm" name="frm" enctype="multipart/form-data">
				<c:if test="${session_MEM_ID != NULL}">
					<div width="100%">
						<textarea id="COMMENTS_CONTENT" name="COMMENTS_CONTENT" rows="6" cols="113"></textarea>
						<div align="right" style="float:right;">
							<a href="#this" id="cWrite" name="cWrite">코멘트달기 <br>이미지 넣을거</a>
						</div>
						<input type="hidden" id="COMMENTS_TYPE" name="COMMENTS_TYPE" value="3"/>
						<input type="hidden" id="COMMENTS_PARENT" name="COMMENTS_PARENT" value="${map.BOARD_NUM }"/>
						<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_INFO.MEM_ID }"/>
					</div>
					<br/>
				</c:if>
			</form>
			</div>
			<table id="commentTable" class="tbl_type">
				<tbody>

					<!-- 스크립트를 통해 댓글에 대한 정보가 담김 -->

				</tbody>
			</table>
			<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
		
		<div align="center">
				<br /> <a href="#this" class="btn" id="list">목록으로</a>
				<c:if test="${session_MEM_INFO.MEM_ID == map.MEM_ID }">
					<a href="#this" class="btn" id="modify">수정하기</a>
				</c:if>
				<c:if
					test="${session_MEM_INFO.MEM_ID == map.MEM_ID || session_MEM_INFO.MEM_LEVEL == '2'}">
					<a href="#this" class="btn" id="delete">삭제하기</a>
				</c:if>
			</div>
	</div>
</div>
</body>
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectCommentList(1);
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#modify").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardModify();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			$("a[name='file']").on("click", function(e){
				e.preventDefault();
				fn_downloadFile($(this));
			});
			$("#cWrite").on("click", function(e){
				e.preventDefault();
				fn_writeComment();
			});
			/* $("a[name='cDelete']").on("click", function(e){
				e.preventDefault();
				fn_deleteComment();
			}); */
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardList' />");
			comSubmit.submit();
		}
		
		function fn_openBoardModify(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardModifyForm' />");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();
		}
	
		function fn_deleteBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardDelete' />");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();
			
		}
		function fn_downloadFile(obj){
			var idx=obj.parent().find("#FILES_NUM").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile'/>");
			comSubmit.addParam("FILES_NUM",idx);
			comSubmit.submit();
		}
		
		function fn_writeComment(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/community/boardDetail/commentWrite'/>");
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();			
		}

		function fn_deleteComment(num){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardDetail/commentDelete'/>");
			comSubmit.addParam("COMMENTS_NUM", num);
			comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
			comSubmit.submit();			
		}

		function fn_selectCommentList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/community/boardDetail/commentList' />");
			comAjax.setCallback("fn_selectCommentListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("COMMENTS_TYPE", 3);
			comAjax.addParam("COMMENTS_PARENT", $("#BOARD_NUM").val());
			comAjax.ajax();
		}

		function fn_selectCommentListCallback(data) {
			var total = data.TOTAL;
			var body = $('#commentTable');
			body.empty();
			if (total == 0) {
				var str = "<tr align='center'>" + "<td colspan='5'>댓글이 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectCommentList"
					
				};
				gfn_renderPaging(params);
				
				var str = ""
				str += "<tr style='text-align: center'><td width='10%'><img src='./../resources/images/commu_writer.png' height='25'></td><td width='*'><img src='./../resources/images/commu_hit.png' height='25'></td><td width='30%'><img src='./../resources/images/commu_date.png' height='25'></td><td width='5%'></td></tr>";
				
				$.each(data.list,
				function(key, value) {
					str += "<tr style='text-align: center'>"
							+ "<td>"
							+ value.MEM_ID
							+ "</td>"
							+ "<td>"
							+ value.COMMENTS_CONTENT
							+ "</td>" + "<td>" + new Date(value.COMMENTS_DATE).toLocaleString() + "</td>" + "<td>";
					if('${session_MEM_ID}' == value.MEM_ID){
						str += "<a href='#this' name='cDelete' onClick='fn_deleteComment("+value.COMMENTS_NUM+")'> 삭제 </a>"
							+ "<input type='hidden' id='NOTICE_NUM' name='NOTICE_NUM' value=" + value.COMMENTS_PARENT + ">"
							
					}
					str += "</td>" + "</tr>";
								});
				body.append(str);
			}
		}
	</script>
</html>


