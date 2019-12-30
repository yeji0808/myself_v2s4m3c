<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<DIV class='container-fluid' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <DIV class='top_menu_label'>Resort 0.1 영화와 여행이있는 리조트</DIV>
    <NAV class='top_menu_list'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='${root}' >HOME</A> <span class='top_menu1'> | </span>
      
      <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='${root}/member/login.do' >Login</A> <span class='top_menu1'> | </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/member/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose>

      <A class='menu_link'  href='${root}/rest_categrp/list.do'>카테고리로 찾기</A> <span class='top_menu1'> | </span>    
      <A class='menu_link'  href='${root}/rest_map/map.do'>지도로 찾기</A> <span class='top_menu1'> | </span>    
      <A class='menu_link'  href='${root}/restrnts/create.do'>음식점 등록하기</A>  
          
    </NAV>
  </DIV>
   
</DIV>






