<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title> 등록 </title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
function checkData(f){ // f == document.frmData 객체
    var msg; // 에러 메세지
    var str; // 임시 문자열 저장 변수
      
    // 제목 앞뒤의 공백 제거
    str = f.title.value.replace(/^\s*|\s*$/g,'');
    if (str.length == 0){
        msg = '안내\n\n제목을 입력해 주십시오'; 
        window.alert(msg);
        f.title.focus();
        return false;
    }
    
    // 내용 앞뒤의 공백 제거
    str = f.content.value.replace(/^\s*|\s*$/g,''); 

    // 이름의 길이를 비교
    if (str.length == 0){
        msg = '안내\n\n내용을 입력해 주십시오'; 
        window.alert(msg);
        f.content.focus();
        return false;
    }
    
    return true;
}
</script>
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

<DIV class='container' style='width: 80%;'>

<DIV class='title_line' style='width: 15%; font-size: 20px;'>일정표</DIV>

<ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./calendar2.jsp?somoimno=${param.somoimno }'>일정표</A>
  </ASIDE>
  <ASIDE style="float: right;">
    <A href="javascript:location.reload();">새로고침</A><span class='menu_divide' >│</span>
    <A href="javascript:history.back();">취소</A><span class='menu_divide' >│</span>
    <A href="./list.jsp?somoimno=${param.somoimno }">목록</A><span class='menu_divide' >│</span>
    <A href="./calendar2.jsp?somoimno=${param.somoimno }">일정표</A>

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV><br>
    
<FORM name="frm" action="./createProc.jsp" method="POST" onSubmit="return checkData(this)">
  <input type='hidden' name='somoimno' value='${param.somoimno }'>
  
  <table style='border: 0px none #FFFFFF; width: 70%;'>
    <tr>
      <th width='20%'>출력 날짜</th>
      <td width='80%' style='text-align: left; border: 0px none #FFFFFF'>
        <input type='date' name='labeldate' value='' size='10'>
        형식: 2019-12-25
      </td>
    </tr>  
    <tr>
      <th>출력 레이블</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <input type='text' name='label' value='' size='20'>
        형식: 최대 20자
        </td>
    </tr>  
    <tr>
      <th>제목</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <input type='text' name='title' value='' size='50'>      
      </td>
    </tr>
    <tr>
      <th>내용</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <TEXTAREA name='content' style = 'border:1px solid; width: 100%' rows="10"></TEXTAREA>
      </td>
    </tr>      
     
  </table>

  <DIV style='text-align: center; border: 0px none #FFFFFF'>  
    <DIV class='bottom'> 
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>  
    </DIV>
  </DIV>
  
</FORM>

</DIV>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->












