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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#w_attach_panel').hide();\">";
    tag += "  <IMG src='../w_attach/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#w_attach_panel').html(tag);
    $('#w_attach_panel').show();
  }
</script>
</head>

<body>
<c:set var="boardno" value="${boardVO.boardno}" />
<c:set var="wno" value="${writeVO.wno }" />

<jsp:include page="/menu/top.jsp" flush='false' />

  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="wno" value="${wno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${contentsVO.title}</span>
            (<span>${contentsVO.recom}</span>)
            <span>${contentsVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV id='w_attach_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
            <c:forEach var="w_attachVO" items="${w_attach_list }">
              <c:set var="thumb" value="${w_attachVO.w_attachthumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${w_attachVO.w_attachname }')"><IMG src='../w_attach/storage/${thumb }' style='margin-top: 2px;'></A>
                  <A href="./file_delete_proc.do?wno=${wno}&w_attachno=${w_attachVO.w_attachno }"><span class="glyphicon glyphicon-remove"></span></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          <li class="li_center" >
            <button type="button" onclick="location.href='./read.do?wno=${wno}'"
                        class="btn btn-info">첨부 파일 삭제 취소</button>
          </li>
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  