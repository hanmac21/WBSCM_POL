<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="asset/dist/img/wbfavi.ico">
<link rel="icon" href="asset/dist/img/wbfavi.ico">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>WOOBOTECH SCM</title>

<!-- Custom fonts for this template-->
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<style>
body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-color: #B0BEC5;
	background-repeat: no-repeat
}

.card0 {
	box-shadow: 0px 4px 8px 0px #757575;
	border-radius: 0px
}

.card2 {
	margin: 0px 40px
}

.logo {
	width: 200px;
	height: 100px;
	margin-top: 20px;
	margin-left: 35px
}

.image {
	width: 360px;
	height: 280px
}

.border-line {
	border-right: 1px solid #EEEEEE
}

.facebook {
	background-color: #3b5998;
	color: #fff;
	font-size: 18px;
	padding-top: 5px;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer
}

.twitter {
	background-color: #1DA1F2;
	color: #fff;
	font-size: 18px;
	padding-top: 5px;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer
}

.linkedin {
	background-color: #2867B2;
	color: #fff;
	font-size: 18px;
	padding-top: 5px;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	cursor: pointer
}

.line {
	height: 1px;
	width: 45%;
	background-color: #E0E0E0;
	margin-top: 10px
}

.or {
	width: 10%;
	font-weight: bold
}

.text-sm {
	font-size: 14px !important
}

::placeholder {
	color: #BDBDBD;
	opacity: 1;
	font-weight: 300
}

:-ms-input-placeholder {
	color: #BDBDBD;
	font-weight: 300
}

::-ms-input-placeholder {
	color: #BDBDBD;
	font-weight: 300
}

input, textarea {
	padding: 10px 12px 10px 12px;
	border: 1px solid lightgrey;
	border-radius: 2px;
	margin-bottom: 5px;
	margin-top: 2px;
	width: 100%;
	box-sizing: border-box;
	color: #2C3E50;
	font-size: 14px;
	letter-spacing: 1px
}

select {
	border: 1px solid lightgrey;
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #304FFE;
	outline-width: 0
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}

a {
	color: inherit;
	cursor: pointer
}

.btn-blue {
	background-color: #1A237E;
	width: 150px;
	color: #fff;
	border-radius: 2px
}

.btn-orange {
	background-color: #ffaf5c;
	width: 150px;
	color: #fff;
	border-radius: 2px
}

.btn-blue:hover {
	background-color: #000;
	cursor: pointer
}

.bg-blue {
	color: #fff;
	background-color: #1A237E
}

@media screen and (max-width: 991px) {
	.logo {
		margin-left: 0px
	}
	.image {
		width: 300px;
		height: 220px
	}
	.border-line {
		border-right: none
	}
	.card2 {
		border-top: 1px solid #EEEEEE !important;
		margin: 0px 15px
	}
}
</style>

<body>

	<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
		<div class="card card0 border-0">
			<div class="row d-flex">
				<div class="col-lg-6">
					<div class="card1 pb-5">
						<img src="resources/img/main.png">


					</div>
				</div>

				<div class="col-lg-6">
					<form method="post"
						onsubmit="return loginFormCheck(this);return false">
						<div class="card2 card border-0 px-4 py-5">
							<div class="row mb-4 px-3">
								<h6 class="mb-0 mr-4 mt-2"></h6>
							</div>
							<div class="row mb-4 px-3">
								<h6 class="mb-0 mr-4 mt-2"></h6>
							</div>
							<div class="row mb-4 px-3">
								<h6 class="mb-0 mr-4 mt-2"></h6>
							</div>
							<%-- <div class="row px-3">
								<label class="mb-1">
									<h6 class="mb-0 text-sm">
										Factory division
										<spring:message code="FactorySel" text="FactorySel"/>
									</h6>
								</label>
							</div>
							<div class="row px-3">
								<label class="mb-1"></label> <select class="mb-4" id="branch"
									name="branch" style="width: 100px; height: 30px">
									<option value="000" ${branch =='000' ? 'selected' :'' }>POLAND</option>
									<option value="001" ${branch =='001' ? 'selected' :'' }>울산</option>
								</select>
							</div>  --%>
							<input type="hidden" value="000" name = "branch" id="branch">
							<div class="row px-3">
								<label class="mb-1">
									<h6 class="mb-0 text-sm">
										<%-- <spring:message code="id" text="id"/> --%>
										ID
									</h6>
								</label> <input class="mb-4" type="text" name="loginId" id="loginId"
									placeholder="Enter your business number">
							</div>
							<div class="row px-3">
								<label class="mb-1">
									<h6 class="mb-0 text-sm">
										<%-- <spring:message code="password" text="password"/> --%>
										PASSWORD
									</h6>
								</label> <input type="password" name="loginPw" id="loginPw"
									placeholder="Enter your password.">
							</div>
							<div class="row px-3 mb-4">
								<div
									class="custom-control custom-checkbox custom-control-inline">
									<input id="chk1" type="checkbox" name="chk"
										class="custom-control-input" value="chk1"> <label for="chk1"
										class="custom-control-label text-sm">Remember me</label>
								</div>
								<a href="#" class="ml-auto mb-0 text-sm"></a>
							</div>
							<div class="row mb-3 px-3">
								<button type="submit" class="btn btn-blue text-center">Login</button>
							</div>
							
							<!-- 다국어 처리용 web-inf/lang 폴더 참고  -->
							<%-- <div class="row mb-4 px-3">
								<small class="font-weight-bold">
								<a href="<c:url value="/mng_login?lang=ko" />" onclick="setKor()">한국어</a>||
								<a href="<c:url value="/mng_login?lang=en" />" onclick="setEng()">English</a>
								<a class="text-danger "></a></small>
							</div> --%>
							
							<!-- <select class="mb-4" id="lang" name="lang" style="width: 200px;">                 				
                  				<option value="ko">한국어</option>
                  				<option value="en">English</option>
                			</select> -->
                			
							<div class="row mb-4 px-3">
								<c:choose>
									<c:when test="${ msg.equals('') }">
										<span class="form-text">limeted system. </span>
									</c:when>
									<c:otherwise>
										<span class="form-text" style="margin-left: 20px;">${ msg }</span>
									</c:otherwise>
								</c:choose>
							</div>

						</div>
					</form>
				</div>

				<!-- /.social-auth-links -->

			</div>
			<div class="bg-blue py-4">
				<div class="row px-3">
					<small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2022. All
						rights reserved.</small>
					<div class="ml-4 ml-sm-auto">
						<span class="fa mr-4 text-sm">※ This site is optimized for Windows 10 and 1920 x 1080 resolution. 
						The browser works with Chrome and Edge.&nbsp;&nbsp;						
							<img src="resources/img/chrome.PNG" onclick="location.href='https://www.google.co.kr/chrome/thank-you.html?brand=CHBD&statcb=1&installdataindex=empty&defaultbrowser=0#'">
							<a href="https://www.google.co.kr/chrome/thank-you.html?brand=CHBD&statcb=1&installdataindex=empty&defaultbrowser=0#">Chrome Download</a></img>												
							<img src="resources/img/edge.PNG" onclick="location.href='https://www.microsoft.com/ko-kr/edge'"><a href="https://www.microsoft.com/ko-kr/edge">Edge Download</a></img>							
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>

