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
	height: 59%;
}
</style>
 

<!-- ????????? CSS -->

<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

	<header class="main-header">
   <%--  <nav class="navbar navbar-static-top">
       <jsp:include page="../common/mng_top_menu.jsp"></jsp:include>
      <!-- /.container-fluid -->
    </nav> --%>
   </header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- <section class="content-header">
				<span style="float:left; font-size: 30px;">????????????</span>
				
				<span id="set_timer"
							class="pull-right" style="margin-right: 20px; font-size: 30px; float:right;"></span>
				
				<div id="Progress_Loading">
					<img src="resources/img/loadingbar1.gif">
				</div>
				ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol
			</section> -->

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row" style="width: 100%; margin-bottom: 5px; padding-bottom: 5px;">
					<!-- ?????? ?????? ?????? -->
					<div class="col-xs-12" style="padding-right: 0px;">
						<%-- <span>???????????? : </span> &nbsp;<input type="text" id="startdate" 	name="startdate" style="margin-right:15px; width: 100px" autocomplete="off"	 value="${startdate}" /> &nbsp;
							<span> ?????? : </span> &nbsp;<select id="branch" name="branch" style="margin-right:15px;">
				<option value="000" ${branch =='000' ? 'selected' :'' }>??????</option>
				<option value="001" ${branch =='001' ? 'selected' :'' }>??????</option>
				</select>&nbsp; --%>
				
			
				
							<%-- <span> ?????? : </span> &nbsp;<input type="text" id="p_carname"	 autocomplete="off"	name="p_carname" style="margin-right:15px; width: 100px"	value="" 
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
							/>	
							
							&nbsp;
						    <span> ?????? : </span> &nbsp;<input type="text" id="p_itemcode1"	autocomplete="off"	name="p_itemcode1" style="margin-right:15px; width: 100px"	value="" 
						    onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
						    />	
						    
						    &nbsp;
						    <span> ?????? : </span> &nbsp;<input type="text" id="p_itemname"	autocomplete="off"	name="p_itemname" style="margin-right:15px; width: 100px"	value="" 
						    onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
						    />	
						    
						    &nbsp;	
							<%if("master".equals(admin)){%>
							<span> ????????? : </span> &nbsp;<input type="text" id="p_name"	autocomplete="off"	name="p_name" style="margin-right:15px; width: 100px"	value="" 
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"
							/>
							<%} %>	
							
							&nbsp;&nbsp;&nbsp; <span>????????????(??????) : </span> &nbsp;<select
							id="aligndata" name="aligndata">
							<option value="0" ${aligndata =='0' ? 'selected' :'' }>????????????</option>
							<option value="1" ${aligndata =='1' ? 'selected' :'' }>????????????</option>
							<option value="2" ${aligndata =='2' ? 'selected' :'' }>????????????</option>
							</select>
						
							<input type="button" class="btn btn-warning" onclick="getUserList('1')" value="????????????" style="margin-left: 25px;" id="start"/> --%>
							<!-- <input type="button" class="btn btn-success" id="btexe" onclick="export()" value="????????????"	 style="margin-left: 25px;" />  -->
							
							<input type="button" class="btn btn-success" value="Save excel" onclick="export()" id="xls"/>
							
				<div id="page" style="float:right;">
						<%-- <span>????????? ???</span>
							<select id="itemCountPerPage" class="selectpicker"
								style="width: 60px; height: 30px" onchange="getUserList('1')">
								<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
								<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
								<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
							</select>
						<span>??? ??? ??????</span> --%>	
					</div>
					</div>
				</div>
				<div  id="tabledata">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body" style="overflow: scroll;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="??????"/></td-->
									<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
									
										<thead>
											<tr>
												<th class="sticky-th" rowspan="3"style="text-align: center;">Sequence</th>
												<th class="sticky-th" rowspan="3"style="text-align: center;">Workplace</th>
												<th class="sticky-th" rowspan="3"style="text-align: center;">Car</th>
												<th class="sticky-th" rowspan="3"style="text-align: center;">Part Number</th>
												<th class="sticky-th" rowspan="3" style="text-align: center;">Item name</th>
												<th class="sticky-th" rowspan="3"style="text-align: center;">Spec</th>
												<th class="sticky-th" rowspan="3"style="text-align: center;">Unit</th>
												<!-- <th rowspan="3" style="text-align: center;">Standard</th>
												<th rowspan="3" style="text-align: center;">Item classification</th>
												<th rowspan="3" style="text-align: center;">Unit</th> -->
												<th class="sticky-th" colspan="4" style="text-align: center;">Warehouse inventory</th>
												<th class="sticky-th" colspan="2" style="text-align: center;">WIP inventory</th>
												<th class="sticky-th" rowspan="2" colspan="2" style="text-align: center;">Total Qty</th>
												<th class="sticky-th" rowspan="3" colspan="2" style="text-align: center;">Total Qty</th>
												
												
											</tr>
											<tr>
												<th class="sticky-th-2nd" colspan="2" style="text-align: center; ">Material Warehouse </th>
												<!-- <th colspan="2" style="text-align: center;">Outside Warehouse</th> -->
												<th class="sticky-th-2nd" colspan="2" style="text-align: center; ">Products Warehouse</th>
												<!-- <th colspan="2" style="text-align: center;">??????</th> -->
												<th class="sticky-th-2nd" colspan="2" style="text-align: center; ">Poland Workshop</th>
												<!-- <th colspan="2" style="text-align: center;">Porm</th>
												<th colspan="2" style="text-align: center;">A/REST</th> -->
												<!-- <th colspan="2" style="text-align: center;">Total Qty</th> -->
											</tr>	
											<tr>
												<th class="sticky-th-3rd" style="text-align: center; ">OK</th>
												<th class="sticky-th-3rd" style="text-align: center; ">NG</th>
												<th class="sticky-th-3rd" style="text-align: center; ">OK</th>
												<th class="sticky-th-3rd" style="text-align: center; ">NG</th>
												<th class="sticky-th-3rd" style="text-align: center; ">OK</th>
												<th class="sticky-th-3rd" style="text-align: center; ">NG</th>
												<th class="sticky-th-3rd" style="text-align: center; ">OK</th>
												<th class="sticky-th-3rd" style="text-align: center; ">NG</th>
												<!-- <th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th> -->
												<!-- <th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th> -->
											</tr>		
										</thead>
										<tbody>
												<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="text-align: center;">${i }</td>
															<td>${vo.co_saname}</td>
															<td>${vo.carname}</td>
															<td>${vo.itemcode}</td>
															<td>${vo.itemname}</td>
															<td>${vo.spec}</td>
															<td>${vo.unit}</td>
															<td style="text-align:right;">${vo.m001qty ne "0" ? vo.m001qty : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															<td style="text-align:right;">${vo.m001qty1 ne "0" ? vo.m001qty1 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															<td style="text-align:right;">${vo.f001qty ne "0" ? vo.f001qty : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															<td style="text-align:right;">${vo.f001qty1 ne "0" ? vo.f001qty1 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															
															<td style="text-align:right;">${vo.j0001qty ne "0" ? vo.j0001qty : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															<td style="text-align:right;">${vo.j0001qty1 ne "0" ? vo.j0001qty1 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															<%-- <td>${vo.p001qty ne "0" ? vo.p001qty : ""}</td> --%>
															<%-- <td>${vo.g001qty ne "0" ? vo.g001qty : ""}</td>
															<td>${vo.f001qty1 ne "0" ? vo.f001qty1 : ""}</td>
															<td>${vo.f003qty1 ne "0" ? vo.f003qty1 : ""}</td> --%>
															
															<%-- <td>${vo.p001qty1 ne "0" ? vo.p001qty1 : ""}</td> --%>
															<%-- <td>${vo.g001qty1 ne "0" ? vo.g001qty1 : ""}</td>
															<td>${vo.a0001qty ne "0" ? vo.a0001qty : ""}</td>
															<td>${vo.c0001qty ne "0" ? vo.c0001qty : ""}</td>
															<td>${vo.j0001qty ne "0" ? vo.j0001qty : ""}</td>
															<td>${vo.a0001qty1 ne "0" ? vo.a0001qty1 : ""}</td> --%>
															<c:set var="row_sum1" value="${vo.f001qty + vo.f003qty+vo.m001qty+vo.g001qty+vo.e001qty+vo.a0001qty+vo.c0001qty+vo.j0001qty}" />
				                                            <c:set var="row_sum2" value="${vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1}" />
				                                            <c:set var="row_sum3" value="${(row_sum1+row_sum2)}" />
				                                            <fmt:formatNumber var="number3" type="number"  maxFractionDigits="2" value="${ (((vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty +vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1)*100) - (((vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty +vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1)*100)%1)) * (1/100)   } " />
				                                             
				                                             
				                                             <%-- <fmt:formatNumber var="number3" type="number"  maxFractionDigits="2" value="${row_sum3} " /> --%>
				
				                                              
				                                             <td style="text-align:right;">${vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty ne "0" ? row_sum1 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
				                                             <td style="text-align:right;">${vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 ne "0" ? row_sum2 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
				                                             <td style="text-align:right;">${vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty +vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 ne "0" ? number3 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</td>
															
															<%-- <td style="text-align:right;"><span id="ok${i}">${vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty ne "0" ? vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</span></td>
															<td style="text-align:right;"><span id="ng${i}">${vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 ne "0" ? vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</span></td>
															<td style="text-align:right;"><span id="tot${i}">${vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty +vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty1+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 ne "0" ? vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty+vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 : "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"}</span></td> --%>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
													<tr>
														<td colspan="20" style="height: 100px; text-align: center;">No data found.</td>
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
	
	<%-- <div class="" style="width: 33%; text-align: center; float: left; padding-top: -10px; margin-top: -10px;">
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
	</div> --%>
	
	<div style="float:right; width: 33%;">
	
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

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b></b>
			</div>
			<strong>Copyright &copy; 2021 <a href="#">WOOBOTECH</a>.
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
	<script src="resources/js/jquery.table2excel.js"></script>


	<script type="text/javascript">

			
	$(document).ready(function() {
		//$('#Progress_Loading').hide();
		$('#xls').click();
		/* $('#start').click(); */
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
		//console.log("1?????????@@@@");
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
	 //???????????????????????????220721?????????????????????
		 function getUserList(page, keyword) {
			 
		 	var form = document.formdata;
		 	
		 	var startdate = $('#startdate').val();
		 	var enddate = $('#enddate').val();
		 	var itemcode1 =$('#p_itemcode1').val();
		 	var itemname =$('#p_itemname').val();
		 	var name =$('#p_name').val();
		 	var carname =$('#p_carname').val();
		 	var branch =$('#branch').val();
		 	var pageView = "mng_stock_plan_table";
			var itemCountPerPage =  $('#itemCountPerPage').val();
			var align = $('#aligndata').val();
			
			if(branch==null){
				  alert("????????? ???????????????");
				  return;
			  }
		 	
		 	$.ajax({
		 		type:"post",
		 		url:"mng_stock_plan",
		 		dataType:"html",
		 		data:{
		 			startdate : startdate,
		 			enddate : enddate,
		 			page : page,
		 			pageView : pageView,
		 			itemcode1 : itemcode1,
		 			itemname : itemname,
		 			name : name,
		 			carname : carname,
		 			branch  : branch,
		 			itemCountPerPage : itemCountPerPage,
		 			align : align
		 		}	
		 		}).done(function(data){
		 			$("#tabledata").html("");
		 			$("#tabledata").html(data);
		 			$('td.number').number( true, 0 );
		 		//	$('span.number').number( true, 0 );
		 		});
		 	
		 	

		 }
		
		 //???????????????????????????220721??????????????????
		
		
		
	</script>
	<script>
  	$("#xls").click(function (){
  		$("#tablebody").table2excel({
  			  name: "Excel table",
  	          filename: "WooboTech_StockPlan",
  	          fileext: ".xls",
  		});
  	});
	</script>
  <script>
	  $( function() {
		  $('#startdate').datepicker ({ 
			  format: 'yyyy-mm-dd' 
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
		  $('#enddate').datepicker ({ 
			  format: 'yyyy-mm-dd' 
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
	  } );
	  
  </script>
</body>
</html>
