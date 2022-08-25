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
	
 <link rel="stylesheet" href="asset/plugins/datatables/dataTables.bootstrap.css">	

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

<style type="text/css" class="init">
	th, td { 
		white-space: nowrap; 
		padding: 10px;
	}
	
	div.dataTables_wrapper {
		margin: 0 auto;
	}

 	div.container {

        width: 80%;

    }

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

#tablebody{
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	display: bolck;
	margin-top: 0px;
	font-size: 18px;
}

#tablebody th{
	position: sticky;
	top: 0px;
	background-color: white;
	border-top: 2px;
	box-shadow: inset 0 1px 0  #bbc6d3, inset 0 -1px 0 #bbc6d3;
}

.tableWrapper{
	width: 100%;
	height: 675px;
	overflow: auto;
}
</style>

<!-- 커스텀 CSS -->
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
				<span style="float:left; font-size: 30px;">관리자관리</span>
				
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
					<div class="col-xs-12" style="padding-right: 0px;">
						<span> 아이디 : </span> &nbsp;<input type="text" id="m_id"	 autocomplete="off"	name="m_id" style="margin-right:10px; width: 100px;"	value="" 
						onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
						/>	
							
					    <span>지역 : </span> &nbsp;<select id="m_plant" name="m_plant" style="height:27px;">
					    	<option value="" >전체</option>
							<option value="000">평택</option>
							<option value="001">울산</option>
						</select>	
												
						<input type="button" class="btn btn-warning" onclick="getUserList('1')" value="조회하기" style="margin-left: 50px;" id="start"/>
						
						<input type="button" class="btn btn-warning" onclick="addMember()" value="관리자추가" style="margin-left: 50px;" id="addMember"/>
							
						<div id="page" style="float:right;">
							<span>페이지 당</span>
								<select id="itemCountPerPage" class="selectpicker"
									style="width: 60px; height: 27px" onchange="getUserList('1')">
									<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
									<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
									<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
								</select>
							<span>개 씩 표시</span>	
						</div>
					</div>
				</div>
				
				<div  id="tabledata">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body tableWrapper" style="overflow: scroll; padding: 0 0 0 0;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
									
										<thead>
											<tr>
												<th rowspan="1" style="text-align: center;">순번</th>
												<th rowspan="1" style="text-align: center;">ID</th>
												<th rowspan="1" style="text-align: center;">지역</th>
												<th rowspan="1" style="text-align: center;">
													<input type="checkbox" name="chk_del" id="del_all" value="del_all" class="chkall">&nbsp;&nbsp;&nbsp;
													<button type="button" id="all_del" onclick="fnAllDel()">삭제</button>
												</th>
											</tr>
										</thead>
										
										<tbody>
												<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="text-align: center;">${i }</td>
															<td style="text-align: center;">${vo.id }</td>
															<td style="text-align: center;" id="${vo.row_seq }">${vo.plant }</td>
															<td style="text-align: center;"><input type="checkbox"/></td>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
													<tr>
														<td colspan="4" style="height: 100px; text-align: center;">검색된
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



	<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="margin-left: 10px;">건수 : ${ itemCount }</span>
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
		<strong>Copyright &copy; 2021 <a href="#">우보테크</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>

					<div>


					</div>

				</div>

				<div id="modalPop4" class="modal fade">
				</div>
			
			
				
			</section>
			<!-- /.content -->
		</div>
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

	</div>
	<!-- ./wrapper -->

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
	$(document).ready(function() {
		
	});
	
	$(document).ready(function() {

	}).ajaxStart(function(){
		FunLoadingBarStart();
	}).ajaxStop(function(){
		FunLoadingBarEnd();
	});
	
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
		
		var d = new Date(serverDate);
		
		return d;
	}

	const now = currentTime();
	$('#set_timer').text(now.toLocaleString());

	var timer = setInterval(()=>{
		console.log("1초마다@@@@");
		now.setSeconds(now.getSeconds()+1);
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
	
	function addMember(){
		
		window.open("mng_add_member","Add Member",'height=600, width=500');
		
	}
	
	function getUserList(page, keyword){
		
		var form = document.formdata;
		
		var m_id = $('#m_id').val();
		var m_plant = $('#m_plant').val();
		var itemCountPerPage =  $('#itemCountPerPage').val();
		var pageView = "mng_member_whole_table";
		
		$.ajax({
			type:"post",
			url:"mng_member_whole",
			dataType:"html",
			data:{
				page:page,
				pageView:pageView,
				itemCountPerPage:itemCountPerPage,
				m_id:m_id,
				m_plant:m_plant
			}
			
		}).done(function(data){
			$("#tabledata").html("");
			$("#tabledata").html(data);
			$('td.number').number(true,0);
		});
		
	}
	
  </script>
</body>
</html>
