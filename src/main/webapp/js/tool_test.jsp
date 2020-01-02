<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>tool_test.jsp</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/JavaScript" src="./tool.js"></script>

</head>
<body>
<script type="text/javascript">
 document.writeln(getExt('winter.jpg'));
 // fname.slice(fname.lastIndexOf('.') + 1)
 // document.writeln('winter.jpg'.slice(3));
 // document.writeln('winter.jpg'.substring(3));
 
 if (isImage('winter.jpg') == true){
	 document.writeln('이미지 파일임으로 전송가능');
 }
</script>

</body>
</html>