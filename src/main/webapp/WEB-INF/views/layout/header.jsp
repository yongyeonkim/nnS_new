<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<script type="text/javascript">
   var onSearch = function(){   
      submit();  
   };   
</script>

<!--  Header 영역 -->
<div class="header_area">
   <h1><a href="/nnS/main" title="nnS#"><img class="main_image" src="<c:url value="/resources/images/mainlogo.png"/>" alt="nnS#"/></a></h1>   
   <div class="search_main">
      <div class="search_inner">
         <form action="/nnS/shop" method="post">
            <fieldset>
               
               <select name="searchType">
                 <option value="n">-----</option>
                 <option value="title">상품명</option>
                 <option value="content">내용</option>
                 <option value="brand">브랜드</option>
                </select>
               <input type="text" class="txt" placeholder="Search" name="keyword"/>&nbsp;
               <input type="submit" value="검색" class="search_btn" onClick="onSearch()"/>
            </fieldset>
         </form>
      </div>
   </div>
   <div class="top_menu">
      <ul>
         <c:if test="${session_MEM_ID == null }">
         <li><a href="${contextPath}/nnS/loginForm" class="log">로그인</a></li> 
         <li><a href="${contextPath}/nnS/joinForm">회원가입</a> </li>
         <li><a href="${contextPath}/nnS/findId">ID/PW찾기</a> </li>
         <li><a href="${contextPath}/nnS/myPage">마이페이지</a></li>
         <li><a href="${contextPath}/nnS/loginForm">내상점</a></li> 
         </c:if>
         <c:if test="${session_MEM_ID != null }">
         <li>${session_MEM_ID}&nbsp;님</li>   
            <c:if test="${session_MEM_ID == 'admin' }">
               <li><a href="/nnS/main">관리자페이지</a></li>    
            </c:if>
         <li><a href="${contextPath}/nnS/logout" class="log">로그아웃</a></li> 
         <li><a href="${contextPath}/nnS/myPage">마이페이지</a></li>
         <li><a href="${contextPath}/nnS/myshop">내상점</a></li> 
         </c:if>
      </ul>
   </div>
</div>

<!-- 내상점 / 커뮤니티 창일 경우에 띄워주는 메뉴 시작 -->
<%-- <c:if test="${session_shopAndCommunity}"> --%>
   <div class="tab_cate">    
      <div class="tabs_area">  
         <ul class="tabs">

            <li><a href="/nnS/shop/allGoodsList" class="tab_a1"><span>쇼핑몰</span></a></li>
            <li><a href="/nnS/community/noticeList" class="tab_a2"><span>커뮤니티</span></a></li>
         </ul>
      </div>
   </div>
<%-- </c:if> --%>
<!--//메뉴 끝-->