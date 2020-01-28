<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file ="ssi.jsp" %>

<%
int somoimno = Integer.parseInt(request.getParameter("somoimno"));
String labeldate = request.getParameter("labeldate");
String label = request.getParameter("label");
String title = request.getParameter("title");
String content = request.getParameter("content");

CalendarDTO dto = new CalendarDTO();
dto.setSomoimno(somoimno);
dto.setLabeldate(labeldate);
dto.setLabel(label);
dto.setTitle(title);
dto.setContent(content);

int cnt = dao.create(dto);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>등록 처리</title>
</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

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

<h2>
<%
if (cnt == 1){
    // out.println("등록했습니다.");
    response.sendRedirect("./list.jsp?somoimno=" + dto.getSomoimno());
}else{
    out.println("등록 실패했습니다.");
    out.println("<br><br> <input type='button' value='다시 시도' onclick='history.back()'>");
}
%>
</h2>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->




