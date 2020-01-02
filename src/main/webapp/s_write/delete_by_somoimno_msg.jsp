<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>

<DIV style='display: table; width: 100%; height: 300px;'>
<DIV style='display: table-cell; vertical-align: middle;'>
 
 <jsp:include page="/menu/s_top.jsp" />
 
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count > 0 }">
          <LI class='li_center'>
            <span class='span_success'>글을 삭제했습니다.</span>
          </LI>
          <LI class='li_center'>
            <button type='button' 
                        onclick="location.href='../somoim/delete.do?somoimno=${param.somoimno}'"
                        class="btn btn-primary">확인</button>                      
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_center'>
            <span class='span_fail'>글 삭제에 실패했습니다.</span>
          </LI>
          <LI class='li_center'>
            <button type='button' 
                        onclick="history.back();"
                        class="btn btn-primary">다시시도</button>
            <button type='button' 
                        onclick="window.close();"
                        class="btn btn-primary">창닫기</button>                        
          </LI>
        </c:otherwise>
      </c:choose>
     </UL>
  </fieldset>
 
</DIV>

</DIV>
 
<jsp:include page="/menu/s_bottom.jsp" /> 
 
</body>
 
</html>