<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
String root = request.getContextPath();
%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<style>
#test_btn1 {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  margin-right: -4px;
}

#btn_group button {
  width: 20%;
   height:150px;
  border: 1px solid skyblue;
  background-color: rgba(0, 0, 0, 0);
  color: skyblue;
  padding: 5px;
}

#btn_group button:hover {
  color: white;
  background-color: skyblue;
}
</style>

<link href="../css/css.css" rel="Stylesheet" type="text/css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">  

//추천항목 별 img 산출
function load_recom_image(recom_no){
  var params = 'recom_no=' + recom_no; 
  /* alert(params);
  return;  */
  $.ajax({
    url: "../rec_img/list_by_recom_no.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      //alert(rdata);
      var msg = '';
      
      // $('#panel_recom').html(''); // 패널 초기화, val(''): 안됨
      
      for (i=0; i < rdata.list.length; i++) { 
        var row = rdata.list[i];
        msg += "<A href='javascript:panel_img_w(" +row.fname+ ")'><IMG src='../rec_img/storage/"+row.thumb+"'></A>";
      }
       //alert(msg);
      $('#recom_image_panel_'+recom_no).html(msg);
    },
    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
    error: function(request, status, error) { // callback 함수
      var msg = 'ERROR request.status: '+request.status + '/ ' + error;
      console.log(msg);
    }});
}
// 추천항목 삭제
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
//추천수 증가시키기
function increase_cnt(recom_no) {
  var frm_recom = $('#frm_recom');
  var params ="recom_no=" +recom_no;
  //alert(params);


  $.ajax({
    url: "../rec/increase_cnt.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터 
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      
      $('#panel_recom_cnt_'+recom_no,frm_recom).html(rdata.cnt);
      
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
function panel_img_w(file) {
  var tag = "";
  tag   = "<A href=\"javascript: $('#w_attach_panel').hide();\">";
  tag += "  <IMG src='../rec_img/storage/" + file + "' style='width: 100%;'>"; 
  tag += "</A>";
  
  $('#w_attach_panel').html(tag);
  $('#w_attach_panel').show();
}
</script> 
</head>

<body style="font-family: 'Do Hyeon'', sans-serif">
<c:set var="cho_no" value="${choiceVO.cho_no }" />




<jsp:include page="/menu/top.jsp" flush='false' />


  <FORM name='frm' method="get" action='./update.do'>
    <input type="hidden" name="cho_no" value="${cho_no}">
    <div style="width: 60%; margin: 0px auto; padding-top: 50px"> 
      <div style="float: left; clear: both;">
        <!-- <A href='../rec_img/list.do'>이미지 전체 보기</A> -->
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
            <DIV id='panel_img_w' style="width: 100%; margin: 0px auto;"></DIV>
          </li>
          <!-- ********************CHOICE READ 내용 종료******************** -->
          
        </ul>
      </fieldset>
    </div>
  </FORM>
  <!-- ********************선택지 리스트 시작******************** -->
  <form name="frm_recom" id="frm_recom"  style="width: 100%; ">
  <input type="hidden" name="cho_no" value="${cho_no}">
  
    <DIV style="width: 40%; margin:100px auto;"  > 

      <c:forEach var="recVO" items="${list_recom }" varStatus="stat">
          <c:set var="recom_no" value="${recVO.recom_no }" /> 
          <div>
            <div style="float: left; width: 80%;"><span style="font-size: 2em; font-weight: bold;">${stat.count}. ${recVO.content }<br></span>
                     <A href='../rec_img/create.do?recom_no=${recom_no}&cho_no=${param.cho_no}' style='margin: 4px;'><IMG src='./images/upload.png'  ></A>
                     <A href='../rec/update.do?cho_no=${param.cho_no}&recom_no=${recom_no}' style='margin: 4px;'><IMG src='./images/update.png' ></A>
                     <A href='javascript:delete_recom(${recom_no})' style='margin: 4px;'><IMG src='./images/delete.png' ></a>
                     <script type="text/javascript">load_recom_image(${recom_no });</script> 
                     <div id='recom_image_panel_${recom_no }'></div> 
            </div>   
            
          </div>     
          <div id="btn_group" style="margin-top: 10px;" >   
          <button id="test_btn1" type="button" onclick="increase_cnt(${recom_no });" >좋아요<br><span id="panel_recom_cnt_${recom_no }" >${recVO.cnt }</span></button>
          
          </div>
          <div style="clear: both;"></div> 
        </c:forEach>
      </DIV>
  </form>
  
        
  <!-- ********************선택지 리스트 종료******************** -->
   
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
  