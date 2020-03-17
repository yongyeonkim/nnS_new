<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
</head>
<body>
<div id="content">
	<div id="main-container2">
		<img src="./resources/images/commu_btitle.png" width="200" height="70"> 
	<table border="1" align="center" class="tbl_type">
		<colgroup>
			<col width="8%" />
			<col width="*" />
			<col width="15%" />
			<col width="15%" />  
			<col width="8%" />
		</colgroup>  
		<caption><h2>자유게시판</h2></caption>
		<thead>
			<tr>
				<th scope="col"><img src="./resources/images/commu_num.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_title.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_writer.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_date.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_hit.png" height="25"></th>
			</tr>
		</thead>
		<tbody id="boardTbody" class="body">
			<!-- 스크립트를 통해 게시글에 대한 정보가 담김 -->
		</tbody>
	</table>
	<br/>
	<div id="PAGE_NAVI" align="center"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	</div>
	</div>
	<br />

	
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList_board(1);

			$("a[name='title_board']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail_board($(this));
			});
		});

		function fn_openBoardDetail_board(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/boardDetail' />");
			comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
			comSubmit.submit();
		}
		function fn_selectBoardList_board(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/community/boardListPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback_board");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}

		function fn_selectBoardListCallback_board(data) {
			var total = data.TOTAL;
			var body = $("#boardTbody");
			body.empty();
			if (total == 0) {
				var str = "<tr align=\"center\">" + "<td colspan='5'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectBoardList_board"
					
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(
								data.list,
								function(key, value) {
									var title = value.BOARD_TITLE;
									if(title.length > 20){
										title = title.substring(0, 19) + "...";
									}
									
										str += "<tr style=\"text-align: center\">"
											+ "<td>"
											+ value.BOARD_NUM
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title_board'>"
											+ title
											+ "</a>"
											+ "<input type='hidden' id='BOARD_NUM' value=" + value.BOARD_NUM + ">"
											+ "</td>" + "<td>" + value.MEM_ID
											+ "</td>" + "<td>" + new Date(value.BOARD_DATE).toLocaleString()
											+ "</td>" + "<td>" + value.BOARD_COUNT
											+ "</td>" + "</tr>";
								});
				body.append(str);

				$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			}
		}
	</script>
</body>
</html>