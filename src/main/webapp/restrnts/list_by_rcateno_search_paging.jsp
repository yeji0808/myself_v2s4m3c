<%@ page contentType="text/html; charset=UTF-8"%>
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
function update_img_form(restno) {
  // alert('admin2no: ' + admin2no);
  
  var url = './update_img.do?restno=' + restno;
  var win = window.open(url, '카테고리 그룹 수정', 'width=600px, height=300px');
  
  var x = (screen.width - 600) / 2;
  var y = (screen.height - 300) / 2;
  
  win.moveTo(x, y); // 지정된 좌표로 이동    
} 
</script>
</head>
 

<body>

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>${restcategrpVO.rcatename}</DIV>
    <form name='frm' id='frm' method='get' action='./list.do'>
    <input type='hidden' name='rcateno' value='${restcategrpVO.rcateno }'>
    
    <ASIDE style='float: left;'>
      <c:if test="${param.rword.length() > 0 }">
        [${param.rword }] 검색 목록 (${search_count } 건)
      </c:if>
    </ASIDE>
    
    <ASIDE style='float: right;'>      
      <c:choose>
        <c:when test="${param.rword != '' }">
          <input type='text' name='rword' id='rword' value='${param.rword }' 
                     style='width: 60%;'>
        </c:when>
        <c:otherwise>
          <input type='text' name='rword' id='rword' value='' style='width: 60%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.rword.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list.do?rcateno=${restcategrpVO.rcateno }'">검색 취소</button>  
      </c:if>
    </ASIDE> 
  </form>
  
    <div class="row row-cols-1 row-cols-md-3" style='width: 60%; margin-left: 20%;'>
      <c:forEach var="restrntsVO" items="${list }">
        <c:set var="restrntsno" value="${restrntsVO.restno }" />
        <c:set var="fname" value="${restrntsVO.fname.toLowerCase() }" />
      <div class="col mb-4">
        <div class="card h-100" >
        <div class="card-case">
        <A href="javascript: update_img_form(${restrntsVO.restno});"><img src="./images/png.png" title="대표사진 수정"  class="update_img"/></a>
          <c:choose>
            <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
              <c:choose>
                <c:when test="${sessionScope.memberno==null}">
                  <a href="./read.do?restno=${restrntsVO.restno}"><IMG src="./storage/${restrntsVO.thumb}" class="card-img"></a>
                </c:when>
                <c:otherwise>
                  <a href="./read_login.do?restno=${restrntsVO.restno}&memberno=${sessionScope.memberno}"><IMG src="./storage/${restrntsVO.thumb}" class="card-img"></a>
                </c:otherwise>
              </c:choose>
            </c:when>
            <c:otherwise>
              ${restrntsVO.fname }
            </c:otherwise>
          </c:choose>
          </div>
          <div class="card-body">
            <p class="card-title">${restrntsVO.rname}</p>
            <h5 class="card-text">${restrntsVO.rmain}</h5>
            <p class="card-text2" style="align: right;">
              <small class="text-muted"><IMG src='./images/good.png' title='추천수' > ${restrntsVO.rrecom}</small>
              <small class="text-muted"><IMG src='./images/view.png' title='조회수'> ${restrntsVO.rcnt}</small>
              <small class="text-muted"><IMG src='./images/review.png' title='댓글수'> ${restrntsVO.reviewcnt}</small>
              <c:choose>
                <c:when test="${sessionScope.memberno==restrntsVO.memberno}"> 
                  <a href="./update_info.do?restno=${restrntsVO.restno}&rcateno=${restcategrpVO.rcateno}"><img src="./images/update.png" title="글 수정" /></a>
                  <a href="./delete.do?restno=${restrntsVO.restno}&rcateno=${restcategrpVO.rcateno}"><img src="./images/delete.png" title="삭제" /></a>
                </c:when>
              </c:choose>
            </p>
          </div>
        </div>
      </div>    
      </c:forEach>
    </div>
    
        <br><br>    
        <br><br>
        <DIV class='bottom_menu'>${paging }</DIV>
        <br><br>

</body>
 
</html>
    
 
  