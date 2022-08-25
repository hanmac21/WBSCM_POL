<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h3 style="position: relative;top: 10px;left: 100px;font-size: 40px;">E-MAIL SEND</h3>
		
		<hr class="featurette-aivider">
		
		<form action="/mail/send" id="send" method="POST">
		
			<div class="form-group" style="position: absolute;left: 100px;top: 530px;">
                <label for="gender">
                  
                  <span class="align-middle" style="font-size: 25px;">Select Email</span>
                </label>
               <table>
               		
	               	<c:forEach items="${list }" var="list">
			            <tr>	
		               		<c:if test="${list.email1 ne ' '}">
		               			<td><input type="checkbox"  value="${list.email1}" name="email1" class="checkbox"></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.email1}</b></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.user1}</b></td>
		               		</c:if>
		                </tr>	
		               	<tr>
		               		<c:if test="${list.email2 ne ' '}">
		               			<td><input type="checkbox" value="${list.email2}" name="email2" class="checkbox"></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.email2}</b></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.user2}</b></td>
		               		</c:if>
		               	</tr>
		               	<tr>	
		               		<c:if test="${list.email3 ne ' '}">
		               			<td><input type="checkbox" value="${list.email3}" name="email3" class="checkbox"></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.email3}</b></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.user3}</b></td>
		               		</c:if>
		               	</tr>
		               	<tr>	
		               		<c:if test="${list.email4 ne ' '}">
		               			<td><input type="checkbox" value="${list.email4}" name="email4" class="checkbox"></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.email4}</b></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.user4}</b></td>
		               		</c:if>
		               	</tr>
		               	<tr>	
		               		<c:if test="${list.email5 ne ' '}">
								<td><input type="checkbox" value="${list.email5}" name="email5" class="checkbox"></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.email5}</b></td>
		               			<td><b style="margin-left: 10px;font-size: 18px;">${list.user5}</b></td>
		               		</c:if>
		               	</tr>	
	               </c:forEach>
          			
          		</table>
                <!-- 이메일 들어올 자리 -->
                <!-- <select class="form-control" id="plant" name="plant" required>
                  <option value="" disabled selected>공장을 선택하세요.</option>
                  <option value="000">평택</option>
                  <option value="001">울산</option>
                </select> -->
            </div>
			<div class="form-group" style="position: absolute;top: 140px;left: 100px;">
				<label for="subject">
					<!-- <i class="material-icons align-middle">account_box</i> -->
              	    <span class="align-middle" style="font-size: 25px;">Title</span>
				</label>
				<input type="text" class="form-control" id="subject" aria-describedby="idHelp" name="subject" placeholder="Please enter your email subject" required autofocus style="width: 450px;height: 50px;">
				<!-- <small id="idHelp" class="form-text text-muted">아이디는 필수 입력 요소입니다.</small> -->
			</div>
			
			<div class="form-group" style="position: absolute;top: 260px;left: 100px;">
                <label for="content">
                 <!--  <i class="material-icons align-middle">lock</i> -->
                  <span class="align-middle" style="font-size: 25px;">Contents</span>
                </label>
                <!-- <input type="" class="form-control" id="content" aria-describedby="pwdHelp" name="content" placeholder="E-Mail 내용을 입력해주세요." required> -->
                <textarea class="form-control" id="content" aria-describedby="pwdHelp" name="content" placeholder="Please enter the contents of the email." style="width: 450px;height: 200px;resize: none;"></textarea>
                <!-- <small id="pwdHelp" class="form-text text-muted">비밀번호는 필수 입력 요소입니다.</small> -->
            </div>
				
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
            
            <!-- <div class="form-group">
                <label for="gender">
                  <i class="material-icons align-middle">factory</i>
                  <span class="align-middle">공장 선택</span>
                </label>
                <select class="form-control" id="plant" name="plant" required>
                  <option value="" disabled selected>공장을 선택하세요.</option>
                  <option value="000">평택</option>
                  <option value="001">울산</option>
                </select>
            </div> -->
            
            <div class="my-3 text-center" style="position: absolute;left: 410px;top: 30px;">
                <button type="button" id="btnadd" class="btn btn-primary" onclick="javascript:MailSend();" style="width: 140px;height: 40px;">Send E-Mail</button>
               <!--  <button type="button" class="btn btn-primary ml-3" onclick="javascript:popupClose();">취소</button> -->
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
		
		var msg = "${msg}";
		if (msg!= "") {
			alert(msg);
			window.close(); 
		}
		
		/* function popupClose() {
			window.close(); 
		}  */
		
		function MailSend() {
			console.log("클릭");
			var sub = $('#subject').val();
			var cont = $('#content').val();
			//var radio = form.querySelector('input[name="radio"]')checkd;
			var radio = $('input:checkbox[class="checkbox"]').is(':checked');

			console.log(sub);
			console.log(cont);
			console.log(radio);
			
			if (sub == '') {
				alert("Please enter a title.");
				$('#subject').focus();
			}else if (cont == '') {
				alert("Please enter the contents.");
				$('#content').focus();
			}else if ($('input:checkbox[class="checkbox"]').is(':checked') == false) {
				alert("You must select at least one EMAIL to send.");
			}else{
				$('#send').submit();
			}
			
		}
		//★★★★★삭제예정220721★★★★★
		/* $('input[type=radio]').click(function() {
			console.log("클릭");
			console.log($(this).val());
			var radio = $('input:radio[class="radio"]').is(':checked');
			console.log(radio);
			if ($(this).is(':checked') == true) {
				//$(this).removeAttr( "disabled" );
				//$(this).checked = true;
				$(this).removeAttr('checked'); 
			}
			
		}) */
		
/* 		//id 포커스 나가면 아이디 중복 체크, 추가 버튼 활성화/비활성화 2022-04-25 정인우	
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
			
		}); */
	
	</script>
</body>
</html>