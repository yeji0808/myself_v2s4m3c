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
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#atcfile_panel').hide();\">";
    tag += "  <IMG src='../atcfile/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#atcfile_panel').html(tag);
    $('#atcfile_panel').show();
  }
</script>
</head>

<body>
<c:set var="somoimno" value="${somoimVO.somoimno}" />
<c:set var="writeno" value="${writeVO.writeno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
<jsp:include page="/menu/s_top.jsp" flush='false' />

  <ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='../somoim/read.do?somoimno=${somoimno }'>${somoimVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?somoimno=${somoimno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?somoimno=${somoimno }&writeno=${writeno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <a href="../atcfile/create.do?writeno=${writeno}&somoimno=${somoimVO.somoimno}">첨부 파일 등록</A>
    <span class='menu_divide' > | </span>
    <a href="./file_delete.do?writeno=${writeno}&somoimno=${somoimVO.somoimno}">첨부 파일 삭제</A>
    <span class='menu_divide' > | </span>  
    <A href='./delete.do?somoimno=${somoimno }&writeno=${writeno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./file_delete.do'>
      <input type="hidden" name="writeno" value="${writeno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${writeVO.title}</span>
            (<span>${writeVO.recom}</span>)
            <span style='float: right;'>${writeVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV id='atcfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
            <c:forEach var="atcfileVO" items="${atcfile_list }">
              <c:set var="thumb" value="${atcfileVO.thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${atcfileVO.fname }')"><IMG src='../atcfile/storage/${thumb }' style='margin-top: 2px;'></A>
                  <A href="./file_delete_proc.do?writeno=${writeno}&atcfileno=${atcfileVO.atcfileno }">
                  <span class="glyphicon glyphicon-remove"></span></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          <li class='li_right'>
            <button type='button' onclick="location.href='./read.do?writeno=${writeno }&somoimno=${somoimno }'" class="btn btn-primary">첨부파일 삭제 취소</button>
          </li>
                      
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/s_bottom.jsp" flush='false' />
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  