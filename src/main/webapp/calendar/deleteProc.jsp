<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file ="ssi.jsp" %>

<%
int calendarno = Integer.parseInt(request.getParameter("calendarno"));
int cnt = dao.delete(calendarno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>삭제 처리</title>

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

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;'>삭제 처리</DIV>
</DIV> 

<DIV class='content'>
  <%
  if (cnt == 1){
    // out.println("삭제 했습니다.<br><br>");
    response.sendRedirect("./list.jsp");
  }else{
    out.println("삭제 실패했습니다.");
    out.println("<br><br> <input type='button' value='다시 시도' onclick='history.back()'>");
  }
  %>
  <input type='button' value='목록' 
         onclick="location.href='./list.jsp'">

</DIV>

<!-- *********************************************** -->
</DIV>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->




