<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />

    <title>찜 목록</title>
    <link href="../css/style.css" rel="Stylesheet" type="text/css">
    <script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	    $(document).ready(function() {
	    	$(".clickable-row").css("cursor", "pointer");
	        $(".clickable-row").click(function(event) {
	        	if(!$(event.target).hasClass("delcol")) {
	        		window.location = $(this).data("href");
	        	}
	        });
	        if("${sessionScope.id }"==""){
	        	alert("로그인 후 이용해주세요");
	        	window.location.href="../members/login.do";
	        }
	        
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
    </script>
    <style>
		.thumb {
			padding: 5px;
			width: 110px;
		}
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
<!-- 마이 페이지 첫 화면 + 찜 목록 조회 페이지 -->
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
    <!-- 마이 페이지 좌측 메뉴 -->
    <div id="content-wrapper" class="no-margin">
        <section id="portfolio" class="white" style="margin-bottom:50px;">
            <div class="container">
                <div class="gap"></div>
                <div class="row">
                <div class="col-md-10 fade-up" style="width:100%; margin:auto;">
                <br>
                <div>
                <table class="table">
                  <thead>
                     <tr>
                        <th class="col-md-1 hidden-xs"></th>
                        <th class="col-md-2" style="overflow: hidden; white-space: nowrap;">			        	
						        		  이름
									      </th>
                        <th class="col-md-4 hidden-sm hidden-xs" style="overflow: hidden; white-space: nowrap;">
						        			 요리
									      </th>
                        <th class="col-md-2 hidden-md hidden-sm hidden-xs" style="overflow: hidden; white-space: nowrap;">
						        			 주소
									       </th> 
                         <th class="col-md-2 hidden-md hidden-sm hidden-xs" style="overflow: hidden; white-space: nowrap;">
                           영업시간
                         </th>
                       	<th class="col-md-1"></th>
                        <th class="col-md-1"></th>
                      </tr>
                    </thead>
                    <tbody>
                        		<c:forEach items="${mysiteList}" var="RestrntsVO" varStatus="status">
                                <tr class="clickable-row" data-href="../restrnts/read?restno=${RestrntsVO.restno}">

									<td class="col-md-1 hidden-xs" style="vertical-align: middle;"><img class="thumb" style="width:110px; height:85.56px;" src="${RestrntsVO.first_image}"></td>
                        			<td class="col-md-2" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${RestrntsVO.rname}</td>
                        			<td class="col-md-4 hidden-sm hidden-xs" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${RestrntsVO.raddress1}</td>
                        			<td class="col-md-1 hidden-md hidden-sm hidden-xs" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${RestrntsVO.rmain}</td>
                        			<td class="col-md-2 hidden-md hidden-sm hidden-xs" style="vertical-align: middle; overflow: hidden; white-space: pre-wrap;">${RestrntsVO.rtime}</td>
                        			<td class="col-md-1" style="vertical-align: middle">
                      
						        			<a class="btn btn-primary" role="button" href="/restrnts/read?restno=${RestrntsVO.restno}">이동</a>
                   </td>
                   
                        			<!-- 찜 목록 아이템 삭제 버튼 -->
                        			<td class="col-md-1" style="vertical-align: middle">
                        				<div class="delcol">
                        				<form>
                        					<button id="delbtn${RestrntsVO.jno}" type="button" class="btn btn-warning">                		
								        			     삭제
                        					</button>
					                       	<script type="text/javascript">
					                       		$("#delbtn${RestrntsVO.jno}").click(function(e){
										    		e.preventDefault();
										    		
										    		var jno=${RestrntsVO.jno};
										    		$.ajax({
										    		  url:"/jimdel",
										    		  type:'post',
										    		  data:{
										    		  	jno:jno,
										    		  },
										    		  success:function(data){
											        	
										        				alert("예약목록이 삭제되었습니다");
										        	        	window.location.href="/mypage";

										    		  }	
										    		});
										    	});
											</script>
                        				</form>
                        				</div>
                        			</td>
                        		</tr>
                        		</c:forEach>
                        	</tbody>
                        </table>
                        </div>
                    </div><!-- col -->
                </div><!-- row -->  
                <div class="gap"></div> 
            </div>
            <div class="text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
			            <li><a href="/mypage?page=${pageMaker.startPage-1}&laquo"></a></li>

							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li 
									<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>		
				              <a href='/mypage?page=${idx}'>${idx}</a>       	  								
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
							<li><a href='/mypage?page=${pageMaker.endPage +1}'>&raquo;</a></li>		
							</c:if>
							
						</ul>
					</div>
        </section><!-- section -->
    </div>
</body>
</html>