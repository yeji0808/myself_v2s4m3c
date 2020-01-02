<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>${somoimVO.name }</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
<jsp:include page="/menu/s_top.jsp" />


<DIV class='title_line' style='width: 15%; font-size: 20px;'>전체글</DIV>

  <ASIDE style='float: left;'>
    <A href="../somoim/list.do">소모임</A> >
    <A href="./read.do?somoimno=${somoimVO.somoimno}">${somoimVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="../s_write/create.do?somoimno=${somoimVO.somoimno}&memberno=1">등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
     
    <div style='width: 100%;'>
    <table class='table table-hover' style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 60%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>제목</th>
          <th style='text-align: center;'>추천</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="writeVO" items="${list }">
          <c:set var='writeno' value='${writeVO.writeno }' />
        
          <tr> 
            <td style='text-align: center;'>${writeVO.rdate.substring(0, 10)}</td>
            <td>
              <a href="../s_write/read.do?somoimno=${somoimVO.somoimno }&writeno=${writeno}">${writeVO.title}</a> 
            </td> 
            <td style='text-align: center;'>${writeVO.recom}</td>
            <td style='text-align: center;'>
              <A href="../s_write/update.do?writeno=${writeno}&somoimno=${somoimVO.somoimno}">
              <img src="./images/update.png" title="수정" border='0'/></A>
              <A href="../s_write/delete.do?writeno=${writeno}&somoimno=${somoimVO.somoimno}">
              <img src="./images/delete.png" title="삭제"  border='0'/></A>
              <A href="../attachfile/create.do?writeno=${writeno}&somoimno=${somoimVO.somoimno}">
              <img src="./images/upload.png" title="파일 업로드"></A>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>   
  
<jsp:include page="/menu/s_bottom.jsp" />
<jsp:include page="/menu/bottom.jsp" />  
    
</body>
 
</html> 