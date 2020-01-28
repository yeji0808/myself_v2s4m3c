<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file ="./ssi.jsp" %>

<%
int somoimno = Integer.parseInt(request.getParameter("somoimno"));
ArrayList<CalendarDTO> list = dao.list(somoimno);
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>목록</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">

</head>

<body>
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

<DIV class='title_line' style='width: 15%; font-size: 20px;'>일정표</DIV>

<ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./calendar2.jsp?somoimno=${param.somoimno }'>일정표</A>
  </ASIDE>
  <ASIDE style="float: right;">
    <A href="javascript:location.reload();">새로고침</A><span class='menu_divide' >│</span>
    <A href="./createForm.jsp?somoimno=${param.somoimno }">등록</A><span class='menu_divide' >│</span>
    <A href="./calendar2.jsp?somoimno=${param.somoimno }">일정표</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV><br>  

<table style='width: 100%;'>
  <tr bgcolor="#AAAAAA">
    <th width='5%'>번호</th>
    <th width='15%'>레이블 날짜</th>
    <th width='15%'>레이블</th>
    <th width='40%'>제목</th>
    <th width='5%'>조회</th>        
    <th width='15%'>등록일</th>
  </tr>

<%
int size = list.size();  // 저장된 객체의 수

for(int i=0; i<size; i++){
  Object object = list.get(i); // object 타입은 사용 못함.
  CalendarDTO dto = (CalendarDTO)object;
  
  int calendarno = dto.getCalendarno();
  String labeldate = dto.getLabeldate();
  String label = dto.getLabel();
  String title = dto.getTitle();
  int cnt = dto.getCnt();
  String regdate = dto.getRegdate();
%> 
  <tr bgcolor="#EEEEEE" 
      onMouseOver="this.style.backgroundColor='#ffffff'" 
      onMouseOut="this.style.backgroundColor='#EEEEEE'"> 

    <td><%=calendarno %></td>
    <td><%=labeldate %></td>
    <td class='td'>
      <a href='./read.jsp?somoimno=${param.somoimno }&calendarno=<%=calendarno %>'><%=label%></a>
    </td>
    <td class='td'>
      <%
      // 2013-02-07 형식으로 추출
      String date = dto.getRegdate().substring(0, 10);
      // 이틀 전날것까지 새글 처리
      if (Tool.isNew(date, 2)){
        out.println("<img src='./images/new.gif'>");
      }
      %>
      <a href='./read.jsp?somoimno=${param.somoimno }&calendarno=<%=calendarno %>'><%=title%></a>
    </td>
    <td><%=cnt %></td>
    <td><%=regdate.substring(0, 10) %></td>

</tr>  
<%
}
%>
</table>

</DIV>

<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>


