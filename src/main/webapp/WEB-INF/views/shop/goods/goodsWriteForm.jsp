<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>

<meta charset="UTF-8">
<style type="text/css">
#main-container2
{
   min-height: 200px;
   margin: auto;
   padding: 20px;
   background-color: #fff;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<div id="content">
	<div id="main-container2">
	<center><img src="./../resources/images/form_tgoods.png"></center>
		<form  method="post" id="frm" name="frm" enctype="multipart/form-data" onsubmit="return formCheck();">
		<table class="tbl_type">
		<colgroup>
            <col width="10%">
            <col width="*"/>
            <col width="10%">
            <col width="*%">
         </colgroup>
		<tr>
			<th>
	      		<img src="./../resources/images/form_category.png">
	      	</th>
	      	<td>
	      		<select name="GOODS_CATEGORY" id="GOODS_CATEGORY">
					<option value="" selected disabled hidden>==선택하세요==</option>
				    <option value=1 <c:out value="${map.GOODS_CATEGORY eq '1' ? 'selected' :''}"/>>식품</option>
					<option value=2 <c:out value="${map.GOODS_CATEGORY eq '2' ? 'selected' :''}"/>>주방</option>
					<option value=3 <c:out value="${map.GOODS_CATEGORY eq '3' ? 'selected' :''}"/>>생활</option>
					<option value=4 <c:out value="${map.GOODS_CATEGORY eq '4' ? 'selected' :''}"/>>인테리어</option>
					<option value=5 <c:out value="${map.GOODS_CATEGORY eq '5' ? 'selected' :''}"/>>가전디지털</option>
					<option value=6 <c:out value="${map.GOODS_CATEGORY eq '6' ? 'selected' :''}"/>>스포츠레저</option>
					<option value=7 <c:out value="${map.GOODS_CATEGORY eq '7' ? 'selected' :''}"/>>자동차</option>
					<option value=8 <c:out value="${map.GOODS_CATEGORY eq '8' ? 'selected' :''}"/>>도서</option>
					<option value=9 <c:out value="${map.GOODS_CATEGORY eq '9' ? 'selected' :''}"/>>음반</option>
					<option value=10 <c:out value="${map.GOODS_CATEGORY eq '10' ? 'selected' :''}"/>>DVD</option>
					<option value=11 <c:out value="${map.GOODS_CATEGORY eq '11' ? 'selected' :''}"/>>완구</option>
					<option value=12 <c:out value="${map.GOODS_CATEGORY eq '12' ? 'selected' :''}"/>>문구</option>
					<option value=13 <c:out value="${map.GOODS_CATEGORY eq '13' ? 'selected' :''}"/>>헬스건강</option>
					<option value=14 <c:out value="${map.GOODS_CATEGORY eq '14' ? 'selected' :''}"/>>여행</option>
					<option value=15 <c:out value="${map.GOODS_CATEGORY eq '15' ? 'selected' :''}"/>>아트공예</option>
					<option value=16 <c:out value="${map.GOODS_CATEGORY eq '16' ? 'selected' :''}"/>>뷰티</option>
					<option value=17 <c:out value="${map.GOODS_CATEGORY eq '17' ? 'selected' :''}"/>>가방</option>
					<option value=18 <c:out value="${map.GOODS_CATEGORY eq '18' ? 'selected' :''}"/>>패션</option>
					<option value=19 <c:out value="${map.GOODS_CATEGORY eq '19' ? 'selected' :''}"/>>신발</option>
					<option value=20 <c:out value="${map.GOODS_CATEGORY eq '20' ? 'selected' :''}"/>>기타</option>
				</select>
	      	</td>
	      	<th>
				<img src="./../resources/images/form_hash.png"><br/>
			</th>
			<td>
				<input type="text" id="GOODS_HASH" name="GOODS_HASH" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_HASH}"</c:if>>
			</td>
		</tr>
		<tr>
			<th>
				<img src="./../resources/images/form_title.png"><br/>
			</th>
			<td>
				<input type="text" id="GOODS_TITLE" name="GOODS_TITLE" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_TITLE}"</c:if>>
				<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_ID}">
			</td>
	      	<th>
	      		<img src="./../resources/images/form_pstatus.png">
	      	</th>
	      	<td>
	      		<select name="GOODS_STATUS" id="GOODS_STATUS">
					<option value="" selected disabled hidden>==선택하세요==</option>
				    <option value="1" <c:out value="${map.GOODS_STATUS eq '1' ? 'selected' :''}"/>>A</option>
				    <option value="2" <c:out value="${map.GOODS_STATUS eq '2' ? 'selected' :''}"/>>B</option>
				    <option value="3" <c:out value="${map.GOODS_STATUS eq '3' ? 'selected' :''}"/>>C</option>
				    <option value="4" <c:out value="${map.GOODS_STATUS eq '4' ? 'selected' :''}"/>>D</option>
				</select>
	      	</td>
		</tr>
		<tr>
			<th>
				<img src="./../resources/images/form_price.png"><br/>
			</th>
			<td>
				<input type="text" id="GOODS_PRICE" name="GOODS_PRICE" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_PRICE}"</c:if>>
			</td>
			<th>
				<img src="./../resources/images/form_dprice.png"><br/>
			</th>
			<td>
				<input type="text" id="GOODS_DCOST" name="GOODS_DCOST" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_DCOST}"</c:if>>
			</td>
		</tr>
		<tr>
			<th>
				<img src="./../resources/images/form_brand.png"><br/>
			</th>
			<td>
				<input type="text" id="GOODS_BRAND" name="GOODS_BRAND" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_BRAND}"</c:if>>
			</td>
			<th>
				<img src="./../resources/images/form_area.png"><br/>
			</th>
			<td>
				<input type="text" id="GOODS_REGION" name="GOODS_REGION" value=<c:if test="${request_type eq 'modify'}">"${map.GOODS_REGION}"</c:if>>
			</td>
		</tr>
        <tr>
        	<td colspan="4">
               <textarea name="GOODS_CONTENT" id="GOODS_CONTENT" rows="30" cols="100"><c:if test="${request_type eq 'modify'}">${map.GOODS_CONTENT}</c:if></textarea>
			</td>
		</tr>
      </ul>
	  </table>
	  
      	<p align="left">
      		<c:if test="${request_type eq 'modify'}"><a href="#this" class="btn" id="updateBtn"><button class="bttn-bordered bttn-xs bttn-primary">수정하기</button></a></c:if>
			<c:if test="${request_type eq 'write'}"><a href="#this" class="btn" id="addBtn"><button class="bttn-bordered bttn-xs bttn-primary">작성하기</button></a></c:if>
			<a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
			
      	</p>
	  
	  <c:if test="${request_type eq 'modify'}"><input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}"></c:if>
      </form>
	</div>
