<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
    
    <title>정보수정</title>
    <link href="../css/style.css" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    $(function(){
    	 $("#myinfo").click(function(){
	        		window.location.href="/myinfo";
	        });
	        
	        $("#mypage_jim").click(function(){

	        		window.location.href="/mypage";

	        });
	        
	        $("#mycomment").click(function(){
				
	        		window.location.href="/mycomment";

	        });
    });
	function checkPwd(){
		var passReg=/[a-z0-9]{10,15}$/g;
		var password=$("#passwd").val();
		var repassword=$("#repasswd").val();
		var check_pw=password.search(/[0-9]/g);
		var check_pw2=password.search(/[a-z]/ig);
	
		if(password.length<6){
			$("#passwd").css("background-color","#FFCECE");
		}
		if(repassword.length<6){
			$("#passwd").css("background-color","#FFCECE");
		}
		if(password ==""){
			$("#passwd").css("background-color","#FFCECE");
		}
		else if(repassword==""){
			$("#repasswd").css("background-color","#FFCECE");
		}
		else if(password!=repassword){
			$("#passwd").css("background-color","#FFCECE");
			$("#repasswd").css("background-color","#FFCECE");
		}
		else if(password.length>=6 && repassword.length >=6 && password==repassword && passReg.test(password) &&check_pw >=0 && check_pw2>=0)
		{
			$("#passwd").css("background-color","#B0F6AC");
			$("#repasswd").css("background-color","#B0F6AC");
		}
	}
	
	$(function(){
   		$("#join-submit").click(function(e){
    		e.preventDefault();

			var pw1=$("#passwd").val();
			var pw2=$("#repasswd").val();
			
			if(pw1!=pw2){
        			alert("비밀번호가 서로 다릅니다.");
			}else{
				var user_id = $("#userid").val();
				var user_name = $("#name").val();
				var user_pw = $("#passwd").val();
				var phone = $("#phone").val();
				
				$.ajax({
		    		  url:"/myupdate",
		    		  type:'post',
		    		  data:{
		    		  	user_id:user_id,
		    		  	user_name:user_name,
		    		  	user_pw:user_pw,
		    		  	phone:phone,
		    		  },
		    		  success:function(data){	
		        				alert("정보수정이 성공적으로 완료되었습니다.");
		        	        	window.location.href="/myinfo";
		    		  }	
	    		});
			}
    	});
	});

	
	</script>
    <style>
		#single-page-slider {
			background-image: url("../resources/imgs/banner/mypage-banner.jpg");
			bakcground-color: #483D8B;
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;
		}
	</style>
