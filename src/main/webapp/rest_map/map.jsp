<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>지도로 음식점 찾기</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
<script type="text/javascript">
</script>
 
</head> 
 
<body>
 <jsp:include page="/menu/top.jsp" />
  <DIV class='title_line'>지도로 음식점 찾기</DIV>
 
  <!-- 지도를 담을 영역 만들기 -->
  <div id="map" style="width:500px;height:400px;"></div>
  
  <!-- 실제 지도를 그리는 Javascript API를 불러오기 -->
  <script type="text/javascript" 
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=149fab470d075509dd16a58d3c604783"></script>
  
  <script type="text/javascript">
    var container = document.getElementById('map');
    var options = {
      center: new kakao.maps.LatLng(33.450701, 126.570667),
      level: 3
    };
  
      var map = new kakao.maps.Map(container, options);
    </script>
 

</body>
 
</html> 
 
 