<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<%@ include file="../common/jsHeader.jsp"%>
<title>Add Member</title>
<link rel="shortcut icon" href="asset/dist/img/wbfavi.ico">
<link rel="icon" href="asset/dist/img/wbfavi.ico">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="asset/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

<link rel="stylesheet"
	href="asset/plugins/datatables/dataTables.bootstrap.css">

<link rel="stylesheet"
	href="asset/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="asset/plugins/datepicker/datepicker3.css">
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="asset/plugins/iCheck/all.css">
<!-- Bootstrap Color Picker -->
<link rel="stylesheet"
	href="asset/plugins/colorpicker/bootstrap-colorpicker.min.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="asset/plugins/timepicker/bootstrap-timepicker.min.css">
<link rel="stylesheet" href="resources/css/print-preview.css">

<!-- jvectormap -->
<link rel="stylesheet"
	href="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="asset/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="asset/dist/css/skins/_all-skins.min.css">

<!-- Google Fonts and Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
	<div class="border border-info p-4 rounded">
		<h3>회원 추가</h3>
		
		<hr class="featurette-aivider">
		
		<form action="mng_add_member" method="POST">
			
			<div class="form-group">
				<label for="id">
					<i class="material-icons align-middle">account_box</i>
              	    <span class="align-middle">아이디</span>
				</label>
				<input type="text" class="form-control" id="id" aria-describedby="idHelp" name="id" required autofocus>
				<small id="idHelp" class="form-text text-muted">아이디는 필수 입력 요소입니다.</small>
			</div>
			
			<div class="form-group">
                <label for="password">
                  <i class="material-icons align-middle">lock</i>
                  <span class="align-middle">비밀번호</span>
                </label>
                <input type="password" class="form-control" id="pw" aria-describedby="pwdHelp" name="pw" required>
                <small id="pwdHelp" class="form-text text-muted">비밀번호는 필수 입력 요소입니다.</small>
            </div>
				<!--★★★★★삭제예정220721★★★★★  -->
			<!-- <div class="form-group">
                <label for="email">
                  <i class="material-icons align-middle">mail</i>
                  <span class="align-middle">이메일 주소</span>
                </label>
                <input type="email" class="form-control" id="email" name="email">
            </div>
            
            <div class="form-group">
                <label for="gender">
                  <i class="material-icons align-middle">grade</i>
                  <span class="align-middle">등급 선택</span>
                </label>
                <select class="form-control" id="grade" name="grade" required>
                  <option value="" disabled selected>등급을 선택하세요.</option>
                  <option value="manager">직원</option>
                  <option value="master">관리자</option>
                </select>
            </div> -->
            
            <div class="form-group">
                <label for="gender">
                  <i class="material-icons align-middle">factory</i>
                  <span class="align-middle">공장 선택</span>
                </label>
                <select class="form-control" id="plant" name="plant" required>
                  <option value="" disabled selected>공장을 선택하세요.</option>
                  <option value="000">평택</option>
                  <option value="001">울산</option>
                </select>
            </div>
            
            <div class="my-3 text-center">
                <button type="submit" id="btnadd" class="btn btn-primary">회원추가</button>
                <button type="reset" class="btn btn-primary ml-3">초기화</button>
            </div>
              	
		</form>	
	</div>
	
	<!-- jQuery 2.2.3 -->
	<script src="asset/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="asset/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.number.min.js"></script>
	<script src="resources/js/jquery.number.js"></script>

	<!-- FastClick -->
	<script src="asset/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="asset/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="asset/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="asset/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

	<script src="asset/plugins/datepicker/bootstrap-datepicker.js"></script>
	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<!-- DataTables -->
	<script src="asset/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="asset/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="asset/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="asset/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- script src="asset/dist/js/pages/dashboard2.js"></script-->
	<!-- AdminLTE for demo purposes -->
	<script src="asset/dist/js/demo.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/jquery.print-preview.js"></script>
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/js/printThis.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
		
	<script type="text/javascript">
		
		//id 포커스 나가면 아이디 중복 체크, 추가 버튼 활성화/비활성화 2022-04-25 정인우	
		$('input#id').on('focusout',function(){
			let id = $(this).val();
			if(id.length==0){
				return;
			}
			
			const add = document.getElementById('btnadd');
			
			$.ajax({
				url : '/api/members/' + id + '.json',
				method : 'GET',
				success : function(data){
					console.log(typeof data); //object
					console.log(data); // {}
				
					if(!data.count){
						$('small#idHelp').html('사용 가능한 아이디입니다.')
										 .removeClass('text-muted').removeClass('text-danger').addClass('text-success');
						add.disabled=false;
					}else{
						$('small#idHelp').html('이미 사용중인 아이디입니다.')
									     .removeClass('text-muted').removeClass('text-success').addClass('text-danger');
						add.disabled=true;
					}
				},
				error : function(request, status, error){
					alert('code : ' + request.status + '\n message : ' + request.responseText + '\n error : '+error);
				}
			});
			
		});
	
	</script>
</body>
</html>