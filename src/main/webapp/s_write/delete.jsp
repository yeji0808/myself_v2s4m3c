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

<script type="text/javascript">
// FK 값에 따른 write 삭제
function delete_by_writeno() {
 frm_delete_by_writeno.submit();
} 
</script>

</head> 
 
<body>

<FORM name='frm_delete_by_writeno' method='POST' 
          action='../atcfile/delete_by_writeno.do'>
    <input type='hidden' name='writeno' value='${param.writeno }'>
    <input type='hidden' name='somoimno' value='${param.somoimno }'>
</FORM> 
  
<jsp:include page="/menu/s_top.jsp" flush='false' />
 
  <ASIDE style='float: left;'>
    <A href="../somoim/list.do">소모임</A> >
    <A href="../somoim/read.do?somoimno=${somoimVO.somoimno}">${somoimVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='javascript:history.back();'>목록</A>
    <span class='menu_divide' >│</span> 
    <A href='./delete.do?somoimno=${somoimno }&writeno=${writeno }'>삭제</A>
  </ASIDE> 
  
  <div class='menu_line'></div>
 
  <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='writeno' value='${param.writeno}'>
      <input type="hidden" name="somoimno" value="${param.somoimno }">
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${writeVO.title }<br><br>
          <span style='color: red;'>삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.</span><br><br>
          
          <c:choose>
            <c:when test="${count_by_writeno > 0 }">
              <DIV style='text-decoration: underline;'>
                관련된 첨부파일 ${count_by_writeno } 건이 발견되었습니다.<br>
              </DIV>
              <DIV>  
                관련된 첨부파일을 삭제해야 글을 삭제 할 수 있습니다.<br>
                <span style='color: #FF0000; text-decoration: underline;'>첨부파일이 삭제되면 복구 할 수 없습니다.</span><br>
                첨부파일을 삭제 하시겠습니까?
                <button type="button" onclick="delete_by_writeno(); opener.location.reload();" 
                	         class="btn btn-primary" style='margin: 3px; padding: 3px;'>예(삭제진행)</button>   
              </DIV>
            </c:when>
            <c:otherwise>
              <button type="submit" class="btn btn-primary">삭제</button>
            </c:otherwise>
          </c:choose>       
          
          <button type ="button" onclick="location.href='./read.do?somoimno=${param.somoimno}&writeno=${param.writeno}'" class="btn btn-primary">취소</button>
        </div>
      </div>   
  </FORM>
 
<jsp:include page="/menu/s_bottom.jsp" flush='false' />
</body>
 
</html> 