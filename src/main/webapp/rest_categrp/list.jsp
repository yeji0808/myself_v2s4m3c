<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
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
    
<script type="text/javascript">
function update_form(rcateno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './update.do?rcateno=' + rcateno;
  var win = window.open(url, '카테고리 그룹 수정', 'width=500px, height=200px');
  
  var x = (screen.width - 500) / 2;
  var y = (screen.height - 200) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

function delete_form(rcateno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './delete.do?rcateno=' + rcateno;
  var win = window.open(url, '카테고리 그룹 삭제', 'width=600px, height=400px');
  
  var x = (screen.width - 600) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 

</script>
 
</head> 
 
<body>
 <jsp:include page="/menu/top.jsp" />
  <DIV class='title_line'>카테고리 그룹</DIV>
 
 <c:choose>
  <c:when test="${sessionScope.userno==2 || sessionScope.id_admin != null}">
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
      <label>음식 카테고리 이름</label>
      <input type='text' name='rcatename' value='' required="required" style='width: 25%;'>
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  </c:when>
 </c:choose>
  
  <%-- <ul class="nav nav-tabs" id="myTab" role="tablist">
    <c:forEach var="restcategrpVO" items = "${list }">
    <c:set var="rcateno" value='${restcategrpVO.rcateno }'/>
      <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="home" aria-selected="true">${restcategrpVO.rcatename }</a>      
      </li>
    </c:forEach>
</ul>
<div class="tab-content" id="myTabContent">
<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
<iframe src='../restrnts/list.do?rcateno=${rcateno }' style='width: 100%; height: 100%;'></iframe>
</div>
</div> --%>

 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 20%;'/>
    <col style='width: 50%;'/>
    <col style='width: 30%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class='th_basic'>순서</TH>
    <TH class='th_basic'>대분류명</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="restcategrpVO" items = "${list }">
    <c:set var="rcateno" value='${restcategrpVO.rcateno }'/>
    <TR>
      <TD style='text-align: center;'>${rcateno }</TD>
      <TD>
        <A href='../restrnts/list.do?rcateno=${rcateno }'>${restcategrpVO.rcatename }</A> (${restcategrpVO.rcnt })
      </TD>
      <TD style='text-align: center;'>
        <A href="javascript: update_form(${rcateno });"><IMG src='./images/update.png' title='수정'></A>
        <A href="javascript: delete_form(${rcateno });"><IMG src='./images/delete.png' title='삭제'></A>
      </TD>
    </TR>
  </c:forEach> 
  </tbody>
 
</TABLE>
 

</body>
 
</html> 
 
 