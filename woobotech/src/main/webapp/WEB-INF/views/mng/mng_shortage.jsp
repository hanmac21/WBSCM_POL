<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<form id="formdata2" name="formdata2" method="post">
	<input type="hidden" name="startdate" value=""> <input
		type="hidden" name="enddate" value=""> <input type="hidden"
		name="gubun" value=""> <input type="hidden" name="com_text"
		value=""> <input type="hidden" name="pageView" value="">
</form>

<style type="text/css" class="init">
th, td {
	white-space: nowrap;
}

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
	padding: 6px;
}

/* #Progress_Loading {
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

#tablebody{
	width: 100%;
	border: 0px;
	border-collapse: collapse;
	display: bolck;
	margin-top: 0px;
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
				<span style="float:left; font-size: 30px;"><!-- ?????????????????? -->Shortage</span>
				
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
				<!-- ?????? ?????? ?????? -->
				<div class="row" style="width: 100%; margin-bottom: 5px; padding-bottom: 5px;">
					<!-- ?????? ?????? ?????? -->
					<div class="col-xs-12" style="padding-right: 0px;">
						<span><!-- ?????????????????? -->Date : </span> &nbsp;
						<%-- <input type="text" id="startdate"
							name="startdate" style="margin-right: 10px; width: 100px"
							autocomplete="off" value="${startdate}" />  --%>
						<input type="text" id="startdate" name="startdate" value="${startdate }" style="width:125px; margin-right:10px;" readonly/>	
							
						<%
						if ("master".equals(admin)) {
						%>
						<span>Kind : </span>&nbsp;
						<select
							id="division" name="division" style="margin-right: 10px; height:27px;">
							<option value="001" ${division =='001' ? 'selected' :'' }>Production</option>
							<option value="002" ${division =='002' ? 'selected' :'' }>Goods</option>
						</select>
						<input type="hidden" name="p_cno" id="p_cno" placeholder="Partner number"
							value="" readonly="readonly"> &nbsp;&nbsp;&nbsp; 
						
						&nbsp;&nbsp;&nbsp;
						
						<%
						}
						%>	
					
						<input type="hidden" name="branch" id="branch" value="000">
						 &nbsp; 
						<input type="button" class="btn btn-warning"
							onclick="getUserList('1')" value="View"
							style="margin-left: 25px;" id="ok"/>
							
							<div id="page" style="float:right;">
						<span>Per page</span>
							<select id="itemCountPerPage" class="selectpicker"
								style="width: 60px; height: 27px" onchange="getUserList('1')">
								<option value="300" ${itemCountPerPage =='300'  ? 'selected' :'' }>300</option>
								<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
								<option value="30" ${itemCountPerPage =='30' ? 'selected' :'' }>30</option>
							</select>
						<span></span>	
					</div>
					</div>
				</div>
				<div id="tabledata">
					
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body tableWrapper" style="overflow: scroll; padding:0 0 0 0;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="??????"/></td-->
									<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												<th>Sequence</th>
												<!-- <th>Code</th>
												<th>Partner name</th> -->
												<th>Item code</th>
												<th>Item name</th>
												<th>Car</th>
												<!-- th>????????????</th-->
												<!-- th>????????????</th -->
												<th style="font-size: 10px">${str_day1}</th>
												<th style="font-size: 10px">${str_day2}</th>
												<th style="font-size: 10px">${str_day3}</th>
												<th style="font-size: 10px">${str_day4}</th>
												<th style="font-size: 10px">${str_day5}</th>
												<th style="font-size: 10px">${str_day6}</th>
												<th style="font-size: 10px">${str_day7}</th>
												<th style="font-size: 10px">${str_day8}</th>
												<th style="font-size: 10px">${str_day9}</th>
												<th style="font-size: 10px">${str_day10}</th>
												 	
												<th style="font-size: 10px">Total</th>
												<th style="font-size: 10px">Expected</th>
												<!-- th>?????????</th-->
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
														<c:set var="i" value="${i+1 }"/>

														<tr>
															<td style="text-align: center;">${i }</td>
															<%-- <td>${vo.custcode}</td>
															<td>${vo.cu_sangho}</td> --%>
															<td>${vo.itemcode1}</td>
															<td>${vo.itemname}</td>
															<td>${vo.carname}</td>
															<!--  >td></td-->
															<!--  >td></td-->
															<td>${vo.day1b}</td>
															<td>${vo.day2b}</td>
															<td>${vo.day3b}</td>
															<td>${vo.day4b}</td>
															<td>${vo.day5b}</td>
															<td>${vo.day6b}</td>
															<td>${vo.day7b}</td>
															<td>${vo.day8b}</td>
															<td>${vo.day9b}</td>
															<td>${vo.day10b}</td>
															<td class="number">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11}</td>

														</tr>

													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="19"
															style="height: 100px; text-align: center;">No data found.</td>
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
		<%-- <span style="margin-left: 10px;">number : ${ itemCount }</span> --%>
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
		<strong>Copyright &copy; 2022 <a href="#">WOOBOTECH</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>


					<div></div>

				</div>





				<div id="modalPop4" class="modal fade"></div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- <footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b></b>
			</div>
			<strong>Copyright &copy; 2021 <a href="#">????????????</a>.
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
	<script src="resources/js/jquery.table2excel.js"></script>


	<script type="text/javascript">
	$(function() {
		/* $('#p_delivery_date').datepicker({
			format : 'dd-mm-yyyy'
		}); */
		
		$("#startdate").datepicker ({ 
			  format: 'dd-mm-yyyy',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
		
		$("#startdate").datepicker().datepicker("setDate", new Date());
	});
	$(document).ready(function() {
		var test = $("#buy_1").val();
		console.log(test);
	});
	
	/* .ajaxStart(function(){
		$('#Progress_Loading').show();
	}).ajaxStop(function(){
		$('#Progress_Loading').hide();
	}); */
	
	$(document).ready(function() {
		//$('#Progress_Loading').hide();
		var branch = getCookie("branch");
	    $("#branch").val(branch);
	    
	    $("#ok").click();
	}).ajaxStart(function(){
		//$('#Progress_Loading').show();
		FunLoadingBarStart();
	}).ajaxStop(function(){
		//$('#Progress_Loading').hide();
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
		console.log("1?????????@@@@");
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
	
	$(function () {
	    var branch = getCookie("branch");
	    $("#branch").val(branch);
	    // alert(loginId);
			
	 });
	// ?????? ???????????? ??????
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
	
	function fnPWSave(){
		var u_id =$('#p_p_u_id').val(); 
		var  pw = $('#p_pw').val();
		
		$.ajax({
			type : "post",
			url : "mng_pw_u",
			dataType : "html",
			data : {
				u_id : u_id,
				pw:pw
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('Successfully processed.');
				location.reload();
			}else{
				alert('Registration failed');
			}

		});
		
	}
	
	function fnPWView(u_id,point){
		$('#p_p_u_id').val(u_id);
		
		$('#modalPop2').modal('show');
	}
	
	function fnPointView(u_id,point){
		$('#p_u_id').val(u_id);
		$('#p_tatal_point').val(point);
		$('#modalPop').modal('show');
	}
	
	function fnPointSave(p_type){
		var u_id =$('#p_u_id').val(); 
		var  point = $('#p_point').val();
		
		$.ajax({
			type : "post",
			url : "mng_point_u",
			dataType : "html",
			data : {
				u_id : u_id,
				point : point,
				p_type : p_type
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('Successfully processed.');
				location.reload();
			}else{
				alert('Registration failed');
			}

		});
		
	}
	
	function showExcel(){
		var startdate = $('#startdate').val();
		var branch =$('#branch').val();
		var alldtate=$('#alldtate').val();
		window.open("mng_biz_plan_excel?startdate="+startdate+"&alldtate="+alldtate+"&branch="+branch,"Buy Plan Excel",'height=500,width=750');
	}
	
	//?????? ??????
	 function exportToExcel(){
		
	 	var form = document.formdata2;
	 	var startdate = $('#startdate').val();
	 	var enddate = $('#enddate').val();

	 	form.startdate.value=startdate;
	 	form.enddate.value=enddate;
	 	form.gubun.value=gubun;
	 	form.com_text.value=com_text;
	 	form.pageView.value="mng_member_excel";
	 	form.action="mng_member";
	 	form.submit();
	 }
	
		/**
		 * checkbox?????? ????????? ???????????? ?????? ????????? ????????????.
		 * @param checkbox
		 * @returns {Array}
		 */
		
		 function getUserList(page, keyword) {
			 
		 	var form = document.formdata;
		 	
		 	var startdate = $('#startdate').val();
		 	var enddate = $('#enddate').val();
		 	var itemcode1 =$('#p_itemcode1').val();
		 	var carname =$('#p_carname').val();
		 	var itemname = $('#p_itemname').val();
		 	var division = $('#division').val();
		 	var custname = $('#p_cu_sangho').val();

		 	var pageView = "mng_shortage_table";
		 	var branch =$('#branch').val();
		 	
		 	var result=$('#alldtate').val();
		 	
		 	if(branch==null){
				  alert("please select a factory");
				  return;
			  }
		 	
		 	var itemCountPerPage =  $('#itemCountPerPage').val();
		 	$.ajax({
		 		type:"post",
		 		url:"mng_shortage",
		 		dataType:"html",
		 		data:{
		 			startdate : startdate,
		 			enddate : enddate,
		 			page : page,
		 			pageView : pageView,
		 			itemcode1 : itemcode1,
		 			carname: carname,
		 			itemname: itemname,
		 			branch : branch,
		 			itemCountPerPage : itemCountPerPage,
		 			division : division,
		 			custname : custname,
		 			result : result
		 		}	
		 		}).done(function(data){
		 			$("#tabledata").html("");
		 			$("#tabledata").html(data);
		 			$('td.number').number( true, 0 );
		 			//$('span.number').number( true, 0 );
		 		});

		 }
		
	</script>

	<script>
	  $( function() {
		  /* $('#startdate').datepicker ({ 
			  format: 'dd-mm-yyyy' 
		  }).on('change',function(){
				$('.datepicker').hide();
		  }); */
		  $('#enddate').datepicker ({ 
			  format: 'dd-mm-yyyy' 
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
	  } );
	  
  </script>
	
	
</body>
</html>
