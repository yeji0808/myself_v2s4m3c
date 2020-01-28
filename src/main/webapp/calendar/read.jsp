<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="./ssi.jsp" %>
 
<%
int calendarno = Integer.parseInt(request.getParameter("calendarno"));

CalendarDTO dto = null;
dto = dao.read(calendarno);
%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>조회</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">

</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>

<!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <%-- <A href="${root }/somoim/list.do"><img src='${root}/menu/images/logo.jpg' style='width: 5%; margin-left: 100px;'></A> --%>
    <NAV class='top_menu_list' style='text-align: center;'>
      <span class='top_menu1'></span>      
      <A class='menu_link'  href='../somoim/read.do?somoimno=${param.somoimno}'>
        <span class="glyphicon glyphicon-list-alt" style='color: #ffffff'></span> 전체글 </A> <span class='top_menu1'></span>    
      <A class='menu_link'  href='../atcfile/list.do?somoimno=${param.somoimno}'> 
        <span class="glyphicon glyphicon-picture" style='color: #ffffff'></span> 사진첩 </A> <span class='top_menu1'></span>    
      <A class='menu_link'  href='./calendar2.jsp?somoimno=${param.somoimno}'> 
        <span class="glyphicon glyphicon-calendar" style='color: #ffffff'></span> 일정 </A>
    </NAV>
  </DIV>
  <!-- 화면 상단 메뉴 종료 -->

<DIV class='container' style='width: 80%;'>

<!-- *********************************************** -->

<DIV class='title_line' style='width: 15%; font-size: 20px;'>일정표</DIV>

<ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./calendar2.jsp?somoimno=${param.somoimno }'>일정표</A>
  </ASIDE>
  <ASIDE style="float: right;">
    <A href="javascript:location.reload();">새로고침</A><span class='menu_divide' >│</span>  
    <A href="./createForm.jsp?somoimno=${param.somoimno }'">등록</A><span class='menu_divide' >│</span>
    <A href="./deleteForm.jsp?somoimno=${param.somoimno }&calendarno=${param.calendarno}">삭제</A><span class='menu_divide' >│</span>
    <A href="./updateForm.jsp?somoimno=${param.somoimno }&calendarno=${param.calendarno}">수정</A><span class='menu_divide' >│</span>
    <A href="./list.jsp?somoimno=${param.somoimno }">목록</A><span class='menu_divide' >│</span>
    <A href="./calendar2.jsp?somoimno=${param.somoimno }">일정표</A>

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV><br>
    
<table style='border: 0px none #FFFFFF; width: 100%;'>
  <tr>
    <th width='20%'>출력 날짜</th>
    <td width='80%' style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getLabeldate() %>
    </td>
  </tr>  
  <tr>
    <th>출력 레이블</th>
    <td style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getLabel() %>
    </td>
  </tr>  
  <tr>
    <th>제목</th>
    <td style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getTitle() %>      
     </td>
  </tr>
  <tr>
    <th>내용</th>
    <td style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getContent() %>
    </td>
  </tr>      
   
</table>  

<!-- *********************************************** -->
</DIV>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->












