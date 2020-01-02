<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

</script>
 
</head> 
 
<body>
 
  <DIV class='title_line' style='width: 10%; font-size: 26px;'>소모임</DIV>
  
    <DIV class='container'>
      <DIV id='panel_create' style='padding: 10px 0px 10px 0px; width: 100%; text-align: center;'>
        <H1 style='text-align: left; font-size: 20px; font-weight: bold;'>내 목록</H1><br>

        <DIV style='width: 23%; float: left; margin: 0.5%; padding: 0.5%; background-color: #EEEEEE;' class="img-rounded" alt="Cinque Terre">               
          <A href="./create.do" title='소모임 만들기'><IMG src='./images/plus.png' class="img-rounded" alt="Cinque Terre" style='width: 100%; height: 150px;'></A><br>
          <span style='font-size: 1.2em;'>소모임 만들기</span><br><br>
        </DIV>
      
        <c:forEach var="somoimVO" items="${list }"> 
        <c:set var="thumb" value="${somoimVO.thumb.toLowerCase() }" />     
          <DIV style='width: 23%; float: left; margin: 0.5%; padding: 0.5%; background-color: #EEEEEE;' class="img-rounded" alt="Cinque Terre">   
          
            <c:choose>
             <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <A href="./read.do?somoimno=${somoimVO.somoimno }" title='${somoimVO.name}'>
                <IMG src='./storage/${somoimVO.thumb }' class="img-rounded" alt="Cinque Terre" style='width: 100%; height: 150px;'></A>
              </c:when>
            </c:choose><br>
            
            <span style='font-size: 1.2em; text-align: left;'>${somoimVO.name }</span><br>    
            <span style='font-size: 0.8em; text-align: left;'>멤버 ${somoimVO.membercnt }명</span><br>
          </DIV>
      
        </c:forEach>
                         
      </DIV>  
    </DIV>
    
    <DIV class='container'>
      <DIV id='panel_create' style='padding: 10px 0px 10px 0px; width: 100%; text-align: center;'>
        <H1 style='text-align: left; font-size: 20px; font-weight: bold;'>전체 목록</H1><br>
 
        <c:forEach var="somoimVO" items="${list }"> 
        
          <DIV style='width: 23%; float: left; margin: 0.5%; padding: 0.5%; background-color: #EEEEEE;' class="img-rounded" alt="Cinque Terre">   
          
          <c:choose>
          <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
            <A href="./read.do?somoimno=${somoimVO.somoimno }" title='${somoimVO.name}'>
            <IMG src='./storage/${somoimVO.thumb }' class="img-rounded" alt="Cinque Terre" style='width: 100%; height: 150px;'></A>
          </c:when>
          </c:choose><br>
          
            <span style='font-size: 1.2em; text-align: left;'>${somoimVO.name }</span><br>    
            <span style='font-size: 0.8em; text-align: left;'>멤버 ${somoimVO.membercnt }명</span><br>
          </DIV>
      
        </c:forEach>
                         
      </DIV>  
    </DIV><br><br>
    
</body>
 
</html> 