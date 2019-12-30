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
  <input type='hidden' name='wno' value='${param.wno }'>            
  <input type='hidden' name='boardno' value='${param.boardno }'>
</FORM>

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../board/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?boardno=${boardno }'>${boardVO.name }</A> >
    삭제
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?boardno=${param.boardno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
  
  <div class='menu_line'></div>
 
  <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='wno' value='${param.wno}'>
      <input type="hidden" name="boardno" value="${param.boardno }">
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${writeVO.wtitle }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
          
          <c:choose>
            <c:when test="${count_by_wno > 0 }">
              <DIV style="text-decoration: underline;">
                관련된 첨부파일 ${count_by_wno } 건이 발견되었습니다.
              </DIV>
              <DIV> 
                관련된 첨부파일을 삭제해야 글을 삭제 할 수 있습니다.<br>
                <span style='color: #FF0000'>첨부 파일이 삭제되면 복구 할 수 없습니다.</span><br>
                첨부 파일을 삭제 하시겠습니까?
                <button type='button' onclick="delete_by_w_attachno();" class="btn btn-info">예(삭제진행)</button> 
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
 
  