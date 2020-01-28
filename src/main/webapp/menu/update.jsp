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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script>            
        $(document).ready (function () {                
            $('.btnAdd').click (function () {                                        
                $('.buttons').append (                        
                    '<input type="text" class="form-control-lg" required="required" name="mname" style="width: 30%;"><input type="text" class="form-control-lg" required="required" name="mprice" style="width: 20%;"><input type="button" class="btnRemove" value="Remove"><br>'                    
                ); // end append                            
                $('.btnRemove').on('click', function () { 
                    $(this).prev().remove (); // remove the textbox
                    $(this).prev().remove (); 
                    $(this).next ().remove (); // remove the <br>
                    $(this).remove (); // remove the button
                });
            }); // end click                                            
        }); // end ready        
    </script>    
</head> 
 
<body>

<jsp:include page="/menu/top.jsp" flush='false' /> 
  
    <DIV class='title_line'>음식점 메뉴 등록</DIV>
  <DIV style='margin-left: 30%; margin-top: 5%; width: 50%;'>
    <FORM name='frm' method='POST' action='./create_menu.do' enctype="multipart/form-data"  class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <input type='hidden' name='restno' id='restno' value='${param.restno }'>
      <input type='hidden' name='rcateno' id='rcateno' value='${param.rcateno }'>
     
      <div class="form-group" >        
        <div class="buttons"> 
        <label>1인 메뉴 *</label><br>
        <c:forEach var="menuVO" items="${menu_list }">                    
          <input type="text" class="form-control-lg" required="required" name="mname" style="width: 30%;"placeholder="메뉴명" value='${menuVO.mname}' >
          <input type="text" class="form-control-lg" required="required" name="mprice" style="width: 20%;"placeholder="가격" value='${menuVO.mprice}' >
        </c:forEach>
          <input type="button" class="btnAdd" value="추가"><br>        
        </div>     
      </div>    
      

      <DIV class='content_bottom_menu' style="padding-right: 20%;">
        <button type="submit" class="btn btn-info btn-lg" >다음</button>
        <button type="button" 
                    onclick="location.href='./read.do?restno=${param.restno}'" 
                    class="btn btn-info btn-lg">수정 끝내기</button>
      </DIV>
      
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  