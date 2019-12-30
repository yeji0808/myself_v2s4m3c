<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
       ▷ <A href='${root}/contents/list_all.do'>전체글(${total_count })</A>
    
       <UL style='padding-left: 30px;'>   
         <c:forEach var="categrpVO" items = "${list }">
           <c:set var="categrpno" value="${categrpVO.categrpno }" />
           <li style='font-size: 0.9em;'>
             <A href='${root}/contents/list.do?categrpno=${categrpno }' style='font-size: 0.9em;'>${categrpVO.name }</A> (${categrpVO.cnt })           
           </li>     
         </c:forEach> 
       </UL>
  
  
  
  
  
  
       