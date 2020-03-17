<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/include-header.jspf" %>
	<%@ include file="/WEB-INF/views/shop/goods/commentDetail.jsp" %>
  	<script>
  		$(document).ready(function(){ 
  			$('.bxslider').bxSlider({ 
  				auto: true, 
  				speed: 500, 
  				pause: 4000, 
  				mode:'fade', 
  				autoControls: true, 
  				pager:true, 
			}); 
		});
	</script>
  	
<style type="text/css">
/* 레이어 팝업 */

/* modal */
#modal {position: fixed; left:0; top:0; width: 100%; height: 100%; transform: scale(0); z-index:1; }
#modal .modal-bg {background: rgba(0,0,0,0.7); display:flex; align-items: center; justify-content: center; height: 100%; }
#modal .modal-bg .modal-cont {position:relative; background: #fff; padding: 40px; width:1000px; max-width: 1200px; display: inline-block; text-align:center;}
#modal .modal-bg .modal-cont h2 {font-size: 30px; margin:0;}
#modal .modal-bg .modal-cont p {font-size: 18px; }
#modal .modal-bg .modal-cont .close {position: absolute; top: 0; right:0; margin:20px; padding: 10px; background: #000; border-radius: 50%; }
#modal .modal-bg .modal-cont .close svg {width: 24px; fill: #fff; vertical-align: top;}

#modal.three {
    transform: scale(1);
}
#modal.three .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeIn 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal.three .modal-bg .modal-cont {
    opacity: 0;
    animation: scaleUp 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal.three.out {
    animation: quickScaleDown 0s .5s linear forwards;
}
#modal.three.out .modal-bg {
    background: rgba(0,0,0,0);
    animation: fadeOut 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}
#modal.three.out .modal-bg .modal-cont {
    opacity: 0;
    animation: scaleDown 0.5s cubic-bezier(0.165, 0.85, 0.44, 1) forwards;
}

@keyframes fadeIn {
    0% {background: rgba(0,0,0,0)}
    100% {background: rgba(0,0,0,0.7)}
}
@keyframes fadeOut {
    0% {background: rgba(0,0,0,0.7)}
    100% {background: rgba(0,0,0,0)}
}
@keyframes scaleUp {
    0% {transform: scale(0.5) translatey(1000px); opacity:0}
    100% {transform: scale(1) translatey(0px); opacity:1}
}
@keyframes scaleDown {
    0% {transform: scale(1) translatey(0px); opacity:1}
    100% {transform: scale(0.5) translatey(1000px); opacity:0}
}
@keyframes quickScaleDown {
    0% {transform: scale(1);}
    99.9% {transform: scale(1); }
    100% {transform: scale(0); }
}
</style>
  	
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/btn.css"/>" rel="stylesheet">
</head>
<body>

