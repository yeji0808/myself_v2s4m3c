<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../categrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do'>모든 이미지 파일</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
<!--     <span class='menu_divide' > | </span> -->

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;  text-align: center'> 
    <table class="table table-striped" style='width: 70%; margin: 0px auto;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 40%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
         
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>Img_no</th>
          <th style='text-align: center;'>THUMB파일</th>
          <th style='text-align: center;'>Recom_no</th>
          <th style='text-align: center;'>SIZE</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="rec_imgVO" items="${list }">
          <c:set var="recom_no" value="${rec_imgVO.recom_no }" />
          <c:set var="fname" value="${rec_imgVO.fname.toLowerCase() }" />
          
          <tr> 
          <td style='vertical-align: middle;'>
            ${rec_imgVO.img_no }
          </td>
            <td style='vertical-align: middle;'>
              <c:choose>
                <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
                  <IMG src="./storage/${rec_imgVO.thumb }"> 
                  
                </c:when>
                <c:otherwise>
                  ${rec_imgVO.fname}
                </c:otherwise>
              </c:choose>
            </td> 
            <td style='vertical-align: middle;'>
            ${rec_imgVO.recom_no }
          </td>
            <td style='text-align: center; vertical-align: middle;'>${rec_imgVO.fsize}</td>
            <td style='text-align: center; vertical-align: middle;'> 
              <a href="./delete.do?recom_no=${rec_imgVO.recom_no}"><img src="./images/delete.png" title="삭제"  border='0' /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  