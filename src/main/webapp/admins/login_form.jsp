<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>SOLO</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
  function loadDefault() {
    $('#id_admin').val('admin1');
    $('#passwd_admin').val('1234');
  }
</script> 

</head> 
 
<body>
 <jsp:include page="/menu/top.jsp" flush='false' />
 <DIV class='title_line' style='width: 20%;'>관리자 로그인</DIV>
 
<DIV style='width: 80%; margin: 0px auto;'>
  <FORM name='frm' method='POST' action='./login.do'>
  
    <div class="form-group">
      <label class="col-md-2 control-label">아이디</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-md" name='id_admin' id='id_admin' value='' required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
      </div>
 
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label">패스워드</label>    
      <div class="col-md-10">
        <input type='password' class="form-control input-md" name='passwd_admin' id='passwd_admin' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">로그인</button>
        <button type='button' onclick="loadDefault();" class="btn btn-primary btn-md">테스트 계정</button>
      </div>
    </div>   
    
  </FORM>
</DIV>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
 