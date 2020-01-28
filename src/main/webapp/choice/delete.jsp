<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function delete_by_w_attachno() {
    frm_delete_by_w_attachno.submit();
  }
</script>
</head> 
 
<body>

<FORM name='frm_delete_by_w_attachno' method='POST' 
            action='../w_attach/delete_by_w_attachno.do'>
  <input type='hidden' name='wno' value='${param.cho_no }'>
</FORM>

<jsp:include page="/menu/top.jsp" flush='false' />
   
  <div class='menu_line'></div>
 
  <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='cho_no' value='${param.cho_no }'>
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${choiceVO.cho_title }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
          
          <c:choose>
            <c:when test="${count_by_cho_no > 0 }">
              <DIV style="text-decoration: underline;">
                관련된 첨부파일 ${count_by_cho_no } 건이 발견되었습니다.
              </DIV>
              <DIV> 
                <span style='color: #FF0000'>'삭제 진행 시 첨부파일도 삭제됩니다.</span><br>
              </DIV>
            </c:when>
            <c:otherwise>
              
            </c:otherwise>
          </c:choose>
          <button type = "submit" class="btn btn-info">삭제 진행</button>
          <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
        </div>
      </div>   
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  