</body>


<script>
  $(function () {
    
    var loginId = getCookie("loginId");
   // alert(loginId);
    $("#loginId").val(loginId);
    var branch = getCookie("branch2");
    $("#branch").val(branch);
    var chk1 = getCookie("chk1");
    if(chk1==="chk1"){
    	$("input:checkbox[id='chk1']").prop("checked",true);
    }
    var lang = getCookie("lang");
    if(lang == null || lang == ''){
    	lang = "ko";	
    }
    $("#lang").val(lang).prop("selected", true);
    
  });
  
  function loginFormCheck(frm) {
	  var branch =  $("#branch").val();//지역
	  var loginId =  $("#loginId").val();
	  var loginPw =  $("#loginPw").val();
	  var lang = $("#lang").val();
console.log(branch);
	 /*  if(branch==null){
		  alert("공장을 선택하세요");
		  return;
	  } */
	  
	  if("" == loginId){
		  alert("Please enter your ID");
		  return;
	  }
	  if("" == loginPw){
		  alert("Please enter your password");
		  return;
	  }
	  
	 /*  if(lang == null){
		  alert("언어를 선택하세요");
		  return;
	  } */
	  
	 var check1 = $("#chk1").is(":checked");
	 if(check1==true){
	  	var loginId =  $("#loginId").val();
	  	setCookie("loginId",loginId,365);
	  	
	  	//branch가 이상하게 세션으로 남아서 branch2를 추가해서 쿠키로 로그인 화면에서 공장 선택
	  	var branch =  $("#branch").val();
	  	setCookie("branch",branch,365);
	  	setCookie("branch2",branch,365);
	  	
	  	setCookie("lang",lang,365);
	  	
	  	var chk1 = $("#chk1").val();
	  	setCookie("chk1",chk1,365);
	 }else{
	 	setCookie("loginId","",365);
	 	var branch =  $("#branch").val();
	 	setCookie("branch",branch,365);
	 	setCookie("branch2",branch,365);
	 	
	 	setCookie("lang","",365);
	 	
	 	setCookie("chk1","",365);
	 }
	 	
 	frm.action = "mng_login_user";
 	frm.submit();
 	return false;
  }
  
  function fnSearchView(){
	   
		$('#myModal').modal('show');
	  
  }
 
//쿠키 생성 함수
function setCookie(cName, cValue, cDay) {
	var expire = new Date();
	expire.setDate(expire.getDate() + cDay);
	cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	if (typeof cDay != 'undefined')
		cookies += ';expires=' + expire.toGMTString() + ';';
	document.cookie = cookies;
}

// 쿠키 가져오기 함수
function getCookie(cName) {
	cName = cName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cName);
	var cValue = '';
	if (start != -1) {
		start += cName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1)
			end = cookieData.length;
		cValue = cookieData.substring(start, end);
	}
	return unescape(cValue);
}

/* function setKor(){
	setCookie("lang","ko",365);
}

function setEng(){
	setCookie("lang","en",365);
} */

</script>

</html>
