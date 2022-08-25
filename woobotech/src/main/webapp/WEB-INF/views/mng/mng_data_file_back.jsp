<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>우보테크(관리자)</title>
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

<!-- jvectormap -->
<link rel="stylesheet"
	href="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="asset/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="asset/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  
  
  
</head>

<form id="formdata" name="formdata" method="post">
	<input type="hidden" id="userid" name="userid" value="111">
	
	
	
	
</form>
<input type="hidden" id="option_dt_nm1" name="option_dt_nm1" value="11">
<input type="hidden" id="option_dt_nm2" name="option_dt_nm2" value="22">
<input type="hidden" id="option_dt_nm3" name="option_dt_nm3" value="33	">
<form id="formdata2" name="formdata2" method="post">
	<input type="hidden" name="gubun" value=""> <input
		type="hidden" name="add_do" value=""> <input type="hidden"
		name="com_text" value=""> <input type="hidden" name="pageView"
		value="">
</form>

<form id="form1" name="form1" method="post">
	<input type="hidden" id="contents" name="contents" value="111">
</form>

<style type="text/css" class="init">
	  th, td { white-space: nowrap; }
	div.dataTables_wrapper {
		margin: 0 auto;
	}

 	div.container {

        width: 80%;

    }

	</style>
<style>
  table {
    width: 100%;
    border: 1px solid #bbc6d3;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #bbc6d3;
    padding: 10px;
  }
</style>


