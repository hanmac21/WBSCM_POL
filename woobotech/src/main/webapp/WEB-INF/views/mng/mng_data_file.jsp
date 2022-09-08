<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WOOBOTECH(manager)</title>
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
    /* border: 1px solid #bbc6d3; */
    border-collapse: collapse;
  }
  th, td {
    /* border: 1px solid #bbc6d3; */
    padding: 10px;
  }
  
 /*  #Progress_Loading {
	position: absolute;
	left: 50%;
	top: 50%;
	background: #ffffff;
} */

#back{
	position: absolute;
	z-index: 100;
	background-color: #000000;
	display: none;
	left: 0;
	top: 0;
}

#loadingBar{
	position: absolute;
	left: 50%;
	top: 50%;
	display: none;
	z-index: 200;
	transform: translate(-10%, -15%);
	width: 48%;
	height: 50%;
}
</style>


<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

	<header class="main-header">
    <nav class="navbar navbar-static-top">
       <jsp:include page="../common/mng_top_menu.jsp"></jsp:include>
      <!-- /.container-fluid -->
    </nav>
   </header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<span style="float:left; font-size: 30px;"><!-- 자료실 -->Library</span>
				
				<span id="set_timer"
							class="pull-right" style="margin-right: 20px; font-size: 30px; float:right;"></span>
				
				<!-- <div id="Progress_Loading">
					<img src="resources/img/loadingbar1.gif">
				</div> -->
				<!-- ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol-->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row" style="width: 100%; margin-bottom: 5px; padding-bottom: 5px;">
					<!-- 공통 검색 조건 -->
						<!-- 공통 검색 조건 -->
						<div class="col-xs-12" style="padding-right: 0px;">
							<span> Date : </span> &nbsp;
							<!-- <input type="text" id="startdate"	name="startdate" autocomplete="off" style="margin-right:5px; width: 100px"> -->
							<input type="text" id="startdate" name="startdate" style="width:125px; margin-right:5px;" autocomplete="off" readonly placeholder="dd-mm-yyyy"/>
							~
							<!-- <input type="text" id="enddate" name="enddate"	autocomplete="off" style="margin-right: 20px; width: 100px">  -->
							<input type="text" id="enddate" name="enddate" style="width:125px; margin-right:20px;" autocomplete="off" readonly placeholder="dd-mm-yyyy"/>
							
							<span> Title : </span> &nbsp;<input type="text" id="p_title"	autocomplete="off"	name="p_title" style="margin-right:15px;width: 100px"	value="" 
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
							/>&nbsp;&nbsp;
							<span> content : </span> &nbsp;<input type="text" id="s_contents"	autocomplete="off"	name="s_contents" style="margin-right:15px; width: 200px"	value="" 
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
							/>&nbsp;&nbsp;
							<input		type="button" class="btn btn-warning" onclick="getUserList('1')"
								value="View" style="margin-left: 50px;margin-right: 50px;" id="ok"/>
								<%if("master".equals(admin)){%>
								<input type="button" class="btn btn-info"
								onclick="fnDataFileAdd()" value="New" /> 

								<%} %>
					<div id="page" style="float:right;">
						<span>Per page</span>
							<select id="itemCountPerPage" class="selectpicker"
								style="width: 60px; height: 27px" onchange="getUserList('1')">
								<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
								<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
								<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
							</select>
						<span>Display</span>	
					</div>
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
										class="table table-hover" cellspacing="0">
										<thead>
											<tr>
												<th style="font-size: 18px; text-align:center">Sequence</th>
												<th style="font-size: 18px; text-align:center">Title</th>
												<th style="font-size: 18px; text-align:center">name</th>
												<th style="font-size: 18px; text-align:center">Date</th>
												<th style="font-size: 18px; text-align:center">Hits</th>

											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }">
													<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="font-size: 18px; text-align:center" width="5%">
															<fmt:parseNumber value="${itemCount }" var="itemCount"/>
																<fmt:parseNumber value="${currentPage }" var="currentPage"/>
																<fmt:parseNumber value="${itemCountPerPage }" var="itemCountPerPage"/>
																<c:set var="no" value="${itemCount - ((currentPage - 1) * itemCountPerPage ) - i + 1}"/>
																${no }
															</td>
															<td style="font-size: 18px; text-align:centerx" width="45%"><a href="javascript:fnDataFileDt(${vo.brd_no})">${ vo.title} 
															<c:choose>
																<c:when test="${vo.file_cnt>0 }">
																	<img src="resources/img/attached.png" style="width: 18px; height: 18px;"/>
																</c:when>
																<c:otherwise>
																	
																</c:otherwise>
															</c:choose>
															</a></td>
															<td style="font-size: 18px; text-align:center" width="20%">WOOBOTECH</td>
															<td style="font-size: 18px; text-align:center" width="25%">${ vo.reg_date}</td>
															<td style="font-size: 18px; text-align:center" width="5%">${ vo.hit}</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="6" style="height: 100px; text-align: center;">No data found.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>



	<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="margin-left: 10px;">number : ${ itemCount }</span>
	</div>
	
	<div class="" style="width: 33%; text-align: center; float: left; padding-top: -10px; margin-top: -10px;">
		<ul class="pagination" style="padding-top:0px;">
			<li><a href="javascript:getUserList( '1' ,'')">&nbsp;&lt;&lt;&nbsp;</a></li>

			<c:if test="${currentPage > 1 }">
				<li><a href="javascript:getUserList(${ currentPage-1 },'');">&nbsp;&lt;&nbsp;</a></li>
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
				<li><a href="javascript:getUserList(${ currentPage+1},'');">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			<c:if test="${ currentPage >= maxPage }">
				<!-- button type="button" class="btn1">&nbsp;&gt;&nbsp;</button-->
				<li><a href="javascript:getUserList(${ currentPage},'');">&nbsp;&gt;&nbsp;</a></li>
			</c:if>
			
			<li><a href="javascript:getUserList(${maxPage},'');">&nbsp;&gt;&gt;&nbsp;</a></li>

		</ul>
	</div>
	
	<div style="float:right; width: 33%;">
		<div class="pull-right hidden-xs">
				<b></b>
		<strong>Copyright &copy; 2021 <a href="#">WOOBOTECH</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>
				</div>


				
				


				<div id="modalPop" class="modal fade">
					
				</div>
				<div id="modalPop4" class="modal fade">
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

	<!-- <footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b></b>
		</div>
		<strong>Copyright &copy; 2021 <a href="#">우보테크</a>.
		</strong> All rights reserved.
	</footer> -->

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
	
	$(function() {
		/* $('#p_delivery_date').datepicker({
			format : 'yyyy-mm-dd'
		}); */
		
		$("#startdate").datepicker ({ 
			  format: 'yyyy-mm-dd',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
		

	});
	$(function() {
		/* $('#p_delivery_date').datepicker({
			format : 'yyyy-mm-dd'
		}); */
		
		$("#enddate").datepicker ({ 
			  format: 'yyyy-mm-dd',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
		
	});
	$(document).ready(function() {
		//$('#Progress_Loading').hide();
	});
	/* .ajaxStart(function(){
		$('#Progress_Loading').show();
	}).ajaxStop(function(){
		$('#Progress_Loading').hide();
	}); */
	
	$(document).ready(function() {
		$('#ok').click();
		//$('#Progress_Loading').hide();
	}).ajaxStart(function(){
		//$('#Progress_Loading').show();
		FunLoadingBarStart();
	}).ajaxStop(function(){
		//$('#Progress_Loading').hide();
		FunLoadingBarEnd();
	});
	
	/* function currentTime(){
		
		var xmlHttpRequest;
		if(window.XMLHttpRequest){
			xmlHttpRequest = new XMLHttpRequest();
		}else if(window.ActiveXOject){
			xmlHttpRequest = new ActiverXObject("Microsoft.XMLHTTP");
		}else{
			return;
		}
		
		xmlHttpRequest.open('HEAD',window.location.href.toString(), false);
		xmlHttpRequest.setRequestHeader("ContentType","text/html");
		xmlHttpRequest.send('');
		
		var serverDate = xmlHttpRequest.getResponseHeader("Date");
		
		//var timer = setInterval(currentTime,1000);
		
		var d = new Date(serverDate);
		$('#set_timer').text(d.toLocaleString());
	}   */
	
	/* setInterval(function(){
		//console.log("@@@");
		currentTime();
	},1000); */
	
	/* var timer = setInterval(()=>{
		//console.log("1초마다@@@@");
		currentTime();
	},1000); */
	
	function currentTime(){
		
		var xmlHttpRequest;
		if(window.XMLHttpRequest){
			xmlHttpRequest = new XMLHttpRequest();
		}else if(window.ActiveXOject){
			xmlHttpRequest = new ActiverXObject("Microsoft.XMLHTTP");
		}else{
			return;
		}
		
		xmlHttpRequest.open('HEAD',window.location.href.toString(), false);
		xmlHttpRequest.setRequestHeader("ContentType","text/html");
		xmlHttpRequest.send('');
		
		var serverDate = xmlHttpRequest.getResponseHeader("Date");
		
		//var timer = setInterval(currentTime,1000);
		
		var d = new Date(serverDate);
		//d = d.setSeconds(d.getSeconds()+1);
		//$('#set_timer').text(d.toLocaleString());
		//$('#set_timer').text(d);
		return d;
	}

	//var now = new Date(currentTime);
	const now = currentTime();
	$('#set_timer').text(now.toLocaleString());
	//alert(now);

	/* setInterval(function(){
		//console.log("@@@");
		currentTime();
	},1000); */

	var timer = setInterval(()=>{
		console.log("1초마다@@@@");
		now.setSeconds(now.getSeconds()+1);
		//console.log(now);
		//console.log(now);
		//console.log(currentTime());
		//currentTime();
		//now;
		//date();
		//now.setSeconds(now.getSeconds()+100);
		$('#set_timer').text(now.toLocaleString());
	},1000);
	
	function FunLoadingBarStart(){
		var backHeight = $(document).height();
		var backWidth = window.document.body.clientWidth;
		
		var backGroundCover = "<div id='back'></div>";
		var loadingBarImage = '';
		
		loadingBarImage += "<div id='loadingBar'>";
		loadingBarImage += "	<img src='resources/img/wooboloading7.gif'/>";
		loadingBarImage += "</div>";
		
		$('body').append(backGroundCover).append(loadingBarImage);
		
		$('#back').css({'width':backWidth,'height':backHeight,'opacity':'0.3'});
		$('#back').show();
		$('#loadingBar').show();
	}
	
	function FunLoadingBarEnd(){
		$('#back, #loadingBar').hide();
		$('#back, #loadingBar').remove();
	}
		
		//$('td.number').number( true, 0 );
		$('.clickBtn').bind('click', function() {
			var trNum = $(this).closest('tr').prevAll().length;
			//alert(trNum);
			
			fnSeletedRow(trNum);
			
		});
	</script>


	<script type="text/javascript">
	
	

	function fnfile_d(brd_no,seq){
		
		if(!confirm("Are you sure you want to delete the file?")){
			
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
				alert('Successfully processed.');
				fnDataFileDt(brd_no);
				//location.reload();
			}else{
				alert('Registration failed.');
				//alert('비밀번호 일치하지 않습니다.');
			}

		});
		
	}
	
	
	
	function fnDataFileDt_u(){
		
		var contents = CKEDITOR.instances.p_contents.getData();	
		
		if($("#p_p_title").val()==''){
			alert("Please enter a title.");
			return;
		}
		
		if($("#p_pass").val()==''){
			alert("Please enter your Password.");
			return;
		}
		
		if(contents==''){
			alert("Please enter the contents.");
			return;
		}
		
	   $("#contents").val(contents) 	;
	   var form = $('#form1')[0];
       var formData = new FormData(form);
       /* formData.append("img1",  $("#file1")[0].files[0]);
       formData.append("img2",  $("#file2")[0].files[0]);
       formData.append("img3",  $("#file3")[0].files[0]);
       formData.append("img4",  $("#file4")[0].files[0]);
       formData.append("img5",  $("#file5")[0].files[0]); */
       formData.append("brd_no", $("#p_brd_no").val());
       formData.append("good_group_cd", $("#p_good_group_cd").val());
       formData.append("title", $("#p_p_title").val());
       formData.append("pass", $("#note_pass").val());
       //formData.append("cno", $("#p_cno").val());
      // formData.append("contents",contents);

      $.ajax({
           url: 'mng_data_file_dt_u',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
                	   
                	   if(result=='1'){
                		   alert("Successfully registered.");
                		   location.reload();
                	   }else{
                		   alert("Please contact the administrator.");
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
		
		//alert("!");
		
		if($("#p_p_title").val()==''){
			alert("Please enter a title.");
			return;
		}
		
		if($("#p_pass").val()==''){
			alert("Please enter your Password.");
			return;
		}
		
		if(contents==''){
			alert("Please enter the contents.");
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
       formData.append("title", $("#p_p_title").val());
       formData.append("pass", $("#p_pass").val());
      // formData.append("contents",contents);
      
      var file1=$("#file1").val();
      var file2=$("#file2").val();
      var file3=$("#file3").val();
      var file4=$("#file4").val();
      var file5=$("#file5").val();
      
     /*  if(!file1){
    	  alert("파일을 첨부해주세요");
    	  return;
      } */
      
      if(!(file1==''||file2==''||file3==''||file4==''||file5=='')){
    	  alert("Please check the file.");
    	  return;
      }
      
      $.ajax({
           url: 'mng_data_file_add_i',
           processData: false,
           contentType: false,
           data: formData,
           type: 'POST',
           success: function(result){
                	   
                	   if(result=='1'){
                		   alert("Successfully registered.");
                		   location.reload();
                	   }else{
                		   alert("Please contact the administrator.");
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
		var startdate = $('#startdate').val();
	 	var enddate = $('#enddate').val();
	 	var s_contents = $('#s_contents').val();
		var pageView = "mng_data_file_table";
		var itemCountPerPage =  $('#itemCountPerPage').val();
		FunLoadingBarStart();
		$.ajax({
			type : "post",
			url : "mng_data_file",
			dataType : "html",
			data : {
				page : page,
				pageView : pageView,
				title : title,
				itemCountPerPage : itemCountPerPage,
				startdate:startdate,
				enddate:enddate,
				s_contents : s_contents
			}
		}).done(function(data) {
			$("#tabledata").html("");
			$("#tabledata").html(data);
			FunLoadingBarEnd();
			//	$('td.number').number( true, 0 );
			//	$('span.number').number( true, 0 );
		});

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
	</script>

	<script>
		$(function() {
		});
	</script>
</body>
</html>
