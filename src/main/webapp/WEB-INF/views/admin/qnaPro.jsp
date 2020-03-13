<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>  
 
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
/* $(document).ready(function(){
	var str = "${param.title}";
	document.getElementById("QNA_TITLE").value = "${param.title}";//opener.document.getElementById("title").value;
	
}); */
$(document).ready(function(){
$("#write").on("click", function(e){ //답변달기 버튼
	e.preventDefault();
	fn_insertBoard();
});
});
function fn_insertBoard(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/admin/qnaRePro' />");

	 // 게시글 내용 필요
    if(CKEDITOR.instances.QNA_RE.getData() =='' 
            || CKEDITOR.instances.QNA_RE.getData().length ==0){
        alert("내용을 입력해주세요.");
        $("#QNA_RE").focus();
        return false;
    }
	
	comSubmit.submit();
	close();
}
/* function write(){
	var comSubmit = new ComSubmit("frm");
    comSubmit.setUrl("<c:url value='/admin/qnaRePro'/>");
    comSubmit.submit();
} */
$("#frm").on("submit",function(e){
});

function back(){
	history.go(-1);
}

$(function(){
	CKEDITOR.replace('QNA_RE',{
      width:'100%',
      height:'600px',
		filebrowserUploadUrl: '${pageContext.request.contextPath }/ckeditor/fileupload'
	});
});
</script>

</head>
<%@ include file="/WEB-INF/include/include-body.jspf" %> 
<!-- 메뉴 시작 -->

<div style="padding-left:15px;width:700px;">    
	<h1>답변달기</h1>
		
			<div>
				<form id="frm" name="frm" method="post"> 	
                        
                        	<input type="hidden" name="QNA_NUM" id="QNA_NUM" value="${map.QNA_NUM }">
                        	<input type="hidden" name="QNA_TYPE" id="QNA_TYPE" value="${map.QNA_TYPE }">
                                                    
                             <input type="hidden" name="QNA_TITLE" id="QNA_TITLE" value="RE: ${map.QNA_TITLE }"/>
                              
                                                      
                       
                        <div>
                            
                            <textarea rows="20" cols="60" title="답변" id="QNA_RE" name="QNA_RE"></textarea>
                        </div>
                        
						<button class="btn" id="write">답변작성</button>
						<button type="reset" onclick="back();">작성취소</button>					
				</form>
			</div>
	</div>




<!-- // container -->
