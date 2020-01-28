<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>당신의 선택은?</title>
 
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
        <A href='./list.do'>추천게시판</A> 
      </div>
       <div style="float: right; ">
         <A href="javascript:location.reload();">새로고침 ||</A> 
         <A href="./create.do?cho_no=${choiceVO.cho_no }">등록</A>
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
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="choiceVO" items="${list }">
          <c:set var="cho_no" value="${choiceVO.cho_no }" />
          
          <tr> 
            <td style='text-align: center;'>${choiceVO.rdate.substring(0, 10)}</td>
            <td>
              <a href="./read.do?cho_no=${cho_no}" >
              <span style="font-style: oblique; font-weight: 600;">${choiceVO.cho_title}</span></a> 
            </td> 
            <td style='text-align: center;'>
              <a href="./update.do?cho_no=${cho_no}"><img src="./images/update.png" title="수정"></a>
              <a href="./delete.do?cho_no=${cho_no}"><img src="./images/delete.png" title="삭제"></a>
              <a href="../choice/create.do?cho_no=${cho_no}"><img src="./images/upload.png" title="파일 업로드"></a>
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
    
 
  