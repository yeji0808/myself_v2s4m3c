<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>YOLO</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
function update_form(userno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './update.do?userno=' + userno;
  var win = window.open(url, '카테고리 그룹 수정', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(userno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './delete.do?userno=' + userno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=800px, height=400px');
  
  var x = (screen.width - 800) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>카테고리 그룹</DIV>
  
  <div style="text-align: right; margin-right: 10px;">
      <A href="../members/login_ck_form.jsp">로그인</A>
      <A href="../members/create.do">회원가입</A>
      </div>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>그룹 이름</label>
      <input type='text' name='user_name' value='' required="required" style='width: 25%;'>
 
      <label>유저수</label>
      <input type='number' name='user_cnt' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
                
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
  
      <label>형식</label>
      <select name='visible'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
      
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 40%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class='th_basic'>순서</TH>
    <TH class='th_basic'>유저명</TH>
    <TH class='th_basic'>유저수</TH>
    <TH class='th_basic'>출력</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="categrpVO" items = "${list }">
    <c:set var="userno" value="${categrpVO.userno }" />
    <TR>
      <TD style='text-align: center;'>${categrpVO.seqno }</TD>
      <TD>
        <A href='../members/list_by_user.do?userno=${userno}'>${categrpVO.user_name }</A>
      </TD>
      <TD style='text-align: center;'>${categrpVO.user_cnt}</TD>
      <TD style='text-align: center;'>${categrpVO.visible }
      <TD style='text-align: center;'>
        <A href="javascript: update_form(${userno });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${userno });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</TABLE>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
 