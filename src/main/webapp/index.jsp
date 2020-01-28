<%@ page contentType="text/html; charset=UTF-8" %>
 
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
  
  
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
 $(function() {
      $("#food").on("click", function() {
        $("#divBox").fadeIn();  // id가 "divBox"인 요소를 점점 나타나게 함.
      });
      $("#fadeOutBtn").on("click", function() {
        $("#divBox").fadeOut(); // id가 "divBox"인 요소를 점점 사라지게 함.
      });
    });
 </script> 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body style="background-color: rgba(240, 240, 240,0.8); "> 
<jsp:include page="/menu/top.jsp" flush='false' />
   
<!--   <DIV style='width: 80%; margin:100px auto;'> 
    <div style="width: 100%;  margin-top: 20px;">
    <DIV  style='clear: both; width:80%;
                    border-bottom: dotted 0.5px #777777;
                    margin: 2px auto;'></DIV> 
    <div style="width: 100%;text-align: center; margin: 50px auto">
         <span style="font-size: 1.5em; border:thick">인사말</span> 
    </div>
    <DIV style='clear: both; width:80%;
                   border-bottom: dotted 1px #777777;
                   margin: 2px auto;'></DIV>
    </div>  
  </DIV> -->
  
 <div style="width: 100%; height: 500px;  margin-top: 50px; background-color: #ffcc99">
      <div style=" width:30%;  float:left; height: 500px; text-align: center; padding-top: 50px;"  id="food">
          <a href="./rest_categrp/list.do"><span style="font-size: 5em;">FOOD </span><br> 
          <span>Information</span></a>
      </div>
      <div style=" width:30%; float:left; height: 500px; text-align: center; padding-top: 200px;">
           <span style="font-weight:bold;font-size:1.2em; color: #222222">혼자 먹는 음식
                                                                      <br> 맛집 소개소!
                                                                      </span> 
      </div>
      <div style="float:right; width: 40%">
         <a href="#"><IMG src="./menu/images/main_food.jpg" style="height: 500px; "></a>
      </div>
 </div> 
 <br><br><br> <br><br><br> <br><br><br>
   <div style="width: 100%; height: 500px;  margin-top: 50px; background-color: #cce6ff">
      <div style="float:left; width: 40%;">
         <a href="#"><IMG src="./menu/images/main_somoim.jpg" style="height: 500px; width: 100% "></a>
      </div>
     
      <div style=" width:30%; float:left; height: 500px; text-align: center; padding-top: 180px;">
           <span style="font-weight:bold;font-size:1.2em; color: #222222">일상에 지치고 힘들 땐 
                                                                      <br> 모두와 함께!
                                                                      <br> 주변 사람들과 이야기해봐요.
                                                                      <br><span style="font-size: 0.7em; font-weight: normal;"> 같은 관심사나 취미를 공유할 수 있어요.</span>
                                                                      </span> 
      </div>
       <div style=" width:30%;  float:right; height: 500px; text-align: center; padding-top: 350px;"  id="food">
          <a href="#"><span style="font-size: 5em;">Together </span><br>
          <span>Somoim</span></a>
      </div>
      
 </div> 
 <br><br><br> <br><br><br> <br><br><br>
   <div style="width: 100%; height: 500px;  margin-top: 50px; background-color: rgba(110,213,245,60);">
      <div style=" width:30%;  float:left; height: 500px; text-align: center; padding-top: 165px;"  id="food">
          <a href="./b_write/list.do"><span style="font-size: 5em;">Write </span><br>
          <span>scribble</span></a>
      </div> 
      
      <div style=" width:30%; float:left; height: 500px; text-align: center; padding-top: 220px;">
           <span style="font-weight:bold;font-size:1.2em; color: #222222">자유롭게 쓰자!
                                                                      <br> 선택하기 힘든 건 물어보자!
                                                                      </span> 
      </div>
       <div style="float:right; width: 40%;">  
         <a href="${root }/team1/board/list.do"><IMG src="./menu/images/main_board.png" style="height: 500px; width: 100% "></a>
      </div>
      
 </div> 
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
  
         