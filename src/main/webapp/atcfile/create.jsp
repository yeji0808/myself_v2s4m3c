<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<jsp:include page="/menu/s_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./list.do?somoimno=${somoimVO.somoimno }'>${somoimVO.name }</A> >
    신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?somoimno=${param.somoimno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
               enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK somoimno 지정 -->
      <input type='hidden' name='somoimno' id='somoimno' value='${param.somoimno }'>
      <input type='hidden' name='writeno' id='writeno' value='${param.writeno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-primary">파일 전송</button>
        <button type="button" 
                    onclick="location.href='../s_write/read.do?somoimno=${param.somoimno}&writeno=${param.writeno }'" 
                    class="btn btn-primary">취소</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/s_bottom.jsp" flush='false' />
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  