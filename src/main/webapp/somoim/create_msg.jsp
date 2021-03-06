<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

</script>

</head> 
<body>
<jsp:include page="/menu/top.jsp" />

<DIV class='title_line' style='width: 15%; font-size: 26px;'>소모임 생성</DIV>
 
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count == 1 }">
          <LI class='li_center'>
            <span class='span_success'>새로운 소모임을 만들었습니다.</span>
          </LI>
          <LI class='li_center'>
            <button type='button' onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_center'>
            <span class='span_fail'>소모임 생성에 실패했습니다.</span>
          </LI>
          <LI class='li_center'>
            <span class='span_fail'>다시 시도해주세요.</span>
          </LI>
          <LI class='li_center'>
            <button type='button' onclick="location.href='./create.do'" class="btn btn-primary">다시시도</button>
            <button type='button' onclick="location.href='./list.do'" class="btn btn-primary">목록</button>
          </LI>
        </c:otherwise>
      </c:choose>
      
    </UL>
  </fieldset>

<jsp:include page="/menu/bottom.jsp" />
</body>

</html>
  