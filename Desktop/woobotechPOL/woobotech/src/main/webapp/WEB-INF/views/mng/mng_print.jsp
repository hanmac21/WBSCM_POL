<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "<br><br>"); %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../common/jsHeader.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WOOBOTECH</title>
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
    margin-top: 3px;
    
  }
  th, td {
    border: 1px solid #bbc6d3;
    padding-left: 2px;
    padding-right:2px;
  }
</style>

<style>
 body {
            margin: 0;
            padding: 0;
            font: 12pt "Tahoma";
        }
        * {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
        }
        .page {
            width: 21cm;
            min-height: 29.7cm;
            padding: 2cm;
            margin: 1cm auto;
            border-radius: 5px;
            background: white;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }
        .subpage {
            padding: 1cm;
            height: 256mm;
        }
        @page {
            size: A4 landscape;
            margin: 0;
            /*size: landscape;*/
        }
        @media print {
            .page {
                margin: 0;
                border: initial;
                border-radius: initial;
                width: initial;
                min-height: initial;
                box-shadow: initial;
                background: initial;
                page-break-after: always;
            }
        }
@page a4sheet{
	size:29.7cm 21.0cm;
	margin-right: 5mm;
	margin-left: 5mm;
	}
	
.a4{page:a4sheet; page-break-after:always}

</style>

