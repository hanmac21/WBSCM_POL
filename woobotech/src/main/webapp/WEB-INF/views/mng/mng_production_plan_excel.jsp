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
	padding: 10px;
}

/* #Progress_Loading {
	position: absolute;
	left: 50%;
	top: 50%;
	background: #ffffff;
} */
#back {
	position: absolute;
	z-index: 100;
	background-color: #000000;
	display: none;
	left: 0;
	top: 0;
}

#loadingBar {
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



<!-- 커스텀 CSS -->

<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">

		<header class="main-header">
			<%-- <nav class="navbar navbar-static-top">
				<jsp:include page="../common/mng_top_menu.jsp"></jsp:include>
				<!-- /.container-fluid -->
			</nav> --%>
		</header>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- <section class="content-header">
				<span style="float: left; font-size: 30px;">생산계획관리</span> <span
					id="set_timer" class="pull-right"
					style="margin-right: 20px; font-size: 30px; float: right;"></span>

				<div id="Progress_Loading">
					<img src="resources/img/loadingbar1.gif">
				</div>
				ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol
			</section>
 -->
			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row" style="width: 100%; margin-bottom: 5px; padding-bottom: 5px;">
					<!-- 공통 검색 조건 -->
					<div class="col-xs-12" style="padding-right: 0px;">

						<%-- <span>생산계획일자 : </span> &nbsp;<input type="text" id="startdate"
							name="startdate" style="margin-right: 15px; width: 100px"
							autocomplete="off" value="${startdate}" />&nbsp; <span>
							공장 : </span> &nbsp;<select id="branch" name="branch"
							style="margin-right: 15px;">
							<option value="000" ${branch =='000' ? 'selected' :'' }>평택</option>
							<option value="001" ${branch =='001' ? 'selected' :'' }>울산</option>
						</select> &nbsp; <span> 차종 : </span> &nbsp;<input type="text"
							id="p_carname" autocomplete="off" name="p_carname"
							style="margin-right: 15px; width: 100px" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />
						&nbsp; <span> 품명 : </span> &nbsp;<input type="text"
							id="p_itemname" autocomplete="off" name="p_itemname"
							style="margin-right: 15px; width: 100px" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />
						&nbsp; <span> 품번 : </span> &nbsp;<input type="text"
							id="p_itemcode" autocomplete="off" name="p_itemcode"
							style="margin-right: 15px; width: 100px" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />	
							
						&nbsp;&nbsp;&nbsp; <span>정렬기준(품명) : </span> &nbsp;<select
							id="aligndata" name="aligndata">
							<option value="0" ${aligndata =='0' ? 'selected' :'' }>선택안함</option>
							<option value="1" ${aligndata =='1' ? 'selected' :'' }>오름차순</option>
							<option value="2" ${aligndata =='2' ? 'selected' :'' }>내림차순</option>
						</select>
							
						&nbsp; <input type="button" class="btn btn-warning"
							onclick="getUserList('1')" value="조회하기"
							style="margin-left: 25px;" id="ok" /> --%>


						<!-- input type="button" class="btn btn-info"	onclick="exportToExcel()" value="엑셀변화"			style="float: right; margin-right: 10px;" /-->
						<!-- <input type="button" class="btn btn-success" 
							onclick="showExcel()" value="엑셀저장" style="margin-left: 50px;" /> -->
						
						<input type="button" class="btn btn-success" value="Save excel" onclick="export()" id="xls"/>
						
						<%-- <div id="page" style="float: right;">
							<span>페이지 당</span> <select id="itemCountPerPage"
								class="selectpicker" style="width: 60px; height: 30px"
								onchange="getUserList('1')">
								<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
								<option value="100"
									${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
								<option value="300"
									${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
							</select> <span>개 씩 표시</span>
						</div> --%>
					</div>
				</div>
				<div id="tabledata">
					<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body" style="overflow: scroll;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												<th>Sequence</th>
												<th>Item code</th>
												<th>Item name</th>
												<th>Car</th>
												<th>Product plan</th>
												<th>Basic Stock</th>
												<th>Safety Stock</th>
												<fmt:parseDate value='${str_day1}' var='strDay1' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day2}' var='strDay2' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day3}' var='strDay3' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day4}' var='strDay4' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day5}' var='strDay5' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day6}' var='strDay6' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day7}' var='strDay7' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day8}' var='strDay8' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day9}' var='strDay9' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day10}' var='strDay10' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day11}' var='strDay11' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day12}' var='strDay12' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day13}' var='strDay13' pattern='yyyy-MM-dd'/>
												<fmt:parseDate value='${str_day14}' var='strDay14' pattern='yyyy-MM-dd'/>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay1}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay2}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay3}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay4}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay5}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay6}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay7}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay8}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay9}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay10}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay11}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay12}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay13}' /></th>
												<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay14}' /></th>
												<th style="text-align: center;">Total</th>
												<th style="text-align: center;">Expected stock</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">

														<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="text-align: center;">${i }</td>
															<td>${vo.itemcode1}</td>
															<td>${vo.itemname}</td>
															<td>${vo.carname}</td>
															<td>${vo.plan_qty}</td>
															<td>${vo.stock_qty}</td>
															<td>${vo.safetystock}</td>
															<td>${vo.day1}</td>
															<td>${vo.day2}</td>
															<td>${vo.day3}</td>
															<td>${vo.day4}</td>
															<td>${vo.day5}</td>
															<td>${vo.day6}</td>
															<td>${vo.day7}</td>
															<td>${vo.day8}</td>
															<td>${vo.day9}</td>
															<td>${vo.day10}</td>
															<td>${vo.day11}</td>
															<td>${vo.day12}</td>
															<td>${vo.day13}</td>
															<td>${vo.day14}</td>
															<td>${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 ne "0" ? vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 : ""}</td>
															<td>${vo.stock_qty-vo.plan_qty+vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 ne "0" ? vo.stock_qty-vo.plan_qty+vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 : ""}</td>
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


					<div></div>

				</div>


				<div id="modalPop4" class="modal fade"></div>


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
		});
		/* .ajaxStart(function(){
			$('#Progress_Loading').show();
		}).ajaxStop(function(){
			$('#Progress_Loading').hide();
		}); */
		
		$(document).ready(function() {
			var branch = getCookie("branch");
			$("#branch").val(branch);
			
			$('#xls').click();
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
		
		$(function () {
		    var branch = getCookie("branch");
		    $("#branch").val(branch);
		    // alert(loginId);
		 });
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
		 //★★★★★삭제예정220721★★★★★시작
		function fnPWSave() {
			var u_id = $('#p_p_u_id').val();
			var pw = $('#p_pw').val();

			$.ajax({
				type : "post",
				url : "mng_pw_u",
				dataType : "html",
				data : {
					u_id : u_id,
					pw : pw
				}
			}).done(function(data) {
				var isOk = data;
				if (isOk == 1) {
					alert('정상 처리되었습니다.');
					location.reload();
				} else {
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
		
		function fnCheckedValue() {
			var str = new Array();
			var j = 0;
			for (var i = 1; i < $('table tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('table tr').eq(i).children().find(
						'input[type="checkbox"]').is(':checked');

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
			var itemname =$('#p_itemname').val();
			var itemcode =$('#p_itemcode').val();
		 	var carname =$('#p_carname').val();
		 	var branch =$('#branch').val();
		 	var align = $('#aligndata').val();
		 	
		 	if(branch==null){
				  alert("공장을 선택하세요");
				  return;
			  }
		 	
			var pageView = "mng_production_plan_table";
			var itemCountPerPage =  $('#itemCountPerPage').val();
			$.ajax({
				type : "post",
				url : "mng_production_plan",
				dataType : "html",
				data : {
					startdate : startdate,
					enddate : enddate,
					page : page,
					pageView : pageView,
					itemname : itemname,
					itemcode : itemcode,
		 			carname: carname,
		 			branch : branch,
		 			itemCountPerPage : itemCountPerPage,
		 			align : align
				}
			}).done(function(data) {
				$("#tabledata").html("");
				$("#tabledata").html(data);
				$('td.number').number(true, 0);
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
		//★★★★★삭제예정220721★★★★★끝
		/* function showExcel(){
			var startdate=$('#startdate').val();
			var branch=getCookie("branch");
			$("#branch").val(branch);
			window.open("mng_production_plan_excel?startdate="+startdate+"&branch="+branch,"Buy Plan Excel",'height=500,width=750');
		} */
	</script>

	<script>
		$(function() {
			$('#startdate').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('#enddate').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
		});
	</script>
	<script>
  	$("#xls").click(function (){
  		$("#tablebody").table2excel({
  			  name: "Excel table",
  	          filename: "WooboTech_ProPlan",
  	          fileext: ".xls",
  		});
  	});
	</script>
</body>
</html>
