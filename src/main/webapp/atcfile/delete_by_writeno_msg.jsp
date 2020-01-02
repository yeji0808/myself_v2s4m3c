<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>

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

<DIV style='display: table; width: 100%; height: 300px;'>
<DIV style='display: table-cell; vertical-align: middle;'>
 
<DIV class='title_line'>알림</DIV>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count > 0 }">
          <LI class='li_none'>
            <span class='span_success'>첨부파일을 삭제했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="location.href='../s_write/delete.do?writeno=${param.writeno}&somoimno=${param.somoimno }'"
                        class="btn btn-primary">확인</button>                    
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_none'>
            <span class='span_fail'>첨부파일 삭제에 실패했습니다.</span>
          </LI>
          <LI class='li_none'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-primary">다시시도</button>
            <button type='button' 
                        onclick="location.href='../s_write/read.do?somoimno=${param.somoimno}&writeno=${param.writeno }'"
                        class="btn btn-primary">취소</button>                        
          </LI>
        </c:otherwise>
      </c:choose>
     </UL>
  </fieldset>
 
</DIV>

</DIV>
</DIV>
 
 <jsp:include page="/menu/s_bottom.jsp" flush='false' />
 
</body>
 
</html>