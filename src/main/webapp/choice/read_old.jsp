<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">  
$(function() { // 자동 실행
  list_by_cho_no(${recVO.cho_no });  // JS의 EL 접근
  
  if ('${sessionScope.memberno}' != '') { // 로그인된 경우
    alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

    var frm_recom = $('#frm_recom');
    $('#content', frm_wreply).attr('placeholder', '댓글 작성');
    
  }
});


//추천항목 목록
function list_by_cho_no(cho_no) {
  var params = 'cho_no=' + cho_no; 
  /* alert(params);
  return;  */
  $.ajax({
    url: "../rec/list_by_cho_no.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      //alert(rdata);
      var msg = '';
      
      $('#panel_recom').html(''); // 패널 초기화, val(''): 안됨
      
      for (i=0; i < rdata.list.length; i++) {
        var row = rdata.list[i];
        /* alert(row.content + " " + row.recom_no); */
        msg += "<span style='font-size: 2em'>" + row.content +"<br></span>";
        msg += "<A href='javascript:delete_recom("+ row.recom_no +")' style='margin: 4px;'><IMG src='./images/delete.png'></a>";
        msg += " <A href='javascript:delete_recom()'></A>";
        msg += "<A href='../rec/update.do?cho_no=${param.cho_no}&recom_no="+ row.recom_no +"' style='margin: 4px;'><IMG src='./images/update.png'></button>"
          // if ('${sessionScope.memberno}' == row.memberno) {  글쓴이 일치여부 확인 
       // } 
        
           
        
        msg += "<div style='clear: both;'></div>";
        msg += "<hr>"
      }
      
       //alert(msg);
      $('#panel_recom').append(msg);
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }
  
  });}
  function delete_recom(recom_no) {
    /* var frm_recom = $('#frm_recom'); */
    var params = 'recom_no=' + recom_no;
     /* alert(params);  
    return;   */


    $.ajax({
      url: "./recom_delete.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터 
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        location.reload();
      }, 
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
      } 
    });
 } 
    </script> 
</head>

<body>
<c:set var="cho_no" value="${choiceVO.cho_no }" />

<jsp:include page="/menu/top.jsp" flush='false' />


  <FORM name='frm' method="get" action='./update.do'>
    <input type="hidden" name="cho_no" value="${cho_no}">
    <div style="width: 80%; margin: 0px auto; padding-top: 50px">
      <div style="float: left; clear: both;">
        <A href='../rec_img/list.do'>이미지 전체 보기</A>
      </div>
      <div style="float: left; clear: both;">
        <A href='./list.do'>추천게시판</A>
      </div>
      <div style="float: right;">
        <A href="javascript:location.reload();">새로고침</A>
      </div>
      <fieldset class="fieldset" style="width: 100%; margin: 0px auto" >
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> <span
            style="font-style: oblique; font-weight: bold;">${choiceVO.cho_title}</span>
            <span style="float: right; padding-right: 5px">[${choiceVO.rdate.substring(0, 16)}]</span>
          </li>
          <li class="li_none" style='text-align: center;'></li>
          <!-- ********************CHOICE READ 내용 시작******************** -->
          <li class="li_none">
            <DIV style="padding-left: 20px">${choiceVO.cho_content }</DIV>
          </li>
          <!-- ********************CHOICE READ 내용 종료******************** -->
          
        </ul>
      </fieldset>
    </div>
  </FORM>
  <!-- ********************선택지 리스트 시작******************** -->
  <form name="frm_recom" id="frm_recom">
  <input type="hidden" name="cho_no" value="${cho_no}">
  
    <DIV style="width: 40%; padding-left: 150px; float: left;" >
      <br>
      <br>
      <DIV id="panel_recom">
      </DIV>
    </DIV>
  </form>
  <!-- ********************선택지 리스트 종료******************** -->
   
  <!-- Thumb파일 출력 폼
  <form action="" style="float: left">
    <div panel_rec_img>
      <span>cusim</span>
    </div>
  </form>
  <c:forEach var="rec_imgVO" items="${rec_img_list }">
              <c:set var="thumb" value="${rec_imgVO.w_attachthumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img_w('${w_attachVO.w_attachname }')"><IMG src='../rec_img/storage/${thumb }' style='margin-top: 2px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
  Thumb파일 출력 폼 끝 -->
  
  <div style="clear: both;"></div>
           <!-- 기타 기능 영역 시작 --> 
           <form name="frm_none" id="frm_none">
            
     <%-- <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'> --%>
      
            <DIV style="width: 80%; margin: 0px auto; ">
              <br><br>
              <button type="button"
                onclick="location.href='../rec/create.do?cho_no=${cho_no}'"
                class="btn btn-info" style="float: right; margin: 2px">
                선택지 추가</button>
              <button type="button"
                onclick="location.href='./delete.do?cho_no=${cho_no}'"
                class="btn btn-info" style="float: right; margin: 2px">
                글 삭제</button>
              <button type="button"
                onclick="location.href='./update.do?cho_no=${cho_no}'"
                class="btn btn-info" style="float: right; margin: 2px">
                글 수정</button>
                <br><br>
            </DIV> <!-- 기타 기능 영역 종료 --> 
            </form>
            
 

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  