</div>

<script type="text/javascript">
	var gfv_count = 1;
	
	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault();
			fn_openGoodsList();
		});
		
		$("#addBtn").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			if(fn_formCheck()){
				fn_insertGoods();	
			}
		});
		$("#updateBtn").on("click", function(e){ //수정하기 버튼
			e.preventDefault();
			if(fn_formCheck()){
				fn_updateGoods();	
			}
		});
	});
	
    $(function(){
		CKEDITOR.replace('GOODS_CONTENT',{
            width:'100%',
            height:'600px',
			filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
		});
	});
	
	function fn_openGoodsList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
		comSubmit.submit();
	}
	
	function fn_insertGoods(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/shop/goodsWrite' />");
		comSubmit.submit();
	} 
	
	function fn_updateGoods(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/shop/goodsModify' />");
		comSubmit.submit();
	} 
	
	function fn_formCheck() {
		// 게시글 카테고리 필요
        if(!$("#GOODS_CATEGORY").val()){
            alert("카테고리를 입력해주세요.");
            $("#GOODS_CATEGORY").focus();
            return false;
        }
     	// 게시글 중고상태 필요
        if(!$("#GOODS_STATUS").val()){
            alert("중고상태를 입력해주세요.");
            $("#GOODS_STATUS").focus();
            return false;
        }
        // 게시글 제목 필요
        if(!$("#GOODS_TITLE").val()){
            alert("제목를 입력해주세요.");
            $("#GOODS_TITLE").focus();
            return false;
        }
   	 	// 게시글 내용 필요
        if(CKEDITOR.instances.GOODS_CONTENT.getData() =='' 
                || CKEDITOR.instances.GOODS_CONTENT.getData().length ==0){
            alert("내용을 입력해주세요.");
            $("#GOODS_CONTENT").focus();
            return false;
        }
   	 	
     	// 게시글 가격입력 필요
        if(!$("#GOODS_PRICE").val()){
            alert("가격을 입력해주세요.");
            $("#GOODS_PRICE").focus();
            return false;
        }
     	// 게시글 배송비 필요
        if(!$("#GOODS_DCOST").val()){
            alert("배송비를 입력해주세요.");
            $("#GOODS_DCOST").focus();
            return false;
        }
     	// 게시글 브랜드 필요
        if(!$("#GOODS_BRAND").val()){
            alert("브랜드를 입력해주세요.");
            $("#GOODS_BRAND").focus();
            return false;
        }
     	// 게시글 해시태그 필요
        if(!$("#GOODS_HASH").val()){
            alert("해시태그를 입력해주세요.");
            $("#GOODS_HASH").focus();
            return false;
        }
     	// 게시글 판매지역 필요
        if(!$("#GOODS_REGION").val()){
            alert("판매지역을 입력해주세요.");
            $("#GOODS_REGION").focus();
            return false;
        }
     	
     	if($("#GOODS_PRICE").val() && $("#GOODS_DCOST").val()){
     		var gp = $("#GOODS_PRICE").val();
     		var dc = $("#GOODS_DCOST").val();
     		if((parseInt(gp)+parseInt(dc)) >= 1000000){
     			alert("합계 가격이 1,000,000원을 넘을 수 없습니다.");
                $("#GOODS_PRICE").focus();
                return false;
     		}
     	}
     	return true;
		}
</script>
</body>
</html>