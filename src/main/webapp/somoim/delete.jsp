<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
// FK 값에 따른 contents 삭제
function delete_by_somoimno() {
 frm_delete_by_somoimno.submit();
}
</script>
 
</head> 
 
<body>

<jsp:include page="/menu/top.jsp" />
<jsp:include page="/menu/s_top.jsp" />

<FORM name='frm_delete_by_somoimno' method='POST' action='../s_write/delete_by_somoimno.do'>
  <input type='hidden' name='somoimno' value='${somoimVO.somoimno }'>
  
</FORM> 

<DIV class='title_line' style='width: 15%; font-size: 20px;'>소모임 삭제</DIV>

<FORM name='frm' method='POST' action='./delete.do'>
  <input type='hidden' name='somoimno' value='${somoimVO.somoimno }'>
  <fieldset class='fieldset_basic'>
    <ul style='margin-left: 20px; margin-top: 20px;'>
      <li class='li_center' style='font-weight: bold;'>
        삭제할 소모임 이름: ${somoimVO.name }
      </li>      
      
      <c:if test="${count_by_somoimno > 0 }">
        <li class='li_center' style='text-decoration: underline; color: #FF0000;'>
          관련된 글 ${count_by_somoimno } 건이 발견되었습니다.<br>
        </li>
        <li class='li_center'>  
          관련글을 삭제해야 소모임을 삭제 할 수 있습니다.<br>
          <span style='color: #FF0000; text-decoration: underline;'>관련글이 삭제되면 복구 할 수 없습니다.</span><br>
          관련 글을 모두 삭제 하시겠습니까?
          <button type="button" onclick="delete_by_somoimno(); opener.location.reload();" 
                     class="btn btn-primary" style='margin: 3px; padding: 3px;'>예(삭제진행)</button>   
        </li>
      </c:if>
      
      <li class='li_center'>
        삭제하면 복구 할 수 없습니다.<br>
        삭제를 진행 하시겠습니까?
      </li>
      <li class='li_right'>
        <c:if test="${count_by_somoimno == 0 }">
          <button type="submit" class="btn btn-primary">삭제 진행</button>
        </c:if>  
        <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>  
      </li>         
    </ul>
  </fieldset>
</FORM>

<jsp:include page="/menu/s_bottom.jsp" />
<jsp:include page="/menu/bottom.jsp" />

</body>
 
</html> 
  
   