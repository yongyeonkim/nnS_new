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
	comAjax.setUrl("<c:url value='/admin/reportProListPaging' />");
	comAjax.setCallback("fn_selectBoardListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.addParam("search",$('#search').val());
	comAjax.ajax();
}

function fn_selectBoardListCallback(data) {
	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if (total == 0) {
		var str = "<tr align=\"center\">" + "<td colspan='9'>등록된 신고사항이 없습니다</td>"
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
						data.list,
						function(key, value) {
								str += 
										
										'<tr class="gradeA even" role="row">'
								+			'<td style="text-align:center;vertical-align:middle;">' + value.REPORT_NUM + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">'
								+			"<input type='hidden' name='title2' id='title2' value=" + value.REPORT_NUM + ">"
								+			'<a href="#this" id="title" name="title">'
								+				value.REPORT_TITLE
								+		    "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ID + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + new Date(value.REPORT_DATE).toLocaleString() + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.REPORT_TYPE + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.REPORT_GOODS_SELLER_ID + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.REPORT_STATUS + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.REPORT_DEL_GB + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">'
								+				"<a href='/nnS/admin/reportModify?MEM_ID="+value.MEM_ID+"&REPORT_NUM="+value.REPORT_NUM+"&REPORT_STATUS="+value.REPORT_STATUS+"'>" + '<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png">' + "</a>"			
								+			"<a href='/nnS/admin/adReportDelete?REPORT_NUM="+value.REPORT_NUM+"'>"  + '<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()">' + "</a>" + "</td>"									
								+		"</tr>"
								+		"</tr>"
								+       "<tr class='hiden'>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "내용" + "</th>"
								+           "<td colspan='8' style='text-align:center;vertical-align:middle;'>" +  value.REPORT_CONTENT + "</td>" 
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
	<h1 class="page-header">신고목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         신고내용을 확인, 처리하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<form action="/nnS/admin/reportProList" method="post">
                     <a href="/nnS/admin/reportProList"><button type="button" class="btn btn-outline btn-default">전체</button></a>
                     <select class="form-control" name="search" id="search">
                        <option value ="">-- 구분 --</option>
                        <option value ="1" <c:out value="${search eq '1' ? 'selected' :''}"/>>처리대기</option>
                        <option value ="2" <c:out value="${search eq '2' ? 'selected' :''}"/>>신고접수</option>
                        <option value ="3" <c:out value="${search eq '3' ? 'selected' :''}"/>>허위신고</option>
                        <option value ="4" <c:out value="${search eq '4' ? 'selected' :''}"/>>처리완료</option>
                     </select>
                     <input type="submit" value="분류" class="search_btn" onClick="onSearch()"/>                  
                  </form>
						</div>
						<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 신고수 :${TOTAL} </div>
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
										<th style="width: 7%; text-align:center;">글번호</th>
										<th style="width: 17%; text-align:center;">제목</th>
										<th style="width: 10%; text-align:center;">신고자</th>										
										<th style="width: 16%; text-align:center;">신고일자</th>
										<th style="width: 10%; text-align:center;">신고유형</th>
										<th style="width: 10%; text-align:center;">신고대상</th>
										<th style="width: 10%; text-align:center;">처리상태</th>
										<th style="width: 10%; text-align:center;">글삭제여부</th>
										<th style="width: 10%; text-align:center;">관리</th>
									</tr>
								</thead>
								<tbody class="body">
						
								</tbody>
							</table>
							<br/>
							<div id="PAGE_NAVI" align="center"></div>
							<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
						
						</div>
					</div>
					
				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
