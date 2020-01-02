<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<jsp:include page="/menu/s_top.jsp" flush='false' />
 
<DIV class='title_line'>알림</DIV>
 
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.upload_count > 0}">
          <LI class='li_center'>
            <span class='span_success'>파일을 등록했습니다.</span>
          </LI>
          <LI class='li_center'>
            <span class='span_success'>정상 등록된 파일 ${param.upload_count } 건</span>
          </LI>
        </c:when>
        <c:otherwise> 
          <LI class='li_center'>
            <span class='span_fail'>파일 등록에 실패했습니다.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      <LI class='li_center'>
        <br>
        <button type='button' 
                    onclick="location.href='../s_write/read.do?somoimno=${param.somoimno}&writeno=${param.writeno }'"
                    class="btn btn-primary">확인</button>
     </UL>
  </fieldset>
 
<jsp:include page="/menu/s_bottom.jsp" flush='false' />
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 