</head><!--/head-->
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- 내 정보 수정 페이지 (가입 페이지에서 아이디 체크, 이메일 체크 스크립트 들어낸 코드) -->
    <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
	                    
					        			<h2>마이페이지</h2>
                        <hr><p><a href="./mypage.jsp">예약 목록</a> · <a href="./mycomment.jsp">내 댓글</a> · <a href="./myinfo.jsp">정보수정</a></p>

                                </div>
                            </div>   
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
    </section><!--/#main-slider-->
    
    
    <DIV id='main_panel'></DIV>
 
  <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal END -->
 
  <DIV class='title_line' style='width: 30%;'>회원 정보 조회 및 수정</DIV>
 
  <FORM name='frm' id='frm' method='POST' action='./update.do' 
              onsubmit="return send();" class="form-horizontal">
    <input type='hidden' name='memberno' id='memberno' value='${membersVO.memberno }'>          
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>아이디</label>    
      <div class="col-md-10">
        ${membersVO.id }
        * 아이디는 변경이 불가합니다.
                
      </div>
    </div>   
                
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>성명</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='name' id='name' 
                   value='${membersVO.name }' required="required" style='width: 30%;' placeholder="성명">
      </div>
    </div>   
    
    <div class="form-group">
      <label class="col-md-2 control-label">생년월일</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='birth' id='birth' 
                   value='${membersVO.birth }' required="required" style='width: 30%;' placeholder="생년월일"> 예) 1999-01-01
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>전화번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='tel' id='tel' 
                   value='${membersVO.tel }' required="required" style='width: 30%;' placeholder="전화번호"> 예) 010-0000-0000
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label">이메일</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='email' id='email' 
                   value='${membersVO.email }' required="required" style='width: 30%;' placeholder="이메일"> 예) abc@naver.com
      </div>
    </div> 
    
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='zipcode' id='zipcode' 
                   value='${memberVO.zipcode }' required="required" style='width: 30%;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>  
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='address1' id='address1' 
                   value='${memberVO.address1 }' required="required" style='width: 80%;' placeholder="주소">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='address2' id='address2' 
                   value='${memberVO.address2 }' required="required" style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.8em;'>유저구분</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='userno' id='userno'
                   value='${membersVO.userno }' required="required" style='width: 30%;' placeholder="유저구분">
      </div>
    </div>
 
    <div class="form-group">
      <div class="col-md-12">
 
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
 
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">저장</button>
        <button type="button" onclick="history.go(-1);" class="btn btn-primary btn-md">취소</button>
 
      </div>
    </div>   
  </FORM>
  
    
    
    <!-- 마이 페이지 좌측 메뉴 -->
    <div id="content-wrapper" class="no-margin">
        <section id="portfolio" class="white">
            <div class="container">
                <div class="gap"></div>
                <div class="row">
                    
                
                    <div id="join_responsive" class="col-md-10 fade-up" style="width:100%;height:100%;">
                 
		        	
		                <script type="text/javascript">
			        	
			        			document.write("<form role=\"joinform\" id=\"joinform\" style='width:600px;margin:auto;'  method=\"post\">");

		        		</script>
		                	<c:forEach items="${memberList}" var="MembersVO" varStatus="status">
		                    <div class="form-group">
			                    <script>
			                
			            			document.write("<label for='inputName'>이름</label>");
			            			document.write("<input type='text' class='form-control' id='name' name='user_name' value='${MemberVO.user_name}' required placeholder='이름을 입력해주세요'>");
	
			                    </script>
		                     </div>
		                     <div class="form-group">
		                        <label for="InputId">
		                        	<script type="text/javascript">
					        		
					        			document.write("아이디");

					        		</script>
								</label><br>
			                    <b>${MemberVO.user_id}</b>
			                    <input type="hidden" id="userid" name="user_id" value="${MemberVO.user_id}"><br>
			                    <span><small><b>
		                        	<script type="text/javascript">
					        		
					        			document.write("* 아이디는 변경이 불가합니다.");

					        		</script>
								</b></small></span>
		
		                    </div>
		                    <div class="form-group">
			                    <script>
				                   
				             			document.write("<label for='inputPassword'>비밀번호</label>");
				             			document.write("<input type='password' class='form-control' id='passwd' name='user_pw' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='비밀번호는 문자와 숫자를 조합하여 10~15자리로 만들어 주세요.'>");

			                    </script>
		                    </div>
		                    <div class="form-group">
			                    <script>
			                    	
			                    		document.write("<label for='inputPasswordCheck'>비밀번호 확인</label>");
			                    		document.write("<input type='password' class='form-control' id='repasswd' name='repasswd' oninput='checkPwd()' value='${MemberVO.user_pw}' required placeholder='비밀번호 확인을 위해 다시한번 입력 해 주세요'>");

			                    </script>
		                    </div>
		                    <div class="form-group">
		                        <label for="InputEmail">
		                  
					        			document.write("이메일");

					        		</script>
								</label><br>
		                        <b>${MemberVO.email}</b>
			                    <input type="hidden" name="email" value="${MemberVO.email}"><br>
			                    <span><small><b>
		                        	<script type="text/javascript">
					        		
					        			document.write("* 이메일 변경이 불가합니다.");

					        		</script>
								</b></small></span>
		                 
		                    </div>
		                    <div class="form-group">
			                    <script>
			                   
			                    		document.write("<label for='inputMobile'>휴대폰 번호</label>");
			                    		document.write("<input type='tel' class='form-control' id='phone' name='phone' value='${MemberVO.phone}' required placeholder='-없이 휴대폰번호를 입력해 주세요'>");

			                    </script>
		                    </div>
		                   <!-- 정보수정이 성공하면 성공 페이지로 이동 -->
		                    <div class="form-group text-center">
		                        <button type="button" id="join-submit" class="btn btn-primary">
		                        	<script type="text/javascript">
					        	
					        			document.write("정보수정");

					        		</script>
									<i class="fa fa-check spaceLeft"></i>
		                        </button>
		                        <button type="reset" class="btn btn-warning">
		                        	<script type="text/javascript">
					        	
					        			document.write("수정취소");

					        		</script>
									<i class="fa fa-times spaceLeft"></i>
		                        </button>
		                    </div>
		                    </c:forEach>
						</form>
                </div><!-- row -->  
                <div class="gap"></div>
            </div>
            </div>
        </section><!-- section -->
    </div>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>