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

<!-- Fotorama -->
  <link href="fotorama.css" rel="stylesheet">
  <script src="fotorama.js"></script>

<script type="text/javascript">
$(function() { // 자동 실행
  list_by_restno(${restrntsVO.restno });  // JS의 EL 접근
  
  if ('${sessionScope.memberno}' != '') { // 로그인된 경우
    //alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

    var frm_reply = $('#frm_reply');
    $('#content', frm_reply).attr('placeholder', '댓글 작성');
  }
});

function create_reply() {
  var frm_reply = $('#frm_reply');
  var params = frm_reply.serialize();
  
  len = $('#memberno', frm_reply).val().length;
  // alert('length: ' + len);
  // return;
  
  if (len == 0) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
    $('#modal_panel').modal();            // 다이얼로그 출력
    
    return;  // 실행 종료
  }
  
  if ($('#content', frm_reply).val().length > 300) {
    $('#modal_title').html('댓글 등록'); // 제목 
    $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
    $('#modal_panel').modal();           // 다이얼로그 출력
    return;  // 실행 종료
  } 
  
  $.ajax({
    url: "../review/create.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우

      var msg = "";
      
      if (rdata.count > 0) {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "댓글을 등록했습니다.";
        
        list_by_restno(${restrntsVO.restno }) // 목록을 새로 읽어옴.
        
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
function list_by_restno(restno) {
  // alert(contentsno);
  var params = 'restno=' + restno;

  
  $.ajax({
    url: "../review/list_by_restno_join.do", // action 대상 주소
    type: "get",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      var msg = '';
      
      $('#panel_reply').html(''); // 패널 초기화, val(''): 안됨
      
      for (i=0; i < rdata.list.length; i++) {
        var row = rdata.list[i];
        
        msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
        msg += "<span style='font-weight: bold;'>" + row.id + "</span>";
        msg += "  " + row.rdate;
        if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
          msg += " <A href='javascript:reply_delete("+row.reviewno+")'><IMG src='./images/delete.png'></A>";
        }
        msg += "  " + "<br>";
        msg += row.content;
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

//삭제 레이어 출력
function reply_delete(reviewno) {
  // alert('reviewno: ' + reviewno);
  var frm_reply_delete = $('#frm_reply_delete');
  $('#replyno', frm_reply_delete).val(reviewno); // 삭제할 댓글 번호 저장
  $('#modal_panel_delete').modal();               // 삭제폼 다이얼로그 출력
}

// 삭제 처리
function reply_delete_proc(reviewno) {
  // alert('replyno: ' + replyno);
  var params = $('#frm_reply_delete').serialize();
  $.ajax({
    url: "./review_delete.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
      // alert(rdata);
      var msg = "";
      
      if (rdata.count ==1) { // 패스워드 일치
        if (rdata.delete_count == 1) { // 삭제 성공

          $('#btn_frm_reply_delete_close').trigger("click"); // 삭제폼 닫기, click 발생 
          
          list_by_restno(${restrntsVO.restno }); // 목록을 다시 읽어옴
          
          return; // 함수 실행 종료
        } else {  // 삭제 실패
          msg = "패스 워드는 일치하나 댓글 삭제에 실패했습니다. <br>";
          msg += " 다시한번 시도해주세요."
        }
      } else { // 패스워드 일치하지 않음.
        msg = "패스워드가 일치하지 않습니다.";
      }
      
      $('#modal_panel_delete').hide();       // 삭제폼이 있는창을 숨김
      
      $('#modal_panel_delete_msg_content').html(msg);   // 내용
      $('#modal_panel_delete_msg').modal();                   // 다이얼로그 출력        

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

//추천수
function increase_recom(){
  var frm_recom = $('#frm_recom');
  var params = frm_recom.serialize();

  if ($('#memberno', frm_reply).val().length == 0) {
    $('#modal_title').html('추천 등록'); // 제목 
    $('#modal_content').html("로그인해야 추천할 수 있습니다."); // 내용
    $('#modal_panel').modal();            // 다이얼로그 출력
    
    return;  // 실행 종료
  }

  $.ajax({
    url: "../m_rec/increase_recom.do", // action 대상 주소
    type: "post",           // get, post
    cache: false,          // 브러우저의 캐시영역 사용안함.
    async: true,           // true: 비동기
    dataType: "json",   // 응답 형식: json, xml, html...
    data: params,        // 서버로 전달하는 데이터
    success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우

      var msg = "";
      
      if (rdata.like == 1) {
        $('#modal_content').attr('class', 'alert alert-success'); // CSS 변경
        msg = "추천 완료!";
        
        $('#rec_img').attr('src','./images/full_heart.png');
        $('#panel_recom').html(rdata.rrecom);
        
      } else {
        $('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
        msg = "추천을 취소합니다.";
        
        $('#rec_img').attr('src','./images/heart.png');
        $('#panel_recom').html(rdata.rrecom);
      }
      
      $('#modal_title').html('추천 확인'); // 제목 
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
</script>

</head>

<body>
  <c:set var="rcateno" value="${restcategrpVO.rcateno}" />
  <c:set var="restno" value="${restrntsVO.restno }" />
  
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
  </div> <!-- Modal 알림창 종료 -->
  
  <!-- 삭제폼 -->
  <div class="modal fade" id="modal_panel_delete" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <form name='frm_reply_delete' id='frm_reply_delete' method='POST' 
                    action='./review_delete.do'>
            <input type='hidden' name='reviewno' id='reviewno' value=''>
            
            <label>패스워드</label>
            <input type='password' name='passwd' id='passwd' class='form-control'>
            <div style='text-align: right; margin: 5px;'>
              <button type='button' class='btn btn-success' 
                           onclick="reply_delete_proc(this.form.replyno.value);this.form.passwd.value='';">삭제</button>
            </div> 
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       id='btn_frm_reply_delete_close'>Close</button>
        </div>
      </div>
    </div>
  </div> <!-- 삭제폼 종료 -->
  
  <!-- 삭제폼 알림창 시작 -->
  <div class="modal fade" id="modal_panel_delete_msg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
                       onclick="$('#modal_panel_delete').show();">×</button>
          <h4 class="modal-title">비밀번호 에러</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_panel_delete_msg_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <!-- 현재 창은 삭제되면서 삭제폼이 다시 출력됨. -->
          <button type="button" class="btn btn-default" data-dismiss="modal"
                      onclick="$('#modal_panel_delete').show();">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
      <ASIDE style='float: right;'>
      <A href="javascript:location.reload();">새로고침</A>
      
      <span class='menu_divide' > | </span> 
      <A href='./list.do?rcateno=${rcateno }'>목록</A>
        <span class='menu_divide' > | </span> 
        <A href='./update_info.do?restno=${restno}&rcateno=${rcateno}'>수정</A>
        <span class='menu_divide' > | </span> 
        <A href='./delete.do?restno=${restno}&rcateno=${rcateno}'>삭제</A>
    </ASIDE> 

 
      <DIV style='margin: 5% 18%; width: 70%;'>
      <FORM name='frm_recom' id='frm_recom'>
        <input type='hidden' name='restno' id='restno' value='${restno}'>       
        <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
        <div class="container">
          <!-- 첨부사진 영역 시작-->
          <div class="col-5" style="width: 40%; float:left;">
          <div class="fotorama" data-autoplay="5000" data-nav="thumbs" data-width="400" data-ratio="220/300" data-max-width="100%" style="margin: 0px auto;">
            <c:forEach var="rattachfileVO" items="${attachfile_list }">
              <c:set var="thumb" value="${rattachfileVO.thumb.toLowerCase() }" />                
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <a href="../rattachfile/storage/${rattachfileVO.fname}"><IMG src='../rattachfile/storage/${thumb }' style='margin-top: 2px;'></a>
                </c:when>
              </c:choose>
            </c:forEach>
          </div>
          </div>
          <!-- 첨부사진 영역 종료--> 
        
          <!-- 정보 영역 시작 -->
          <div class="col-6" style="width: 50%; float:left;">
            <h1 class="title">${restrntsVO.rname}</h1>
            <h5 class="card-text">${restrntsVO.rmain}</h5>
            <br><br>
            <button type="submit" class="btn btn-info" >예약하기</button>
            <c:choose>
              <c:when test="${m_recVO.recno==null}">
                <A href='javascript:increase_recom();'><IMG src='./images/heart.png' style='padding-left:0.5em; padding-right:0.3em;'title='추천수' id='rec_img'></A><span id="panel_recom" style='font-size: 15px;'>${restrntsVO.rrecom}</span>
              </c:when>
              <c:otherwise> 
                <A href='javascript:increase_recom();'><IMG src='./images/full_heart.png' style='padding-left:0.5em; padding-right:0.3em;'title='추천수' id='rec_img'></A><span id="panel_recom" style='font-size: 15px;'>${restrntsVO.rrecom}</span>
              </c:otherwise>
            </c:choose>
            
            <hr>
            <div class="context"><IMG src='./images/clock.png' style='padding: 0em 1em;'>${restrntsVO.rtime}</div>
            <hr>
            <div class="context"><IMG src='./images/call.png' style='padding: 0em 1em;'>${restrntsVO.rcall}</div>
            <hr>
            <div class="context"><IMG src='./images/pin.png' style='padding: 0em 1em;'>${restrntsVO.raddress1}${restrntsVO.raddress2}</div>
            <hr>
            <div class="context" style='overflow:hidden;'><IMG src='./images/cutlery.png' style='padding: 0.5em 1em 0em 1em; float: left;'>
            <div class="context" style='float: left; padding: 0px;'>
            <c:forEach var="menuVO" items="${menu_list }">
            ${menuVO.mname}  <a style='color:#C5C5C5;'>····································</a>  ${menuVO.mprice} 원<br>
            </c:forEach>
            </div>
            </div>
            <hr>
            <div class="context" style='overflow:hidden;'>
              <IMG src='./images/doc.png' style='padding: 0.5em 1em 0em 1em; float: left;'>${restrntsVO.rintro}</div>
            <hr>
            <div class="context"><IMG src='./images/search.png' style='padding: 0em 1em;'>${restrntsVO.rword}</div>          
          </div>
          <!-- 정보 영역 종료 -->    
        </div>        
      </FORM>
      
      <!-- 댓글 영역 시작 -->
      <DIV style="width: 91%;">
      <h1 class="r_title" style="margin-top: 7%;">음식점 리뷰</h1>
        <HR>
        <FORM name='frm_reply' id='frm_reply'>
          <input type='hidden' name='restno' id='restno' value='${restno}'>
          <input type='hidden' name='memberno' id='memberno' value='${sessionScope.memberno}'>
          
          <textarea name='content' id='content' style='width: 100%; height: 60px;' placeholder="댓글 작성, 로그인해야 등록 할 수 있습니다."></textarea>
          <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
          <button type='button' id='btn_create' onclick="create_reply();">등록</button>
        </FORM>
        <HR>
        <DIV id='panel_reply'>
        
        </DIV>
        
      </DIV>
      </DIV>

  

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
