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
    <A href='./list.do'>추천한 회원 목록</A>
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
          <th style='text-align: center;'>RecMemberNo</th>
          <th style='text-align: center;'>MemberNo</th>
          <th style='text-align: center;'>Recom_no</th>
          <th style='text-align: center;'>DATE</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="recMemberVO" items="${list }">
          <c:set var="recom_no" value="${recMemberVO.recom_no }" />
          <c:set var="memberno" value="${recMemberVO.memberno }" />
          
          <tr> 
          <td style='vertical-align: middle;'>
            ${recMemberVO.recMemberNo } 
          </td>
            <td style='vertical-align: middle;'>
              ${memberno }
            </td> 
            <td style='vertical-align: middle;'>
            ${recom_no }
          </td>
            <td style='text-align: center; vertical-align: middle;'>${recMemberVO.rdate.substring(0, 10)}</td>
           <td style='text-align: center; vertical-align: middle;'>  
              <a href="./delete.do?RecMemberNo=${recMemberVO.recMemberNo }"><img src="./images/delete.png" title="삭제"  border='0' /></a>
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
    
 
  