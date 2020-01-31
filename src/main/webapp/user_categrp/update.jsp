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
<jsp:include page="/menu/top.jsp" flush='false' />
<FORM name='frm' method='POST' action='./update.do'>
  <input type='hidden' name='userno' value='${categrpVO.userno }'>
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none'>
        <label class='label_basic'>순서</label>
        <input type='number' name='seqno' value='${categrpVO.seqno }' required="required" placeholder="${seqno }" min="1" max="1000" step="1" style='width: 20%;'>
      </li>
      <li class='li_none'>
        <label class='label_basic'>그룹 이름</label>
        <input type='text' name='user_name' value='${categrpVO.user_name }' required="required" autofocus="autofocus">
      </li>
       <li class='li_none'>
        <label class='label_basic'>유저수</label>
        <input type='number' name='user_cnt' value='${categrpVO.user_cnt }' required="required" placeholder="${cnt }" min="1" max="100" step="1" style='width: 20%;'>
      </li>
      <li class='li_none'>
        <label class='label_basic'>형식</label>
        <select name='visible'>
         <option value='Y' ${categrpVO.visible == 'Y' ? "selected='selected'":"" }>Y</option>
          <option value='N' ${categrpVO.visible == 'N' ? "selected='selected'":"" }>N</option>
        </select>
      </li>
     
      <li class='li_right'>
        <button type="submit">수정 진행</button>
        <button type="button" onclick="window.close();">닫기</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
 <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
  
   