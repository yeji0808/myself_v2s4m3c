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
  <div class="headline1" style="background-image: url(${root}/menu/images/main_photo.jpg);"> 
    
    <DIV class="headline2"  >  
       <span style="font-size: 2em;  color: #dddddd;">  
          Lorem Ipsum Dolor 
        </span>   
    </div> 
    <div class="login_frame" >
      <span style="font-size: 1em; ">
        <a style="color: #dddddd; float: right; ">LOGIN</a>
      </span> 
    </div>
    
  </div>
  <div class="menubar">
<ul>
 <li style='width:25%;text-align: center;'><a href="/team1/index.do">Home</a></li>
 
 <li style='width:25%;text-align: center;'><a href="#">음식 정보</a></li>
 <li style='width:25%;text-align: center;'><a href="http://172.16.12.8:9090/team1/somoim/list.do">소모임</a></li>
 <li style='width:25%;text-align: center;'><a href="#" id="current">게시판</a>
  <ul>
     <li><a href="http://localhost:9090/team1/board/list.do">카테고리 목록</a></li>
     <li><a href="#">골라줘</a></li> 
    </ul> 
    
 </li>
</ul>
</div>                                   
    
  
   






