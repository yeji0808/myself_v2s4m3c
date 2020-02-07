<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>소모임</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(function() { // 자동 실행
    list_by_writeno(${param.writeno });  // JS의 EL 접근
    
    if ('${sessionScope.memberno}' != '') { // 로그인된 경우
        // alert('sessionScope.memberno: ' + '${sessionScope.memberno}');

        var frm_s_reply = $('#frm_s_reply');
        $('#content', frm_s_reply).attr('placeholder', '댓글 작성');
      }
  });
   
  function panel_img(file) {
    var tag = "";
    tag = "<A href=\"javascript: $('#atcfile_panel').hide();\">";
    tag += "  <IMG src='../atcfile/storage/" + file
        + "' style='width: 100%;'>";
    tag += "</A>";

    $('#atcfile_panel').html(tag);
    $('#atcfile_panel').show();
  }
  
  function create_s_reply() {
    var frm_s_reply = $('#frm_s_reply');
    var params = frm_s_reply.serialize();
    // alert('checkId() 호출됨: ' + params);
    // return;
    if ($('#memberno', frm_s_reply).val().length == 0) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("로그인해야 등록 할 수 있습니다."); // 내용
      $('#modal_panel').modal();            // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    // 영숫자, 한글, 공백, 특수문자: 글자수 1로 인식, 오라클은 1자가 3바이트임으로 300자로 제한
    // alert('내용 길이: ' + $('#content', frm_s_reply).val().length);
    // return;
    if ($('#content', frm_s_reply).val().length > 300) {
      $('#modal_title').html('댓글 등록'); // 제목 
      $('#modal_content').html("댓글 내용은 300자이상 입력 할 수 없습니다."); // 내용
      $('#modal_panel').modal();           // 다이얼로그 출력
      return;  // 실행 종료
    }
    
    $.ajax({
      url: "../s_reply/create.do", // action 대상 주소
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
          
          list_by_writeno(${param.writeno }) // 목록을 새로 읽어옴.
          
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
  function list_by_writeno(writeno) {
    //alert(writeno);
    var params = 'writeno=' + writeno;

    $.ajax({
      url: "../s_reply/list_by_writeno_join.do", // action 대상 주소
      type: "get",           // get, post
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   // 응답 형식: json, xml, html...
      data: params,        // 서버로 전달하는 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        // alert(rdata);
        var msg = '';
        
        $('#panel_s_reply').html(''); // 패널 초기화, val(''): 안됨
        
        for (i=0; i < rdata.list.length; i++) {
          var row = rdata.list[i];
          
          msg += "<DIV style='border-bottom: solid 1px #EEEEEE; margin-bottom: 10px;'>";
          msg += "<span style='font-weight: bold; color: #2A2A2A'>" + row.id + "</span>" + "<br>";
          msg += "<span style='color: #000000; font-size: 15px;'>" + row.content + "</span><br>" +"<span style='float: left; font-size: 0.9em; color: #999999;'>" + row.rdate+ "</span><br>";
          msg += "<button type='button' style='font-size: 0.9em; margin-bottom: 5px;'>답글</button>";
          if ('${sessionScope.memberno}' == row.memberno) { // 글쓴이 일치여부 확인
            msg += "<button type='button' onclick='javascript:s_reply_delete("+row.replyno+")' style='font-size: 0.9em; margin-bottom: 5px; margin-left: 5px;'>삭제</button><br>";
          }
          msg += "</DIV>";
        }
        // alert(msg);
        $('#panel_s_reply').append(msg);
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
  
  // 삭제 레이어 출력
  function s_reply_delete(replyno) {
    // alert('replyno: ' + replyno);
    var frm_s_reply_delete = $('#frm_s_reply_delete');
    $('#replyno', frm_s_reply_delete).val(replyno);  // 삭제할 댓글 번호 저장
    $('#modal_panel_delete').modal();              // 삭제폼 다이얼로그 출력
  }
  
  // 삭제 처리
  function s_reply_delete_proc(replyno) {
    // alert('replyno: ' + replyno);
    var params = $('#frm_s_reply_delete').serialize();
    $.ajax({
      url: "./s_reply_delete.do", // action 대상 주소
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

            $('#btn_frm_s_reply_delete_close').trigger("click"); // 삭제폼 닫기 
            
            list_by_writeno(${param.writeno }); // 목록을 다시 읽어옴
            
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
</script>
</head>

<body>
  <c:set var="somoimno" value="${somoimVO.somoimno}" />
  <c:set var="writeno" value="${S_WriteVO.writeno }" />

  <jsp:include page="/menu/top.jsp" flush='false' />
  <jsp:include page="/menu/s_top.jsp" flush='false' />

  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
          <!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
          <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" onclick='javascript:location.reload();'
            class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal 알림창 종료 -->
  
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
          <form name='frm_s_reply_delete' id='frm_s_reply_delete' method='POST' 
                    action='./s_reply_delete.do'>
            <input type='hidden' name='replyno' id='replyno' value=''>
            
            <label>패스워드</label>
            <input type='password' name='passwd' id='passwd' class='form-control'>
            <div style='text-align: right; margin: 5px;'>
              <button type='button' class='btn btn-success' 
                           onclick="s_reply_delete_proc(this.form.replyno.value);this.form.passwd.value='';">삭제</button>
            </div> 
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" 
                       id='btn_frm_s_reply_delete_close'>Close</button>
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
          <h4 class="modal-title">댓글 삭제</h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_panel_delete_msg_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal"
                      onclick="$('#modal_panel_delete').show();">Close</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->

  <ASIDE style='float: left;'>
    <A href='../somoim/list.do'>소모임</A> > 
    <A href='./list.do?somoimno=${somoimno }'>${somoimVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A> <span
      class='menu_divide'> | </span> <A
      href='./list.do?somoimno=${param.somoimno }'>목록</A>

    <c:if test='${sessionScope.id != null }'>
      <span class='menu_divide'> | </span>
      <A href='./update.do?somoimno=${param.somoimno }&writeno=${param.writeno}'>수정</A>
      <span class='menu_divide'> | </span>
      <a href="../atcfile/create.do?writeno=${param.writeno}&somoimno=${param.somoimno}">첨부 파일 등록</A>
      <span class='menu_divide'> | </span>
      <a href="./file_delete.do?writeno=${param.writeno}&somoimno=${param.somoimno}">첨부 파일 삭제</A>
      <span class='menu_divide'> | </span>
      <A href='./delete.do?somoimno=${param.somoimno }&writeno=${param.writeno}'>삭제</A>
    </c:if>

  </ASIDE>

  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
    <input type="hidden" name="writeno" value="${writeno}">
    <fieldset class="fieldset">
      <ul>
        <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
          <span>${writeVO.title}</span> 
          (<span>${writeVO.recom}</span>)
          <span style='float: right;'>${writeVO.rdate.substring(0, 16)}</span>
        </li>
        <li class="li_none">
          <DIV id='atcfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
        </li>
        <li class="li_none" style='text-align: center;'>
        <c:forEach var="atcfileVO" items="${atcfile_list }">
            <c:set var="thumb" value="${atcfileVO.thumb.toLowerCase() }" />
            <c:choose>
              <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <A href="javascript:panel_img('${atcfileVO.fname }')"><IMG src='../atcfile/storage/${thumb }' style='margin-top: 2px;'></A>
              </c:when>
            </c:choose>
          </c:forEach>
        </li>

        <li class="li_none">
          <DIV>${writeVO.content }</DIV>
        </li><br><br><br><br><hr>
        <li class="li_none">
          <DIV style='text-decoration: none;'>
            <span class="glyphicon glyphicon-search"></span> 검색어:(키워드) ${writeVO.word }
          </DIV>
        </li>
        <li class="li_none">
          <DIV>
            <span class="glyphicon glyphicon-download-alt"></span> 파일명을 클릭하면 다운로드가 가능합니다. 
            <A href='../atcfile/downzip.do?writeno=${writeno}'><IMG src='./images/zip.png' title='zip 파일 다운로드'></A>
          </DIV>
          <DIV>
            <c:forEach var="atcfileVO" items="${atcfile_list }">
              <c:set var="fname"  value="${atcfileVO.fname.toLowerCase() }" />
              <A href='${root}/download2?dir=/atcfile/storage&filename=${atcfileVO.fupname}&downname=${atcfileVO.fname}'>${atcfileVO.fname}</A> /              
              </c:forEach>
          </DIV>
        </li>
      </ul>
    </fieldset>
  </FORM>
  <!-- 댓글 영역 시작 -->
  <DIV style='width: 90%;'>

    <HR>
    <FORM name='frm_s_reply' id='frm_s_reply'>
    
      <input type="hidden" name='writeno' id='writeno' value='${param.writeno }'> 
      <input type="hidden" name='memberno' id='memberno' value='${sessionScope.memberno }'>
      
      <textarea name='content' id='content' style='width: 100%; height: 50px; resize: none;' placeholder="댓글 작성"></textarea>
      <input type='password' name='passwd' id='passwd' placeholder="비밀번호">
      <button type='button' id='btn_create' onclick="create_s_reply();" class='btn btn-primary btn-sm'>등록</button>
    </FORM>
    <HR>

    <DIV id='panel_s_reply'></DIV>
  </DIV>
  <!-- 댓글 영역 종료 -->
  <jsp:include page="/menu/s_bottom.jsp" flush='false' />
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
