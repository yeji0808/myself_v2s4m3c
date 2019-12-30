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
 
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">
   window.onload=function(){
    CKEDITOR.replace('wcontent');  // <TEXTAREA>태그 id 값
  }; 
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 <%--  <ASIDE style='float: left;'>
    <A href='../board/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?boardno=${boardVO.boardno }'>${boardVO.name }</A> >
    신규 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?boardno=${param.boardno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE>  --%>
  
  <div class='menu_line'></div>
  <DIV style='width: 80%; margin: 0px auto'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'> 
      <!-- FK boardno 지정 -->
      <input type='hidden' name='boardno' id='boardno' value='${param.boardno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='wtitle' value='' placeholder="제목" required="required" >
        </div>
      </div>   
      
      <TR>
      <TD><TEXTAREA name='wcontent' id='wcontent' rows='10' cols='70'></TEXTAREA></TD>
    </TR><br>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='wword'  value='' placeholder="검색어">
        </div>
      </div>

  
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?boardno=${param.boardno}'" 
                    class="btn btn-info">취소[목록]</button>
                    </DIV>
                     </form>
  </DIV>



  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  