<div id="content">
	<div id="vertical_tab-container">
	<!--
		<ul>
			 <li <c:if test="${sortType eq 'all'}">class="selected"</c:if>><a href=<c:url value="/shop/allGoodsList"/>>전체상품</a></li>
	         <li <c:if test="${sortType eq 'like'}">class="selected"</c:if>><a href=<c:url value="/shop/likeGoodsList"/>>인기상품</a></li>
	         <li <c:if test="${sortType eq 'new'}">class="selected"</c:if>><a href=<c:url value="/shop/newGoodsList"/>>신규상품</a></li>
	         <li <c:if test="${sortType eq ''}">class="selected"</c:if>><a href=<c:url value="/shop"/>>카테고리</a></li>
		</ul>
		 -->
	</div>
	<div id="main-container">
		<table border="1" align="center" style="min-height:100%">
			<colgroup>
				<col width="45%"/>
				<col width="15%"/>
				<col width="15%"/>
				<col width="15%"/>
			</colgroup>
			<caption>상품 상세</caption>
			<tbody>
				<tr colspan="2">
					<td rowspan="2">
						<c:choose>
							<c:when test="${map.GOODS_THUMBNAIL eq null}">
								<img alt="" style="width:95%; height:300px; padding:10px 10px 10px 10px;" src=<c:url value="/resources/images/no_image.png"/>>
							</c:when>
							<c:otherwise>
								<img alt="" style="width:95%; height:300px; padding:10px 10px 10px 10px;" src="${path}${map.GOODS_THUMBNAIL}">	
							</c:otherwise>
						</c:choose>
					</td>
					<td colspan="3" style="padding:0 0 0 20px; font-size:15px;">
						<br>
						<img src="/nnS/resources/images/goods_brand.png"> : ${map.GOODS_BRAND}<br />
						<img src="/nnS/resources/images/goods_model.png"> : ${map.GOODS_TITLE} <br />	<!-- 테이블에 없음 --> 
						<img src="/nnS/resources/images/goods_pstatus.png"> : ${map.GOODS_STATUS}<br/>
						<input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NUM}">
						<input type="hidden" id="GOODS_NUM" name="GOODS_NUM" value="${map.GOODS_NUM}">
						<img src="/nnS/resources/images/goods_price.png"> : ${map.GOODS_PRICE}<br /> 
						<img src="/nnS/resources/images/goods_dprice.png">: ${map.GOODS_DCOST} <br /><!-- 테이블에 없음 --> 
						<img src="/nnS/resources/images/goods_total.png"> : <c:out value="${map.GOODS_PRICE+map.GOODS_DCOST}"/><br/>
						<br>
					</td>
				</tr>
				<tr align="center">
				<td>
					<a href='#this' id="buy"><img src=<c:url value="/resources/images/baro.png"/> id='baro_img' style="width:60px; height:30px"></a>
				</td>
				<td> 
					<a href='javascript: report_func();'><img src=<c:url value="/resources/images/siren2.png"/> id='report_img' style="width:60px; height:30px"></a>
				</td>
				<td>	
					<c:choose>
						<c:when test="${goodsLikeMap.GOODS_LIKE_YN eq 0}">
					    	<a href='javascript: like_func();'><img src=<c:url value="/resources/images/like_black.png"/> id='unlike_img' style="width:30px; height:30px"></a>
					  	</c:when>
					  	<c:otherwise>
					    	<a href='javascript: unlike_func();'><img src=<c:url value="/resources/images/like_red.png"/> id='like_img' style="width:30px; height:30px"></a>
					  	</c:otherwise>
					</c:choose>
				
				</td>	
				</tr>
			</tbody>
		</table>
		<div class="container" style="width:100%">
		    <ul class="goodsTabs">
		        <li class="selected"><a href="#goodsTab1"><img src="./../resources/images/goods_tab_1.png" height="25"></a></li>
		        <li><a href="#goodsTab2"><img src="./../resources/images/goods_tab_2.png" height="25"></a></li>
		        <li><a href="#goodsTab3"><img src="./../resources/images/goods_tab_3.png" height="25"></a></li>
		    </ul>
		    <div class="goodsTab_container">
		        <div id="goodsTab1" class="goodsTab_content">
		       
					  <ul class="bxslider"> 
					  	<c:forEach var="row" items="${list}" varStatus="var"> 
					  		<li><img alt="" style="width:auto; height:450px;" src="${path}${row.GOODS_IMAGE_STD}"/></li>
						</c:forEach>
					  </ul>
					  
		            <p>${map.GOODS_CONTENT}</p>
		        </div>
		        <div id="goodsTab2" class="goodsTab_content">
		             
						<div align='center'>
	                        <!-- 뭐든 넣어도됨(작성자 등등) -->
			      		</div>
			      		<!-- 문의 작성 폼 -->
			      		<form id="frm" name="frm">
				      		<c:if test="${session_MEM_ID != NULL}">
					      		<div width="100%">
				      				<textarea name='COMMENTS_CONTENT' id='COMMENTS_CONTENT' rows='5' cols='150' style='resize: none;'></textarea>
				      				<input type="hidden" id="COMMENTS_TYPE" name="COMMENTS_TYPE" value="1"/>
				      				<input type="hidden" id="COMMENTS_PARENT" name="COMMENTS_PARENT" value="${map.GOODS_NUM}"/>
				      				<input type="hidden" id="MEM_ID" name="MEM_ID" value="${session_MEM_INFO.MEM_ID }"/>
									<input type="button" id="cWrite" name="cWrite" value="문의하기" onClick="" style="vertical-align : middle;">
			      				</div>
			      			</c:if>
	      				</form>
	      				<br>
					<table id="goodsTab2_ct" class="tbl_type" style="width:100%; height: 100px;">
						<tbody>
						</tbody>
			       </table>
	       			<div id="PAGE_NAVI" align="center"></div>
					<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
			   </div>
		        <div id="goodsTab3" class="goodsTab_content">
		             
		             <br>
						판매자 ID : ${memberMap.MEM_ID}<br />
						판매자 이름 : ${memberMap.MEM_NAME} <br /> 
						판매자 성별 : ${memberMap.MEM_GEN}<br/>
						판매자 이메일 : ${memberMap.MEM_EMAIL}<br /> 
						판매자 연락처 : ${memberMap.MEM_PHONE}<br />
						<br>
		        </div>
		    </div>
		    <br>
		    <br/>
		<a href="#this" class="btn" id="list"><button class="bttn-bordered bttn-xs bttn-primary">목록으로</button></a>
		
		<c:if test="${session_MEM_ID eq map.MEM_ID && session_MEM_ID ne null}">
			<a href="#this" class="btn" id="update"><button class="bttn-bordered bttn-xs bttn-primary">수정하기</button></a>
			<a href="#this" class="btn" id="delete"><button class="bttn-bordered bttn-xs bttn-primary">삭제하기</button></a>
		</c:if>
		</div>
   </div>
   
