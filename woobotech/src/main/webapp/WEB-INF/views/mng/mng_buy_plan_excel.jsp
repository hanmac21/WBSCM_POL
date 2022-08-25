<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>우보테크</title>
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
/* ul, li{
	margin-top: -10px;
	padding-top: -10px;
}
 */
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
	/* border-spacing: 2px; */
}

th, td {
	border: 1px solid #bbc6d3;
	padding: 10px;
}

/* #Progress_Loading {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -21px;
	margin-top: -21px;
	background: #ffffff;
} */

/* #wrap{
	width: 100%;
	min-height: 768px;
	position: relative;
}

#Progress_Loading{
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	width: 48%;
	height: 59%;
	z-index: 10000;
	display: flex;
	justify-content: center;
	align-items: center;
}

#mask{
	position:absolute;
	left:0;
	top:0;
	z-index:9999;
	background-color:#000;
	display:none;
} */

/* #mask{
	position:absolute;
	left:0;
	top:0;
	z-index:100;
	background-color:#000;
	display:non;
}

#loadingImg{
	position:absolute;
	left:45%;
	top:50%;
	z-index:120;
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

<!-- 커스텀 CSS -->

<body class="hold-transition skin-blue layout-top-nav">
<!-- 엑셀은 히든 가져가면 모양 이상해져서 buy_plan에서는 히든은 지웠습니다. -->

	<!-- <div id="mask" class="black_background"></div>
	
	<div id="light" class="white_content">
		<img src="resources/img/loadingbar1.gif"/>	
	</div> -->
	
	<div class="wrapper" id="wrap">

		<%-- <header class="main-header">
			<nav class="navbar navbar-static-top">
				<jsp:include page="../common/mng_top_menu.jsp"></jsp:include>
				<!-- /.container-fluid -->
			</nav>
		</header> --%>
		<!-- Left side column. contains the logo and sidebar -->
		<!-- <div id="Progress_Loading">
			<img src="resources/img/wooboloading3.gif">
		</div>
		
		<div id="mask"></div> -->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<!-- <h1 style="float:left;">
					구매계획관리 <small></small>
				</h1> -->
				<!-- <span style="float:left; font-size: 30px;">구매계획관리</span>
				
				<span id="set_timer"
							class="pull-right" style="margin-right: 20px; font-size: 30px; float:right;"></span> -->
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


						 
						<!-- &nbsp; &nbsp;&nbsp; <input type="button" class="btn btn-warning" id="search" 
							onclick="getUserList('1')" value="조회하기"
							style="margin-right: 50px" /> -->
						<!-- input type="button"	class="btn btn-info" onclick="fnNDeliverySet()" value="거래명세서발행하기"   /-->
						<!-- input type="button"	class="btn btn-success" onclick="fnSetLabel()" value="라벨발행하기" style="margin-left: 10x" /-->
						<!-- input type="button"	class="btn bg-maroon" onclick="fnDelivertView()" value="배송출발하기" style="margin-left: 10x" /-->
						<!-- input type="button"	class="btn bg-maroon" onclick="fnTrnsMove()" value="거래명세서 재발행" style="margin-left: 10x" /-->
						<input type="button" class="btn btn-success" value="Save excel" onclick="export()" id="xls"/>
						
						
					</div>
				</div>
				<input type="hidden" id="p_barcode">
				
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
												<th style="text-align: center; width: 3%;">Sequence
												</th>
												<th style="text-align: center; width: 7%;">Partner<br>&lt;partner code&gt;
												</th>
												<th style="text-align: center; width: 25%;">Item code<br>(item name)
												</th>
												<th style="text-align: center; width: 5%;">Car</th>
												<th style="text-align: center;">${str_day1}</th>
												<th style="text-align: center;">${str_day2}</th>
												<th style="text-align: center;">${str_day3}</th>
												<th style="text-align: center;">${str_day4}</th>
												<th style="text-align: center;">${str_day5}</th>
												<th style="text-align: center;">${str_day6}</th>
												<th style="text-align: center;">${str_day7}</th>
												<th style="text-align: center;">${str_day8}</th>
												<th style="text-align: center;">${str_day9}</th>
												<th style="text-align: center;">${str_day10}</th>
												<th style="text-align: center;">${str_day11}</th>
												<th style="text-align: center;">${str_day12}</th>
												<th style="text-align: center;">${str_day13}</th>
												<th style="text-align: center;">${str_day14}</th>
												<th style="text-align: center; width: 5%;">Total</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
														<c:set var="i" value="${i+1 }"/>
														<tr style="height: 40px;">
															<td style="text-align: center;">${i }</td>
															<td><span class="custname">${vo.custname}</span><br>&lt;<span
																class="custcode">${vo.custcode}</span>&gt;</td>
															<td><span class="itemcode1">${vo.itemcode1}</span><br>
																<span class="itemname">${vo.itemname}</span></td>
															<td><span class="car_type">${vo.car_type}</span> <span
																class="unit" style="display: none;">${vo.unit}</span></td>
															<td>

																<span class="number">${vo.day1}</span>
																		
															</td>
															<td>

																<span class="number">${vo.day2}</span>
																		
															</td>


															<td>

																<span class="number">${vo.day3}</span>
																		
															</td>

															<td>

																<span class="number">${vo.day4}</span>
																		
															</td>

															<td>

																<span class="number">${vo.day5}</span>
																		
															</td>
															<td>

																<span class="number">${vo.day6}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day7}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day8}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day9}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day10}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day11}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day12}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day13}</span>
																		
															</td>
															
															<td>

																<span class="number">${vo.day14}</span>
																		
															</td>
															
															<td class="number">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14}</td>

														</tr>

													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="18" style="height: 100px; text-align: center;">No data found.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>


					<div></div>

				</div>

				<div id="modalPop" class="modal fade"></div>


				<div id="modalPop2" class="modal fade" style="text-align: center;">
				</div>


				<div id="modalPop3" class="modal fade"></div>


				<div id="modalPop4" class="modal fade"></div>

				<div class="modal fade" id="modal_contact">
					<div class="modal-dialog" style="margin-top: 40px;">
						<div class="modal-content div-modal-content-wrap">

							<div class="modal-header init-custom div-modal-header">
								<img style="float: right; width: auto; height: 25px;"
									alt="팝업창 닫기" src="resources/img/close.png"
									onclick="coupon_close();">
							</div>

							<div class="modal-body init-custom div-modal-body-wrap">

								<p class="p-modal-contact-title" style="display: inline-block;">찾기</p>

								<input type="button" class="btn btn-info" onclick="fnUserSave()"
									value="적용" style="float: right;" />

								<hr class="hr-1-black init-custom" style="margin-top: 20px;" />

								<div class="div-ad-srds-modal" style="margin-top: 15px;">

									<input type="text" id="pp_cu_sangho"> <img alt="검색"
										src="resources/img/icon_search.png"
										style="width: auto; height: 26px;" onclick="fnSearch()">
								</div>


								<div class="row">
									<div class="col-xs-12">
										<div class="box">
											<!-- /.box-header -->
											<div class="box-body" id="table_user">
												<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
												<table id="tablebody1" width="100%"
													class="stripe row-border order-column" cellspacing="0">
													<thead>
														<tr>
															<th><input type="checkbox" name="chk_info" value=""></th>
															<th>협력사번호</th>
															<th>협력사명</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
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



	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<link rel="stylesheet" href="resources/css/print-preview.css">
	<script src="resources/js/jquery.print-preview.js"></script>
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/js/printThis.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//$('#Progress_Loading').hide();
			//alert("?");
			 /* var timer = setInterval(currentTime,1000);
			  function currentTime(){
				  
				  var d= new Date();
				//  console.log("time :" +d.toLocaleString());
				  $('#set_timer').text(d.toLocaleString());
			  } */
			  
			//var timer = setInterval(currentTime,1000);
			
			//var timer = setInterval(currentTime,1000);
						
			var branch = getCookie("branch");
		    $("#branch").val(branch);
		    //alert("!");
			/* $('#search').click(); */
			$('#xls').click();
			
		}).ajaxStart(function(){
			//$('#Progress_Loading').show();
			//wrapWindowByMask();
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
			//console.log("1초마다@@@@");
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
		
		/* setInterval("server_time()",1000);
		//var srv_time = "<?php print date("F d, Y H:i:s",time());?>";
		var now = new Date(srv_time);
		
		function server_time(){
			now.setSeconds(now.getSeconds()+1);
			
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var date = now.getDate();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var seconds = now.getSeconds();
			
			console.log("1");
			$('#set_timer').text(year + "-");
		} */
		
		/* var timer = setInterval(currentTime,1000);
		function currentTime(){
			  
			var d= new Date();
			//  console.log("time :" +d.toLocaleString());
			$('#set_timer').text(d.toLocaleString());
		} */
		 
		
		/* jQuery.fn.center = function(){
			this.css('top',Math.max(0,(($(window).height()-$(this).outerHeight())/2)+$(window).scrollTop())+'px');
			this.css('left',Math.max(0,(($(window).height()-$(this).outerHeight())/2)+$(window).scrollTop())+'px');
			return this;
		} */
		
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
		
		/* function wrapWindowByMask(){
			var windowHeight = $(document).height();
			var maskWidth = $(window).width();
			
			$('#mask').css({'width':maskWidth,'height':maskHeight});
			$('#mask').fadeTo(10,0.8);
			
			$('#Progress_Loading').show();
			$('#Progress_Loading').center();
		} */
		
		/* jQuery(function($){
			var loading = $('<img alt="loading" id="loadingImg" scr="resources/img/loadingbar1.gif">').appendTo(document.body).hide();
			
			$(window.ajaxStart(function(){
				loading.show();
				wrapWindowByMask();
			})
			.ajaxStop(function(){
				loading.hide();
				$('#mask').hide();
			});
		}); */
		
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
		//★★★★★삭제예정220721★★★★★ 시작
		 //메모적용
		function fnMemoSet(barcode){
			var memo = $("#s_memo").val();
			var len= memo.length;
			if(len>20){
				alert("20자 이하로 입력해주세요 ")
				return;
			}
			
			$("#p_memo").text(memo);
			$("#p_memo2").text(memo);
			
			$.ajax({
				type : "post",
				url : "mng_trns_memo_u",
				dataType : "html",
				data : {
					memo : memo,
					barcode : barcode
					
				}
			}).done(function(data) {
				var isOk = data;
				if (isOk == 1) {
					alert('비고란에 적용되었습니다.');
					
				}else{
					alert('비고란 적용 실패');
				}

			});
		}
		
		//거래명세서 인쇄
		function fnTrnsPop(barcode,prdate){
			var prdate = $("#outdate").val();
			
			 if("" == prdate){
				  alert("작성일자를 입력하세요");
				  return;
			 }
				
			//var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);
			//alert("받아오는 값"+text);
		
			// window.open("mng_print?barcode="+barcode+"&text="+text,  "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes'); */
			window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
			
		}
		
		function fnTrnsMove(){
			location.href="mng_re_trns";
		}
		
		function fnSearch() {
		    var cu_sangho = $("#pp_cu_sangho").val();
		 	//alert(userid);
			if(cu_sangho==''){
				$("#modal_contact").modal('show');
				return;
			}	    
		 	$.ajax({
		 		type:"post",
		 		url:"mng_cu_sangho",
		 		dataType:"html",
		 		data:{
		 			cu_sangho :cu_sangho
		 		}	
		 		}).done(function(data){
		 			$("#modal_contact").modal('show');
		 			
		 			$("#table_user").html("");
		 			$("#table_user").html(data);
		 		
		 		//	$('span.number').number( true, 0 );
		 		});

		}

		function fnUserSave(){
			var cno='';
			var cu_sangho='';
			var j=0;
			private_yn ="N";
			for (var i = 1; i < $('#tablebody3').find('tr').size(); i++) {
					
				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody3').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
				
				if (chk == true) {
					cno = $('#tablebody3').find('tr').eq(i).find('input[type="checkbox"]').val();
					cu_sangho = $('#tablebody3').find('tr').eq(i).find('.d_cu_sangho').text();
					cno = $('#tablebody3').find('tr').eq(i).find('.d_cno').text();
					
					j++;

				}
			}
			
			if(j==0){
				alert("사용자를 선택해주세요");
				return;
			}else if(j>=2){
				alert("사용자를 한명만 선택 해주세요");
				return;
			}else if(j==1){
				$('#p_cno').val(cno);
				$('#p_cu_sangho').val(cu_sangho);
				//$('#h_name').val(name);
				private_yn="Y";
			}
			$("#modal_contact").modal('hide');
			
		}   
		 function fnMaDateSet(){
			
			var ma_date = $("#ma_date").val();
			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
					
				if (chk == true) {
					
					$('#tablebody').find('tr').eq(i).find('.' +check_day+'_lot').val(ma_date);

				}
			}
			
		}
		
		function fnPWView(){
			//$('#p_p_u_id').val(u_id);
			
			$('#modalPop4').modal('show');
		}
		
		
		function fnDelivertView(){
			if(check_date==''){
				alert("선택된 항목이 없습니다.");
				return;
			}
			$.ajax({
				type : "post",
				url : "mng_delivery_view",
				dataType : "html",
				data : {
				}
			}).done(function(data) {
				$("#modalPop3").html("");
				$("#modalPop3").html(data);
				$('#modalPop3').modal('show');
				//	$('span.number').number( true, 0 );
			});
		}
		
		
	function fnNDeliverySet(){
			
			
			
			var qty = new Array();//수량
			var custname = new Array();//거래처명
			var itemcode1 = new Array();//품번
			var itemname  = new Array();//품명
			var custcode = new Array();//납품처코드
			var i_qty = new Array(); //입력한 수량
			var lotno = new Array(); //입력한 lotno
			var indate="";
			var dstate ="배송준비중";
			var delivery_date = "";
			var delivery_hour = $("#p_delivery_hour").val();
			var delivery_min = "";
			
			var du_hour = "";
			var du_min = "";
			
			
			
			
			
			
			var j = 0;

			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
					
				if (chk == true) {
					
					custcode[j] = $('#tablebody').find('tr').eq(i).find('.custcode').text();
					custname[j] = $('#tablebody').find('tr').eq(i).find('.custname').text();
					itemcode1[j]= $('#tablebody').find('tr').eq(i).find('.itemcode1').text();
					itemname[j] = $('#tablebody').find('tr').eq(i).find('.itemname').text();
					i_qty[j]    = $('#tablebody').find('tr').eq(i).find('.'+check_day).val();
					lotno[j]    = $('#tablebody').find('tr').eq(i).find('.' +check_day+'_lot').val();
					
					j++;

				}
			}
			indate = check_date;
			$.ajax({
				type : "POST",
				url : "mng_delivery_i",
				dataType : "html",
				data : "custcode=" + custcode + "&custname=" + custname+ "&itemname=" + itemname+"&i_qty=" + i_qty	+ "&itemcode1=" + itemcode1+"&indate=" +indate+"&dstate="+dstate +"&delivery_hour="+delivery_hour+"&delivery_min="+delivery_min
				       +"&delivery_date="+delivery_date+"&du_hour="+du_hour+"&du_min="+du_min,
			}).done(function(data) {
				
				fnTranViewSet();
				//	$('span.number').number( true, 0 );
			});
			
		}
		
		
		function fnDeliverySet(){
			
			
			
			var qty = new Array();//수량
			var custname = new Array();//거래처명
			var itemcode1 = new Array();//품번
			var itemname  = new Array();//품명
			var custcode = new Array();//납품처코드
			var i_qty = new Array(); //입력한 수량
			var lotno = new Array(); //입력한 lotno
			var indate="";
			var dstate ="배송중";
			var delivery_date = $("#p_delivery_date").val();
			var delivery_hour = $("#p_delivery_hour").val();
			var delivery_min = $("#p_delivery_min").val();
			
			var du_hour = $("#p_du_hour").val();
			var du_min = $("#p_du_min").val();
			
			
			
			
			
			
			var j = 0;

			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
					
				if (chk == true) {
					
					custcode[j] = $('#tablebody').find('tr').eq(i).find('.custcode').text();
					custname[j] = $('#tablebody').find('tr').eq(i).find('.custname').text();
					itemcode1[j]= $('#tablebody').find('tr').eq(i).find('.itemcode1').text();
					itemname[j] = $('#tablebody').find('tr').eq(i).find('.itemname').text();
					i_qty[j]    = $('#tablebody').find('tr').eq(i).find('.'+check_day).val();
					lotno[j]    = $('#tablebody').find('tr').eq(i).find('.' +check_day+'_lot').val();
					
					j++;

				}
			}
			indate = check_date;
			$.ajax({
				type : "POST",
				url : "mng_delivery_i",
				dataType : "html",
				data : "custcode=" + custcode + "&custname=" + custname+ "&itemname=" + itemname+"&i_qty=" + i_qty	+ "&itemcode1=" + itemcode1+"&indate=" +indate+"&dstate="+dstate +"&delivery_hour="+delivery_hour+"&delivery_min="+delivery_min
				       +"&delivery_date="+delivery_date+"&du_hour="+du_hour+"&du_min="+du_min,
			}).done(function(data) {
				
				alert("배송출발 시간 설정 완료");
				$('#modalPop3').modal('hide');
				//	$('span.number').number( true, 0 );
			});
			
		}
		
		
		
		
		
		function fnclose(){
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop').modal('hide');
		}
		function fnclose2(){
			//fnStartLabel();
		//	alert('a');
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop2').modal('hide');
		}
		
		function fnclose3(){
			$('#modalPop3').modal('hide');
		}
		
		function print(){
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop').modal('hide'); //거래명세서 화면을 가린다.
			$('#modalPop2').modal('hide');
			$("#label_print").printThis();
			//fnNextLabel();
		}
		
		
		//거래명세서 발행
		function fnTransPrint(){
			$('#modalPop2').modal('hide');
			$("#all_trans_print").printThis();
			//fnStartLabel();
			$( '.label' ).hide();
		}
		
		var check_date="";
		var check_day="";
		var check_count =0;
		
		function checkValue(id,box,lot_id,day_id){
		
		
		//alert(check_box);
			
		//alert(id);
		//alert( $("#check_"+box).val());
		
		
		
		if($("input:checkbox[id="+id+"]").is(":checked") == true) { //체크박스 선택시
			
			check_count ++;
		    if(check_count>9){
		    	alert('거래명세서 항목은 10개를 초과하실수 없습니다.');
		    	$("input:checkbox[id="+id+"]").prop("checked", false);
		    	check_count--;
		    	return;
		    }
			if(check_date!=''){
				
				if(check_date != $("#check_"+box).val()){ //같은 날짜만 선택 가능합니다.
					alert("같은 날짜만 선택 가능합니다.");
					$("input:checkbox[id="+id+"]").prop("checked", false);
					return;	
				}
			}else{
				
				check_date =$("#check_"+box).val();
				if(box=="box1"){
					check_day ="day1";	
				}else if(box=="box2"){
					check_day ="day2";	
				}else if(box=="box3"){
					check_day ="day3";	
				}else if(box=="box4"){
					check_day ="day4";	
				}else if(box=="box5"){
					check_day ="day5";	
				}else if(box=="box6"){
					check_day ="day6";	
				}else if(box=="box7"){
					check_day ="day7";	
				}else if(box=="box8"){
					check_day ="day8";	
				}else if(box=="box9"){
					check_day ="day9";	
				}else if(box=="box10"){
					check_day ="day10";	
				}else if(box=="box11"){
					check_day ="day11";	
				}else if(box=="box12"){
					check_day ="day12";	
				}else if(box=="box13"){
					check_day ="day13";	
				}else if(box=="box14"){
					check_day ="day14";	
				}
				//alert(check_day & " / " &  check_date);
			}
			$('#text_'+lot_id).show();
			$('#'+lot_id).show();
			$('#'+day_id).show();
			
		
		}else{//체크 박스 풀 경우
			check_count--;
			check_date ="";
			check_day="";
			 $("input:checkbox[name="+box+"]").each(function() {

			      if(this.checked){//checked 처리된 항목의 값

			    	  check_date = $("#check_"+box).val();
			    	  if(box=="box1"){
							check_day ="day1";	
						}else if(box=="box2"){
							check_day ="day2";	
						}else if(box=="box3"){
							check_day ="day3";	
						}else if(box=="box4"){
							check_day ="day4";	
						}else if(box=="box5"){
							check_day ="day5";	
						}else if(box=="box6"){
							check_day ="day6";	
						}else if(box=="box7"){
							check_day ="day7";	
						}else if(box=="box8"){
							check_day ="day8";	
						}else if(box=="box9"){
						   check_day ="day9";	
						}else if(box=="box10"){
							check_day ="day10";	
						}else if(box=="box11"){
							check_day ="day11";	
						}else if(box=="box12"){
							check_day ="day12";	
						}else if(box=="box13"){
							check_day ="day13";	
						}else if(box=="box14"){
							check_day ="day14";	
						}			
			      }

			 });
			 $('#text_'+lot_id).hide();
			 $('#'+lot_id).hide();
			 $('#'+day_id).hide();
		}
		
		} 
		
		//거래명세서 정보 셋팅
		
		 function fnTranViewSet(){
			if(check_date==''){
				alert("선택된 항목이 없습니다.");
				return;
			}
			
			//와드
			
			var qty = new Array();//수량
			var custname = new Array();//거래처명
			var itemcode1 = new Array();//품번
			var itemname  = new Array();//품명
			var custcode = new Array();//납품처코드
			var car_type = new Array();//차종
			var unit = new Array();//단위
			var i_qty = new Array(); //입력한 수량
			var lotno = new Array(); //입력한 lotno
			var label_idx = new Array(); // 출력할 라벨 인덱스
			
			var j = 0;
			
			//alert("값은 받어왔습니다.1");

			let pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/; 
			//alert("값은 받어왔습니다.2");
			var indate = check_date;
			var check_find=0;
			//alert("값은 받어왔습니다.3");
			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {
				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				//alert($('#tablebody').find('tr').size());
				if(check_day=="day1"){
					check_find =0;
				}else if(check_day=="day2"){
					check_find =1;
				}else if(check_day=="day3"){
					check_find =2;	
				}else if(check_day=="day4"){
					check_find =3;	
				}else if(check_day=="day5"){
					check_find =4;
				}else if(check_day=="day6"){
					check_find =5;
				}else if(check_day=="day7"){
					check_find =6;
				}else if(check_day=="day8"){
					check_find =7;
				}else if(check_day=="day9"){
					check_find =8;
				}else if(check_day=="day10"){
					check_find =9;
				}else if(check_day=="day11"){
					check_find =10;
				}else if(check_day=="day12"){
					check_find =11;
				}else if(check_day=="day13"){
					check_find =12;
				}else if(check_day=="day14"){
					check_find =13;
				}
				//var chk = $('#tablebody').find('tr').eq(i).children().find('table').children().find('tr').eq(0).find('input[type="checkbox"]').is(':checked');
				var chk = $('#tablebody').find('tr').eq(i).children().find('table').children().find('.tr').eq(check_find).find('input[type="checkbox"]').is(':checked');
				var tqty = $('#tablebody').find('tr').eq(i).find('.'+check_day).val();
				//alert("값은 받어왔습니다.7  i=" + i  +"/chk=" + chk + " /tqy=" +tqty);
				console.log(chk);
				if (chk == true && tqty>0) { //chk == true
					custcode[j] = $('#tablebody').find('tr').eq(i).find('.custcode').text();
					custname[j] = $('#tablebody').find('tr').eq(i).find('.custname').text();
					itemcode1[j]= $('#tablebody').find('tr').eq(i).find('.itemcode1').text();
					itemname[j] = $('#tablebody').find('tr').eq(i).find('.itemname').text().replace(/,/gi, "|");
					car_type[j] = $('#tablebody').find('tr').eq(i).find('.car_type').text();
					unit[j] = $('#tablebody').find('tr').eq(i).find('.unit').text();
					i_qty[j]    = $('#tablebody').find('tr').eq(i).find('.'+check_day).val();
					lotno[j]    = $('#tablebody').find('tr').eq(i).find('.' +check_day+'_lot').val();
					label_idx[j]= i;
					//alert(unit[j]);
					//alert(i_qty[j]);
					//alert("값은 받어왔습니다.8");
					//if(!pattern.test(lotno[j])){
						//alert("생산일자 날짜 형식을 지켜주세요");
						//return;
					//}
					
					if(check_date<lotno[j]){
						var cf = confirm("생산일자가 입고예정일보다 미래에 있습니다. 계속 진행하시려면 확인을 눌러주세요.")
						if(!cf){
							return;
						}
					}	
					
					if(lotno[j]===''){
						alert("생산일자를 선택하세요.");
						return;
					}
					
					j++;

				}
				
			}
			
			prdate   = $("#outdate").val();
			
			
			$.ajax({
				type : "POST",
				url : "mng_trns_data",
				dataType : "html",
				data : "custcode=" + custcode + "&custname=" + custname+ "&itemname=" + itemname+"&car_type=" + car_type+"&i_qty=" + i_qty +"&lotno=" + lotno
						+ "&itemcode1=" + itemcode1+ "&label_idx=" + label_idx+ "&check_date=" + check_date+"&unit=" + unit+"&indate=" + indate +"&prdate="+prdate,
			}).done(function(data) {
				$("#modalPop3").html("");
				$("#modalPop3").html(data);
				$('#modalPop3').modal('show');
				//	$('span.number').number( true, 0 );
			});
			
		
			
		}
		
		var check_ct=0;
		var checkArray = new Array();
		var checkArrayidx =0;
		var start_index =0;
		function fnSetCheckBoxCount(){
			check_ct =0;
			start_index=0;
			checkArray = new Array();
			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {
				
				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
				
				
				if (chk == true) {
					check_ct = check_ct +1;
					checkArray[checkArrayidx] = i;
					checkArrayidx++;
				}	
				
			}
			
			for(var ix=0; ix<checkArray.length; ix++){
				console.log(checkArray[ix]);
			}
		}
		
		
		function fnStartLabel(){
			
			
			fnSetCheckBoxCount() ; //체크박스 체크 카운트
			if(check_ct<=0){
				alert("발행할 항목을 체크해주세요");
				return;
			}
			
			fnLabelViewSet(checkArray[start_index]); //제일 첫번째 바코드 값으로 발행
			
			
		}
		
		function fnNextLabel(){
			start_index ++;
			//alert("start_index:" + start_index + " checkArrayidx[" + checkArrayidx);
			if(start_index>=checkArrayidx){ //더이상 발행할 바코드가 없는 경우
				alert("발행 완료"); //거래명세서 발행
			}else{
				fnLabelViewSet(checkArray[start_index]); //
			}
			
			
		}
		var label_idx ="";
		//라벨 정보 셋팅
		function fnLabelViewSet(idx) {
			$('#modalPop3').modal('hide'); //거래명세서 화면을 가린다.
			var qty ="";//수량
			var custname ="";//거래처명
			var itemcode1 ="";//품번
			var itemname  ="";//품명
			var custcode ="" ;//납품처코드
			var car_type ="" ;//차종
			var i_qty ="";//입력수량
			var check_ct =0;
			var lot_no ="";
			var j = 0;
			var indate="";
			var prdate="";
				
			custcode = $('#tablebody').find('tr').eq(idx).find('.custcode').text();
			custname = $('#tablebody').find('tr').eq(idx).find('.custname').text();
			itemcode1 = $('#tablebody').find('tr').eq(idx).find('.itemcode1').text();
			itemname = $('#tablebody').find('tr').eq(idx).find('.itemname').text();
			car_type = $('#tablebody').find('tr').eq(idx).find('.car_type').text();
			i_qty    = $('#tablebody').find('tr').eq(idx).find('.'+check_day).val();
			lotno    = $('#tablebody').find('tr').eq(idx).find('.' +check_day+'_lot').val();
			prdate   = $("#outdate").val();
			indate = check_date;
			
			if(prdate==''){
				alert("작성일자를 확인하세요!!!");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "mng_label_add",
				dataType : "html",
				data : {
					custname:custname,
					itemcode1:itemcode1,
					itemname:itemname,
					indate:indate,
					custcode:custcode,
					qty:qty,
					i_qty:i_qty,
					car_type:car_type,
					lotno:lotno,
					prdate:prdate
				}
			}).done(function(data) {
				$("#modalPop").html("");
				$("#modalPop").html(data);
				$('#modalPop').modal('show');
				//	$('span.number').number( true, 0 );
			});
			
			label_idx =idx; //라벨 인덱스 저장
		}
		
		function errorFunction(){
			alert('에러');
			return false;
		}
		
		function promise_function(){
			return new Promise(function(resolve,reject){
				//alert('1st');
				$.ajax({
					type : "post",
					url : "mng_manger_view",
					dataType : "html",
					data : {
					}
				}).done(function(data) {
					$("#modalPop4").html("");
					$("#modalPop4").html(data);
					$('#modalPop4').modal('show');		
					//$('#modalPop').modal('show');
					//	$('span.number').number( true, 0 );
				});
			});
		} 
		
		 function firstAjax(){
			return new Promise(function(resolve,reject){
				alert('2nd');
				$.ajax({
					type : "post",
					url : "mng_label_add",
					dataType : "html",
					data : {
						custname:custname,
						itemcode1:itemcode1,
						itemname:itemname,
						indate:indate,
						custcode:custcode,
						qty:qty,
						i_qty:i_qty,
						car_type:car_type,
					}
				}).done(function(data) {
					$("#modalPop").html("");
					$("#modalPop").html(data);
					$('#modalPop').modal('show');
					//	$('span.number').number( true, 0 );
				});
			});
		}  //라벨 출력
		function fnLabelPrint() {
			$('#label_text'+label_idx).text("발행완료");
			//$('#label_2text'+label_idx).text("발행완료");
			var itemname = $("#p_itemname").val();
			var itemcode1 = $("#p_itemcode1").val();
			var custname = $("#p_custname").val();
			var custcode = $("#p_custcode").val();
			var qty = $("#p_qty").val();
			var car_type = $("#p_car_type").val();
			var box_qty = $("#p_box_qty").val();
			var lotno = '';
			var indate = $("#p_indate").val();
			var madate = $("#p_madate").val();
			var tradebarcode = $("#p_barcode").val();
			var memo =$("#s_memo").val();
			//alert ("메모내용=>"+memo);
			if(box_qty==''){
				alert("박스 수량을 입력해주세요");
				return;
			}
			
			if(custname==''){
				alert("업체 명을 입력해주세요");
				
				//promise_function().then(firstAjax).catch(errorFunction);
				promise_function().catch(errorFunction);
				document.getElementById('cnl').click();
				//firstAjax()
				
				return;
			}
			
			if(madate==''){
				alert("생산일자를 입력해주세요");
				return;
			}
			
			$.ajax({
				type : "post",
				url : "mng_label_print",
				dataType : "html",
				data : {
					itemname:itemname,
					itemcode1:itemcode1,
					custname:custname,
					custcode:custcode,
					qty:qty,
					car_type:car_type,
					box_qty:box_qty,
					lotno:lotno,
					indate:indate,
					madate:madate,
					tradebarcode:tradebarcode,
					memo:memo,
				}
			}).done(function(data) {
				$("#modalPop").html("");
				$("#modalPop").modal('hide');
				$("#modalPop2").html("");
				$("#modalPop2").html(data);
				$('#modalPop2').modal('show');
				//	$('span.number').number( true, 0 );
			});

		}	
		
		
		
		
		//라벨 화면
		function fnSetLabel_back() {
			
			var obj =  fnLabelViewSet();
			var custname = obj.custname
			var itemcode1 = obj.itemcode1;
			var itemname = obj.itemname;
			var indate = obj.indate;
			var qty = obj.qty;
			var custcode = obj.custcode;
			var car_type = obj.car_type;
			var i_qty = obj.i_qty;
			
			if(custname==''){
				alert("발행할 라벨을 선택해주세요!");
				return;
			}
			
			
			$.ajax({
				type : "post",
				url : "mng_label_add",
				dataType : "html",
				data : {
					custname:custname,
					itemcode1:itemcode1,
					itemname:itemname,
					indate:indate,
					custcode:custcode,
					qty:qty,
					i_qty:i_qty,
					car_type:car_type,
				}
			}).done(function(data) {
				$("#modalPop").html("");
				$("#modalPop").html(data);
				$('#modalPop').modal('show');
				//	$('span.number').number( true, 0 );
			});

		}
		
		function showExcel(){
			var startdate = $('#startdate').val();
			window.open("mng_buy_plan_excel?startdate="+startdate,"Buy Plan Excel",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		}
		
		//라벨 정보 셋팅
		function fnLabelViewSet_back() {
			var qty ="";//수량
			var custname ="";//거래처명
			var itemcode1 ="";//품번
			var itemname  ="";//품명
			var custcode ="" ;//납품처코드
			var car_type ="" ;//차종
			var unit ="" ;//단위
			var i_qty ="";//입력수량
			var check_ct =0;
			var j = 0;
			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {
				
				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody').find('tr').eq(i).children().find('input[type="checkbox"]').is(':checked');
				
				
				if (chk == true) {
					check_ct = check_ct +1;
					
					//alert($("input:checkbox[name='box2']").is(":checked").val());
						$('input:checkbox[type=checkbox]:checked').each(function () {
				   			qty = $(this).val();
				   			
				   			check_ct = check_ct +1;
							
						});
					if(check_ct>2){
						alert("라벨 발행시 하나만 선택가능합니다.");
						return;
					}
			   				
					//qty = $('#tablebody').find('tr').eq(i).find('input[type="checkbox"]').val();
					//$("input:checkbox[name='aaa']").val()
					custcode = $('#tablebody').find('tr').eq(i).find('.custcode').text();
					custname = $('#tablebody').find('tr').eq(i).find('.custname').text();
					itemcode1 = $('#tablebody').find('tr').eq(i).find('.itemcode1').text();
					itemname = $('#tablebody').find('tr').eq(i).find('.itemname').text();
					car_type = $('#tablebody').find('tr').eq(i).find('.car_type').text();
					unit = $('#tablebody').find('tr').eq(i).find('.unit').text();
					i_qty    = $('#tablebody').find('tr').eq(i).find('.'+check_day).val();
					
					}
				}
				
				var obj=new Object();
				obj.custname =custname;
				obj.itemcode1 =itemcode1;
				obj.itemname=itemname;
				obj.indate=check_date; // 입고일자
				obj.custcode=custcode;
				obj.qty=qty;
				obj.i_qty=i_qty;
				obj.car_type=car_type;
				obj.unit=unit;
				
			return obj;
		} 
			$.ajax({
				type : "POST",
				url : "mng_mng_i.do",
				dataType : "html",
				data : "uids=" + uids + "&admin_id= " + admin_id
						+ "&admin_name=" + admin_name,
				success : function(msg) {
					if (msg == 1) {
						alert('수정되었습니다.')
						document.location.reload();
					} else {
						alert('수정실패/시스템 관리자에게 확인하세요!');
					}

				}
			});
		
		function fnLabelViewSet() {
			var uids = new Array();
			var admin_id = new Array();
			var admin_name = new Array();
			var j = 0;

			for (var i = 1; i < $('#tablebody1').find('tr').size(); i++) {

				// table 중 tr이 i번째 있는 자식중에 체크박스가 체크중이면

				var chk = $('#tablebody1').find('tr').eq(i).children().find(
						'input[type="checkbox"]').is(':checked');
					
				if (chk == true) {
					var fabric_seq = $('#tablebody1').find('tr').eq(i).find(
							'input[type="checkbox"]').val();
					var fabric_seq2 = $('#tablebody1').find('tr').eq(i).find(
							'.userid').text();
					var fabric_seq3 = $('#tablebody1').find('tr').eq(i).find(
							'.name').text();
					//alert(fabric_seq3);
					uids[j] = fabric_seq;
					admin_id[j] = fabric_seq2;
					admin_name[j] = fabric_seq3;
					j++;

				}
			}
			
			

			$.ajax({
				type : "POST",
				url : "mng_mng_i.do",
				dataType : "html",
				data : "uids=" + uids + "&admin_id= " + admin_id
						+ "&admin_name=" + admin_name,
				success : function(msg) {
					if (msg == 1) {
						alert('수정되었습니다.')
						document.location.reload();
					} else {
						alert('수정실패/시스템 관리자에게 확인하세요!');
					}

				}
			});
		
		}
		
		
		//거래명세서
		function fnTrnsDt(u_id) {

			$.ajax({
				type : "post",
				url : "mng_trns_dt",
				dataType : "html",
				data : {
					u_id : u_id
				}
			}).done(function(data) {
				$("#modalPop").html("");
				$("#modalPop").html(data);
				$('#modalPop').modal('show');
				//	$('span.number').number( true, 0 );
			});

		}	
		
		//엑셀 출력 예전 꺼 -> 안씀
		function exportToExcel() {

			var form = document.formdata2;
			var startdate = $('#startdate').val();
			//var enddate = $('#enddate').val();
			//var gubun = $('#gubun').val();
			//var com_text = $('#com_text').val();
			form.startdate.value = startdate;
			//form.enddate.value = enddate;
			//form.gubun.value = gubun;
			//form.com_text.value = com_text;
			form.pageView.value = "mng_member_excel";
			form.action = "mng_member";
			form.submit();
		} 
		//★★★★★삭제예정220721★★★★★ 끝
		/**
		 * checkbox에서 선택된 항목들의 값을 배열로 리턴한다.
		 * @param checkbox
		 * @returns {Array}
		 */
		//★★★★★삭제예정220721★★★★★ 시작
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
		//★★★★★삭제예정220721★★★★★ 끝

		function getUserList(page, keyword) {
			check_count=0;
			check_date='';
			var form = document.formdata;

			var startdate = $('#startdate').val();
			//var enddate = $('#enddate').val();
			////var gubun = $('#gubun').val();
			//var com_text = $('#com_text').val();

			var pageView = "mng_buy_plan_excel_table";

			var cno =  $('#p_cno').val();
			var custname =  $('#p_cu_sangho').val();
			var branch =  $('#branch').val();
			
			/* if(branch==null){
				  alert("공장을 선택하세요");
				  return;
			  } */
			
			var carname=$('#p_carname').val();//차종 
			var itemname=$('#p_itemname').val();
			var itemcode=$('#p_itemcode').val();
			
			// var custcode =  $('#s_custcode').val();
			var itemCountPerPage =  $('#itemCountPerPage').val();
			
			var result = $('#alldtate').val();
			var align = $('#aligndata').val();
			
			$.ajax({
				type : "post",
				url : "mng_buy_plan_excel",
				dataType : "html",
				data : {
					startdate : startdate,
					page : page,
					cno : cno,
					custname : custname,
					carname : carname,
					itemname : itemname,
					itemcode : itemcode,
					pageView : pageView,
					itemCountPerPage : itemCountPerPage,
					result:result,
					branch:branch,
					align : align
					
				}
			}).done(function(data) {
				$("#tabledata").html("");
				$("#tabledata").html(data);
				$('td.number').number(true, 0);
				$('span.number').number(true, 0);
				//alert("end");
				//	$('span.number').number( true, 0 );
			});

		}
		//★★★★★삭제예정220721★★★★★ 시작
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
		//211102 배송준비중 전송
		function fnDelivertView(deliveryno,dstate){
			
			$.ajax({
				type : "post",
				url : "mng_delivery_view",
				dataType : "html",
				data : {
					dstate : dstate,
					deliveryno : deliveryno
				}
			}).done(function(data) {
				$('#modalPop3').modal('hide');
				$("#modalPop").html("");
				$("#modalPop").html(data);
				$('#modalPop').modal('show');
				//	$('span.number').number( true, 0 );
			});
		}

		//211102 배송준비중 전송
		function fndelivery_u2(deliveryno, dstate){
			
			if(!confirm("["+dstate +"]상태로 변경하시겠습니까?")){
				
				return;
			}
			
			
			
			$.ajax({
				type : "post",
				url : "mng_delivery_state_u2",
				dataType : "html",
				data : {
					deliveryno:deliveryno,
					dstate:dstate,
					
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
			
		} $("#xls").click(function (){
	  		$("#tablebody").table2excel({
	  			  name: "Excel table",
	  	          filename: "excel table"+'.xls',
	  	          fileext: ".xls",
	  		});
	  	}); 
		
		//211102 배송준비중 전송
		 function fndelivery_u(deliveryno, dstate){
			
			if(!confirm("["+dstate +"]상태로 변경하시겠습니까?")){
				
				return;
			}
			
			var delivery_date = $("#p_delivery_date").val();
			var delivery_hour = $("#p_delivery_hour").val();
			var delivery_min = $("#p_delivery_min").val();
			
			var du_hour = $("#p_du_hour").val();
			var du_min = $("#p_du_min").val();
			
			
			$.ajax({
				type : "post",
				url : "mng_delivery_state_u",
				dataType : "html",
				data : {
					deliveryno:deliveryno,
					dstate:dstate,
					delivery_date:delivery_date,
					delivery_hour:delivery_hour,
					delivery_min:delivery_min,
					du_hour:du_hour,
					du_min:du_min
					
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
		//★★★★★삭제예정220721★★★★★ 끝
	</script>

	<script>
		$(function() {
			$('span.number').number(true, 0);
			
			$('#startdate').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('#ma_date').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day1_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day2_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day3_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day4_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day5_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day6_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day7_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day8_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day9_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day10_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day11_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day12_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day13_lot"]').datepicker({
				format : 'yyyy-mm-dd'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day14_lot"]').datepicker({
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
  	          filename: "WooboTech_BuyPlan",
  	          fileext: ".xls",
  		});
  	});
	</script>
</body>
</html>
