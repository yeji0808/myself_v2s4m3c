<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

</head> 
 
<body>

<jsp:include page="/menu/top.jsp" flush='false' /> 
  
    <DIV class='title_line'>음식점 등록하기</DIV>
  <DIV style='margin-left: 30%; margin-top: 5%; width: 50%;'>
    <FORM name='frm' method='POST' action='./create_info.do' enctype="multipart/form-data"  class="form-horizontal">
               
      <!-- FK memberno 지정 -->
  
     <div class="form-group ">
        <div class="form-group col-md-6">
          <label for="rname">음식점 이름 *</label>
          <input type="text" class="form-control form-control-lg" required="required" id="rname" name='rname' >
        </div>
        <div class="form-group col-md-4">
          <label for="rcateno">분류 *</label>
          <select id="rcateno" class="form-control form-control-lg" required="required" name="rcateno" >
            <option value="0" selected>분류</option>
            <option value="1">한식</option>
            <option value="2">중식</option>
            <option value="3">양식</option>
            <option value="4">일식</option>
          </select>
        </div>
      </div>
     
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>메인요리 (ex. 돼지고기구이) *</label>
        <input type="text" class="form-control form-control-lg" required="required" id="rmain" name='rmain'  placeholder="표지에 띄울 메인요리">
      </div>      
      </div>  
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>한줄 소개</label>
        <input type="text" class="form-control form-control-lg"  id="rintro" name='rintro' placeholder="음식점을 간단하게 소개해주세요">
      </div>
      </div>
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>영업 시간 *</label>
        <input type="text" class="form-control form-control-lg" required="required" id="rtime" name='rtime' >
      </div>
      </div>
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>전화번호</label>
        <input type="text" class="form-control form-control-lg" id="rcall" name='rcall' >
      </div>
      </div>
      <div class="form-group">
       <label>주소 *</label>    
         <input type='text' class="form-control form-control-lg" name='rzipcode' id='rzipcode' 
                   required="required" style='width: 30%;' placeholder="우편번호">
         <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-lg">  
      <!-- ----- DAUM 우편번호 API 시작 ----- -->
      <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
        <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
      </div>
       
      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
      <script>
          // 우편번호 찾기 화면을 넣을 element
          var element_wrap = document.getElementById('wrap');
       
          function foldDaumPostcode() {
              // iframe을 넣은 element를 안보이게 한다.
              element_wrap.style.display = 'none';
          }
       
          function DaumPostcode() {
              // 현재 scroll 위치를 저장해놓는다.
              var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
              new daum.Postcode({
                  oncomplete: function(data) {
                      // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
       
                      // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                      var fullAddr = data.address; // 최종 주소 변수
                      var extraAddr = ''; // 조합형 주소 변수
       
                      // 기본 주소가 도로명 타입일때 조합한다.
                      if(data.addressType === 'R'){
                          //법정동명이 있을 경우 추가한다.
                          if(data.bname !== ''){
                              extraAddr += data.bname;
                          }
                          // 건물명이 있을 경우 추가한다.
                          if(data.buildingName !== ''){
                              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                          }
                          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                          fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                      }
       
                      // 우편번호와 주소 정보를 해당 필드에 넣는다.
                      document.getElementById('rzipcode').value = data.zonecode; //5자리 새우편번호 사용
                      document.getElementById('raddress1').value = fullAddr;
       
                      // iframe을 넣은 element를 안보이게 한다.
                      // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                      element_wrap.style.display = 'none';
       
                      // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                      document.body.scrollTop = currentScroll;
                      
                      $('#raddress2').focus();
                  },
                  // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                  onresize : function(size) {
                      element_wrap.style.height = size.height+'px';
                  },
                  width : '100%',
                  height : '100%'
              }).embed(element_wrap);
       
              // iframe을 넣은 element를 보이게 한다.
              element_wrap.style.display = 'block';
          }
      </script>
      <!-- ----- DAUM 우편번호 API 종료----- -->
      </div>
      <div class="form-group">
          <input type='text' class="form-control form-control-lg" name='raddress1' id='raddress1' 
                     value='' required="required" style='width: 80%;' placeholder="주소">
      </div>     
      <div class="form-group">   
          <input type='text' class="form-control form-control-lg" name='raddress2' id='raddress2' 
                     value='' required="required" style='width: 80%;' placeholder="상세 주소">
      </div>   
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>검색어</label>
        <input type="text" class="form-control form-control-lg" id="rword" name='rword'  placeholder="종로맛집, 고기, 매운음식">
      </div>
      </div>
      <div class="form-group">   
        <label>음식점 대표사진</label>
          <input type='file' class="form-control-file" name='fnameMF' 
          value='' placeholder="파일 선택"></input>
      </div>

      <DIV class='content_bottom_menu' style="padding-right: 20%;">
        <button type="submit" class="btn btn-info btn-lg" >다음</button>
      </DIV>
       
    </FORM>
  </DIV>


  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  