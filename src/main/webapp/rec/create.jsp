<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>선택지 항목 등록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
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
  <DIV style='width: 80%; margin: 0px auto'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='memberno' id='memberno' value='1'> 
      <input type='hidden' name='cho_no' id='cho_no' value='${param.cho_no }'> 
      
      <div class="form-group">
      <h3>선택 항목 등록<br></h3><br>
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='content'  
                   value='' placeholder="내용" required="required" style="width: 50%; text-align: center;">
                   <br>
        </div> 
      </div>   
      
      <TR>
    </TR><br>
  
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
 
  