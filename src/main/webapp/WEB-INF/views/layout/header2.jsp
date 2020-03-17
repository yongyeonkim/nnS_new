<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/inform.css'/>" />
<style>
a {color:#666;}
</style>
<script type="text/javascript">
   
   $(document).ready(function() {
	      poll();
	     
	   });
	   
	   function fn_InformConfirm(num){
	      $.ajax({
	           url: '/nnS/inform/confirm',
	           type: 'GET',
	           data: {INFORM_NUM:num},
	           dataType: 'json',
	           success: function(data) {
	               console.log('success'),
	               updateCallback(data);
	           }});
	   }
	   function updateCallback(data){
		   poll();
	      //window.location.reload();
	   }
	 
	   function poll() {
	       $.ajax({
	           url: '/nnS/inform',
	           type: 'GET',
	           data: {},
	           dataType: 'json',
	           success: function(data) {
	               console.log('success'),
	               callback(data);
	           },
	           timeout: 3000,
	           complete: setTimeout(function() { poll(); }, 10000)
	           });
	   };
	   
	   function callback(data){
		      var total = data.list;
		      var totalcount = data.TOTAL;
		      var count = $(".count_number");
		      var body = $("#inform");
		      count.empty();
		      body.empty();
		      count.append(totalcount);
		      var str = "";
		      if (total == 0) {
		    	 count.css("opacity","1");
		    	 count.remove();
		         str += "<tr>" + "<td colspan='4'>새로운 알림이 없습니다.</td>"
		         + "</tr>";
		         body.append(str);
		      } else {
		            $.each(
		            data.list,
		            function(key, value) {
		               str += "<a href='#this'  name='confirm' onClick='fn_InformConfirm("+value.INFORM_NUM+")'> " 
		                  + new Date(value.INFORM_DATE).toLocaleString()
		                  + "<br/>"
		                  + value.INFORM_CONTENT
		                  + "<input type='hidden' id='INFORM_NUM' value=" + value.INFORM_NUM + ">"
		                  + "</a>";
		            });

		            body.append(str);
		            count.css("background-color","red");
		      }
		   }

</script>
<!-- header_area -->
<div class="header_area" align="center">
	<h1><a href="/nnS/main" title="nnS"><img src="/nnS/resources/images/SkinImg/mainlogo2.png" alt="nnS" style="width:200px;" align="center"/></a></h1>		

	<div class="top_menu">
		<ul>
			<c:if test="${session_MEM_ID == null }">
			<li><a style="color:#666;" href="${contextPath}/nnS/loginForm" class="log">로그인</a></li> 
			<li><a style="color:#666;" href="${contextPath}/nnS/joinForm">회원가입</a> </li>
			<li><a style="color:#666;" href="${contextPath}/nnS/findId">ID/PW찾기</a> </li>
			</c:if>
			<c:if test="${session_MEM_ID != null }">
			<li><p style="font-color:#666; font-size:12px;">${session_MEM_ID}&nbsp;님</p></li>	
				<c:if test="${session_MEM_ID == 'admin' }">
					<li><a style="color:#666;" href="/nnS/admin">관리자페이지</a></li> 	
				</c:if>
			<li><a style="color:#666;" href="${contextPath}/nnS/logout" class="log">로그아웃</a></li> 
			<li><a style="color:#666;" href="${contextPath}/nnS/myPage">마이페이지</a></li>
			<li><a style="color:#666;" href="${contextPath}/nnS/myshop">내상점</a></li> 
			</c:if>
		</ul>
		
      <c:if test="${session_MEM_ID != null}">
         <div class="dropdown" style="float:right;">
         <button class="dropbtn"><img style="width:30px; height:30px;" src="<c:url value="/resources/images/Bell.png"/>"/></button>
            <div class="count_number"></div>
            <div class="dropdown-content">
              <table id="inform">
                 <tbody>
                 </tbody>
              </table>
            </div>
       </div>
       </c:if>
	</div>

	
</div><!-- // header_area -->

