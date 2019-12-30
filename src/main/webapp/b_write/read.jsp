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
  function create_wreply() {
    var frm_reply = $('#frm_reply');
    var params = frm_reply.serialize();
     //alert('checkId() 호출됨: ' + params);
     //return;
    if ($('#memberno', frm_reply).val().length == 0) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#content', frm_reply).val().length);
    // return;
    if ($('#rcontent', frm_reply).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    $.ajax({
      url: "../wreply/create.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = "";
        
        if (rdata.count > 0) {
          $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
          msg = "댓글을 등록했습니다.";
          
          list_by_contentsno(${writeVO.wno }) // 목록을 새로 읽어옴.
          
        } else {
          $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
          msg = "댓글 등록에 실패했습니다.";
        }
        
        $('#modal_title').html('댓글 등록'); // 제목 
        $('#modal_content').html(msg);        // 내용
        $('#modal_panel').modal();              // 다이얼로그 출력
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
//댓글 목록
  function list_by_wno(wno) {
    // alert(wno);
    var params = 'wno=' + wno;

    $.ajax({
      url: "../wreply/list_by_wno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#panel_reply').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          
          msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
          msg += "  " + row.rrdate;
          if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
            msg += " <A href='javascript:wreply_delete("+row.wreplyno+")'><IMG src='./images/delete.png'></A>";
          }
          msg += "  " + "<br>";
          msg += row.rcontent;
          msg += "</DIV>";
        }
        // alert(msg);
        $('#panel_reply').append(msg);
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
    tag += "  <IMG src='../w_attach/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#w_attach_panel').html(tag);
    $('#w_attach_panel').show();
  }
  
  function increase_recom() {
    var frm_recom = $('#frm_recom');
    var params = frm_recom.serialize();
    //alert(params);


    $.ajax({
      url: "./increase_recom.do", // action 대상 주소
      type: "post",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터 
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        //alert(rdata.wrecom);
        // alert($('#wrecom_span', frm_recom).html("2020"));
        $('#wrecom_span',frm).html(rdata.wrecom);
        
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
<c:set var="boardno" value="${boardVO.boardno}" />
<c:set var="wno" value="${writeVO.wno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div> 
  <!-- Modal 알림창 종료 -->
  

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="wno" value="${wno}">
      <input type="hidden" name=boardno value="${param.boardno}">
      <div style="width:80%; margin:0px auto; padding-top: 50px">
       <div style="float: left;clear:both;">
        <A href='./list.do?boardno=${param.boardno }'>${boardVO.name }</A> 
      </div>
       <div style="float: right; ">
         <A href="javascript:location.reload();">새로고침</A>
      </div>
      <fieldset class="fieldset" style="width:100% ;margin: 0px auto">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span style="font-style: oblique; font-weight: bold;">${writeVO.wtitle}</span>
            <span style="float: right; padding-right: 5px">[${writeVO.rdate.substring(0, 16)}]</span>
            <span id='wrecom_span' style="float:right; padding-right:15px"> ${writeVO.wrecom}</span>
            <span style="float: right">LIKE :</span>
          </li>
           <li class="li_none">
            <DIV id='w_attach_panel' style="width: 80%; margin: 0px auto;"></DIV> 원본 이미지 출력
          </li> 
           <li class="li_none" style='text-align: center;'>
          
          </li> 
          
          <li class="li_none">
            <DIV>${writeVO.wcontent }${thumb}</DIV>
          </li>
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어(키워드): ${writeVO.wword }
            </DIV>
          </li>
          <li class="li_none">
            <DIV>
              <span class="glyphicon glyphicon-download-alt"></span>
              파일명을 클릭하면 다운로드가 가능합니다. 
              <A href='../w_attach/downzip.do?wno=${wno}'>
                <IMG src='./images/zip_mount.png' title='zip 파일 다운로드'></A>
                <DIV>
                
              <c:forEach var="w_attachVO" items="${w_attach_list }">
                <c:set var="w_attachname" value="${w_attachVO.w_attachname.toLowerCase() }" />
                <A href='${root}/download2?dir=/w_attach/storage&filename=${w_attachVO.w_attachupfile}&downname=${w_attachVO.w_attachname}'>${w_attachVO.w_attachname}</A> /              
              </c:forEach> 
            </DIV>  
                  <c:forEach var="w_attachVO" items="${w_attach_list }">
              <c:set var="thumb" value="${w_attachVO.w_attachthumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img_w('${w_attachVO.w_attachname }')"><IMG src='../w_attach/storage/${thumb }' style='margin-top: 2px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
              </DIV>
             <br>
         </li>                    
        </ul>
      </fieldset>
      </div>
  </FORM> 
           <!-- 기타 기능 영역 시작 --> 
           <form name="frm_recom" id="frm_recom">
            <input type='hidden' name='wno' id='wno' value='${param.wno}'> 
            
     <%-- <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'> --%>
      
            <DIV style="width: 80%; margin: 0px auto; ">
      
              <button type="button"
                onclick="location.href='./file_delete.do?wno=${wno}&boardno=${param.boardno}'"
                class="btn btn-info" style="float: right; margin: 2px">
                첨부파일 삭제</button> 
              <button type="button"
                onclick="location.href='../w_attach/create.do?boardno=${param.boardno }&wno=${wno}'"
                class="btn btn-info" style="float: right; margin: 2px">
                첨부파일 등록</button>
              <button type="button"
                onclick="location.href='./delete.do?boardno=${param.boardno }&wno=${wno}'" 
                class="btn btn-info" style="float: right; margin: 2px">
                글 삭제</button>
              <button type="button"
                onclick="location.href='./update.do?boardno=${param.boardno }&wno=${wno}'"
                class="btn btn-info" style="float: right; margin: 2px">
                글 수정</button>
               <button type="button" onclick="increase_recom();" 
                          class="btn btn-info" style="float: right; margin: 2px ">LIKE IT</button>
            </DIV> <!-- 기타 기능 영역 종료 --> 
            </form>
             
 
 <!-- 댓글 영역 시작 -->
 <div style='border-top: solid 1px #AAAAAA; width:80%; margin:0px auto; '><br></div>
    <DIV style="width:80%; margin: 0px auto; ">
    
    <form name="frm_reply" id="frm_reply">
      <input type="hidden" name="wno" id="wno" value="${param.wno }">
      <input type="hidden" name="memberno" id="memberno" value="1">
      <textarea name="rcontent" id="rcontent" style="width: 100%; height:60px;"placeholder="댓글"></textarea>
      <input type="password" name="rpasswd" id="rpasswd" placeholder="비밀번호">
      <button type="button" id="btn_create" onclick="create_wreply();">등록</button>
    </form>
    <HR>
    <DIV id='panel_reply'>
    
    </DIV>
    </DIV>
    <!-- 댓글 영역 종료 --> 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  