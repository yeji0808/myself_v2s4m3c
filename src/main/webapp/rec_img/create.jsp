<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <HR>
 
  <DIV style='width: 80%; margin:0px auto'>
    <FORM name='frm' method='POST' action='../rec_img/create.do' 
               enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK boardno 지정 -->
      <input type='hidden' name='recom_no' id='recom_no' value='${param.recom_no }'>
      <input type='hidden' name='cho_no' id='cho_no' value='${param.cho_no }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">파일 전송</button>
        <button type="button" 
                    onclick="location.href='./list.do?boardno=${param.boardno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  