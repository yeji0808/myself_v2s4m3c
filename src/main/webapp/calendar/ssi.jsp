<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="java.util.*, java.io.*" %>
<%@ page import="nation.web.tool.Tool"%>
<%@ page import="nation.web.calendar.CalendarDAO,nation.web.calendar.CalendarDTO" %>

<jsp:useBean id="dao" class="nation.web.calendar.CalendarDAO" />

<% 
request.setCharacterEncoding("utf-8");

int currentPage = 0; // 현재 페이지 번호 0 --> 1

if (request.getParameter("currentPage") != null){
  currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

%>




