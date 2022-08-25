<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>우보테크</title>

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

input,
textarea {
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

input:focus,
textarea:focus {
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
						<div class="row">
							<img src="https://i.imgur.com/CXQmsmF.png" class="logo">
						</div>
						<div class="row px-3 justify-content-center mt-4 mb-5 border-line" id="report">
							<table id="tablebody" width="100%" width="100%" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
										<thead>
											<tr>
												<th bgcolor="CDCDCD">등록일자</th>
												<th bgcolor="CDCDCD">고객번호</th>
												<th bgcolor="CDCDCD">아이디</th>
												<th bgcolor="CDCDCD">이름</th>
												<th bgcolor="CDCDCD">상담닉네임</th>
												<th bgcolor="CDCDCD">인출하트(갯수)</th>
												<th bgcolor="CDCDCD">은행명</th>
												<th bgcolor="CDCDCD">계좌번호</th>
												<th bgcolor="CDCDCD">예금주</th>
												
											</tr>
										</thead>
												<td>등록일자</td>
												<td>고객번호</td>
												<td>아이디</td>
												<td>이름</td>
												<td>상담닉네임</td>
												<td>인출하트(갯수)</td>
												<td>은행명</td>
												<td>계좌번호</td>
												<td>예금주</td>
										
										<tbody>
										</tbody>
									</table>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
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
						<div class="row px-3">
							<label class="mb-1">
								<h6 class="mb-0 text-sm">아이디</h6>
							</label> <input class="mb-4" type="text" name="email"
								placeholder="Enter a valid email address">
						</div>
						<div class="row px-3">
							<label class="mb-1">
								<h6 class="mb-0 text-sm">비밀번호</h6>
							</label> <input type="password" name="password"
								placeholder="Enter password">
						</div>
						<div class="row px-3 mb-4">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input id="chk1" type="checkbox" name="chk"
									class="custom-control-input"> <label for="chk1"
									class="custom-control-label text-sm">Remember me</label>
							</div>
							<a href="#" class="ml-auto mb-0 text-sm"></a>
						</div>
						<div class="row mb-3 px-3">
							<a href="javascript:test()"><button type="button" class="btn btn-blue text-center">로그인</button></a>
						</div>
						<div class="row mb-4 px-3">
							<small class="font-weight-bold"> <a
								class="text-danger "></a></small>
						</div>
					</div>
				</div>
			</div>
			<div class="bg-blue py-4">
				<div class="row px-3">
					<small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2021. All
						rights reserved.</small>
					<div class="social-contact ml-4 ml-sm-auto">
						<span class="fa fa-facebook mr-4 text-sm"></span> <span
							class="fa fa-google-plus mr-4 text-sm"></span> <span
							class="fa fa-linkedin mr-4 text-sm"></span> <span
							class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span>
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
<link rel="stylesheet" href="resources/css/print-preview.css"> 
<script src="//code.jquery.com/jquery.min.js"></script> 
<script src="resources/js/jquery.print-preview.js"></script> 
<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/js/printThis.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
	<script type="text/javascript">
	
	function test(){
		//alert('test1');
		//alert($("#report"));
		$("#report").printThis();
	}
	
	</script>

</body>

</html>
