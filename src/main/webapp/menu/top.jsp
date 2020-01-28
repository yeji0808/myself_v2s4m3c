<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
</head>
<body style="background-color: rgba(255, 255, 255,0.8); background-size: 100%;">

  <!-- 화면 상단 메뉴 --> 
  <div class="headline1" style="background-image: url(${root}/css/images/main_photo.jpg);"> 
    
    <DIV class="headline2"  >  
       <span >  
          <p onclick="location.href='${root }/index.do' " style="font-size: 2em;  color: #f2f2f2;">나 혼자 먹는다!</a> 
        </span>   
    </div>  
    <div class="login_frame" style="float: right;">
      
      <c:choose>
        <c:when test="${sessionScope.id == null}"> 
          <span style="font-size: 1em; ">
            <a style="color: #dddddd; " href='${root}/members/login.do'>LOGIN</a>
          </span> 
        </c:when>
        <c:otherwise>
          ${sessionScope.id }<A class='menu_link'  href='${root}/member/logout.do' style="font-size: 1em; ">Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose>
      
    </div>
    
  </div>
  <div class="menubar">
<ul>
 <li style='width:25%;text-align: center;'><a href="${root }/index.do">Home</a></li>

      <li style='width: 25%; text-align: center;'><a href="#">음식
          정보</a>
        <ul>
          <li><a href="${root }/rest_categrp/list.do">카테고리로 찾기</a></li>
          <li><a href="${root }/rest_map/map.do">지도로 찾기</a></li>
          <li><a href="${root }/restrnts/create_info.do">음식점등록하기</a></li> 
        </ul>
      </li>
      <li style='width: 25%; text-align: center;'><a
        href="${root}/somoim/list.do">소모임</a></li>
      <li style='width: 25%; text-align: center;'><a href=""
        id="current">게시판</a>
        <ul>
          <li><a href="${root }/b_write/list.do">자유게시판</a></li>
          <li><a href="${root }/choice/list.do">추천해주세요</a></li>
        </ul></li>
    </ul>
</div>                                   
    
  
   






