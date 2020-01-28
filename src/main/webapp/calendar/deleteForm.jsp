<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file ="ssi.jsp" %>

<%     
int calendarno = Integer.parseInt(request.getParameter("calendarno"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>

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

<ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./calendar2.jsp?somoimno=${param.somoimno }'>일정표</A>
  </ASIDE>
  <ASIDE style="float: right;">
    <A href="javascript:location.reload();">새로고침</A><span class='menu_divide' >│</span>
    <A href="./createForm.jsp?somoimno=${param.somoimno }'">등록</A><span class='menu_divide' >│</span>
    <A href="./list.jsp?somoimno=${param.somoimno }'">목록</A>

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV><br>  
    
<DIV class='content'>
  삭제하시겠습니까? 삭제되면 복구 될 수 없습니다.<br>
</DIV>

<FORM name="frm" action="./deleteProc.jsp" method="POST">
  <input type='hidden' name='calendarno' value="<%=calendarno %>" />
   
  <DIV style='text-align: center; border: 0px none #FFFFFF'>  
    <DIV class='bottom'> 
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="button" onclick="history.back();" class="btn btn-primary">취소</button> 
    </DIV>
  </DIV>
</FORM>

<!-- *********************************************** -->
</DIV>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->












