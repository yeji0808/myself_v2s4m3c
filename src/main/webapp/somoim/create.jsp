<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>소모임</title>
 
<link href="../css/s_style.css" rel="Stylesheet" type="text/css">
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript"> 
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />

<DIV class='title_line' style='width: 15%; font-size: 26px;'>소모임 생성</DIV>
 
<FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data" class="form-horizontal">
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_center'>
        <label>소모임 이름</label>
        <input type='text' class="form-control" name='name' value='' required="required" autofocus="autofocus" style='width: 30%; margin: 0px auto;' placeholder="소모임 이름 입력">
      </li><br>
      <li class='li_center'>
        <label>만들고 싶은 모임을 선택하세요</label><br><br>
        <input type="radio" name='somoimtype' value='게임' required="required">
        <IMG src='./images/game.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>
     
        <input type="radio" name='somoimtype' value='요리' required="required">
        <IMG src='./images/cook.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>

        <input type="radio" name='somoimtype' value='동물' required="required">
        <IMG src='./images/pet.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>

        <input type="radio" name='somoimtype' value='스포츠' required="required">
        <IMG src='./images/sports.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>
        
        <br><br>
        
        <input type="radio" name='somoimtype' value='음악' required="required">
        <IMG src='./images/music.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>
        
        <input type="radio" name='somoimtype' value='사교' required="required">
        <IMG src='./images/relation.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>
        
        <input type="radio" name='somoimtype' value='여행' required="required">
        <IMG src='./images/travel.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>
        
        <input type="radio" name='somoimtype' value='자유주제' required="required">
        <IMG src='./images/free.png' class="img-rounded" alt="Cinque Terre" style='width: 10%; height: 100px;'>
      </li>
      <li class='li_center'> 
        <label>소모임 대표이미지</label><br>
        <label><input type='file' class="form-control-file" name='fnameMF' value='' placeholder="파일 선택"></label>
      </li>
      <li class='li_center'>
        <button type="submit" class="btn btn-primary">완료</button>
        <button type="button" onclick="location.href='./list.do'" class="btn btn-primary">취소</button>
      </li>         
    </ul>
  </fieldset>
</FORM>

<jsp:include page="/menu/bottom.jsp" /> 
</body>
  
</html> 
  
   