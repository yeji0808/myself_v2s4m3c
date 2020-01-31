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

   
  
  <div style='width: 80%;margin: 0px auto; padding-top: 50px'>
      <div style="float: left;clear:both;">
        <A href='./list.do?boardno=${param.boardno }'>${boardVO.name }</A> 
      </div>
       <div style="float: right; ">
         <A href="javascript:location.reload();">새로고침</A>
         <c:if test="${sessionScope.memberno!=null}"> 
           <A href="./create.do?memberno=${sessionScope.memberno }">등록</A>
         </c:if>
      </div>
    <table class="table table-condensed" style='width: 100%;  margin-top: 20px'>
      <colgroup>
        <col style="width: 10%; text-align: center;"></col>
        <col style="width: 40%;"></col>
        <col style="width: 10%; text-align: center;"></col>
        <col style="width: 15%; text-align: center;"></col>
        
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
          <c:set var="wno" value="${writeVO.wno }" />
          <c:set var="boardno" value="${param.boardno }" />
           
          <tr> 
            <td style='text-align: center;'>${writeVO.rdate.substring(0, 10)}</td>
            <td>
              <a href="./read.do?wno=${wno}&memberno=${sessionScope.memberno }" >
              <span style="font-style: oblique; font-weight: 600;">${writeVO.wtitle}</span>(${writeVO.wreplycnt})</a> 
            </td> 
            <td style='text-align: center;'>${writeVO.wrecom}</td> 
            <td style='text-align: center;'>
              <a href="./update.do?wno=${wno}&memberno=${sessionScope.memberno }"><img src="./images/update.png" title="수정"></a>
              <c:forEach var="memberno" items="writeVO.memberno">
              <a href="./delete.do?wno=${wno}&memberno=${memberno}"><img src="./images/delete.png" title="삭제"></a>
              </c:forEach>
              <a href="../attachfile/create.do?wno=${wno}&memberno=${sessionScope.memberno }"><img src="./images/upload.png" title="파일 업로드"></a>
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
    
 
  