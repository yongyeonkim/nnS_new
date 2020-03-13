<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
</head>
<body>
<div id="content">
	<div id="main-container2">
		<img src="./resources/images/commu_rtitle.png" width="200" height="70"> 
	<table border="1" align="center" class="tbl_type">
		<colgroup>
			<col width="8%" />
			<col width="*" />
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />  
			<col width="8%" />
		</colgroup>  
		<caption><h2>신고게시판</h2></caption>
		<form action="/nnS/community/reportList" method="post">
	      <select name="search" id="search">
	                  <option value="0">전체보기</option>
	               <option value="1" <c:out value="${search eq '1' ? 'selected' :''}"/>>처리대기</option>
	               <option value="2" <c:out value="${search eq '2' ? 'selected' :''}"/>>신고접수</option>
	               <option value="3" <c:out value="${search eq '3' ? 'selected' :''}"/>>허위신고</option>
	               <option value="4" <c:out value="${search eq '4' ? 'selected' :''}"/>>처리완료</option>
	      </select>
	      <input type="submit" value="분류" class="search_btn" onClick="onSearch()"/>
	    </form>
		<thead>
			<tr>
				<th scope="col"><img src="./resources/images/commu_num.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_title.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_writer.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_rid.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_status.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_date.png" height="25"></th>
				<th scope="col"><img src="./resources/images/commu_hit.png" height="25"></th>
			</tr>
		</thead>
		<tbody id="reportTbody">
		</tbody>
	</table>
	
	<div id="PAGE_NAVI" align="center"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

	</div>
	</div>

	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function() {
			fn_selectBoardList_report(1); 

			$("a[name='title_report']").on("click", function(e) { //제목 
				e.preventDefault();
				fn_openBoardDetail_report($(this));
			});
		});
	
		function fn_openBoardDetail_report(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/community/reportDetail' />");
			comSubmit.addParam("REPORT_NUM", obj.parent().find("#REPORT_NUM").val());
			comSubmit.submit();
		}
		 function fn_selectBoardList_report(pageNo) {
			var comAjax = new ComAjax();
			
			comAjax.setUrl("<c:url value='/community/reportListPaging' />");
			comAjax.setCallback("fn_selectBoardListCallback_report");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("search", $('#search').val());
			comAjax.ajax();
		}

		function fn_selectBoardListCallback_report(data) {
			var total = data.TOTAL;
			var body = $("#reportTbody");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='7'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectBoardList_report"
					
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(
								data.list,
								function(key, value) {
									var title = value.REPORT_TITLE;
									if(title.length > 20){
										title = title.substring(0, 19) + "...";
									}
									
									var si = "";
		                            if(value.REPORT_GOODS_SELLER_ID == null){
		                               si = " ";
		                            }else{
		                               si = value.REPORT_GOODS_SELLER_ID;
		                            }
									str     += "<tr style=\"text-align: center\">"
											+ "<td>"
											+ value.REPORT_NUM
											+ "</td>"
											+ "<td class='title'>"
											+ "<a href='#this' name='title_report'>"
											+ title
											+ "</a>"
											+ "<input type='hidden' id='REPORT_NUM' value=" + value.REPORT_NUM + ">"
											+"</td>" + "<td>" + value.MEM_ID
											+ "</td>" + "<td>" + si
											+ "</td>" + "<td>" + value.REPORT_STATUS
											+ "</td>" + "<td>" + new Date(value.REPORT_DATE).toLocaleString()
											+ "</td>" + "<td>" + value.REPORT_COUNT
											+ "</td>" + "</tr>";
								});
				body.append(str);

				/*$("a[name='title']").on("click", function(e) { //제목
					e.preventDefault();
					fn_openBoardDetail($(this));
				});*/
			}
		} 
	</script>
</body>
</html>