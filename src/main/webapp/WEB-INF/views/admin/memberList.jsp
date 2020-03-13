<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<head>
<script type="text/javascript">
function delchk(){
    return confirm("삭제하시겠습니까?");
} 

$(document).ready(function() {
	fn_selectBoardList(1);
});

function fn_selectBoardList(pageNo) {
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/memberListPaging' />");
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
		var str = "<tr align=\"center\">" + "<td colspan='9'>조회된 회원이 없습니다.</td>"
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
								+			'<td style="text-align:center;vertical-align:middle;">'+ value.MEM_NUM + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ID + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_PW + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_NAME + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + new Date(value.MEM_BIRTH).toLocaleString() + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_GEN + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_EMAIL + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_PHONE + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ZIP + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ADD1 + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ADD2 + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + new Date(value.MEM_JOINDATE).toLocaleString() + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_LEVEL + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_DEL_GB + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">'
								+				"<a href='/nnS/admin/memberModify?MEM_ID="+value.MEM_ID+"'>" + '<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Cog_font_awesome.svg/32px-Cog_font_awesome.svg.png">'+ "</a>"	
								+			"<input type='hidden' id='MEM_ID' value=" + value.MEM_ID + ">"	
								+			 "<a href='/nnS/admin/memberDelete?MEM_ID="+value.MEM_ID+"'>" + '<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()">' + "</a>" + "</td>"									
								+		"</tr>";
						});
		body.append(str);
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
</style>
</head>
<body>
<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">회원목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         회원목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
						<div class="col-sm-6" style="text-align:left;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 회원수 : ${TOTAL}</div>
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
										<th style="width: 4%; text-align:center;">번호</th>
										<th style="width: 6%; text-align:center;">ID</th>
										<th style="width: 6%; text-align:center;">PW</th>
										<th style="width: 6%; text-align:center;">이름</th>
										<th style="width: 5%; text-align:center;">생년월일</th>
										<th style="width: 5%; text-align:center;">성별</th>
										<th style="width: 10%; text-align:center;">E-Mail</th>										
										<th style="width: 7%; text-align:center;">전화번호</th>
										<th style="width: 5%; text-align:center;">우편번호</th>
										<th style="width: 18%; text-align:center;">주소</th>
										<th style="width: 12%; text-align:center;">상세주소</th>
										<th style="width: 5%; text-align:center;">가입일자</th>
										<th style="width: 3%; text-align:center;">레벨</th>
										<th style="width: 5%; text-align:center;">탈퇴여부</th>
										<th style="width: 3%; text-align:center;">관리</th>
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
</body>
</html>

