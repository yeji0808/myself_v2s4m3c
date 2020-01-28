<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>

<script type="text/javascript">
  function check_image(fnameMF){
	  // alert(fnameMF);	 
	  if (isImage(fnameMF) == false) {
		  alert('이미지 파일이 아닙니다. \n전송 가능한 파일 형식: jpg, png, gif');
		  return false;
	  } 
	  
	  return true;
  }
</script>

</head> 
 
<body>
 
  <FORM name='frm' method='POST' action='./update_image.do' enctype="multipart/form-data" class="form-horizontal" 
             onsubmit="return check_image(fnameMF.value);">
      <input type="hidden" name="somoimno" value="${somoimVO.somoimno }">
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          현재 이미지<br><br><IMG src='./storage/${somoimVO.fname }' style='width: 40%;'><br><br>
          변경할 이미지 선택<HR>
          <input type='file' style='margin: 0px auto;' name='fnameMF' id='fnameMF' value='' placeholder="파일 선택"><br><br>
          <span>변경하시겠습니까?</span><br><br>
          <button type="submit" class="btn btn-primary">변경</button>             
          <button type="button" onclick="window.close();" class="btn btn-primary">창닫기</button>
        </div>
      </div>   
  </FORM>

</body>
 
</html> 