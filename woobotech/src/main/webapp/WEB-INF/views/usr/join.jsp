<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SwitchBack</title>

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

	<div class="container-fluid container1">
		<div class="row-fluid">
			<div class="col-xs-8">
				<div class="row-fluid">
					<div class="col-xs-12 div-coin-top">
						<img class="img-coin-mini" alt="bitcoin-icon"
							src="resources/img/ic_logo_mini_blue.png"> 
							<span class="span-top-coin-name">SwitchBack</span> 
							<span class="span-top-coin-KRW">회원가입</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
 	<div class="container-fluid" style="margin-top: 30px;">
		<div class="row-fluid">
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<input class="form-control input-login" type="text" placeholder= "아이디" id="userid"> 
			</div>
		</div>
		
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<input class="form-control input-login" type="password" placeholder= "비밀번호" style="margin-top: 10px;" id="pwd"> 
			</div>
		</div>
				
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<input class="form-control input-login" type="password" placeholder= "비밀번호 확인" style="margin-top: 10px;" id="re_pwd" > 
			</div>
		</div>
		
		<div class="row-fluid">
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<input class="form-control input-login" type="text" placeholder= "닉네임" style="margin-top: 10px;" id="nick_name"> 
			</div>
		</div>
	</div>
	
	
 	<div class="container-fluid" style="margin-top: 10px;">
		<div class="row-fluid"> 
			<div class="col-xs-12 padding-0" style="text-align: center;">
				<button type="button" class="btn btn-primary btn-login" onclick="fnSave()">회원 가입</button> 
			</div>
		</div>
	</div>
		
</body>






<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>

</body>

<script type="text/javascript">	
	function fnSave(){
		
		
		if(!confirm("회원가입하시겠습니까?")){
			return;
		}
		var userid = $("#userid").val();
		var pwd = $("#pwd").val();
		var re_pwd = $("#re_pwd").val();
		var nick_name = $("#nick_name").val();
		
		if(userid==''){
			alert('아이디를 입력하세요');
			return;
		}
		
		if(pwd=='' || re_pwd==''){
			alert('패스워드를 입력하세요');
			return;
		}
		
		if(pwd!=re_pwd){
			alert('입력하신 비밀번호와 확인비밀번호가 일치하지 않습니다.')
			return;
		}
		if(nick_name==''){
			alert('닉네임을 입력하세요')
			return;
		}
		
		
		$.ajax({
	 		type:"post",
	 		url:"join_i",
	 		dataType:"html",
	 		data:{
	 			userid: userid,
	 			pwd:pwd,
	 			re_pwd:re_pwd,
	 			nick_name:nick_name
	 		}	
	 		}).done(function(data){
	 			var isOk = data;
				if (isOk == 1) {
					//$('#double_check').val("V").css("color", "red");
					alert('회원가입되었습니다.');
					location.href ="login";
				} else {
					
					alert('저장에 실패하였습니다. 시스템 관리자에게 문의하세요');
				}
	 		
	 		});
		
		
	}	
	
</script>	



</html>