<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
}

$(document).ready(function() {
	fn_selectBoardList(1);
	
});


function fn_selectBoardList(pageNo) {
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/noticeListPaging' />");
	comAjax.setCallback("fn_selectBoardListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.ajax();
}

function fn_selectBoardListCallback(data) {
	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if (total == 0) {
		var str = "<tr align=\"center\">" + "<td colspan='9'>조회된 게시글이 없습니다</td>"
				+ "</tr>";
				
		body.append(str);
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			recordCount : 15,
			eventName : "fn_selectBoardList"
			
		};
		gfn_renderPaging(params);

		var str = "";
		$.each(
						data.noticeList,
						function(key, value) {
								str += 
										'<tr class="gradeA even" role="row">'
								+			'<td style="text-align:center;vertical-align:middle;">'+ value.NOTICE_NUM + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' 
								+           '<input type="hidden" name="title2" id="title2" value=' + value.NOTICE_NUM + '>'
								+				'<a href="#this" id="title" name="title">'
								+				value.NOTICE_TITLE
								+			"</a>" + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ID + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + new Date(value.NOTICE_DATE).toLocaleString() + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">'
								+			"<input type='hidden' id='MEM_ID' value=" + value.MEM_ID + ">"	
								+			 "<a href='/nnS/admin/adNoticeDelete?NOTICE_NUM="+value.NOTICE_NUM+"'>" + '<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()">' + "</a>" + "</td>"									
								+		"</tr>"
								+       "<tr class='hiden'>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "내용" + "</th>"
								+           "<td colspan='8' style='text-align:center;vertical-align:middle;'>" +  value.NOTICE_CONTENT + "</td>" 
								+       "</tr>";
						});
		body.append(str);
		$("a[name='title']").toggle(function(){
			$(this).closest("tr").next().show();
			}, function(){
			$(this).closest("tr").next().hide();
		});
	}
}

</script>
<style type="text/css">
.paging{text-align:center;height:32px;margin-top:5px;margin-bottom:15px;}
.paging a,
.paging strong{display:inline-block;width:36px;height:32px;line-height:28px;font-size:14px;border:1px solid #e0e0e0;margin-left:5px;
-webkit-border-radius:3px;
   -moz-border-radius:3px;
		border-radius:3px;
-webkit-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
	-moz-box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
		  box-shadow:1px 1px 1px 0px rgba(235,235,235,1);
}
.paging a:first-child{margin-left:0;}
.paging strong{color:#fff;background:#337AB7;border:1px solid #337AB7;}
.paging .page_arw{font-size:11px;line-height:30px;}
tr.hiden {display:none}
</style>
</head>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">공지사항</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
             	공지사항 작성, 검색, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 게시글 수 : ${TOTAL}</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table
								class="table table-striped table-bordered table-hover dataTable no-footer"
								id="dataTables-example" role="grid"
								aria-describedby="dataTables-example_info">
								<thead>
									<tr role="row">
										<th style="width: 10%; text-align:center;">번호</th>
										<th style="width: 45%; text-align:center;">제목</th>
										<th style="width: 15%; text-align:center;">작성자</th>										
										<th style="width: 15%; text-align:center;">작성일</th>
										<th style="width: 15%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody>
								
								</tbody>
							</table>
								<br/>
									<div id="PAGE_NAVI" align="center"></div>
									<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
						</div>
					</div>
					<div align="right">
                 		<a href="/nnS/community/noticeWriteForm">
                 			<button type="button" class="btn btn-outline btn-default">글쓰기</button>
                 		</a>
                	</div>
					
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
