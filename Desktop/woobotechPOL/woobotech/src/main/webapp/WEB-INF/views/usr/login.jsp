<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 모바일 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 브라우저 초기화 -->
<link rel="stylesheet" href="resources/css/nomalize.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="resources/css/devedu-custom.css?ver=6">


</head> 
<body>
 <form method="post" onsubmit="return loginFormCheck(this);return false">
 	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<img alt="switchback-logo" src="resources/img/ic_logo_big_blue.png" style="width: 100px; height: auto; margin-top: 110px;"> 
			</div>
		</div>
		
	</div>
	
 	<div class="container-fluid" style="margin-top: 130px;">
		<div class="row-fluid">
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<input class="form-control input-login" type="text" placeholder= "아이디" id="loginId" name="loginId"> 
			</div>
		</div>
		
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<input class="form-control input-login" type="password" placeholder= "비밀번호" style="margin-top: 10px;" id="loginPw" name="loginPw" > 
			</div>
		</div>
	</div>
	
 	<div class="container-fluid" style="margin-top: 20px;">
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<button type="submit" class="btn btn-primary btn-login">로그인</button> 
			</div>
		</div>
	</div>
		
 	<div class="container-fluid" style="margin-top: 20px;">
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<span>계정이 없으신가요? </span>
				<span style="font-weight: bold; color: #2e6da4;"><a href="join">회원가입 하기</a> </span>
			</div>
		</div>
	</div>
	</form>
	<div class="container-fluid" style="margin-top: 20px;">
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<span>${ msg } </span>
			</div>
		</div>
	</div>
	 <!-- /.social-auth-links -->
    
</body>


<script>
  function loginFormCheck(frm) {
 		frm.action = "login_user";
 		frm.submit();
 		return false;
  }
  
  
  
</script>



<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
</body>
</html>