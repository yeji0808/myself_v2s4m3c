<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Solo world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
function update_form(boardno) {
  // alert('admin2no: ' + admin2no);
   
  var url = './update.do?boardno=' + boardno;
  var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(boardno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './delete.do?boardno=' + boardno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=350px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

</script>
  
</head> 
 
<body>
 <jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>게시판 목록</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 80%; text-align: center; margin: 0px auto'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
      <label>게시판 이름</label>
      <input type='text' name='name' value='' required="required" style='width: 25%;'>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
<div style='width: 80%;margin: 0px auto; '>
<table class="table table-condensed" style='width: 100%;  margin-top: 20px'>
  <colgroup>
    <col style='width: 70%;'/>    
    <col style='width: 30%;'/>
  </colgroup>
 
  <thead>   
  <TR>
    <TH style='text-align: center;'>게시판이름</TH>
    <TH style='text-align: center;'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="boardVO" items = "${list }">
    <c:set var="boardno" value="${boardVO.boardno }" />
    
    <TR style="text-align: center"> 
      <TD>
        <A href='../b_write/list.do?boardno=${boardno }'>${boardVO.name }</A>(${boardVO.count })
      </TD>
      <TD style='text-align: center;'>
      <!-- 회원은 보기만 가능하고 관리자는 설정이 가능할 수 있게 해준다. -->
        <A href="javascript: update_form(${boardno });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${boardno });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
    </TR>
  </c:forEach>
  </tbody>
  
</TABLE>
 
 </div>
</body>
 
</html> 
 
 