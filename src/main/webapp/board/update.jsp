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

<FORM name='frm' method='POST' action='./update.do'>
  <input type='hidden' name='boardno' value='${boardVO.boardno }'>
  <fieldset class='fieldset_basic'>
    <ul>
  
      <li class='li_none'>
        <label class='label_basic'>변경할 게시판 이름 </label>
        <input type='text' name='name' value='${boardVO.name }' required="required" autofocus="autofocus">
      </li>
      <li class='li_right'>
        <button type="submit" class="btn btn-info">수정 진행</button>
        <button type="button" class="btn btn-info" onclick="window.close();">닫기</button>
      </li>         
    </ul> 
  </fieldset>
</FORM>
 
</body>
 
</html> 
  
   