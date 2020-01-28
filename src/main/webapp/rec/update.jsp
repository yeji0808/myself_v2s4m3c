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
</script>

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">
      <input type='hidden' name='cho_no' value='${param.cho_no }'>
      <input type='hidden' name='recom_no' value='${param.recom_no }'>
      
        <div style="width:80%; margin:0px auto; padding-top: 50px">
       <div style="float: left;clear:both;padding-left: 45px">
        <A href='../choice/list.do'>추천게시판</A> 
      </div>
       <div style="float: right; ">
         <A href="javascript:location.reload();">새로고침</A>
      </div>
      </div>
      <div style="width: 80%;margin:0px auto; padding-top: 50px">
      <div class="form-group">
      <h3>선택 항목 변경<br></h3><br>
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='content'  
                   value='' placeholder="${recVO.content }" required="required" style="width: 50%; text-align: center;">
                   <br>
        </div>
      </div>   
      
      <DIV style='text-align: right; '> 
        <button type="submit" class="btn btn-info">변경된 내용 저장</button>
        <button type="button" onclick="location.href='../choice/read.do?cho_no=${param.cho_no}'" class="btn btn-info">취소[목록]</button>
      </DIV>
      </div>
  
  </FORM>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 
 
 