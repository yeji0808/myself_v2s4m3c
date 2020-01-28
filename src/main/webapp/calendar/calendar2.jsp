<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Calendar, java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="nation.web.tool.Tool" %>
<%@ page import="nation.web.calendar.CalendarDAO,nation.web.calendar.CalendarDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<%
int somoimno = Integer.parseInt(request.getParameter("somoimno"));
%> 
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>일정표</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

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
    <A href="./list.jsp?somoimno=${param.somoimno }">목록</A>
    

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'><br>

<%
Calendar cal = Calendar.getInstance();

int year = 0;
int month = 0;

if (request.getParameter("y") != null){
  year = Integer.parseInt(request.getParameter("y"));  
}else{
  year = cal.get(Calendar.YEAR); // 현재 년도 추출
}

//1월 0부터 시작
if (request.getParameter("m") != null){
  month = Integer.parseInt(request.getParameter("m")) - 1;
}else{
  month = cal.get(Calendar.MONTH); // 현재 월 추출 0 ~  
}
      
// 시작요일 확인
// - Calendar MONTH는 0-11까지임
cal.set(year, month, 1);
int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

// 다음/이전월 계산
// - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
int prevYear = year;
int prevMonth = (month + 1) - 1;
int nextYear = year;
int nextMonth = (month  + 1) + 1;

// 1월인 경우 이전년 12월로 지정
if (prevMonth < 1) {
  prevYear--;
  prevMonth = 12;
}

// 12월인 경우 다음년 1월로 지정
if (nextMonth > 12) {
  nextYear++;
  nextMonth = 1;
}
%>
<table border="0" cellpadding="0" cellspacing="0" width="100%" align='center'>
    <tr>
      <td align="center">
        <!--  이전 년월 -->
        <a href="./calendar2.jsp?somoimno=${param.somoimno }&y=<%=prevYear%>&m=<%=prevMonth%>">◁</a>
        <%=year%>년  <%=month+1%>월
        <!--  다음 년월 --> 
        <a href="./calendar2.jsp?somoimno=${param.somoimno }&y=<%=nextYear%>&m=<%=nextMonth%>">▷</a>
      </td>
    </tr>
    <tr>
      <td>

        <table border="1" cellpadding="0" cellspacing="0" width='100%' height='250px' align='center'>
          <tr>
            <td width='14%' align='center'>일</td>
            <td width='14%' align='center'>월</td>
            <td width='14%' align='center'>화</td>
            <td width='14%' align='center'>수</td>
            <td width='14%' align='center'>목</td>
            <td width='14%' align='center'>금</td>
            <td width='16%' align='center'>토</td>
          </tr>
          <tr height='14%'>
				<%
        // 시작요일까지 이동
        for (int i=1; i<bgnWeek; i++){
          out.println("<td class='calendar_td'>&nbsp;</td>");
        }

        // 첫날~마지막날까지 처리
        // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
        String str="";
        ArrayList<CalendarDTO> list = null;
        CalendarDAO dao = new CalendarDAO();
        StringBuffer sb = null;
    
        while (cal.get(Calendar.MONTH) == month) {
          if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
            out.println("<td class='calendar_td' valign='top' style='color:blue;'>" + cal.get(Calendar.DATE));
          }else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY){
            out.println("<td class='calendar_td' valign='top' style='color:red;'>" + cal.get(Calendar.DATE));
          }else{
            out.println("<td class='calendar_td' valign='top'>" + cal.get(Calendar.DATE));
          }
        
          // ------------------------------------------------------------------------
          // 2010-01-01에 해당하는 일정만 DBMS에서 가져옵니다.
          // ------------------------------------------------------------------------
          // str = cal.get(Calendar.YEAR) + "-" + cal.get(Calendar.MONTH) + "-" + cal.get(Calendar.DATE);
          str = Tool.getDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE));
          list = dao.listLabel(str, somoimno);  
          
          if (list != null){ 
            sb = new StringBuffer();
            for(int i=0; i<list.size(); i++){
              CalendarDTO dto = (CalendarDTO)list.get(i);
              sb.append("<img src='"+request.getContextPath()+"/calendar/images/bu5.gif'>");
              sb.append("<a href='./read.jsp?somoimno=" + dto.getSomoimno() + "&calendarno="+dto.getCalendarno()+"'>"+dto.getLabel()+"</a><br>"); // 수정 필요 DB연동
            }
        
          }
          out.println("<br><div style='color:#00AA00'>" + sb.toString() + "</div></td>");
          // ------------------------------------------------------------------------
      
          // 한달의 마지막 날이 아니면서 토요일인 경우 다음줄로 생성
          // System.out.println(cal.getActualMaximum ( Calendar.DAY_OF_MONTH ));
          if ((cal.getActualMaximum ( Calendar.DAY_OF_MONTH ) != cal.get(Calendar.DATE))) {
            if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){ // 토요일인 경우
              out.println("</tr><tr>");
            }
          }

          // 날짜 증가시키기
          cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
          // 끝날부터 토요일까지 빈칸으로 처리
      
        }
        //System.out.println("cal.get(Calendar.MONTH): " + cal.get(Calendar.MONTH));
        //System.out.println("cal.get(Calendar.DATE): " + cal.get(Calendar.DATE));
        //System.out.println("cal.get(Calendar.DATE): " + cal.get(Calendar.DATE));
    
        if (cal.get(Calendar.DATE) == 1 && (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)) {
          // 한달의 마지막 날짜 토요일이면 아무일도 안함
        }else{
          for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) out.println("<td class='calendar_td'>&nbsp;</td>");
        }

%>
		  	</tr>
	  	</table>
  	</td>
	</tr>
</table>
</div> 

</DIV>

<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>





