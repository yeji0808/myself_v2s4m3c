<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- Fotorama -->
  <link href="fotorama.css" rel="stylesheet">
  <script src="fotorama.js"></script>
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function panel_img(file) {
  var tag = "";
  tag = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
  tag += "  <IMG src='../attachfile/storage/" + file
      + "' style='width: 100%;'>";
  tag += "</A>";

  $('#attachfile_panel').html(tag);
  $('#attachfile_panel').show();
}
</script>

</head>

<body>
<c:set var="rcateno" value="${restcategrpVO.rcateno}" />
<c:set var="restno" value="${restrntsVO.restno }" />

<jsp:include page="/menu/top.jsp" flush='false' />

    <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?categrpno=${categrpno }'>목록</A>
      <span class='menu_divide' > | </span> 
      <A href='./update.do?categrpno=${categrpno }&contentsno=${contentsno}'>수정</A>
      <span class='menu_divide' > | </span> 
      <a href="../attachfile/create.do?contentsno=${contentsno}&categrpno=${categrpVO.categrpno}">첨부 파일 등록</A>
      <span class='menu_divide' > | </span> 
      <a href="./file_delete.do?contentsno=${contentsno}&categrpno=${categrpVO.categrpno}">첨부 파일 삭제</A>
      <span class='menu_divide' > | </span> 
      <A href='./delete.do?categrpno=${categrpno }&contentsno=${contentsno}'>삭제</A>
  </ASIDE> 
  
<HR>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="contentsno" value="${contentsno}">
      
      <DIV style='margin: 0px auto; width: 800px;'>
        <!-- Fotorama data-ratio="100%/66%" -->
        <div class="fotorama"
               data-autoplay="5000"
               data-nav="thumbs"
               data-width="1000"
               data-ratio="800/520"
               data-max-width="100%">
          <a href="./images/spring01.jpg"><img src="./images/thumb/spring01_t.jpg"></a>
          <a href="./images/spring02.jpg"><img src="./images/thumb/spring02_t.jpg"></a>
          <a href="./images/spring03.jpg"><img src="./images/thumb/spring03_t.jpg"></a>
          <a href="./images/spring04.jpg"><img src="./images/thumb/spring04_t.jpg"></a>
          <a href="./images/spring05.jpg"><img src="./images/thumb/spring05_t.jpg"></a>
        </div>
      </DIV>
 
</body>
</html>
 
      <fieldset class="fieldset">

        <ul>
          
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          
          <li class="li_none" style='text-align: center;' >
            <c:forEach var="attachfileVO" items="${attachfile_list }">
              <c:set var="thumb" value="${attachfileVO.thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${attachfileVO.fname }')"><IMG src='../attachfile/storage/${thumb }' style='margin-top: 2px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          
          <li class="li_none">
            <DIV>${contentsVO.content }</DIV>
          </li>
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어(키워드): ${contentsVO.word }
            </DIV>
          </li>
                     
        </ul>
      </fieldset>
  </FORM>
  

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
