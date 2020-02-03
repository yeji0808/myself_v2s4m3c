<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
  function update_image(somoimno) {
	  var url = '${root}/somoim/update_image.do?somoimno=' + somoimno;
    var win = window.open(url, '대표이미지 변경', 'width=650px, height=550px');
     
    var x = (screen.width - 650) / 2;
    var y = (screen.height - 550) / 2;
        
    win.moveTo(x, y); // 지정된 좌표로 이동  
  }
</script>

  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <%-- <A href="${root }/somoim/list.do"><img src='${root}/menu/images/logo.jpg' style='width: 5%; margin-left: 100px;'></A> --%>
    <NAV class='top_menu_list' style='text-align: center;'>
      <span class='top_menu1'></span>      
      <A class='menu_link'  href='${root}/s_write/list.do?somoimno=${param.somoimno}'>
        <span class="glyphicon glyphicon-list-alt" style='color: #ffffff'></span> 전체글 </A> <span class='top_menu1'></span>    
      <A class='menu_link'  href='${root }/atcfile/list.do?somoimno=${param.somoimno}'> 
        <span class="glyphicon glyphicon-picture" style='color: #ffffff'></span> 사진첩 </A> <span class='top_menu1'></span>    
      <A class='menu_link'  href='${root }/calendar/calendar2.jsp?somoimno=${param.somoimno}'> 
        <span class="glyphicon glyphicon-calendar" style='color: #ffffff'></span> 일정 </A>
    </NAV>
  </DIV>
  
<!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
<DIV class='container' style='width: 90%; margin-top: 100px;'>  
  <div class="row">
    <div class="col-6 col-md-4" style='width: 28%; margin-top: 40px;'>
       <input type='hidden' name='somiomno' id='somoimno' value='${param.somoimno }' >
       <c:set var="thumb" value="${somoimVO.thumb.toLowerCase() }" />
               
        <!-- 대표 이미지 -->
        <c:choose>
        <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
          <A class='menu_link'  href='${root}/somoim/read.do?somoimno=${param.somoimno}'>
          <img src='${root}/somoim/storage/${somoimVO.thumb }' class="img-rounded" alt="Cinque Terre" style='width: 270px; height: 180px;'></A>
        </c:when>
        </c:choose><br>
        
        <H3 style='color: #555555; text-align: left; margin-left: 30px;'>${somoimVO.name }</H3>
       
        <UL style='padding-left: 30px;'>
        <LI class='li_left'>
          <A href="javascript:update_image(${param.somoimno })"><span class='glyphicon glyphicon-cog'></span><span style='font-size: 0.9em'> 이미지 변경</span></A>
        </LI>
        <LI class='li_left'>
          <A href="../somoim/update.do?somoimno=${param.somoimno }"><span class='glyphicon glyphicon-cog'></span><span style='font-size: 0.9em'> 소모임 설정</span></A>
        </LI>
        <LI class='li_left'>
          <A href="../somoim/delete.do?somoimno=${param.somoimno }"><span class='glyphicon glyphicon-cog'></span><span style='font-size: 0.9em'> 소모임 삭제</span></A>
        </LI>
      </UL>     
    </div>
      
     <div class="col-md-8" style='width: 70%;'>  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>