<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>

<FORM name='frm' method='POST' action='./update_img.do' enctype="multipart/form-data" class="form-horizontal">
  <input type='hidden' name='restno' value='${restrntsVO.restno }'>
  <fieldset class='fieldset_basic'>
      <div class="form-group">   
        <label>음식점 대표사진</label>
          <input type='file' class="form-control-file" name='fnameMF'
          value='' placeholder="파일 선택"></input>
      </div>
      <DIV class='content_bottom_menu' >
        <button type="submit">수정 진행</button>
        <button type="button" onclick="window.close();">닫기</button>
      </DIV>         

  </fieldset>
</FORM>
 
</body>
 
</html> 
  
   