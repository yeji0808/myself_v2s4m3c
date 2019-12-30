<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('wcontent');  // <TEXTAREA>태그 id 값
  };
</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='boardno' value='${boardVO.boardno }'>
      <input type='hidden' name='wno' value='${writeVO.wno }'>
      
        <div style="width:80%; margin:0px auto; padding-top: 50px">
       <div style="float: left;clear:both; padding-left: 45px">
        <A href='./list.do?boardno=${param.boardno }'>${boardVO.name }</A> 
      </div>
       <div style="float: right; ">
         <A href="javascript:location.reload();">새로고침</A>
      </div>
      </div>
      <div style="width: 80%;margin:0px auto; padding-top: 50px">
      
      <div class="form-group">   
        <label class="col-md-1 control-label">제목</label>
        <div class="col-md-11" >
          <input type='text' class="form-control input-lg" name='wtitle' value='${writeVO.wtitle}' required="required" >
        </div>
      </div>   
      <div class="form-group">   
        <label class="col-md-1 control-label">내용</label>
        <div class="col-md-11">
          <textarea  class="form-control input-lg" name='wcontent' id='wcontent' rows='10'>${writeVO.wcontent}</textarea>
        </div> 
      </div>
      
      <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>검색어</span></label>
        <div class="col-md-11" > 
          <input type='text' class="form-control input-lg" name='wword' value='${writeVO.wword }' placeholder="검색어">
        </div>
      </div>
      
      <DIV style='text-align: right; '> 
        <button type="submit" class="btn btn-info">변경된 내용 저장</button>
        <button type="button" onclick="location.href='./list.do?boardno=${boardVO.boardno}'" class="btn btn-info">취소[목록]</button>
      </DIV>
      </div>
  
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 
 