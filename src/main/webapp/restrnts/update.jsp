<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
  
    <DIV class='title_line'>음식점 수정하기</DIV>
  <DIV style='margin-left: 30%; margin-top: 5%; width: 50%;'>
    <FORM name='frm' method='POST' action='./update_info.do' enctype="multipart/form-data"  class="form-horizontal">
      <input type='hidden' name='rcateno' value='${restcategrpVO.rcateno }'>
      <input type='hidden' name='restno' value='${restrntsVO.restno }'>
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'>
  
     <div class="form-group ">
        <div class="form-group col-md-6">
          <label for="rname">음식점 이름 *</label>
          <br>${restrntsVO.rname}<br>
        </div>
        <div class="form-group col-md-4">
          <label for="rcateno">분류 *</label>
          <br>${restcategrpVO.rcatename}<br>
        </div>
      </div>
     
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>메인요리 (ex. 돼지고기구이) *</label>
        <input type="text" class="form-control form-control-lg" required="required" id="rmain" name='rmain'  value='${restrntsVO.rmain}' >
      </div>
      </div>
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>한줄 소개</label>
        <input type="text" class="form-control form-control-lg"  id="rintro" name='rintro' value='${restrntsVO.rintro}' >
      </div>
      </div>
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>영업 시간 *</label>
        <input type="text" class="form-control form-control-lg" required="required" id="rtime" name='rtime' value='${restrntsVO.rtime}' >
      </div>
      </div>
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>전화번호</label>
        <input type="text" class="form-control form-control-lg" id="rcall" name='rcall' value='${restrntsVO.rcall}' >
      </div>
      </div>
      <div class="form-group">
       <label>주소 *</label><br>    
         우편번호: ${restrntsVO.rzipcode}<br>
         ${restrntsVO.raddress1}${restrntsVO.raddress2}
      </div> 
      <div class="form-group">
      <div class="form-group col-md-10">
        <label>검색어</label>
        <input type="text" class="form-control form-control-lg" id="rword" name='rword'  value='${restrntsVO.rword}' >
      </div>
      </div>
      <div class="form-group">   
        <label>음식점 대표사진</label><p style="font-size: 12px;">* 음식점 대표사진은 따로 수정 가능합니다.</p>
      </div>

      <DIV class='content_bottom_menu' style="padding-right: 20%;">
        <button type="submit" class="btn btn-info btn-lg" >다음</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  