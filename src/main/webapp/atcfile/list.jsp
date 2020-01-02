<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
  function delete_form(atcfileno) {
	  var url = './delete.do?atcfileno=' + atcfileno;
	  var win = window.open(url, '이미지 삭제', 'width=650px, height=400px');
	   
	  var x = (screen.width - 650) / 2;
	  var y = (screen.height - 400) / 2;
	      
	  win.moveTo(x, y); // 지정된 좌표로 이동  
  }
</script>
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<jsp:include page="/menu/s_top.jsp" flush='false' />

<DIV class='title_line' style='width: 15%; font-size: 20px;'>사진첩</DIV>

  <ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./list.do?somoimno=${param.somoimno }'>모든 이미지 파일</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
<!--     <span class='menu_divide' > | </span> -->

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 60%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>글번호</th>
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="S_Write_AtcfileVO" items="${list }">
          <c:set var="writeno" value="${S_Write_AtcfileVO.writeno }" />
          <c:set var="fname" value="${S_Write_AtcfileVO.fname.toLowerCase() }" />
          
          <tr> 
            <td style='text-align: center; vertical-align: middle;'>${writeno}</td>
            <td style='vertical-align: middle;'>
              <c:choose>
                <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
                  
                    <IMG src="./storage/${S_Write_AtcfileVO.thumb }"> ${S_Write_AtcfileVO.fname }
               
                </c:when>
                <c:otherwise>
                  ${atcfileVO.fname}
                </c:otherwise>
              </c:choose>
            </td> 
            <td style='text-align: center; vertical-align: middle;'>${S_Write_AtcfileVO.rdate.substring(0, 10)}</td>
            <td style='text-align: center; vertical-align: middle;'>
              <a href="javascript:delete_form(${S_Write_AtcfileVO.atcfileno })"><img src="./images/delete.png" title="삭제"  border='0' /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/s_bottom.jsp" flush='false' />
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  