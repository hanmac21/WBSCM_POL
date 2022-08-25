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

<form id="formdata" name="formdata" method="post">
	<input type="hidden" id="userid" name="userid" value="111">
</form>
<form id="formdata2" name="formdata2" method="post">
	<input type="hidden"  name="startdate" value="">
	<input type="hidden"  name="enddate" value="">
	<input type="hidden"  name="gubun" value="">
	<input type="hidden"  name="com_text" value="">
	<input type="hidden"  name="pageView" value="">
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
			<a href="mng_home" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>우보테크(관리자)</b></span> <!-- logo for regular state and mobile devices -->
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
						<p>
						</p>
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
					배송관리 <small></small>
				</h1>
				<!-- ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol-->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
		<!-- 공통 검색 조건 -->
		<div class="row" style="width: 100%; margin-bottom: 20px;">
					<!-- 공통 검색 조건 -->
					<div class="col-xs-12" style="padding-right: 0px;">
						<span>배송일자 : </span> <input type="text" id="startdate"	name="startdate" style="margin-left: 10px;width: 100px" value="${startdate}" /> 
						 <input type="button"	class="btn btn-warning" onclick="getUserList('1')" value="조회하기"  style="margin-right: 10x"/>
						 <span id="set_timer" class="pull-right" style="margin-right: 20px;font-size: 30px;"></span>	

			
						<!-- input type="button" class="btn btn-info"	onclick="exportToExcel()" value="엑셀변화"			style="float: right; margin-right: 10px;" /-->

					</div>
	</div>
				<div  id="tabledata">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body" style="overflow: scroll;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
										<thead>
											<tr>
												<th width="10%" style="text-align: center;">no</th>
												<th width="20%" style="text-align: center;">거래처명</th>
												<th width="8%" style="text-align: center;">입고일자</th>
												<th width="8%" style="text-align: center;">수량</th>
												<th width="10%" style="text-align: center;">출발시간</th>
												<th width="15%" style="text-align: center;">도착예정시간</th>
												<th width="15%" style="text-align: center;">남은시간</th>
												<th width="14%" style="text-align: center;">배송상태</th>
												<!-- th>과부족</th-->
											</tr>
										</thead>
										<tbody>
												<c:choose>
												
												<c:when test="${ board.size() > 0 }">
												
												<c:set var ="pre_deliveryno"></c:set>
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														
														<tr>
														    <c:if test="${pre_deliveryno!=vo.deliveryno}">
															<td  style="text-align: center;" rowspan="${vo.d_ct}">${vo.deliveryno}</td>
															<td style="font-size: 18px" rowspan="${vo.d_ct}">${vo.cname}</td>
															<c:set var ="row_span_count" value="1"></c:set>
															</c:if>
															<td style="text-align: center;">${vo.indate}</td>
															<td style="font-size: 18px;text-align: center;">${vo.qty}</td>
															<c:if test="${pre_deliveryno!=vo.deliveryno}">
															<td style="text-align: center;" rowspan="${vo.d_ct}">${vo.dtime}</td>
															<td style="font-size: 18px;text-align: center;" rowspan="${vo.d_ct}">${vo.dtime2}</td>
															<td style="text-align: center;" rowspan="${vo.d_ct}">${vo.remain_h} ${vo.remain_m}
															
															<div class="progress">
												                <div class="progress-bar progress-bar-primary progress-bar-striped" role="progressbar" aria-valuenow="${100-vo.progress_rate}" aria-valuemin="0" aria-valuemax="100" style="width: ${100-vo.progress_rate}%">
												                </div>
												             </div>
															
															</td>
															</c:if>
															
															<c:if test="${pre_deliveryno!=vo.deliveryno}">		
															<c:choose>
													<c:when test="${vo.dstate=='배송중'}">
														<td rowspan="${vo.d_ct}">
															<c:choose>
																<c:when test="${vo.inRemain_h<=0  and vo.inRemain_m<=0 }">
																	<input type="button"	class="btn btn-warning" onclick="fndelivery_u('${vo.deliveryno}','배송완료')" style="font-size: 18px" value="입고예정"/>
																</c:when>
																<c:otherwise>
																	<input type="button"	class="btn btn-warning" onclick="fndelivery_u('${vo.deliveryno}','배송완료')" style="font-size: 18px" value="배송중"/>
																</c:otherwise>
															</c:choose>
															<input type="button"	class="btn btn-info" onclick="fnDelivertDt('${vo.deliveryno}')" value="상세"/>
														</td>
													</c:when>
													
													<c:otherwise>
														<td rowspan="${vo.d_ct}">
														<input type="button"	class="btn btn-success" onclick="fndelivery_u('${vo.deliveryno}','배송중')" style="font-size: 18px" value="배송완료" />
														<input type="button"	class="btn btn-info" onclick="fnDelivertDt('${vo.deliveryno}')" value="상세"/>
														</td>
													</c:otherwise>
													</c:choose>
													</c:if>
														<c:set var ="pre_deliveryno" value='${vo.deliveryno}'></c:set>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
													
													<tr>
														<td colspan="11" style="height: 100px; text-align: center;">검색된
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


					<div>


					</div>

				</div>


	<div id="modalPop" class="modal fade">
					<!-- /.modal-dialog -->
			</div>
			
			
				
			</section>
			<!-- /.content -->
		</div>
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



	<script type="text/javascript">

			
	$(document).ready(function() {

		});

	
	
	function fnDelivertDt(deliveryno){
		
		$.ajax({
			type : "post",
			url : "mng_delivery_dt",
			dataType : "html",
			data : {
				deliveryno : deliveryno
			}
		}).done(function(data) {
			$("#modalPop").html("");
			$("#modalPop").html(data);
			$('#modalPop').modal('show');
			//	$('span.number').number( true, 0 );
		});
	}
	
	function fndelivery_u(deliveryno, dstate){
		
		if(!confirm("["+dstate +"]상태로 변경하시겠습니까?")){
			
			return;
		}
		$.ajax({
			type : "post",
			url : "mng_delivery_state_u",
			dataType : "html",
			data : {
				deliveryno:deliveryno,
				dstate:dstate
			}
		}).done(function(data) {
			var isOk = data;
			if (isOk == 1) {
				alert('정상 처리되었습니다.');
				location.reload();
			}else{
				alert('등록 실패');
			}

		});
		
	}
	
	
	
		


		/**
		 * checkbox에서 선택된 항목들의 값을 배열로 리턴한다.
		 * @param checkbox
		 * @returns {Array}
		 */
		function getCheckedValue(checkbox) {
			var chk_arr = document.getElementsByName(checkbox);

			var str = new Array();
			var idx = 0;
			for (i = 0; i < chk_arr.length; i++) {
				if (chk_arr[i].checked) {
					str[idx] = chk_arr[i].value;
					idx++;
				}
			}
			return str;
		}
		 
		 
		function fnCheckedValue(){
			var str = new Array();
			var j=0;
			for (var i = 1; i < $('table tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('table tr').eq(i).children().find('input[type="checkbox"]').is(':checked');

				 

				if (chk == true) {

				// 그 i 번째 input text의 값을 가져온다.

					var fabric_seq = $('table tr').eq(i).find('select').val();
					str[j] = fabric_seq;
					j++;
				
				

				}

			}
			
			return str;

		}
		
		
		function checkAll(controller, target) {
			var chk_arr = document.getElementsByName(target);
			for (i = 0; i < chk_arr.length; i++) {
				chk_arr[i].checked = controller.checked;
			}
		}

		 function getUserList(page, keyword) {
			 
		 	var form = document.formdata;
		 	
		 	var startdate = $('#startdate').val();
		 	var enddate = $('#enddate').val();
		 	var gubun =$('#gubun').val();
		 	var com_text  =$('#com_text').val();

		 	var pageView = "mng_delivery_table";
		 	
		 	
		 	$.ajax({
		 		type:"post",
		 		url:"mng_delivery",
		 		dataType:"html",
		 		data:{
		 			startdate : startdate,
		 			enddate : enddate,
		 			page : page,
		 			pageView : pageView,
		 			gubun : gubun,
		 			com_text: com_text
		 		}	
		 		}).done(function(data){
		 			$("#tabledata").html("");
		 			$("#tabledata").html(data);
		 			$('td.number').number( true, 0 );
		 		//	$('span.number').number( true, 0 );
		 		});
		 	
		 	

		 }
		
		
		function fnCancelPop() {
			var checkedValue = getCheckedValue('box');

			if (checkedValue == "") {
				alert("삭제할 사용자를 선택한 후 다시 실행해주세요.");
				return false;
			}
			$('#cancelPop').modal('show');
		}

		function fnAppPop(id) {

			$('#userid').val(id);
			$('#modalPop').modal('show');
		}

		
		function fnPop() {
			$('#modalPop').modal('show');
		}
		
		
		
		
	</script>

  <script>
	  $( function() {
		  $('#startdate').datepicker ({ format: 'yyyy-mm-dd' });
		  $('#enddate').datepicker ({ format: 'yyyy-mm-dd' });
	  } );
	  
	  
	  var timer = setInterval(currentTime,1000);
	  function currentTime(){
		  
		  var d= new Date();
		//  console.log("time :" +d.toLocaleString());
		  $('#set_timer').text(d.toLocaleString());
	  }
	  
  </script>
</body>
</html>
