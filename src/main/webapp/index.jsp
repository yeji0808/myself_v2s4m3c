<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
 
  
  
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body style="background-color: rgba(240, 240, 240,0.8); "> 
<jsp:include page="/menu/top.jsp" flush='false' />
   
  <DIV style='width: 80%; margin:100px auto;'> 
  
  
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
    <div style="width: 50%; float: left; margin-top: 20px">
      <IMG src='./menu/images/resort01.jpg' style='width: 90%;'>
    </div> 
    <div style="width: 50%; float: left; margin-top: 20px">
      <IMG src='./menu/images/resort01.jpg' style='width: 90%;'>
    </div> 
    <DIV style='clear: both;'></DIV> <!-- 라인 변경 -->
    
  
    <div style="width: 50%; float: left; margin-top: 20px">
      <IMG src='./menu/images/resort01.jpg' style='width: 90%;'>
    </div> 
    <div style="width: 50%; float: left; margin-top: 20px">
      <IMG src='./menu/images/resort01.jpg' style='width: 90%;'>
    </div> 
    <DIV style='clear: both;'></DIV> <!-- 라인 변경 -->
    
    
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>
  
         