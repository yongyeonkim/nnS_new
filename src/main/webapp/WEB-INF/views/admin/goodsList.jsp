<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
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
	/* $("a[name='title']").on("click", function(e) { //제목 
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
 */
});

function fn_openBoardDetail(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/shop/goodsDetail' />");
	comSubmit.addParam("GOODS_NUM", obj.parent().find("#title2").val());
	comSubmit.submit();
}
function fn_selectBoardList(pageNo) {
	var comAjax = new ComAjax();
	comAjax.setUrl("<c:url value='/admin/goodsListPaging' />");
	comAjax.setCallback("fn_selectBoardListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 15);
	comAjax.addParam("search", $('#search').val());
	
	comAjax.ajax();
}

function fn_selectBoardListCallback(data) {
	var total = data.TOTAL;
	var body = $("table>tbody");
	body.empty();
	if (total == 0) {
		var str = "<tr align=\"center\">" + "<td colspan='9'>등록된 상품이 없습니다</td>"
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
							var tstatus = "";
						    
							if(value.GOODS_TSTATUS == 'N'){
								tstatus = "거래가능";
							}else if (value.GOODS_TSTATUS == 'ING'){
								tstatus = "거래중";
						   }else if(value.GOODS_TSTATUS == 'Y'){
							tstatus ="거래완료"
						   }
								str += 
										'<tr class="gradeA even" role="row">'
								+			'<td style="text-align:center;vertical-align:middle;">'+ value.GOODS_NUM + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.GOODS_CATEGORY + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.MEM_ID + "</td>"
								+			'<td colspan="2" style="text-align:center;vertical-align:middle;">' 
								+           '<input type="hidden" name="title2" id="title2" value=' + value.GOODS_NUM + '>'
								+				'<a href="#this" id="title" name="title">'
								+				value.GOODS_TITLE
								+			"</a>" + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.GOODS_PRICE + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + tstatus + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + new Date(value.GOODS_DATE).toLocaleString() + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">' + value.GOODS_DEL_GB + "</td>"
								+			'<td style="text-align:center;vertical-align:middle;">'
							
								+			"<input type='hidden' id='MEM_ID' value=" + value.MEM_ID + ">"	
								+			 "<a href='/nnS/admin/adGoodsDelete?GOODS_NUM="+value.GOODS_NUM+"'>" + '<input type="image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Trash_font_awesome.svg/32px-Trash_font_awesome.svg.png" onclick="return delchk()">' + "</a>" + "</td>"									
								+		"</tr>"
								+       "<tr class='hiden'>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "판매자이름" + "</th>"
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.MEM_NAME + "</td>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "판매자 성별" + "</th>"
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.MEM_GEN + "</td>"
								+           '<th style="text-align:center;vertical-align:middle;">' + "판매자 이메일" + "</th>"
								           
								+           "<td colspan='2' style='text-align:center;vertical-align:middle;'>" +  value.MEM_EMAIL + "</td>"
								+           '<th style="text-align:center;vertical-align:middle;">' + "판매자 연락처" + "</th>"
								+           "<td colspan='2' style='text-align:center;vertical-align:middle;'>" +  value.MEM_PHONE + "</td>"
								
								+       "</tr>"
								+       "<tr class='hiden'>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "브랜드" + "</th>"
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.GOODS_BRAND + "</td>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "중고상태" + "</th>"
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.GOODS_STATUS + "</td>"
								+           '<th style="text-align:center;vertical-align:middle;">' + "해시태그" + "</th>"
								           
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.GOODS_HASH + "</td>"
								+           '<th style="text-align:center;vertical-align:middle;">' + "판매지역" + "</th>"
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.GOODS_REGION + "</td>"
								+           '<th style="text-align:center;vertical-align:middle;">' + "배송비" + "</th>"
								+           "<td style='text-align:center;vertical-align:middle;'>" +  value.GOODS_DCOST + "</td>"
								+       "</tr>"
								+       "<tr class='hiden'>" 
								+           '<th style="text-align:center;vertical-align:middle;">' + "내용" + "</th>"
								+           "<td colspan='9' style='text-align:center;vertical-align:middle;'>" +  value.GOODS_CONTENT + "</td>" 
								+       "</tr>";
								
						});
		body.append(str);
			$("a[name='title']").toggle(function(){
				var content = $(this).closest("tr").next();
				$(this).closest("tr").next().show();
				content.next().show();
				content.next().next().show();
				}, function(){
					var content = $(this).closest("tr").next();
				$(this).closest("tr").next().hide();
				content.next().hide();
				content.next().next().hide();
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
tr.hiden {display:none; background:#ffffff;}
</style>
</head>

<div class="row" style="padding-left:15px;width:900px;">    
	<h1 class="page-header">상품목록</h1>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-heading">
                         상품목록페이지 검색, 수정, 삭제 기능하는 페이지입니다.
        </div>
        <div class="panel-body">
			<div class="dataTable_wrapper">
				<div id="dataTables-example_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row" style="margin-bottom:5px;">
					<!-- 분류 추가 -->
							<div class="col-sm-6" style="text-align:left;">
							   <form action="/nnS/admin/goodsList" method="post">
				                     <a href="/nnS/admin/goodsList"><button type="button" class="btn btn-outline btn-default">전체</button></a>
				                     <select class="form-control" name="search" id="search">
				                        <option value ="">-- 구분 --</option>
				                        <option value ="sale" <c:out value="${search eq 'sale' ? 'selected' :''}"/>>거래가능</option>
				                        <option value ="payment" <c:out value="${search eq 'payment' ? 'selected' :''}"/>>거래중</option>
				                        <option value ="complete" <c:out value="${search eq 'complete' ? 'selected' :''}"/>>거래완료</option>
				
				                     </select>
				                     <input type="submit" value="분류" class="search_btn"/>                  
	                          </form>
							</div>
							<div class="col-sm-6" style="text-align:right;">
							<div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">총 상품 등록수 : ${TOTAL}</div>
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
										<th style="width: 6%; text-align:center;">번호</th>
										<th style="width: 9%; text-align:center;">카테고리</th>
										<th style="width: 9%; text-align:center;">판매자</th>										
										<th colspan="2" style="width: 30%; text-align:center;">상품명</th>
										<th style="width: 9%; text-align:center;">가격</th>
										<th style="width: 9%; text-align:center;">상품상태</th>
										<th style="width: 10%; text-align:center;">등록일자</th>
										<th style="width: 9%; text-align:center;">삭제여부</th>
										<th style="width: 10%; text-align:center;">관리</th>
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

				</div>
			</div>
			<!-- /.table-responsive -->							
		</div>
	</div>
        <!-- /.panel -->   
</div>
