<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SoloWorld</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 <script type="text/javascript">
 
 function delete_recom() {
   var frm_recom = $('#frm_recom');
   var params = frm_recom.serialize();
   /* alert(params); 
   return;  */


   $.ajax({
     url: "./delete.do", // action 대상 주소
     type: "post",           // get, post
     cache: false,          // 브러우저의 캐시영역 사용안함.
     async: true,           // true: 비동기
     dataType: "json",   // 응답 형식: json, xml, html...
     data: params,        // 서버로 전달하는 데이터 
     success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
       alert('succes');
       location.reload();
     }, 
     // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
     error: function(request, status, error) { // callback 함수
       var msg = 'ERROR<br><br>';
       msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
       msg += '<strong>error</strong><br>'+error + '<hr>';
       console.log(msg);
     } 
   });
 } 
 
 </script>
</head>
 
<body>
  
</body>
 
</html>
    
 
  