<body id="all_trans_print">
								
					<!-- /.box-header -->
					<!-- form start -->
					<form class="form-horizontal" name="form2" id="form2" method="post">

							<page size="A4">
							<div id="all_trans_print" style="margin-left: 20px; margin-right: 20px" class="a4">
								<div class="form-group" id="trans_print">


									<table style="border: hidden;">
										<tr>
											<td width="50%">
												<div class="row"
													style="width: 100%;  margin-top:10px; margin-bottom: 10px; text-align: center">
													<span style="font-size: 20px"><U><B>거래명세표</B></U></span><br>
													(공급자용)

												</div>
												<div class="row" style="padding-left:15px;">
													<div class="row pull-right"
														style="width: 35%; margin-right: 20px; margin-bottom: 5px; text-align: center; margin-right: 50px">
														<img src="/resimg/woobo/barcode/${barcode}.png"style="width: 250px; height: 50px;">
													</div>
													<div class="row pull-left" style="margin-left: 13px;">
														<span style="font-size: 10px">발행순번 : <span id="memo2"></span></span><br>
														<span style="font-size: 10px">작성일자 : ${prdate}</span>
														<!-- <span style="font-size: 10px">작성일자 :</span> -->
													</div>
												</div>	
												
												<table style="border:hidden;">
													<tr>
														<td width="49%" style="padding-left:13px;">
															<table border="1" bordercolor="#A2AFCC" >
																<colgroup>
																	<col style="width: 10%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																</colgroup>
																<tr>
																	<td rowspan="4"
																		style="font-size: 11px; text-align:center;">공<br>급<br>자
																	</td>
																	<td style="font-size: 11px; text-align: center;">번호
																	</td>
																	<td colspan="3"
																		style="font-size: 11px; text-align: center;">${cu_sano}</td>
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">상호</td>
																	<td style="font-size: 7px; text-align: center; height: 46px;" >${cu_sangho}
																	</td>
																	<td style="font-size: 11px; text-align: center;">성명</td>
																	<td style="font-size: 11px; text-align: center; ">${cu_master}</td>
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">주소</td>
																	<c:choose>
																			<c:when test="${null ne cu_juso }">
																				<td colspan="3"
																					style="font-size: 9px; text-align: center; center;height: 46px">${bak_juso}</td>
																			</c:when>
																			<c:otherwise>
																				<td colspan="3"
																					style="font-size: 9px; text-align: center; center;height: 46px">${cu_juso}</td>
																			</c:otherwise>
																		</c:choose>
																	<!--<td colspan="3" -->
																		<!--  style="font-size: 9px; text-align: center;height: 46px">${cu_juso}</td> -->
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">업태</td>
																	<td style="font-size: 11px; text-align: center;">${cu_uptae}
																	</td>
																	<td style="font-size: 11px; text-align: center;">종목</td>
																	<td style="font-size: 11px; text-align: center;">${cu_upjong}</td>
																</tr>

															</table>
														</td>

														<td width="2%" style="border:hidden;"></td>

														<td width="49%" style="padding-right: 12px;">
															<table style="width: 100% ;"	bordercolor="#A2AFCC">
																<colgroup>
																	<col style="width: 10%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																</colgroup>
																<tr style="height: 25%">
																	<td rowspan="4"
																		style="font-size: 11px; text-align: center;">공<br>급<br>받<br>는<br>자
																	</td>
																	<td style="font-size: 11px; text-align: center;">번호
																	</td>
																	<td colspan="3"
																		style="font-size: 11px; text-align: center;">137-81-29744</td>
																</tr>
																<tr style="height: 25%">
																	<td style="font-size: 7px; text-align: center;">상호</td>
																	<td style="font-size: 5px; text-align: center;word-break:break-all;height: 46px"">(주)우보테크
																	</td>
																	<td style="font-size: 11px; text-align: center;">성명</td>
																	<td style="font-size: 11px; text-align: center;">정해일</td>
																</tr>
																<tr style="height: 25%">
																	<td style="font-size: 11px; text-align: center;">주소</td>
																	<td colspan="3"
																		style="font-size: 8px; text-align: center; height: 46px">경기도 평택시 청북면 양교1길 134</td>
																</tr>
																<tr style="height: 25%">
																	<td style="font-size: 11px; text-align: center;">업태</td>
																	<td style="font-size: 11px; text-align: center;">제조
																	</td>
																	<td style="font-size: 11px; text-align: center;">종목</td>
																	<td style="font-size: 11px; text-align: center;">자동차 부품</td>
																</tr>
															</table>
														</td>
													</tr>
												</table> 
												<table>
													<tr>
														<td  style="border:hidden; padding-left:13px; padding-right: 12px;">
														<table border="1" >
													<thead>
														<tr>
															<th
																style="text-align: center; font-size: 13px; width: 5%"">LOT
																NO</th>
															<th
																style="text-align: center; font-size: 13px; width: 20%">부품품번</th>
															<th
																style="text-align: center; font-size: 13px; width: 45%">품명</th>
															<th
																style="text-align: center; font-size: 13px; width: 10%"">납품</th>
															<th
																style="text-align: center; font-size: 13px; width: 10%">불량</th>
															<th
																style="text-align: center; font-size: 13px; width: 10%">입하</th>
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when test="${ board.size() > 0 }">
																<c:forEach var="vo" items="${ board }"
																	varStatus="status">

																	<tr style="height: 46px;">
																		<td style="text-align: center; font-size: 9px">${vo.madate}</td>
																		<td style="text-align: center; font-size: 9px">${vo.itemcode1}</td>
																		<td style="text-align: center; font-size: 9px">
																		${fn:replace(vo.itemname,replaceChar,"<br/>")}
																		</td>
																		<td class="number"
																			style="text-align: center; font-size: 9px">${vo.i_qty}</td>
																		<td
																			style="text-align: center; font-size: 9px"><span id="label_text${vo.label_idx}"></span></td>
																			
																		
																		
																		<c:choose>
																		<c:when test="${pageview eq 'mng_trns_data'}">
																		<td
																			style="text-align: center; font-size: 10px"><span class="label"><input type="button"	class="btn btn-success" onclick="fnLabelViewSet(${vo.label_idx})" value="라벨발행하기" style="margin-left: 10x" /></span></td>
																		</c:when>
																		
																		<c:otherwise>
																		<td
																			style="text-align: center; font-size: 10px"><span class="label"></span></td>
																		</c:otherwise>
																		</c:choose>	

																	</tr>

																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td colspan="12">명세서에 표기할 내용이 없습니다.</td>
																</tr>
															</c:otherwise>

														</c:choose>
														<c:forEach var="i" begin="1" end="${9- board.size()}">

															<tr style="height: 46px;">
																<td style="text-align: center; font-size: 9px"></td>
																<td style="text-align: center; font-size: 9px"></td>
																<td style="text-align: center; font-size: 9px"></td>
																<td style="text-align: center">&nbsp;</td>
																<td style="text-align: center; font-size: 9px"></td>
																<td style="text-align: center; font-size: 9px"></td>
															</tr>

														</c:forEach>
													</tbody>
												</table>
														</td>
													</tr>
												</table>
												<table >
													<tr>
														<td  style="width: 55%;border:hidden;padding-left: 13px;">
															<table>
																<tr style="height: 54px">
																	<td style="width: 20%; text-align: center;font-size: 11px" rowspan="2">
																		비<br>고
																	</td>
																	
																	<td style="width: 80%;text-align: center;padding-left: 10px;font-size: 11px" rowspan="2" >
																		<span id="p_memo">  ${memo}</span>
																	</td>
																</tr>
															</table>	
														</td>
														
														<td style="width: 5%;border:hidden;">
														
														</td>
														
														<td  style="width: 40%;border:hidden;padding-right: 12px;">
															<table>
																<tr style="height: 20px">
																	<td rowspan="2" style="text-align: center;font-size: 9px">
																		결<br>재
																	</td>
																	
																	<td style="text-align: center;font-size: 9px;width:30%">
																		수입검사	
																	</td>
																	<td style="text-align: center;font-size: 9px;width:30%">
																		자재검사	
																	</td>
																	<td style="text-align: center;font-size: 9px;width:30%">
																		담당	
																	</td>
																</tr>
																<tr style="height: 34px">
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</table>	
														</td>
													</tr>
												</table>
											</td>


											<td width="50%">
												<div class="row"
													style="width: 100%; margin-top:10px; margin-bottom: 10px; text-align: center">
													<span style="font-size: 20px"><U><B>거래명세표</B></U></span><br>
													(공급받는자용)

												</div>
												<%-- <div class="row">
													<div class="row pull-right"
														style="width: 35%; margin-right: 20px; margin-bottom: 5px; text-align: center; margin-right: 50px">
														<img src="/resimg/woobo/barcode/${barcode}.png"style="width: 250px; height: 50px;">
													</div>
												</div> --%>
												<div class="row" style="padding-left:13px;">
													<div class="row pull-right"
														style="width: 35%; margin-right: 20px; margin-bottom: 5px; text-align: center; margin-right: 50px">
														<img src="/resimg/woobo/barcode/${barcode}.png"style="width: 250px; height: 50px;">
													</div>
													<div class="row pull-left" style="margin-left: 13px;">
														<span style="font-size: 10px">발행순번 : <span id="memo2_2"></span></span><br>
														<span style="font-size: 10px">작성일자 : ${prdate}</span>
														<!-- <span style="font-size: 10px">작성일자 :</span> -->
													</div>
												</div>
												
												<table style="border:hidden;word-break:break-all;">

													<tr>
														<td width="49%" style="padding-left:12px;">
															<table width="100%" border="1" bordercolor="#A2AFCC" style="word-break:break-all;">
																<colgroup>
																	<col style="width: 10%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																</colgroup>
																<tr>
																	<td rowspan="4"
																		style="font-size: 11px;text-align: center">공<br>급<br>자
																	</td>
																	<td style="font-size: 11px; text-align: center;">번호
																	</td>
																	<td colspan="3"
																		style="font-size: 11px; text-align: center;">${cu_sano}</td>
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">상호</td>
																	<td style="font-size: 5px; text-align: center;height: 46px"">${cu_sangho}
																	</td>
																	<td style="font-size: 11px; text-align: center;">성명</td>
																	<td style="font-size: 11px; text-align: center;">${cu_master}</td>
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">주소</td>
																	<c:choose>
																			<c:when test="${null ne cu_juso }">
																				<td colspan="3"
																					style="font-size: 9px; text-align: center; center;height: 46px">${bak_juso}</td>
																			</c:when>
																			<c:otherwise>
																				<td colspan="3"
																					style="font-size: 9px; text-align: center; center;height: 46px">${cu_juso}</td>
																			</c:otherwise>
																		</c:choose>
																		
																	<!--  <td colspan="3" -->
																		<!--  style="font-size: 8px; text-align: center;height: 46px">${cu_juso}</td> -->
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">업태</td>
																	<td style="font-size: 11px; text-align: center;">${cu_uptae}
																	</td>
																	<td style="font-size: 11px; text-align: center;">종목</td>
																	<td style="font-size: 11px; text-align: center;">${cu_upjong}</td>
																</tr>
															</table>
														</td>
														<td width="2%" style="border:hidden;"></td>
														<td width="49%" style="padding-right: 12px;">
															<table style="width: 100%; " border="1"
																bordercolor="#A2AFCC" >
																<colgroup>
																	<col style="width: 10%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																	<col style="width: 16%">
																	<col style="width: 29%">
																</colgroup>
																<tr width="100%">
																	<td rowspan="4"
																		style="font-size: 11px; text-align: center;">공<br>급<br>받<br>는<br>자
																	</td>
																	<td style="font-size: 11px; text-align: center;">번호
																	</td>
																	<td colspan="3"
																		style="font-size: 11px; text-align: center;">137-81-29744</td>
																</tr>
																<tr>
																	<td style="font-size: 7px; text-align: center;">상호</td>
																	<td style="font-size: 9px; text-align: center;height: 46px">(주)우보테크
																	</td>
																	<td style="font-size: 11px; text-align: center;">성명</td>
																	<td style="font-size: 11px; text-align: center;">정해일</td>
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">주소</td>
																	<td colspan="3"
																		style="font-size: 9px; text-align: center;height: 46px">경기도 평택시 청북면 양교1길 134</td>
																</tr>
																<tr>
																	<td style="font-size: 11px; text-align: center;">업태</td>
																	<td style="font-size: 11px; text-align: center;">제조
																	</td>
																	<td style="font-size: 11px; text-align: center;">종목</td>
																	<td style="font-size: 11px; text-align: center;">자동차 부품</td>
																</tr>
															</table>
														</td>
													</tr>
												</table> 
												
												
												
												<table border="1">
													<tr>
														<td  style="width: 55%;border:hidden; padding-left:12px; padding-right: 12px;">
														<table>
													<thead>
														<tr>
															<th
																style="text-align: center; font-size: 13px; width: 5%"">LOT
																NO</th>
															<th
																style="text-align: center; font-size: 13px; width: 20%">부품품번</th>
															<th
																style="text-align: center; font-size: 13px; width: 45%">품명</th>
															<th
																style="text-align: center; font-size: 13px; width: 10%"">납품</th>
															<th
																style="text-align: center; font-size: 13px; width: 10%">불량</th>
															<th
																style="text-align: center; font-size: 13px; width: 10%">입하</th>
														</tr>
													</thead>
													<tbody>
														<c:choose>
															<c:when test="${ board.size() > 0 }">
																<c:forEach var="vo" items="${ board }"
																	varStatus="status">

																	<tr style="height: 46px;">
																		<td style="text-align: center; font-size: 9px">${vo.madate}</td>
																		<td style="text-align: center; font-size: 9px">${vo.itemcode1}</td>
																		<td style="text-align: center; font-size: 9px">
																			${fn:replace(vo.itemname,replaceChar,"<br/>")}
																		</td>
																		<td class="number"
																			style="text-align: center; font-size: 9px">${vo.i_qty}</td>
																		<td
																			style="text-align: center; font-size: 9px"></td>
																		<td
																			style="text-align: center; font-size: 9px"></td>

																	</tr>

																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td colspan="12">명세서에 표기할 내용이 없습니다.</td>
																</tr>
															</c:otherwise>

														</c:choose>
														<c:forEach var="i" begin="1" end="${9- board.size()}">

															<tr style="height: 46px;padding: 0">
																<td style="text-align: center; font-size: 9px;padding: 0"></td>
																<td style="text-align: center; font-size: 9px;padding: 0"></td>
																<td style="text-align: center; font-size: 9px;padding: 0"></td>
																<td style="text-align: center">&nbsp;</td>
																<td style="text-align: center; font-size: 9px;padding: 0"></td>
																<td style="text-align: center; font-size: 9px;padding: 0"></td>
															</tr>

														</c:forEach>
													</tbody>
												</table>
														</td>
													</tr>
												</table>	
												
												
												<table border="1">
													<tr>
														<td  style="width: 55%;border:hidden;  padding-left:12px;">
															<table>
																<tr style="height: 54px">
																	<td style="width: 20%;text-align: center;font-size: 11px;" rowspan="2">
																		비<br>고
																	</td>
																	
																	<td style="width: 80%;text-align: center;padding-left: 10px;font-size: 11px;" rowspan="2" >
																		<span id="p_memo">  ${memo}</span>
																	</td>
																</tr>
															</table>	
														</td>
														
														<td style="width: 5%;border:hidden;">
														
														</td>
														
														<td  style="width: 40%;border:hidden;padding-right: 12px;">
															<table>
																<tr style="height: 20px">
																	<td rowspan="2" style="text-align: center; font-size: 10px;">
																		결<br>재
																	</td>
																	
																	<td style="text-align: center;font-size: 10px;width:30%">
																		수입검사	
																	</td>
																	<td style="text-align: center;font-size: 10px;width:30%">
																		자재검사	
																	</td>
																	<td style="text-align: center;font-size: 10px;width:30%">
																		담당	
																	</td>
																</tr>
																<tr style="height: 34px">
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</table>	
														</td>
													</tr>
												</table>
												
											</td>

										</tr>

									</table>

								</div>



							</div>
							</page>
					</form>
</body>
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
<link rel="stylesheet" href="resources/css/print-preview.css"> 
<script src="resources/js/jquery.print-preview.js"></script> 
<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/js/printThis.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	printTrna();
	
	function getParameterByName(name){
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
        return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var memo2 = getParameterByName('memo2');
	
	document.getElementById("memo2").innerText = memo2;
	document.getElementById("memo2_2").innerText = memo2;
	
});
function printTrna(){
	
	window.print();
}
</script>


</html>