<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
    
 <title>내 댓글</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   
    <script type="text/javascript">
    
	    $(document).ready(function($) {
	    	$(".clickable-row").css("cursor", "pointer");
	        $(".clickable-row").click(function() {
	        	window.location = $(this).data("href");
	        });
	        
	        $("#myinfo").click(function(){	
	        		window.location.href="/myinfo";
	        });
	        $("#mypage_jim").click(function(){
	          window.location.href="/mypage_jim";
	        $("#mycomment").click(function(){
	          window.location.href="/mycomment";
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
<!-- 내가 작성한 댓글 리스트 페이지 -->
    <section id="single-page-slider" class="no-margin">
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="center gap fade-down section-heading">
			        	
	                                <h2>마이페이지</h2>
	                                <hr><p><a href="./mypage.jsp">예약 목록</a> · 
	                                <a href="./mycomment.jsp">내 댓글</a> · 
	                                <a href="./myinfo.jsp">정보수정</a></p>

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
                                 
                    <div class="col-md-10 fade-up" style="width:100%;margin:auto;">
                        
                        <br>
                        <div class="table-wrapper">
                        <table class="table">
				        	<thead>
				        		<tr>
				        			<th class="col-md-1 hidden-xs" style="white-space: nowrap;">
                        글번호
						        	</th>
				        			<th class="col-md-2" style="white-space: nowrap;">	        		
						        			장소
						        	</th>
				        			<th class="" style="white-space: nowrap;">    		
						        			내용
						        	</th>
				        			<th class="col-md-2 hidden-xs" style="white-space: nowrap;">
						        			작성일
						        	</th>
				        			<th class="col-md-1"></th>
				        		</tr>
				        	</thead>
				        	<tbody>
				        		<c:forEach var="restrntsVO" items="${list }">  		
					        <tr class="clickable-row" data-href="../restrnts/read?restno=${restrntsVO.restno}">
									<td class="col-md-1 hidden-xs" style="vertical-align: middle">${restrntsVO.restno}</td><!-- 글번호는 프론트에서 처리 -->
									<td class="col-md-2" style="vertical-align: middle; white-space: pre-wrap;">${restrntsVO.rzipcode}</td>
									<td class="" style="vertical-align: middle; white-space: pre-wrap;">${restrntsVO.reply_text}</td>
									<td class="col-md-2 hidden-xs" style="vertical-align: middle; white-space: nowrap;"><fmt:formatDate value="${restrntsVO.update_date}" pattern="yyyy/MM/dd"/></td>
									<!-- 댓글이 작성된 페이지로 이동하는 이동 버튼 (시대 페이지 기준 주소) -->
									<td class="col-md-1" style="vertical-align: middle">
		               					<button class="btn-primary" href="">이동</button>
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
              <li><a href=/mycomment?page=${pageMaker.startPage-1}&laquo;></a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li 
									<c:out value="${pageMaker.cri.page == idx?'class=active':''}"/>>
				               <a href='/mycomment?page=${idx}'>${idx}</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
			                            <li><a href='/mycomment?page=${pageMaker.endPage +1}'>&raquo;</a></li>
							</c:if>
							
						</ul>
					</div>
        </section><!-- section -->
       
    </div>



</body>
</html>