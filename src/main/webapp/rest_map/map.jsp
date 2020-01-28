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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
<script type="text/javascript"></script> 
</head> 
 
<body>
 <jsp:include page="/menu/top.jsp" />
  <DIV class='title_line'>지도로 음식점 찾기</DIV>
 
  <!-- 지도를 담을 영역 만들기 -->
  <div id="map" style="margin:5% 5% 5% 10%; width:600px;height:500px;float:left;"></div>
  
  <div id="clickMarker" style="margin-top:6%; width:600px; float:left;"></div>
  
  <!-- 실제 지도를 그리는 Javascript API를 불러오기 -->
  <script type="text/javascript" 
  src="//dapi.kakao.com/v2/maps/sdk.js?appkey=149fab470d075509dd16a58d3c604783&libraries=services,clusterer,drawing"></script>
  <script>
  
    // 지도 생성
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
      center : new kakao.maps.LatLng(37.517956, 127.044595), // 지도의 중심좌표
      level : 10 // 지도의 확대 레벨
    });
    
    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    
    function panTo() {
      // 이동할 위도 경도 위치를 생성합니다 
      var moveLatLon = new kakao.maps.LatLng(33.450580, 126.574942);
      
      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
      map.panTo(moveLatLon);            
    }
    
 // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }
 
    // 주소-좌표 변환 객체 생성
    var geocoder = new kakao.maps.services.Geocoder();
    
    
    </script>
    
    <c:forEach var="restrntsVO" items ="${list }">
      <script>
        //주소로 좌표 검색
        geocoder.addressSearch('${restrntsVO.raddress1}${restrntsVO.raddress2}', function(result, status){
          // 정상적으로 검색 완료됐으면
          if(status === kakao.maps.services.Status.OK){
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            
            // 결과값으로 받은 위치를 마커로 표시 
            var marker = new kakao.maps.Marker({
              map: map,
              position: coords
            }); 
            
            // 마커에 표시할 인포윈도우를 생성합니다 
            var infowindow = new kakao.maps.InfoWindow({
                content: '${restrntsVO.rname}'  // 인포윈도우에 표시할 내용
            });
            
            kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
            
           // 마커에 클릭이벤트를 등록합니다
              kakao.maps.event.addListener(marker, 'click', function() {
                    
                var message ='<h1>${restrntsVO.rname}</h1>';
                message += '<h5 class="card-text">${restrntsVO.rmain}</h5><br><br><hr>';
                message += '<div class="context"><IMG src="./images/pin.png" style="padding-right: 1em;">${restrntsVO.raddress1}${restrntsVO.raddress2}</div><hr>';
                message += '<div class="context"><IMG src="./images/clock.png" style="padding-right: 1em;">${restrntsVO.rtime}</div><hr>';
                message += '<div class="context"><IMG src="./images/call.png" style="padding-right: 1em;">${restrntsVO.rcall}</div><hr>';
                message += '<button type="button" style="float:right;" class="btn btn-info btn-lg" onclick="location.href='
                message += "'../restrnts/read.do?restno=${restrntsVO.restno}'"
                message += '">자세히 보기</button>';
                    
                var resultDiv = document.getElementById('clickMarker'); 
                resultDiv.innerHTML = message;
            });
           
          }
        }); 
      </script> 
    </c:forEach>
    
    

</body>
</html> 
 
 