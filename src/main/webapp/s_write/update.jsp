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
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js" ></script> 

<script type="text/JavaScript">
window.onload=function() {
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<jsp:include page="/menu/s_top.jsp" flush='false' />
 
  <ASIDE style='float: left;'>
    <A href="../somoim/list.do">소모임</A> >
    <A href="./list.do?somoimno=${somoimVO.somoimno}">${somoimVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./create.do?somoimno=${param.somoimno }'>등록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
  
      <input type='hidden' name='somoimno' value='${somoimVO.somoimno }'>
      <input type='hidden' name='writeno' value='${writeVO.writeno }'>
      
      <div class="form-group">   
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='title' value='${writeVO.title}' required="required" style='width: 80%;'>
        </div>
      </div>   
      <div class="form-group">   
        <div class="col-md-11">
          <textarea class="form-control input-lg" name='content' id='content' rows='10'>${writeVO.content}</textarea>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='word' value='${writeVO.word }' placeholder="검색어">
        </div>
      </div>
      
      <DIV style='text-align: right;'>
        <button type="submit" class="btn btn-primary">저장</button>
        <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
      </DIV>
  </FORM>
 
 
<jsp:include page="/menu/s_bottom.jsp" flush='false' />
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>