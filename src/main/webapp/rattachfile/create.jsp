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
  
    <DIV class='title_line'>음식점 메뉴 등록</DIV>
  <DIV style='margin-left: 30%; margin-top: 5%; width: 50%;'>
    <FORM name='frm' method='POST' action='./create_ratf.do' enctype="multipart/form-data"  class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='rcateno' id='rcateno' value='${param.rcateno }'>
      <input type='hidden' name='restno' id='restno' value='${param.restno }'>
     
      <div class="form-group" >        
        <div class="col-md-12">
        <label>음식점 첨부사진 *</label><br> 
          <input type='file' class="form-control-file" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>    

      <DIV class='content_bottom_menu' style="padding-right: 20%;">
        <button type="submit" class="btn btn-info btn-lg" >등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?rcateno=${param.rcateno}'" 
                    class="btn btn-info btn-lg">그만두기[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  