</div>
	

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectCommentList(1);
			
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openGoodsList();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_goodsModify();
			});
			$("#delete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deleteGoods();
			});
			$("#buy").on("click", function(e) { // 바로구매 버튼
				e.preventDefault();
				if("${session_MEM_ID}" == "${memberMap.MEM_ID}"){
					alert("자신의 상품은 구매할 수 없습니다.");
					return false;
				}else if("${map.GOODS_TSTATUS}" != 'N'){
					alert("이미 거래중인 상품은 구매할 수 없습니다.");
				}else{
					fn_orderWriteForm($(this));
				}
			});
			
			$("#cWrite").on("click", function(e){ // 레이어팝업 닫기
				e.preventDefault();
				fn_writeComment();
			});
			
			$(".close").click(function(){
			    $("#modal").addClass("out");
			});			
			
			$("#rcWrite").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_replyWriteComment();
			});

			$("#rcDelete").on("click", function(e){ //삭제하기 버튼
				e.preventDefault();
				fn_deletereplyComment();
			});
		});
		
		function fn_openGoodsList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/allGoodsList' />");
			comSubmit.submit();
		}
		
		function fn_goodsModify(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsModifyForm' />");
			comSubmit.addParam("GOODS_NUM", "${map.GOODS_NUM}");
			comSubmit.submit();
		}
	
		function fn_deleteGoods(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDelete' />");
			comSubmit.addParam("GOODS_NUM", $("#IDX").val());
			comSubmit.submit();
			
		}
		
		/* 좋아요 */
		function like_func(){
			if(session_chk()){
				var IDX="${map.MEM_ID}";
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsLike'/>");
				comSubmit.addParam("LIKE_GOODS_NUM", "${map.GOODS_NUM}");
				comSubmit.addParam("IDX", IDX);
				comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
				comSubmit.submit();	
			}
		}
		
		function unlike_func(){
			if(session_chk()){
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/shop/goodsDetail/goodsUnlike'/>");
				comSubmit.addParam("LIKE_GOODS_NUM", "${map.GOODS_NUM}");
				comSubmit.addParam("LIKE_MEM_ID", "${session_MEM_ID}");
				comSubmit.submit();	
			}
		}
		
		function session_chk(){
			if("${session_MEM_ID}" == null || "${session_MEM_ID}" == "" ){
				alert("로그인이 필요합니다.");
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/loginForm'/>");
				comSubmit.submit();
				return false;
			}else{
				return true;
			}
		}
		
		/* 신고하기 */
		function report_func(){
			if(session_chk()){
				if("${session_MEM_ID}" == "${memberMap.MEM_ID}"){
					alert("자신의 상품은 신고할 수 없습니다.");
					return false;
					}
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/community/reportWriteForm'/>");
				comSubmit.addParam("GOODS_NUM", "${map.GOODS_NUM}");
				comSubmit.addParam("MEM_ID", "${session_MEM_ID}");
				comSubmit.submit();	
			}
		}
		
		/* 상품 구매 */
		
		function fn_orderWriteForm(obj) {
			if(session_chk()){
				var comSubmit = new ComSubmit();
				var GOODS_NUM = "${map.GOODS_NUM}";
				var MEM_ID = "${session_MEM_ID}";
				comSubmit.setUrl("<c:url value='/shop/order/orderWriteForm' />");
				comSubmit.addParam("GOODS_NUM", GOODS_NUM);
				comSubmit.addParam("MEM_ID", MEM_ID);
				comSubmit.submit();
			}
		}

		//Default Action
		$(".goodsTab_content").hide(); //Hide all content
		$("ul.goodsTabs li:first").addClass("active").show(); //Activate first goodsTab
		$(".goodsTab_content:first").show(); //Show first goodsTab content
		
		//On Click Event
		$("ul.goodsTabs li").click(function() {
			$("ul.goodsTabs li").removeClass("selected active"); //Remove any "active" class
			$(this).addClass("selected active"); //Add "active" class to selected goodsTab
			$(".goodsTab_content").hide(); //Hide all goodsTab content
			var activegoodsTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active goodsTab + content
			$(activegoodsTab).fadeIn(); //Fade in the active content
			return false;
		});
		

		
		function fn_detailComment(num,name,goods){
			$("#modal").removeAttr("class").addClass("three");
			var body2 = $("#commentDetail_a");
			var str = "";
			
			body2.empty();
			$.ajax({
				type:"POST",
				async : false,
				url:"${pageContext.request.contextPath}/shop/goodsDetail/commentDetail?COMMENTS_NUM="+num+"&MEM_ID="+name+"&GOODS_NUM="+goods,
				dataType: "json",
				success:function(data){
					
						str +=	"<tr>"
							+	"<td style='width: 150px'>"+data.cMap.MEM_ID+"</td>"
		           			+	"<td style='width: 250px'>"+data.cMap.COMMENTS_DATE+"</td>";
			           	if(data.cMap.COMMENTS_REPLY == 'N'){
			           	str +=	"<td style='width: 100px'>답변대기</td>";	
			           	}else if(data.cMap.COMMENTS_REPLY == 'Y'){
		           		str +=	"<td style='width: 100px'>답변완료</td>";		
			           	}
			           	str +=	"<td rowspan='2' style='width: 100px' align='center'>"
			           		+	"<a href='#this' onClick='fn_deleteComment("+data.cMap.COMMENTS_NUM+")'>문의삭제"
							+	"<input type='hidden' id='GOODS_NUM' name='GOODS_NUM' value="+data.cMap.COMMENTS_PARENT+">"
							+	"</a>"
							+	"</td>"
							+	"<tr>"
							+	"<td colspan='3' style='height:150px'>"+data.cMap.COMMENTS_CONTENT+"</td>"
							+	"</tr>";
						if(data.cMap.COMMENTS_REPLY == 'N' && '${session_MEM_INFO.MEM_ID}' == data.G_MEM_ID){
							str +=	"<tr>"
								+	"<td colspan='3'>${session_MEM_INFO.MEM_ID}</td>"
								+	"<td rowspan='2' align='center'>"
								+	"<a href='#this' id='rcWrite' name='rcWrite' onclick='fn_replyWriteComment()'>답글등록</a>"
								+	"<input type='hidden' id='COMMENTS_TYPE' name='COMMENTS_TYPE' value='1'>"
								+	"<input type='hidden' id='COMMENTS_PARENT' name='COMMENTS_PARENT' value='"+data.cMap.COMMENTS_PARENT+"'>"
								+	"<input type='hidden' id='MEM_ID' name='MEM_ID' value='${session_MEM_INFO.MEM_ID }'>"
								+	"<input type='hidden' id='COMMENTS_RNUM' name='COMMENTS_RNUM' value='"+data.cMap.COMMENTS_NUM+"'>"
								+	"</td>"
								+	"</tr>"
								+	"<tr>"
								+	"<td colspan='3' style='height:150px'><textarea name='COMMENTS_CONTENT' id='COMMENTS_CONTENT' rows='5' cols='120' style='resize: none;'></textarea></td>"
								+	"</tr>";
						} else if(data.cMap.COMMENTS_REPLY == 'Y') {
							str +=	"<tr>"
								+	"<td>판매자 : "+data.rMap.MEM_ID+"</td>"
								+	"<td colspan='2'>"+data.rMap.COMMENTS_DATE+"</td>"
								+	"<td rowspan='2' align='center'>";
						if('${session_MEM_INFO.MEM_ID}' == data.G_MEM_ID){
								+	"<a href='#this' id='rcDelete' name='rcDelete'>답글삭제"
								+	"<input type='hidden' id='REPLY_NUM' name='REPLY_NUM' value='"+data.rMap.COMMENTS_NUM+"'>"
								+	"<input type='hidden' id='COMMENTS_RNUM' name='COMMENTS_RNUM' value='"+data.cMap.COMMENTS_NUM+"'>"
								+	"<input type='hidden' id='G_MEM_ID' name='G_MEM_ID' value='"+data.G_MEM_ID+"'>"
								+	"</a>";
							}
							str	+=	"</td>"
								+	"</tr>"
								+	"<tr>"
								+	"<td colspan='3' style='height:150px'>"+data.rMap.COMMENTS_CONTENT+"</td>"
								+	"</tr>";
						}
			           	body2.append(str);
				},
				error: function(data){
					alert("에러가 발생했습니다. 다시 한번 시도해주세요.");
					return false;
				}
			});
			
			
/*기존거 	var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentDetail'/>");
			comSubmit.addParam("COMMENTS_NUM", num);
			comSubmit.addParam("G_MEM_ID", $("#G_MEM_ID").val());
			comSubmit.submit(); */
		}
		
		function fn_writeComment(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentWrite'/>");
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			
			// 댓글 내용 필요
	         if(!$("#COMMENTS_CONTENT").val()){
	             alert("내용를 입력해주세요.");
	             $("#COMMENTS_CONTENT").focus();
	             return false;
	         }
			
			comSubmit.submit();
		} 
		
		function fn_deleteComment(num){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentDelete'/>");
			comSubmit.addParam("COMMENTS_NUM", num);
			comSubmit.addParam("GOODS_NUM", $("#GOODS_NUM").val());
			comSubmit.submit();
		}
				
		function fn_chkUsr(){
			alert("문의 작성자만 확인할 수 있습니다.")
		}
		
		function fn_replyWriteComment(){
			var comSubmit = new ComSubmit("frm2");
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentReplyWrite'/>");
			comSubmit.addParam("COMMENTS_NUM", $("#COMMENTS_NUM").val());
			comSubmit.addParam("G_MEM_ID", $("G_MEM_ID").val());
			
			// 댓글 내용 필요
	         if(!$("#COMMENTS_CONTENT").val()){
	             alert("내용를 입력해주세요.");
	             $("#COMMENTS_CONTENT").focus();
	             return false;
	         }
			
			comSubmit.submit();
		}
		
		
		function fn_deletereplyComment(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/shop/goodsDetail/commentReplyDelete'/>");
			comSubmit.addParam("REPLY_NUM", $("#REPLY_NUM").val());
			comSubmit.addParam("COMMENTS_RNUM", $("#COMMENTS_RNUM").val());
			comSubmit.addParam("G_MEM_ID", "${G_MEM_ID}");
			comSubmit.submit();
		}
		
		
		// 댓글 페이징
		function fn_selectCommentList(pageNo) {
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/shop/goodsDetail/commentList' />");
			comAjax.setCallback("fn_selectCommentListCallback");
			comAjax.addParam("PAGE_INDEX", pageNo);
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("COMMENTS_TYPE", 1);
			comAjax.addParam("COMMENTS_PARENT", $("#GOODS_NUM").val());
			comAjax.ajax();
		}

		// 댓글 페이징 콜백함수
		function fn_selectCommentListCallback(data) {
			var total = data.TOTAL;
			var body = $("#goodsTab2_ct");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='4'>등록된 상품 문의가 없습니다.</td>"
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

				var str = "";
				$.each(
								data.list,
								function(key, value) {									
							str +=				"<tr style='border-top-style: Double; border-color: #000000;'>"
						           		+	    "<td length='30%' target='_blank' style='width:300px;'>";
						    if('${session_MEM_INFO.MEM_ID}' == value.MEM_ID || '${session_MEM_INFO.MEM_ID}' == '${memberMap.MEM_ID}'){
						    	
						    str +=				"<a href='#this' onClick='fn_detailComment("+value.COMMENTS_NUM+",\""+value.MEM_ID+"\",\""+value.COMMENTS_PARENT+"\")'>"
						    			+		"<input type='hidden' id='G_MEM_ID' name='G_MEM_ID' value='${memberMap.MEM_ID}'>"
						         		+       		value.MEM_ID
						         		+		" 님의 상품문의입니다.</a>";
						    } else {
						    str +=				"<a href='#this' onClick='fn_chkUsr()'>"
						         		+       		value.MEM_ID
						         		+		" 님의 상품문의입니다.</a>";
						    	
						    }      		
						    str+=      	    	"</td>"
							            +   		"<td colspan='2' style='width:170px; align=center;'>"
							            +     			new Date(value.COMMENTS_DATE).toLocaleString()
							            +     	"</td>"
								        +        "<td>";
							if(value.COMMENTS_REPLY=='N'){
								str +=			'답변대기';
							} else if (value.COMMENTS_REPLY=='Y'){
						 		str +=			'답변완료';
							} else{
								str +=			"";
							}
							str +=              "</td>"	
							            +      	"<td style='width: 100px; align=center;'>";
							if('${session_MEM_INFO.MEM_ID}' == value.MEM_ID){
									str += "<a href='#this' name='cDelete' onClick='fn_deleteComment("+value.COMMENTS_NUM+")'> 삭제 </a>"
										+  "<input type='hidden' id='GOODS_NUM' name='GOODS_NUM' value=" + value.COMMENTS_PARENT + ">";					
								}
							str +=              "</td>"
							            +   	"</tr>";
						});
				body.append(str);
			}
		}

	</script>

</body>
</html>