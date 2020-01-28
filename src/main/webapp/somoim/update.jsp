<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
 
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
<jsp:include page="/menu/top.jsp" />
<jsp:include page="/menu/s_top.jsp" />

<DIV class='title_line' style='width: 15%; font-size: 20px;'>소모임 설정</DIV>

<FORM name='frm' method='POST' action='./update.do'>
  <input type='hidden' name='somoimno' value='${somoimVO.somoimno }'>
  <fieldset class='fieldset_basic'>
    <ul style='margin-left: 20px; margin-top: 20px;'>
      <li class='li_none'>
        <label class='label_basic'>소모임 이름</label>
        <input type='text' name='name' value='${somoimVO.name }' required="required" autofocus="autofocus" style='width: 30%;'>
      </li>
      <li class='li_none'>
        <label class='label_basic'>출력 순서</label>
        <input type='number' name='seqno' value='${somoimVO.seqno}' required="required" placeholder="${seqno }" min="1" max="1000" step="1" style='width: 10%;'>
      </li>
      <li class='li_none'>
        <label class='label_basic'>출력 형식</label>
        <select name='visible'>
        <option value='Y' ${somoimVO.visible == 'Y' ? "selevted=='selected'":"" }>Y</option>
        <option value='N' ${somoimVO.visible == 'Y' ? "selevted=='selected'":"" }>N</option>
      </select>
      </li>
      <li class='li_right'>
        <button type="submit" class="btn btn-primary">수정</button>
        <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
      </li>         
    </ul>
  </fieldset>
</FORM>

<jsp:include page="/menu/s_bottom.jsp" /> 
<jsp:include page="/menu/bottom.jsp" /> 
 
</body>
 
</html> 
  
   