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
<link rel="stylesheet" href="resources/css/print-preview.css">

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
body{
	padding-right: 0 !important;
}
table {
	width: 100%;
	border: 1px solid #bbc6d3;
	border-collapse: collapse; 
	border-spacing: 0px;
}
th, td {
	border: 1px solid #bbc6d3;
	padding: 10px;
}
.buyPlan {
	border: 2px solid #bbc6d3;
	padding: 10px;
}
.top{
vertical-align:top; !important
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

/* 로딩바 화면 가운데 2022-04-22 정인우 */
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

/* 모달뜨면 옆에 공백 생기는 거 방지 2022-04-22 정인우 */
.modal-open{
	padding-right: 0px !important;
}

/* ################################# 틀 ######################################## */
/* 테이블 데이터 고정용 틀 2022-04-22 정인우 */
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
/* ################################# 틀 ######################################## */

/* header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 999;
} */

/* #tabledata{
	scrollY:'400';
	scroller:true;
	responsive:true;
} */

</style>

<!-- 커스텀 CSS -->

<body class="hold-transition skin-blue layout-top-nav">

	<!-- <div id="mask" class="black_background"></div>
	
	<div id="light" class="white_content">
		<img src="resources/img/loadingbar1.gif"/>	
	</div> -->
	<div class="wrapper" id="wrap">
		<!-- <header class="main-header"> -->
		<header>
			<div class="main-header">
			<nav class="navbar navbar-static-top">
				<jsp:include page="../common/mng_top_menu.jsp"></jsp:include>
				<!-- /.container-fluid -->
			</nav>
			</div>
		</header>	
		<!-- </header> -->
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
				<span style="float:left; font-size: 30px;">Purchase Plan</span>
				
				<span id="set_timer"
							class="pull-right" style="margin-right: 20px; font-size: 30px; float:right;"></span>
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


						<span>standard date : </span> &nbsp;
						<%-- <input type="text" id="startdate"
							name="startdate" style="margin-right: 10px; width: 100px"
							autocomplete="off" value="${startdate}" /> --%>
						<input type="text" id="startdate" name="startdate" value="${startdate }" style="width:125px; margin-right: 10px;" onchange="dateset(this)" readonly='true'/>	
						<%
						if ("master".equals(admin)) {
						%>
						<input type="hidden" name="p_cno" id="p_cno" placeholder="partner number"
							value="" readonly="readonly"> &nbsp;&nbsp;&nbsp; 
						<span>partner : </span> &nbsp;
						<!-- <input type="text" class="" name="p_cu_sangho"
							id="p_cu_sangho" placeholder="" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}"> -->
						<input type="text" list="sangholist" id="p_cu_sangho" onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />	
							
						<%-- <datalist id="sangholist">
							<option value="" selected>전체</option>
							
							<c:choose>
								<c:when test="${colist.size() >= 1 }">
									<c:forEach var="co" items="${colist }">
										<option value="${co.cu_sangho }">${co.cu_sangho }</option>
									</c:forEach>
								</c:when>
								<c:otherwise>
									협력사 없음
								</c:otherwise>
							</c:choose>
							 
						</datalist> --%>	
						&nbsp;&nbsp;&nbsp;
						<!--  <span> 차종 : </span> &nbsp;<input type="text" id="p_carname"	 autocomplete="off"	name="p_carname" style="margin-right:15px; width: 100px"	value="" onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />	&nbsp; -->
						<!-- img alt="검색" src="resources/img/icon_search.png" style="width: auto; height: 26px;" onclick="fnSearch()"-->
						<%
						}
						%>
						<span>Car : </span> &nbsp;<input type="text" id="p_carname"
							autocomplete="off" name="p_carname"
							style="margin-right: 15px; width: 100px" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />
							
						&nbsp;<span> item name : </span> &nbsp;<input type="text"
							id="p_itemname" autocomplete="off" name="p_itemname"
							style="margin-right: 15px; width: 100px" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />	
							
						&nbsp;<span> item code : </span> &nbsp;<input type="text"
							id="p_itemcode" autocomplete="off" name="p_itemcode"
							style="margin-right: 15px; width: 100px" value=""
							onKeypress="javascript:if(event.keyCode==13) {getUserList('1')}" />
								
						 <%-- &nbsp;<span>company : </span> &nbsp;<select id="branch" name="branch" style="height:27px;">
							<option value="000" ${branch =='000' ? 'selected' :'' }>POLAND</option>
							<option value="001" ${branch =='001' ? 'selected' :'' }>울산</option>
						</select> --%>
						 &nbsp;&nbsp;&nbsp; <span>reserch  : </span> &nbsp;<select
							id="alldtate" name="alldtate" style="height:27px;">
							<option value="0" ${alldtate =='0' ? 'selected' :'' }>Plan Item</option>
							<option value="1" ${alldtate =='1' ? 'selected' :'' }>Total item</option>
						</select>
						
						<input type="hidden" value="000" name = "branch" id = "branch">
						
						 <!-- 220614 -->
						<%-- &nbsp;&nbsp;&nbsp; <span>생산구분 : </span> &nbsp;<select
							id="p_item" name="p_item" style="height:27px;">
							<option value="0" ${p_item =='0' ? 'selected' :'' }>선택안함</option>
							<c:forEach var = "pItem" items="${item}" varStatus="status">
								<option value="${pItem}" ${p_item =='${pItem}' ? 'selected' :'' }>${pItem}</option>
							</c:forEach>
							
						</select> --%>
						
						&nbsp;&nbsp;&nbsp; <span>unpublished : </span> &nbsp;<select
							id="income" name="income" style="height:27px;">
							<option value="0" ${income =='0' ? 'selected' :'' }>Total</option>
							<option value="1" ${income =='1' ? 'selected' :'' }>unpublished</option>
						</select>
						&nbsp;&nbsp;&nbsp;<span>Sort by(item name) : </span> &nbsp;<select
							id="aligndata" name="aligndata" style="height:27px;">
							<option value="0" ${aligndata =='0' ? 'selected' :'' }>unchecked</option>
							<option value="1" ${aligndata =='1' ? 'selected' :'' }>Ascending</option>
							<option value="2" ${aligndata =='2' ? 'selected' :'' }>Descending</option>
						</select>
						 
						&nbsp;<input type="button" class="btn btn-warning" id="search" 
							onclick="getUserList('1')" value="Refresh"
							style="margin-right: 25px; margin-left: 25px;" />
							
						
						<!-- input type="button"	class="btn btn-info" onclick="fnNDeliverySet()" value="거래명세서발행하기"   /-->
						<!-- input type="button"	class="btn btn-success" onclick="fnSetLabel()" value="라벨발행하기" style="margin-left: 10x" /-->
						<!-- input type="button"	class="btn bg-maroon" onclick="fnDelivertView()" value="배송출발하기" style="margin-left: 10x" /-->
						<!-- input type="button"	class="btn bg-maroon" onclick="fnTrnsMove()" value="거래명세서 재발행" style="margin-left: 10x" /-->
						<br>
						<!-- <br><br> -->
						<span>Production date : </span> &nbsp;
						<!-- <input type="text" id="ma_date"
							autocomplete="off" name="ma_date" style="width: 100px" value="" /> -->
						<input type="text" id="ma_date" name="ma_date" style="width:125px;" readonly='true'/>
	
						&nbsp;&nbsp;&nbsp; <input type="button" class="btn btn-success"
							onclick="fnMaDateSet()" value="Production date"
							style="margin-left: 10x;" />
						<input type="button"
							class="btn btn-info" onclick="fnTranViewSet()" value="Issuance of transaction statement"
							style="margin-right: 10px; margin-left: 10px;" />
							<input type="button" class="btn btn-success" value="save excel" onclick="showExcel();"/>
						<!--  <input type="button" class="btn btn-info"	onclick="exportToExcel()" value="엑셀변화"	 style="float: right; margin-right: 10px;" /> -->
						
						<!-- <input type="button" class="btn btn-success" value="엑셀 저장" onclick="showExcel();"/> -->
						
						<!-- <input type="button" style="margin-left: 10px;" class="btn btn-warning" value="엑셀 저장2" id="xls" onclick="export()"/> -->
						
						
					<div id="page" style="float:right; margin-top:5px;">
					&nbsp;&nbsp;&nbsp; 
						&nbsp;&nbsp;&nbsp;<span>Per page</span>
							<select id="itemCountPerPage" class="selectpicker"
								style="width: 60px; height: 27px" onchange="getUserList('1')">
								<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
								<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
								<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
							</select>
						<span>Display</span>	
					</div>
					<!-- </header> -->
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
												<th style="text-align: center; width: 3%;">Overall order</th>
												<th style="text-align: center; width: 7%;">Partner<br>(Partner Code)</th>
												<th style="text-align: center; width: 25%;">Item Code<br>(Item Name)</th>
												<th style="text-align: center; width: 5%;">Car</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box1"
													onclick="checkAll(this, 'box1');" value="${str_day1}" />${str_day1}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box2"
													onclick="checkAll(this, 'box2');" value="${str_day2}" />${str_day2}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box3"
													onclick="checkAll(this, 'box3');" value="${str_day3}" />${str_day3}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box4"
													onclick="checkAll(this, 'box4');" value="${str_day4}" />${str_day4}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box5"
													onclick="checkAll(this, 'box5');" value="${str_day5}" />${str_day5}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box6"
													onclick="checkAll(this, 'box6');" value="${str_day6}" />${str_day6}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box7"
													onclick="checkAll(this, 'box7');" value="${str_day7}" />${str_day7}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box8"
													onclick="checkAll(this, 'box8');" value="${str_day8}" />${str_day8}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box9"
													onclick="checkAll(this, 'box9');" value="${str_day9}" />${str_day9}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box10"
													onclick="checkAll(this, 'box10');" value="${str_day10}" />${str_day10}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box11"
													onclick="checkAll(this, 'box11');" value="${str_day11}" />${str_day11}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box12"
													onclick="checkAll(this, 'box12');" value="${str_day12}" />${str_day12}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box13"
													onclick="checkAll(this, 'box13');" value="${str_day13}" />${str_day13}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck cell" name="boxAll" id="check_box14"
													onclick="checkAll(this, 'box14');" value="${str_day14}" />${str_day14}</th>
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
															<td><span class="custname"><a href ="javascript:mailSend(${vo.custcode});">${vo.custname}</a></span><br>(<span
																class="custcode">${vo.custcode}</span>)</td>
															<td><span class="itemcode1">${vo.itemcode1}</span><br>
																<span class="itemname">${vo.itemname}</span></td>
															<td><span class="car_type">${vo.car_type}</span> <span
																class="unit" style="display: none;">${vo.unit}</span></td>
															<td style="padding:0 0 0 0; ">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<!--class="tr" -->
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt;">
																			<input type="checkbox" name="box1"
																			id="box1${status.count}" value="${vo.day1}"
																			onclick="checkValue(this.id,'box1','lot1_${status.count}','day1_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day1}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day1"
																			id="day1_${status.count}" value="${vo.day1}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot1_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<%-- <input type="text" class="day1_lot"
																			id="lot1_${status.count}" autocomplete="off"
																			name="day1_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;"> --%>
																			
																			<input type="text" class="day1_lot" id="lot1_${status.count}" name="day1_lot"
																				value="" size="10" style="width:120px; display:none;"/>	


																		</td>
																	</tr>
																</table>
															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box2"
																			id="box2${status.count}" value="${vo.day2}"
																			onclick="checkValue(this.id,'box2','lot2_${status.count}','day2_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day2}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day2"
																			id="day2_${status.count}" value="${vo.day2}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot2_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day2_lot"
																			id="lot2_${status.count}" autocomplete="off"
																			name="day2_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>


															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box3"
																			id="box3${status.count}" value="${vo.day3}"
																			onclick="checkValue(this.id,'box3','lot3_${status.count}','day3_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day3}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day3"
																			id="day3_${status.count}" value="${vo.day3}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot3_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day3_lot"
																			id="lot3_${status.count}" autocomplete="off"
																			name="day3_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>


															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box4"
																			id="box4${status.count}" value="${vo.day4}"
																			onclick="checkValue(this.id,'box4','lot4_${status.count}','day4_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day4}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day4"
																			id="day4_${status.count}" value="${vo.day4}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot4_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day4_lot"
																			id="lot4_${status.count}" autocomplete="off"
																			name="day4_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>

															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box5"
																			id="box5${status.count}" value="${vo.day5}"
																			onclick="checkValue(this.id,'box5','lot5_${status.count}','day5_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day5}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day5"
																			id="day5_${status.count}" value="${vo.day5}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot5_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day5_lot"
																			id="lot5_${status.count}" autocomplete="off"
																			name="day5_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding: 0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box6"
																			id="box6${status.count}" value="${vo.day6}"
																			onclick="checkValue(this.id,'box6','lot6_${status.count}','day6_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day6}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day6"
																			id="day6_${status.count}" value="${vo.day6}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot6_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day6_lot"
																			id="lot6_${status.count}" autocomplete="off"
																			name="day6_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box7"
																			id="box7${status.count}" value="${vo.day7}"
																			onclick="checkValue(this.id,'box7','lot7_${status.count}','day7_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day7}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day7"
																			id="day7_${status.count}" value="${vo.day7}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot7_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day7_lot"
																			id="lot7_${status.count}" autocomplete="off"
																			name="day7_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box8"
																			id="box8${status.count}" value="${vo.day8}"
																			onclick="checkValue(this.id,'box8','lot8_${status.count}','day8_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day8}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day8"
																			id="day8_${status.count}" value="${vo.day8}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot8_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day8_lot"
																			id="lot8_${status.count}" autocomplete="off"
																			name="day8_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box9"
																			id="box9${status.count}" value="${vo.day9}"
																			onclick="checkValue(this.id,'box9','lot9_${status.count}','day9_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day9}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day9"
																			id="day9_${status.count}" value="${vo.day9}" size="10"
																			style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot9_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day9_lot"
																			id="lot9_${status.count}" autocomplete="off"
																			name="day9_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box10"
																			id="box10${status.count}" value="${vo.day10}"
																			onclick="checkValue(this.id,'box10','lot10_${status.count}','day10_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day10}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day5"
																			id="day10_${status.count}" value="${vo.day10}"
																			size="10" style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot10_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day10_lot"
																			id="lot10_${status.count}" autocomplete="off"
																			name="day10_lot" value="" size="10"
																			placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box11"
																			id="box11${status.count}" value="${vo.day11}"
																			onclick="checkValue(this.id,'box11','lot11_${status.count}','day11_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day11}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day11"
																			id="day11_${status.count}" value="${vo.day11}"
																			size="10" style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot11_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day11_lot"
																			id="lot11_${status.count}" value="" size="10"
																			name="day11_lot" placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box12"
																			id="box12${status.count}" value="${vo.day12}"
																			onclick="checkValue(this.id,'box12','lot12_${status.count}','day12_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day12}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day12"
																			id="day12_${status.count}" value="${vo.day12}"
																			size="10" style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot12_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day12_lot"
																			id="lot12_${status.count}" value="" size="10"
																			name="day12_lot" placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box13"
																			id="box13${status.count}" value="${vo.day13}"
																			onclick="checkValue(this.id,'box13','lot13_${status.count}','day13_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day13}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day13"
																			id="day13_${status.count}" value="${vo.day13}"
																			size="10" style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot13_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day13_lot"
																			id="lot13_${status.count}" value="" size="10"
																			name="day13_lot" placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>

															</td>
															<td style="padding:0 0 0 0;">

																<table style="margin:0px; border: 0px;">
																	<tr style="height: 15px;" class="tr">
																		<td width="40%"
																			style="border: hidden; padding: 2px; font-size: 15pt">
																			<input type="checkbox" name="box14"
																			id="box14${status.count}" value="${vo.day14}"
																			onclick="checkValue(this.id,'box14','lot14_${status.count}','day14_${status.count}')">&nbsp;<span
																			class="number tqty">${vo.day14}</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day14"
																			id="day14_${status.count}" value="${vo.day14}"
																			size="10" style="display: none; width: 85px; text-align:right;">
																		</td>
																	</tr>

																	<tr style="height: 15px;">
																		<td width="40%" style="border: hidden; padding: 2px;">
																			<span style="display: none;"
																			id="text_lot14_${status.count}">생산일자&nbsp; :</span>
																		</td>
																		<td width="60%" style="border: hidden; padding: 2px;">
																			<input type="text" class="day14_lot"
																			id="lot14_${status.count}" value="" size="10"
																			name="day14_lot" placeholder="dd-mm-yyyy"
																			style="display: none; width: 85px;">
																		</td>
																	</tr>
																</table>
															</td>	
															<td class="number" style="font-size: 15pt;">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14}</td>

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

	<div class="" style="padding-top: 0px; margin-right: 10px; width: 33%; float: left;">
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
	$(function() {
		/* $('#p_delivery_date').datepicker({
			format : 'dd-mm-yyyy'
		}); */
		
		$("#ma_date").datepicker ({ 
			  format: 'dd-mm-yyyy',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
		
		$("#ma_date").datepicker().datepicker("setDate", new Date());
	});
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
			
			//쿠키 생성 함수
			function setCookie(cName, cValue, cDay) {
				var expire = new Date();
				expire.setDate(expire.getDate() + cDay);
				cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
				if (typeof cDay != 'undefined')
					cookies += ';expires=' + expire.toGMTString() + ';';
				document.cookie = cookies;
			}
			
			//쿠키 가져오기 함수
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
						
			var branch = getCookie("branch");
		    $("#branch").val(branch);
		    //alert("!");
		    
		    //화면 들어오면 로딩바 돌게 하기위해 클릭버튼 눌러서 ajax 요청시킴 2022-04-22 정인우
			$('#search').click();
			
			var ment = getCookie("payment");
			var sangho = '<%=(String)session.getAttribute("cu_sangho")%>';
			
			//alert(ment);
			//alert(sangho);
			
			if(!ment){
				setCookie('payment',sangho,365);
			}
			
			setCookie('payment',sangho,365);
			
		}).ajaxStart(function(){
			//$('#Progress_Loading').show();
			//wrapWindowByMask();
			//ajax요청이 들어오면 로딩바 보여줌 2022-04-22 정인우
			FunLoadingBarStart();
		}).ajaxStop(function(){
			//$('#Progress_Loading').hide();
			//ajax요청 끝나면 로딩바 숨김 2022-04-22 정인우
			FunLoadingBarEnd();
		});
		
		function dateset(obj){
			let ma = document.getElementById('ma_date');
			let sangdate = $("#startdate").val();
			
			//alert(sangdate);
			
			ma.value = sangdate;
		}
		
		//######################### 서버 시간 #####################
		//페이지 로딩되면 서버 시간을 불러와서 1초마다 1초씩 더해서 표시
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
		
		//서버 시간 변수로
		const now = currentTime();
		$('#set_timer').text(now.toLocaleString());
		//alert(now);
		
		/* setInterval(function(){
			//console.log("@@@");
			currentTime();
		},1000); */
		
		//1초마다 더하는 부분
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
		//######################### 서버 시간 #####################
		
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
		
		//로딩바 표시 해주는 함수
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
		
		//로딩바 숨기는 함수
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
		
		//메모적용
		function fnMemoSet(barcode){
			var memo = $("#s_memo1").val();
			var len= memo.length;
			if(len>20){
				alert("Please enter no more than 20 characters.")
				return;
			}
			if(memo==null || memo==""){
				alert('There are no values entered for the comments.');
				return false;
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
					alert('Applied to the comment column.');
					
				}else{
					alert('Remark column application failed');
				}
			});
		}
		
		//순번
		function fnMemoSet2(barcode){
			var memo2 = $("#s_memo2").val();
			var len = memo2.length;
			
			if(len>20){
				alert("Please enter no more than 20 characters.");
				return;
			}
			
			if(memo2==null || memo2==""){
				alert('No value entered in order of issue.');
				return false;
			}
			
			$("#p_memo3").text(memo2);
			
			$.ajax({
				type:"post",
				url:"mng_trns_memo2_u",
				dataType:"html",
				data:{
					memo2:memo2,
					barcode:barcode
				}
			}).done(function(data){
				var isOk = data;
				if(isOk==1){
					alert('The order of issue has been applied.');
				}else{
					alert('Failed to apply order of issue');
				}
			});
		}
		
		function fnMemoSet3(barcode){
			var prDate = $('#outdate').val();		//작성일자
			if(prDate==null || prDate==""){
				alert('No value entered for creation date.');
				return false;
			}
			$.ajax({
				type:"post",
				url : "mng_trns_memo3_u",
				dataType :"html",
				data:{
					prDate :prDate,
					barcode: barcode
				}
			}).done(function(data){
				var isOk = data;
				if(isOk==1){
					alert('Created date has been applied.');
				}else{
					alert('Failed to apply creation date');
				}
			});
		}
		
		//거래명세서 인쇄
	//	function fnTrnsPop(barcode,prdate){
		//	var prdate = $("#outdate").val();
		//	var chk_already = $('#label_text'+label_idx).text();
			
		//	if("" == prdate){
		//	  alert("작성일자를 입력하세요");
		//	  return;
		//	}
			 
			/* if(chk_already==='발행완료'){
				window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
			}else{
				alert("라벨을 먼저 발행해주세요.");
				return;
			} */	
			//var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);
			//alert("받아오는 값"+text);
			
			//alert(chk_already);
			
			//<c:forEach items="${board}" var="vo">
			
			//var chk = document.getElementById("label_text${vo.label_idx}").innerText;
			
			//console.log(chk+"chk");
			
			/* if(chk==="발행완료"){
				cnt = cnt+1;
			} */
			
			//</c:forEach>
			
			//alert(cnt);
		//	var all = document.getElementById("all").value;
		//	all = all*1;
			//alert(all);
			
		//	if(cnt==all){
		//		window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		//	}else{
		//		alert("라벨을 먼저 발행해주세요!");
			//}
			//alert(${board});
			//var all = Object.keys(${board}).length;
			//alert(all);
			
			//window.open("mng_print?barcode="+barcode+"&text="+text,  "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
			
	//	}
		
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
				alert("Please select a user.");
				return;
			}else if(j>=2){
				alert("Please select only one user.");
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
				alert("There are no items selected.");
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
		
		//★★★★★삭제예정220726★★★★★시작	
	function fnNDeliverySet(){
			
			var qty = new Array();//수량
			var custname = new Array();//거래처명
			var itemcode1 = new Array();//품번
			var itemname  = new Array();//품명
			var custcode = new Array();//납품처코드
			var i_qty = new Array(); //입력한 수량
			var lotno = new Array(); //입력한 lotno
			var indate="";
			var dstate ="Preparing for shipment";
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
				
				alert("Delivery departure time set complete");
				$('#modalPop3').modal('hide');
				//	$('span.number').number( true, 0 );
			});
			
		}
		//★★★★★삭제예정220726★★★★★끝
		function fnClCon(){
	
			/* var chk_already = $('#label_text'+label_idx).text();
			var all = document.getElementById("all").value;
			all = all*1;
			
			if(cnt==all){
				if(confirm("라벨 발행을 발행해주세요!")){
					//$('#modalPop3').modal('hide');
				}else{
					return;
				}
			}else{
				alert("라벨을 발행해주세요!");
			} */
			
			$('#modalPop3').modal('hide');
			$('#search').click();
				
		}
		
		function fnclose(){
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop').modal('hide');
		}
		
		function fnclose2(){
			//fnStartLabel();
			//	alert('a');
			if(confirm("If you do not publish now, computer problems may occur in the future. Are you sure you want to cancel?")){
				$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
				$('#modalPop2').modal('hide');
			}else{
				return;
			}
		}
		
		function fnclose3(){
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop2').modal('hide');
		}
				
		function print(){
			$('#modalPop3').modal('show'); //거래명세서 화면을 가린다.
			$('#modalPop').modal('hide'); //거래명세서 화면을 가린다.
			$('#modalPop2').modal('hide');
			$("#label_print").printThis();
			//fnNextLabel();
		}
		
		//재스퍼 라벨 인쇄
		function jprint(pno,trbarcode,memo){
			var trbarcode =  $("#p_barcode").val();
			//alert(pno);
			//alert(barcode);
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";	
				}
			window.open("mng_label_jprint?pno="+pno+"&trbarcode="+trbarcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=500, width=500');
			//window.open("mng_label_jprint","Report Print",'height=500, width=500');
			});
			document.getElementById("btnLaClose").innerText = "Close";
			$("#btnLaClose").removeAttr("onclick");
			$("#btnLaClose").attr("onclick","fnclose3()");
			
		}
		
		function jprintDouble(pno,trbarcode,memo){
			var trbarcode =  $("#p_barcode").val();
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";	
				}	
			window.open("mng_label_jprintDouble?pno="+pno+"&trbarcode="+trbarcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=500, width=500');
			});

			document.getElementById("btnLaClose").innerText = "Close";
			$("#btnLaClose").removeAttr("onclick");
			$("#btnLaClose").attr("onclick","fnclose3()");
		}
		
		//재스퍼 라벨 A4 인쇄
		function a4print(pno, barcode,memo){
			var barcode = $("#p_barcode").val();
			//alert(pno);
			//alert(itemcode1);
			
			//window.open("mng_label_jprint?pno="+itemcode1+"&trbarcode="+tradebarcode,"Report Print",'height=500, width=500');
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";	
				}	
			window.open("mng_label_a4print?pno="+pno+"&trbarcode="+barcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=900, width=900');
			});
			document.getElementById("btnLaClose").innerText = "Close";
			$("#btnLaClose").removeAttr("onclick");
			$("#btnLaClose").attr("onclick","fnclose3()");
			
		}
		
		//재스퍼 라벨 A4 2부씩 인쇄
		function a4double(pno, barcode,memo){
			var barcode = $("#p_barcode").val();
			//alert(pno);
			//alert(itemcode1);
			
			//window.open("mng_label_jprint?pno="+itemcode1+"&trbarcode="+tradebarcode,"Report Print",'height=500, width=500');
			var chk = "0";
			$(document).ready(function(){
				if($("#chk").is(":checked")){
					chk ="1";	
				}	
			window.open("mng_label_a4double?pno="+pno+"&trbarcode="+barcode+"&memo="+memo+"&chk="+chk,"Report Print",'height=900, width=900');
			});
			document.getElementById("btnLaClose").innerText = "Close";
			$("#btnLaClose").removeAttr("onclick");
			$("#btnLaClose").attr("onclick","fnclose3()");
			
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
		    /* if(check_count>9){
		    	alert('거래명세서 항목은 10개를 초과하실수 없습니다.');
		    	$("input:checkbox[id="+id+"]").prop("checked", false);
		    	check_count--;
		    	return;
		    } */
		    
			if(check_date!=''){
				
				if(check_date != $("#check_"+box).val()){ //같은 날짜만 선택 가능합니다.
					alert("You can only select the same date.");
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
		
		//row 숨기기
		function hideRow(id){
			var trId = "tr_"+id;
			$('#'+trId).hide();			
		}
		
		//거래명세서 정보 셋팅
		function fnTranViewSet(){
			if(check_date==''){
				alert("There are no items selected.");
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
			//var branch = new Array();
			var tqty2 = new Array();
			
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
				//alert("값은 받어왔습니다.7  i=" + i  +"/chk=" + chk + " /tqy=" +tqty);
				var tqty = $('#tablebody').find('tr').eq(i).find('.'+check_day).val();
				console.log(chk);
				if (chk == true && tqty>0) { //chk == true
					custcode[j] = $('#tablebody').find('tr').eq(i).find('.custcode').text();
					custname[j] = $('#tablebody').find('tr').eq(i).find('.custname').text();
					itemcode1[j]= $('#tablebody').find('tr').eq(i).find('.itemcode1').text();
					itemname[j] = $('#tablebody').find('tr').eq(i).find('.itemname').text().replace(/,/gi, "|");
					car_type[j] = $('#tablebody').find('tr').eq(i).find('.car_type').text();
					unit[j] = $('#tablebody').find('tr').eq(i).find('.unit').text();
					tqty2[j] = $('#tablebody').find('tr').eq(i).children().find('table').children().find('.tr').eq(check_find).find('input[type="checkbox"]').val();
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
						var cf = confirm("Production date is later than warehousing date. Click OK to proceed.")
						if(!cf){
							return;
						}
					}	
					
					if(lotno[j]===''){
						alert("Select production date");
						return;
					}
					
					j++;
				}				
			}
			
			prdate   = $("#outdate").val();
			branch = getCookie("branch");
			
			// 협력사 한곳만 선택가능
			var custcodeChk = new Array();//납품처코드
			var custcodeTemp = "";
			for (var i = 1; i < $('#tablebody').find('tr').size(); i++) {
				var chk = $('#tablebody').find('tr').eq(i).children().find('table').children().find('.tr').eq(check_find).find('input[type="checkbox"]').is(':checked');
				if (chk == true) {
					custcodeChk[i] = $('#tablebody').find('tr').eq(i).find('.custcode').text();
					if(custcodeTemp == ""){
						custcodeTemp = custcodeChk[i];
					}else if(custcodeTemp != custcodeChk[i]){
						alert("Only one supplier can be selected for one transaction statement.");
						return;
					}
				}
			}
			
			//alert(tqty2);
			//alert(i_qty);
			console.log(prdate +"aa"+indate);
			$.ajax({
				type : "POST",
				url : "mng_trns_data",
				dataType : "html",
				data : "custcode=" + custcode + "&custname=" + encodeURIComponent(custname)+ "&itemname=" + encodeURIComponent(itemname)+"&car_type=" + car_type+"&i_qty=" + i_qty +"&lotno=" + lotno
						+ "&itemcode1=" + itemcode1+ "&label_idx=" + label_idx+ "&check_date=" + check_date+"&unit=" + unit+"&indate=" + indate +"&prdate="+indate+"&branch="+branch+"&tqty2="+tqty2,
			}).done(function(data) {
				$("#modalPop3").html("");
				$("#modalPop3").html(data);
				$('#modalPop3').modal({backdrop:'static'});
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
				alert("Please check the items to be issued");
				return;
			}
			
			fnLabelViewSet(checkArray[start_index]); //제일 첫번째 바코드 값으로 발행
			
		}
		
		function fnNextLabel(){
			start_index ++;
			//alert("start_index:" + start_index + " checkArrayidx[" + checkArrayidx);
			if(start_index>=checkArrayidx){ //더이상 발행할 바코드가 없는 경우
				alert("Issuance completed"); //거래명세서 발행
			}else{
				fnLabelViewSet(checkArray[start_index]); //
			}
			
		}
		
		var label_idx ="";
		//라벨 정보 셋팅
		/* function fnLabelViewSet(idx) {
				
			var chk_already = $('#label_text'+label_idx).text();
			
			//alert(chk_already);
			
			if(chk_already==='발행완료'){
				if(confirm("발행 내역이 있는 경우 다시 발행하시면 이전 발행 내역은 삭제됩니다. 계속 하시겠습니까?")){
					
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
					//custname = $('#tablebody').find('tr').eq(idx).find('.custname').text();
					custname = getCookie("payment");
					//alert(custname);
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
						$('#modalPop').modal({backdrop:'static'});
						//	$('span.number').number( true, 0 );
					});
					
					label_idx =idx; //라벨 인덱스 저장
					
				}else{
					return
				}
			}
			
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
			//custname = $('#tablebody').find('tr').eq(idx).find('.custname').text();
			custname = getCookie("payment");
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
				$('#modalPop').modal({backdrop:'static'});
				//	$('span.number').number( true, 0 );
			});
			
			label_idx =idx; //라벨 인덱스 저장
		}
		 */
		 
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
			var branch = getCookie("branch");
				
			custcode = $('#tablebody').find('tr').eq(idx).find('.custcode').text();
			//custname = $('#tablebody').find('tr').eq(idx).find('.custname').text();
			custname = getCookie("payment");
			itemcode1 = $('#tablebody').find('tr').eq(idx).find('.itemcode1').text();
			itemname = $('#tablebody').find('tr').eq(idx).find('.itemname').text();
			car_type = $('#tablebody').find('tr').eq(idx).find('.car_type').text();
			i_qty    = $('#tablebody').find('tr').eq(idx).find('.'+check_day).val();
			lotno    = $('#tablebody').find('tr').eq(idx).find('.' +check_day+'_lot').val();
			console.log("날짜확인"+lotno);
			prdate   = $("#outdate").val();
			indate = check_date;
			
			if(prdate==''){
				alert("Please check the creation date");
				return;
			}
			FunLoadingBarStart();
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
					prdate:prdate,
					branch:branch
				}
			}).done(function(data) {
				$("#modalPop").html("");
				$("#modalPop").html(data);
				$('#modalPop').modal({backdrop:'static'});
				FunLoadingBarEnd();
				//	$('span.number').number( true, 0 );
			});
			
			label_idx =idx; //라벨 인덱스 저장
		}
		
		function errorFunction(){
			alert('error');
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
					//$('span.number').number( true, 0 );
				});
			});
		}
		
		/* function firstAjax(){
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
		} */
				
		//라벨 출력
		function fnLabelPrint() {
			$('#label_text'+label_idx).text("Issuance completed");
			//$('#label_2text'+label_idx).text("발행완료");
			var itemname = $("#p_itemname2").val();
			var itemcode1 = $("#p_itemcode1").val();
			var custname = $("#p_custname").val();
			var custcode = $("#p_custcode").val();
			var qty = $("#p_qty").val();
			var car_type = $("#p_car_type").val();
			var box_qty = $("#p_box_qty").val();			// 박스당입수수량
			var box_qty2 = $("#p_box_qty2").val();
			var box_qty3 = $("#p_box_qty3").val();
			var lotno = '';
			var indate = $("#p_indate").val();
			var madate = $("#p_madate").val();
			var madate2 = $("#p_madate2").val();
			var madate3 = $("#p_madate3").val();
			var tradebarcode = $("#p_barcode").val();
			var memo =$("#s_memo").val();
			var branch = getCookie("branch");
			var production = $("#p_production").val();		//LOT수량
			var production2 = $("#p_production2").val();
			var production3 = $("#p_production3").val();
			
			if(box_qty==""){
				box_qty="0";
			}
			if(box_qty2==""){
				box_qty2="0";
			}
			if(box_qty3==""){
				box_qty3="0";
			}
			if(production==""){
				production="0";
			}
			if(production2==""){
				production2="0";
			}
			if(production3==""){
				production3="0";
			}
			
			var numCheck = /^[0-9]+$/;
			if(!numCheck.test(box_qty)){
				alert("Only numbers can be entered for the number of items received per box.");
				$('#p_box_qty').focus();
				return false;
			}
			if(!numCheck.test(box_qty2)){
				alert("Only numbers can be entered for the number of items received per box.");
				$('#p_box_qty2').focus();
				return false;
			}
			if(!numCheck.test(box_qty3)){
				alert("Only numbers can be entered for the number of items received per box.");
				$('#p_box_qty3').focus();
				return false;
			}
			if(!numCheck.test(production)){
				alert("Only numbers can be entered for the LOT quantity.");
				$('#p_production').focus();
				return false;
			}
			if(!numCheck.test(production2)){
				alert("Only numbers can be entered for the LOT quantity.");
				$('#p_production2').focus();
				return false;
			}
			if(!numCheck.test(production3)){
				alert("Only numbers can be entered for the LOT quantity.");
				$('#p_production3').focus();
				return false;
			}
			if(qty!=Number(production)+Number(production2)+Number(production3)){
				console.log(qty+"aa"+production+production2+production3)
				alert("Order quantity and LOT quantity do not match.");
				$('#p_production').focus();
				return false;
			}
			//alert ("메모내용=>"+memo);
			if((Number(box_qty)+Number(box_qty2)+Number(box_qty3))==0){
				alert("Please enter the number of receipts per box.");
			$('#p_box_qty').focus();
				return false;
			}
			if(production!=0){
				if(box_qty==0){
					alert("Please enter the number of receipts per box.");
					$('#p_box_qty').focus();
					return false;
				}
			}
			
			if(box_qty!=0){
				if(madate==0){
					alert("Please enter the production date");
					$('#p_madate').focus();
					return false;
				}
			}
			if(production2!=0){
				if(box_qty2==0){
					alert("Please enter the number of receipts per box.");
					$('#p_box_qty2').focus();
					return false;
				}
			}
			
			if(box_qty2!=0){
				if(madate2==0){
					alert("Please enter the production date");
					$('#p_madate2').focus();
					return false;
				}
			}
			if(production3!=0){
				if(box_qty3==0){
					alert("Please enter the number of receipts per box.");
					$('#p_box_qty3').focus();
					return false;
				}
			}
			
			if(box_qty3!=0){
				if(madate3==0){
					alert("Please enter the production date");
					$('#p_madate3').focus();
					return false;
				}
			}
			
			if(madate!=""){
				if(madate>indate){
					alert("Production date is later than warehousing date.");
					$('#p_madate').focus();
					return false;
				}
			}
	
			if(custname==''){
				alert("Enter company name.");
				
				//promise_function().then(firstAjax).catch(errorFunction);
				promise_function().catch(errorFunction);
				document.getElementById('cnl').click();
				//firstAjax()
				
				return;
			}
			
			if(itemname==''){
				alert("No Product Name");
				return;
			}
			
			if(madate==''){
				alert("Please enter the production date");
				return;
			}
			$("#modalPop").html("");
			$("#modalPop").modal('hide');
			FunLoadingBarStart();
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
					box_qty2:box_qty2,
					box_qty3:box_qty3,
					lotno:lotno,
					indate:indate,
					madate:madate,
					madate2:madate2,
					madate3:madate3,
					tradebarcode:tradebarcode,
					memo:memo,
					branch:branch,
					production:production,
					production2:production2,
					production3:production3,
				}
			}).done(function(data) {
				
				$("#modalPop2").html("");
				$("#modalPop2").html(data);
				$('#modalPop2').modal({backdrop:'static'});
				FunLoadingBarEnd();
				//cnt=cnt+1;
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
				alert("Please select a label to issue");
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
		
		//엑셀창 보여주기 20220422 정인우
		function showExcel(){
			var startdate = $('#startdate').val();
			var branch =$('#branch').val();
			window.open("mng_buy_plan_excel?startdate="+startdate+"&branch="+branch,"Buy Plan Excel",'height=125,width=750');
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
						alert("You can select only one when issuing a label.");
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

		/*
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
		*/
		/*
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
			
			/*
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
		 */
		
		/*
		
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
		*/
		
		//엑셀 출력
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
		
		//income table = 납품 없는 있는 것들 제외
		function getUserList(page, keyword) {
			check_count=0;
			check_date='';
			var form = document.formdata;
			var startdate = $('#startdate').val();
			//var enddate = $('#enddate').val();
			////var gubun = $('#gubun').val();
			//var com_text = $('#com_text').val();
			var cno =  $('#p_cno').val();
			var custname =  $('#p_cu_sangho').val();
			setCookie("branch",$('#branch').val());
			var branch = getCookie("branch");
			
			if(branch==null){
				  alert("please select a factory.");
				  return;
			  }
			
			var carname=$('#p_carname').val();//차종 
			var itemname=$('#p_itemname').val();
			var itemcode=$('#p_itemcode').val();
			
			// var custcode =  $('#s_custcode').val();
			var itemCountPerPage =  $('#itemCountPerPage').val();
			
			var result = $('#alldtate').val();
			var align = $('#aligndata').val();
			var income = $('#income').val();
			//var item = $('#p_item').val(); //220614
			
			//alert(income);
			//alert(typeof(income));
			
			if(income === "1"){
				
				//미발행분에 대한 뷰 jsp는 따로 불러옵니다. 2022-04-25 정인우
				var pageView = "mng_buy_incomeplan_table";
				console.log(pageView);
				$.ajax({
					type : "post",
					url : "mng_buy_incomeplan",
					dataType : "html",
					data : {
						startdate : startdate,
						page : page,
						cno : cno,
						custname : custname,
						custcode : custname,
						carname : carname,
						itemname : itemname,
						itemcode : itemcode,
						pageView : pageView,
						itemCountPerPage : itemCountPerPage,
						result:result,
						branch:branch,
						align : align,
						income : income,
						//item2 : item //220614
						
					}
				}).done(function(data) {
					$("#tabledata").html("");
					$("#tabledata").html(data);
					$('td.number').number(true, 0);
					$('span.number').number(true, 0);
					//alert("end");
					//	$('span.number').number( true, 0 );
				});
				
			}else{
				
				var pageView = "mng_buy_plan_table";
				console.log(pageView);
				$.ajax({
					type : "post",
					url : "mng_buy_plan",
					dataType : "html",
					data : {
						startdate : startdate,
						page : page,
						cno : cno,
						custname : custname,
						custcode : custname,
						carname : carname,
						itemname : itemname,
						itemcode : itemcode,
						pageView : pageView,
						itemCountPerPage : itemCountPerPage,
						result:result,
						branch:branch,
						align : align,
						income : income,
						//item2 : item  //220614
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
			
		}
		
		function fnCancelPop() {
			var checkedValue = getCheckedValue('box');
			if (checkedValue == "") {
				alert("Please select the user you want to delete and run it again.");
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
			console.log("220916 뷰"+deliveryno);
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
			
			if(!confirm("Do you want to change to ["+dstate +"]state?")){
				
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
					alert('Successfully processed.');
					location.reload();
				}else{
					alert('Registration failed');
				}
			});
			
		}
		
		//211102 배송준비중 전송
		function fndelivery_u(deliveryno, dstate){
			console.log("220916"+deliveryno);
			if(dstate==="출하준비중"){
				dstate = "Preparing for shipment"
			}else if(dstate==="배송중"){
				dstate="In transit"
			}else if(dstate==="배송완료"){
				dstate="Delivery completed"
			}
			if(!confirm("Do you want to change to ["+dstate +"]state?")){
				
				return;
			}
			
			var delivery_date = $("#p_delivery_date").val();
			var delivery_hour = $("#p_delivery_hour").val();
			var delivery_min = $("#p_delivery_min").val();
			
			var du_hour = $("#p_du_hour").val();
			var du_min = $("#p_du_min").val();
			
			if("" == delivery_date){
				alert("Please check the date.");
				return;
			}
			
			if("" == delivery_hour){
				alert("Check the departure time.");
				return;
			}
			
			if("" == delivery_min){
				alert("Please check the departure date.");
				return;
			}
			
			if("" == du_hour){
				alert("Please check the estimated arrival time");
				return;
			}
			
			if("" == du_min){
				alert("Please check the estimated arrival date");
				return;
			}
			
			
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
					alert('Successfully processed.');
					location.reload();
				}else{
					alert('Registration failed');
				}
			});
			
		}
		
		function mailSend(a) {
			/* 팝업창 띄워서 파라메터 보내기 */
			/* 메일창 */
			/* window.open("mng_partner_email","Add Member",'height=600, width=500'); */
			window.open("<c:url value='/mng_partner_email?custcode="+a+"'/>","Email Page",'height=800, width=700');
		}
	</script>

	<script>
		$(function() {
			$('span.number').number(true, 0);
			/* $('#startdate').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('#ma_date').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day1_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day2_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day3_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day4_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day5_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day6_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day7_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day8_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day9_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day10_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day11_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day12_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day13_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			});
			$('input[name="day14_lot"]').datepicker({
				format : 'dd-mm-yyyy'
			}).on('change',function(){
				$('.datepicker').hide();
			}); */
			
		});
	</script>
	
	<script>
  //$(function() {
      //$("#tablebody").table2excel({
         // name: "Excel table",
         // filename: "excel table",
         // fileext: ".xls",
          //exclude_img: true,
         // exclude_links: true,
         // exclude_inputs: true
      //});
  //});
  	$("#xls").click(function (){
  		$("#tablebody").table2excel({
  			  name: "Excel table",
  	          filename: "excel table",
  	          fileext: ".xls",
  		});
  	});
  	
	</script>
</body>
</html>