<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="mng_buy_plan" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>우보테크</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>우보테크</b></span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <%=session_cu_sangho %> <span class="sr-only">Toggle navigation</span>
				</a>
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="logout.do"><i class="fa fa-sign-out"></i></a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="asset/dist/img/user2-160x160.jpg" class="img-circle"
							alt="User Image">
					</div>
					<div class="pull-left info">
						<p></p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- search form -->

				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<jsp:include page="../common/mng_left_menu.jsp"></jsp:include>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					자료실 <small></small>
				</h1>
				<!-- ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol-->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row" style="width: 100%; margin-bottom: 20px;">
					<!-- 공통 검색 조건 -->
						<!-- 공통 검색 조건 -->
						<div class="col-xs-12" style="padding-right: 0px;">
							 <span> 제목 : </span><input type="text" id="p_title" name="p_title"
								style="width: 90px" value=''> <input
								type="button" class="btn btn-warning" onclick="getUserList('1')"
								value="조회하기" /> 
								<%if("master".equals(admin)){%>
								<input type="button" class="btn btn-info"
								onclick="fnDataFileAdd()" value="신규등록" /> 

								<%} %>
						</div>
				</div>
				<div id="tabledata">
					<div class="row" style="width: 100%">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												
												<th style="font-size: 18px">제목</th>
												<th style="font-size: 18px">등록자</th>
												<th style="font-size: 18px">등록일자</th>
												<th style="font-size: 18px">보기</th>

											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }">
														<tr>
															<td style="font-size: 18px" width="40%">${ vo.title}</td>
															<td style="font-size: 18px" width="20%">우보테크</td>
															<td style="font-size: 18px" width="20%">${ vo.reg_date}</td>
															<td style="font-size: 18px" width="20%"><input type="button" class="btn btn-warning" onclick="fnDataFileDt(${vo.brd_no})" value="상세"/></td>

														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="6" style="height: 100px; text-align: center;">검색된
															자료가 없습니다.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>



					<div class="row">
						<div class="col-md-6" style="padding-top: 20px;">
							<span>건수 : ${ itemCount }</span>
						</div>
						<div class="col-md-6" style="width: 100%; text-align: center">
							<ul class="pagination">
								<li><a href="javascript:getUserList( '1' ,'')">&nbsp;&lt;&lt;&nbsp;</a></li>

								<c:if test="${currentPage > 1 }">
									<li><a
										href="javascript:getUserList(${ currentPage-1 },'');">&nbsp;&lt;&nbsp;</a></li>
								</c:if>
								<c:if test="${currentPage <= 1 }">
									<li><a href="javascript:getUserList(${ currentPage},'');">&nbsp;&lt;&nbsp;</a></li>
								</c:if>


								<c:forEach var="pg" items="${ paging }">
									<c:if test="${ pg == currentPage }">
										<!-- button type="button" class="btn" onclick="getUserList(${ pg },'');" style="font-weight:bold;">&nbsp;${ pg }&nbsp;</button-->
										<li class="active"><a
											href="javascript:getUserList(${ pg},'');">${ pg }</a></li>
									</c:if>
									<c:if test="${ pg != currentPage }">
										<!-- button type="button" class="btn" onclick="getUserList(${ pg },'');">&nbsp;${ pg }&nbsp;</button-->
										<li><a href="javascript:getUserList(${ pg},'');">${ pg }</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${ currentPage < maxPage }">

									<!--button type="button" class="btn1" onclick="getUserList(${currentPage+1},'');">&nbsp;&gt;&nbsp;</button-->
									<li><a
										href="javascript:getUserList(${ currentPage+1},'');">&nbsp;&gt;&nbsp;</a></li>
								</c:if>
								<c:if test="${ currentPage >= maxPage }">
									<!-- button type="button" class="btn1">&nbsp;&gt;&nbsp;</button-->
									<li></li>
								</c:if>

								<li><a href="javascript:getUserList(${maxPage},'');">&nbsp;&gt;&gt;&nbsp;</a></li>

							</ul>
						</div>
					</div>

				</div>


				
				


				<div id="modalPop" class="modal fade">
					<
				</div>
				<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<div id="modalPop2" class="modal fade">
		<!-- /.modal-dialog -->
	</div>

	
	<div id="modalPop3" class="modal fade">
		
	</div>

	<!-- /.modal -->


	<!-- /.content-wrapper -->

	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b></b>
		</div>
		<strong>Copyright &copy; 2021 <a href="#">우보테크</a>.
		</strong> All rights reserved.
	</footer>

	<!-- Control Sidebar -->

	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>

	<!-- ./wrapper -->


	<!-- jQuery 2.2.3 -->
	<script src="asset/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="asset/bootstrap/js/bootstrap.min.js"></script>

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
	
	<script src="asset/dist/js/demo.js"></script>

	<script src="asset/plugins/ckeditor/ckeditor.js"></script>
	<script src="asset/plugins/ckeditor/samples/js/sample.js"></script>
	
	<!-- AdminLTE for demo purposes -->
	<script src="asset/dist/js/demo.js"></script>

	<script src="resources/js/jquery.number.min.js"></script>
	<script src="resources/js/jquery.number.js"></script>
	<script type="text/javascript">
		
		//$('td.number').number( true, 0 );
		$('.clickBtn').bind('click', function() {
			var trNum = $(this).closest('tr').prevAll().length;
			//alert(trNum);
			
			fnSeletedRow(trNum);
			
		});
	</script>


	<script type="text/javascript">
	
	

	function fnfile_d(brd_no,seq){
		
		if(!confirm("파일을 삭제 하시겠습니까?")){
			
			return;
		}
		$.ajax({
			type : "post",
			url : "mng_file_d",
			dataType : "html",
			data : {
 				brd_no:brd_no,
				seq:seq
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				fnDataFileDt(brd_no);
				//location.reload();
			}else{
				alert('등록 실패');
			}

		});
		
	}
	
	
	
	function fnDataFileDt_u(){
		
		var contents = CKEDITOR.instances.p_contents.getData();	
		
		
		
		
		if($("#p_title").val()==''){
			alert("상품명을 입력해주세요");
			return;
		}
		
		
	   $("#contents").val(contents) 	;
	   var form = $('#form1')[0];
       var formData = new FormData(form);
       //formData.append("img1",  $("#file1")[0].files[0]);
     //  formData.append("img2",  $("#file2")[0].files[0]);
     //  formData.append("img3",  $("#file3")[0].files[0]);
     //  formData.append("img4",  $("#file4")[0].files[0]);
      // formData.append("img5",  $("#file5")[0].files[0]);
       formData.append("brd_no", $("#p_brd_no").val());
       formData.append("good_group_cd", $("#p_good_group_cd").val());
       formData.append("title", $("#p_title").val());
      // formData.append("contents",contents);


      $.ajax({
           url: 'mng_data_file_dt_u',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
                	   
                	   if(result=='1'){
                		   alert("정상 등록되었습니다.");
                		   location.reload();
                	   }else{
                		   alert("관리자에게 문의 하세요!");
                	   }
                   	
                   }
           });
		
       
		
       
		
		
	}
	
	 function fnDataFileDt(brd_no) {
		 	
		 	$.ajax({
		 		type:"post",
		 		url:"mng_data_file_dt",
		 		dataType:"html",
		 		data:{
		 			brd_no : brd_no
		 		}	
		 		}).done(function(data){
		 			$("#modalPop").html("");
		 			$("#modalPop").html(data);
		 			$('#modalPop').modal('show');
		 		//	$('span.number').number( true, 0 );
		 		});
		 	
		 }	
	
	
	function fnclose(){
		$('#modalPop').modal('hide');
 	}
	
	function fnDataFile_i(){
		
		var contents = CKEDITOR.instances.p_contents.getData();	
		
		
		if($("#p_title").val()==''){
			alert("제목을 입력해주세요");
			return;
		}
		
		
		//if($("#p_option1").val()==''){
		///	alert("옵션명1 입력해주세요");
		//	return;
		//}
		//if($("#p_option2").val()==''){
		//	alert("옵션명2 입력해주세요");
		//	return;
		//}
		
		//if($("#p_option3").val()==''){
		//	alert("옵션명3 입력해주세요");
		//	return;
		//}
		
		
	   $("#contents").val(contents) 	;
	   var form = $('#form1')[0];
       var formData = new FormData(form);
       formData.append("img1",  $("#file1")[0].files[0]);
       formData.append("img2",  $("#file2")[0].files[0]);
       formData.append("img3",  $("#file3")[0].files[0]);
       formData.append("img4",  $("#file4")[0].files[0]);
       formData.append("img5",  $("#file5")[0].files[0]);
       formData.append("title", $("#p_title").val());
       
      // formData.append("contents",contents);

		
      $.ajax({
           url: 'mng_data_file_add_i',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
                	   
                	   if(result=='1'){
                		   alert("정상 등록되었습니다.");
                		   location.reload();
                	   }else{
                		   alert("관리자에게 문의 하세요!");
                	   }
                   	
                   }
           });
		
       
		
       
		
		
	}
	
	function fileCheck(obj,id,imgId){
		
		
		var ext = $('#'+id).val().split('.').pop().toLowerCase();

		if ($('#'+id).val() == '') {
			return;
		}
		/*
		if ($.inArray(ext, [ 'jpg' ]) == -1) {

			alert('jpg 파일만 업로드 할수 있습니다.');

			return;

		}
		*/

		//파일 사이즈 체크
		var iSize = 0;
		if (window.ActiveXObject) {
			var objFSO = new ActiveXObject("Scripting.FileSystemObject");

			var sPath = $('#'+id)[0].value;
				
			var objFile = objFSO.getFile(sPath);
			
			iSize = objFile.size;

			iSize = iSize / 1024;

		} else {
			iSize = ($('#'+id)[0].files[0].size / 1024);
		}

		iSize = (Math.round(iSize * 100) / 100)
		if (iSize > 500) {
			//alert('500kb 이하 이미지만 첨부할 수 있습니다.');
			//////return;
		}

		readURL(obj, imgId,id);
		
	}
	
	
	function readURL(input, imgId,id) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#' + imgId).attr('src', e.target.result);
			}
			
			
			reader.readAsDataURL(input.files[0]);
			
			//if(!confirm("서버에 업로드 하시겠습니까?")){
			//	return;
			//}
			//uploadFile(imgId,id);
		}
	}
	
	
	
	function fnDataFileAdd() {
		
		
	 	$.ajax({
	 		type:"post",
	 		url:"mng_data_file_add",
	 		dataType:"html",
	 		data:{
	 			
	 		}	
	 		}).done(function(data){
	 			$("#modalPop").html("");
	 			$("#modalPop").html(data);
	 			$('#modalPop').modal('show');
	 		//	$('span.number').number( true, 0 );
	 		});
		
	 	
	 }	

	
	
	//상세조회
	function fnOrderDtlList(order_no) {
		
		//alert('aa');
		//fnSeletedTopTable(obj);
		
		$("#selected_code").val(order_no);
		$.ajax({
			type : "post",
			url : "mng_order_dt_list",
			dataType : "html",
			data : {
				order_no:order_no
			}
		}).done(function(data) {
			//alert(data);
			$("#tabledata2").html("");
			$("#tabledata2").html(data);
		});

	}
	
	

	function getUserList(page, keyword) {

		var form = document.formdata;

		var title = $('#p_title').val();
		var pageView = "mng_data_file_table";
	
		$.ajax({
			type : "post",
			url : "mng_data_file",
			dataType : "html",
			data : {
				page : page,
				pageView : pageView,
				title : title,
			}
		}).done(function(data) {
			$("#tabledata").html("");
			$("#tabledata").html(data);
			//	$('td.number').number( true, 0 );
			//	$('span.number').number( true, 0 );
		});

	}
	</script>

	<script>
		$(function() {
		});
	</script>
</body>
</html>
