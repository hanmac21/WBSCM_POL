<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "<br><br>"); %>
<!--
<style>
page[size="A4"] {
	background: white;
	width: 29.7cm;
	height: 21cm;
	display: block;
	margin: 0 auto;
	margin-bottom: 0.5cm;
	box-shadow: 0 0 0.5cm rgba(0, 0, 0, 0.5);
}
@media print {
	body, page[size="A4"] {
		margin: 0;
		box-shadow: 0;
	}
}
</style>
-->
<style>
th, td {
	word-break: break-all;
	/* line-height: 125%; */
}
table{
	/* line-height: 125%; */
}
</style>
<body>
	<div class="modal-dialog" style="width:60%; height:72%; overflow: scroll;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="close"
					aria-label="Close">
					<!-- <span aria-hidden="true">&times;</span> -->
				</button>
				
				<div style="float:left;">
					<h4 class="modal-title">Transaction statement</h4>
					<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
					Current applied sequence : <span id = "p_memo3"> ${memo2 }</span>
				</div>
				
				<div style="width: 100%" style="float: right;">
								<button type="button" class="btn btn-success pull-right modal-close"
									style="margin-left: 10px" onclick="fnClCon()">Close</button>
								<!-- button type="button" class="btn btn-info pull-right" 			onclick="fnTransPrint()">인쇄</button-->
								
								<c:choose>
									<%-- <c:when test="${pageview eq 'mng_trns_data'}">
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="fnTrnsPop('${barcode}','${prdate}')">인쇄</button>
											<button type="button" class="btn btn-info pull-right print_btn" id="print2"  
											style="margin-left: 10px" onclick="fnTrnsForcePop('${barcode}','${prdate}')">인쇄 (라벨발행 무시)</button>
									</c:when>	
									<c:otherwise>
										<button type="button" class="btn btn-info pull-right print_btn" 
											style="margin-left: 10px" onclick="fnTrnsRePop('${barcode}','${prdate}')">인쇄</button>
									</c:otherwise> --%>
									
									<c:when test="${pageview eq 'mng_trns_data'}">
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="fnTrnsPop('${barcode}','${memo}')">Print</button>
										<button type="button" class="btn btn-info pull-right print_btn" id="print2"  
											style="margin-left: 10px" onclick="fnTrnsForcePop('${barcode}','${memo}')">Print (Ignore printing labels)</button>
									</c:when>	
									<c:otherwise>
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="jtrnsprint('${barcode}','${memo}')">Print</button>
									</c:otherwise>
									
								</c:choose>	
								<%-- <button type="button" class="btn btn-info pull-right print_btn" 
									style="margin-left: 10px" onclick="fnTrnsPop('${barcode}','${prdate}')">Report</button> --%>
									
								<button type="button" class="btn btn-warning pull-right"
									style="margin-right: 10px" onclick="fnMemoSet('${barcode}')" id="ok2">apply</button>
								<input type="text" class="pull-right"
									placeholder="Write down" value=""  
									style="width: 300px; height: 30px; margin-right: 10px"
									id="s_memo" onKeypress="javascript:if(event.keyCode==13){$('#ok2').click(); $('#s_memo').val('');}">
								<span class="pull-right" style="margin-top:5px; margin-right: 5px;">ETC :  </span>	
								<!--  <button type="button" class="btn btn-info pull-right print_btn" id="labelPrintAll"  
											style="margin-right: 20px" onclick="fnAllLabel('${barcode }')" disabled>전체 재발행(라벨프린터)</button>-->
								<c:forEach var="vo" items="${ text }" varStatus="status">
									<c:choose>
										<c:when test="${vo.dstate=='출하준비중'}">		<!--DB저장된 한글 영어로 바꾸기-->
											<button type="button" class="btn  btn-warning pull-right"
												style="margin-right: 10px"
												onclick="fnDelivertView('${deliveryno}','In transit')"
												style="font-size: 15px">Shipment preparation</button>
										</c:when>

										<c:when test="${vo.dstate=='배송중'}">
											<input type="button" class="btn  btn-primary pull-right"
												style="margin-right: 10px"
												onclick="fndelivery_u2('${deliveryno}','Delivery completed')"
												style="font-size: 15px" value="In transit" />
										</c:when>
										
										<c:otherwise>
											<input type="button" class="btn  btn-info pull-right"
												style="margin-right: 10px" style="font-size: 15px"
												value="Delivery completed" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<input type="hidden" value="${vo.itemcode1}">
							</div>
			</div>
			<div class="modal-body" id="modalbody1">
				<div class="">
				<!-- <div class="box box-info"> -->

					<!-- /.box-header -->
					<!-- form start -->
							<input type="hidden" id="p_u_id" name="p_u_id" value="">
							 <!-- //★★★★★삭제예정220721★★★★★시작 -->
							<%-- <div style="width: 100%">
								<button type="button" class="btn btn-success pull-right"
									style="margin-left: 10px" data-dismiss="modal">닫기</button>
								<!-- button type="button" class="btn btn-info pull-right" 			onclick="fnTransPrint()">인쇄</button-->
								<button type="button" class="btn btn-info pull-right print_btn"
									onclick="fnTrnsPop('${barcode}','${prdate}')">인쇄</button>
								<button type="button" class="btn btn-warning pull-right"
									style="margin-right: 10px" onclick="fnMemoSet('${barcode}')" id="ok">적용</button>
								<input type="text" class="pull-right"
									placeholder="비고에 들어갈 내용을 작성하세요" value=""
									style="width: 300px; height: 30px; margin-right: 10px"
									id="s_memo" onKeypress="javascript:if(event.keyCode==13){$('#ok').click(); $('#s_memo').val('');}">
								<c:forEach var="vo" items="${ text }" varStatus="status">
									<c:choose>
										<c:when test="${vo.dstate=='출하준비중'}">
											<input type="button" class="btn  btn-warning"
												style="margin-right: 10px"
												onclick="fnDelivertView('${deliveryno}','배송중')"
												style="font-size: 15px" value="출하준비중" />
										</c:when>
										<c:when test="${vo.dstate=='배송중'}">
											<input type="button" class="btn  btn-primary"
												style="margin-right: 10px"
												onclick="fndelivery_u2('${deliveryno}','배송완료')"
												style="font-size: 15px" value="배송중" />
										</c:when>
										<c:otherwise>
											<input type="button" class="btn  btn-info"
												style="margin-right: 10px" style="font-size: 15px"
												value="배송완료" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<input type="hidden" value="${vo.itemcode1}">
							</div> --%>
							<!-- <br> <br> -->
							<page size="A4">

							<div id="all_trans_print">

								<table style="border: 3px solid #00C0EF; width: 100%; padding: 0 0 0 0;">
									<tr>
										<td width="50%">
											
											<div class="row"
												style="width: 100%; margin-bottom: 10px; text-align: center">
												<span style="font-size: 20px"><U><B>Transaction statement</B></U></span><br>
												(For suppliers)
												<input type="hidden" value="${board.size() }" id="all"/>
											</div>
											<div>
												<div class="row" style="float: right;">
													<div class="row"
														style="width: 35%; margin-right: 30px; margin-bottom: 10px; text-align: center;">
														<img src="/resimg/woobo/barcode/${barcode}.png"
															style="width: 200px; height: 40px;"><br>
															<span style="font-size:20px;padding-left:40px;"> ${barcode}</span>
													</div>
												</div>
												<div class="row" style="margin-left: 10px; float: left;">
													<span style="font-size: 12px; width:77px;">Total Qty : </span> &nbsp;&nbsp;<span id="p_sumqty"><fmt:formatNumber value="${sumqty}" pattern="#,##0" /></span><br>
													<span style="font-size: 12px; width:77px;">Printing order : </span> &nbsp; <input type="text" id="s_memo2" name="s_memo2" style="width: 100px" 
													 onKeypress="javascript:if(event.keyCode==13){$('#ok2').click(); $('#s_memo2').val('');}"/>
													<button type="button" class="btn" onclick="fnMemoSet2('${barcode}')" style="font-size: 12px; margin-left:1px; margin-bottom:1px; height:28px;" id="ok2">apply</button> <br>
													<!-- <span style="font-size: 12px">작성일자 : ${outdate}</span> -->
													<span style="font-size: 12px; width:77px;">Date :</span> &nbsp; <input
														type="text" id="outdate" name="outdate" readonly='true'
														style="width: 100px" value="${prdate}" onchange="changed(this)" />
														<button type="button" class="btn" onclick="fnMemoSet3('${barcode}')" style="font-size: 12px; margin-top:-2px;  height:28px;" id="ok2">apply</button> <br>
														
													<!-- <input type="text" id="outdate" name="outdate" value="${outdate} ">  -->
												</div>
											</div>

											<table
												style="border: hidden; width: 100%; word-wrap: break-all;">
												<tr>
													<td width="49%">
														<table border="1" bordercolor="#A2AFCC"
															style="width: 100%; word-break: break-all">
															<colgroup>
																<col style="width: 10%">
																<col style="width: 16%">
																<col style="width: 29%">
																<col style="width: 16%">
																<col style="width: 29%">
															</colgroup>
															<tr>
																<td rowspan="4"
																	style="font-size: 11px; text-align: center; align-items: center">s<br>u<br>p<br>p<br>l<br>i<br>e<br>r
																</td>
																<td style="font-size: 11px; text-align: center;">number
																</td>
																<td colspan="3"
																	style="font-size: 11px; text-align: center;">${cu_sano}</td>
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">company name</td>
																<td style="font-size: 7px; text-align: center;">${cu_sangho}
																</td>
																<td style="font-size: 11px; text-align: center;">name</td>
																<td style="font-size: 11px; text-align: center;">${cu_master}</td>
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">address</td>
																<c:choose>
																	<c:when test="${null ne cu_juso }">
																		<td colspan="3"
																			style="font-size: 9px; text-align: center;">${bak_juso}</td>
																	</c:when>
																	<c:otherwise>
																		<td colspan="3"
																			style="font-size: 9px; text-align: center;">${cu_juso}</td>
																	</c:otherwise>
																</c:choose>
																<!--  <td colspan="3"  -->
																<!--  style="font-size: 9px; text-align: center;">${cu_juso}</td> -->
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">the state of one's<br> business conditions</td>
																<td style="font-size: 11px; text-align: center;">${cu_uptae}
																</td>
																<td style="font-size: 11px; text-align: center;">type</td>
																<td style="font-size: 11px; text-align: center;">${cu_upjong}</td>
															</tr>

														</table>
													</td>

													<td width="2%" style="border: hidden;"></td>

													<td width="49%">
														<table
															style="width: 100%; table-layout: fixed; word-break: break-all;"
															border="1" bordercolor="#A2AFCC">
															<colgroup>
																<%-- <col style="width: 10%">
																<col style="width: 16%">
																<col style="width: 29%">
																<col style="width: 16%">
																<col style="width: 29%"> --%>
															</colgroup>
															<tr style="height: 25%">
																<td rowspan="4"
																	style="font-size: 11px; text-align: center; width: 15%">the<br>state<br>of<br>the<br>supply
																</td>
																<td style="font-size: 11px; text-align: center;">number
																</td>
																<td colspan="3"
																	style="font-size: 11px; text-align: center;">137-81-29744</td>
															</tr>
															<tr style="height: 25%">
																<td style="font-size: 7px; text-align: center;">company name</td>
																<td
																	style="font-size: 5px; text-align: center; word-break: break-all;">WOOBOTECH
																</td>
																<td style="font-size: 11px; text-align: center;">name</td>
																<td style="font-size: 11px; text-align: center;">Jung Hae-il</td>
															</tr>
															<tr style="height: 25%">
																<td
																	style="font-size: 11px; text-align: center; width: 20%">address</td>
																<td colspan="3"
																	style="font-size: 8px; text-align: center; width: 80%; word-break: break-all" id="wjuso">
																	
																	${board[0].loc }
																		
																</td>
															</tr>
															<tr style="height: 25%">
																<td style="font-size: 11px; text-align: center;">the state of one's<br> business conditions</td>
																<td style="font-size: 11px; text-align: center;">Produce</td>
																<td style="font-size: 11px; text-align: center;">type</td>
																<td style="font-size: 11px; text-align: center;">Automotive Parts</td>
															</tr>

														</table>
													</td>
												</tr>
											</table>

											<table border="1">
												<tr>
													<td style="width: 55%; border: hidden;">
														<table>
															<thead>
																<tr>
																	<th
																		style="text-align: center; font-size: 13px; width: 5%"">LOT
																		NO</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 20%">standard</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 45%">item name</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%"">delivery</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%">printing status</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%">incoming shipment</th>


																</tr>
															</thead>
															<tbody>

																<c:choose>
																	<c:when test="${ board.size() > 0 }">
																		<c:forEach var="vo" items="${ board }"
																			varStatus="status">
																		<c:set var="i" value="${i+1 }"/>	

																			<tr style="height: 30px;">
																				<td style="text-align: center; font-size: 13px">${vo.madate}</td>
																				<!-- <td style="text-align: center; visibility:hidden; font-size: 13px">${vo.itemcode1}</td> -->
																				<td style="text-align: center; font-size: 13px">${vo.itemqty}</td>
																				<td style="text-align: center; font-size: 13px; line-height: 115%;">
																					${fn:replace(vo.itemname,replaceChar,"<br/>")}
																				</td>
																				<td class="number"
																					style="text-align: center; font-size: 13px">${vo.i_qty}</td>
																				
																				<c:choose>
																					<c:when test="${pageview eq 'mng_trns_data'}">
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text${vo.label_idx}"></span></td>
																					</c:when>
																					
																					<c:when test="${pageview eq 'mng_re_trns_data'}">
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text${i}">Reissue</span></td>
																					</c:when>

																					<c:otherwise>
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text${vo.label_idx}"></span></td>
																					</c:otherwise>
																				</c:choose>

																				<c:choose>
																					<c:when test="${pageview eq 'mng_trns_data'}">
																						<td style="text-align: center; font-size: 13px; padding: 0 0 0 0;">
																							<input type="button"
																								class="btn btn-success"
																								onclick="fnLabelViewSet(${vo.label_idx})"
																								value="label printing" style="font-size:12px; margin: 0px; border: 0px;" />
																								</td>
																					</c:when>
																					
																					<c:when test="${pageview eq 'mng_re_trns_data'}">
																						<td style="text-align: center; font-size: 13px; padding: 0 0 0 0;">
																							
																							<input type="button"
																								id="${vo.itemcode1 }+reTrnsBtn"
																								class="btn btn-success"
																								onclick="fnReLabel('${vo.itemcode1}')"
																								value="Label reprinting" style="font-size:12px; margin: 0px; border: 0px;"
																								disabled />
																						</td>
																					</c:when>

																					<c:otherwise>
																						<td style="text-align: center; font-size: 13px"><span
																							class="label"></span></td>
																					</c:otherwise>
																				</c:choose>
																			</tr>

																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="12">There is nothing to indicate in the specification.</td>
																		</tr>
																	</c:otherwise>

																</c:choose>
																<%-- <c:forEach var="i" begin="1" end="${9 - board.size()}">

																	<tr style="height: 30px;">
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center">&nbsp;</td>
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center; font-size: 13px"></td>
																	</tr>

																</c:forEach> --%>
															</tbody>
														</table>
													</td>
												</tr>
											</table>
											<table>
												<tr>
													<td style="width: 55%; border: hidden;">
														<table>
															<tr style="height: 100px">
																<td style="width: 20%; text-align: center;" rowspan="2">
																	ETC
																</td>

																<td
																	style="width: 80%; text-align: center; padding-left: 10px"
																	rowspan="2"><span id="p_memo"> ${memo}</span></td>
															</tr>
														</table>
													</td>

													<td style="width: 5%; border: hidden;"></td>

													<td style="width: 40%; border: hidden;">
														<table>
															<tr style="height: 50px">
																<td style="text-align: center;" rowspan="2">Payment
																</td>

																<td style="text-align: center; width: 30%">Incoming inspection</td>
																<td style="text-align: center; width: 30%">Material inspection</td>
																<td style="text-align: center; width: 30%">name</td>
															</tr>
															<tr style="height: 50px">
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
										<!--  //★★★★★삭제예정220721★★★★★시작 -->
										<%-- <td width="50%">
											<div class="row"
												style="width: 100%; margin-bottom: 10px; text-align: center">
												<span style="font-size: 20px"><U><B>거래명세표</B></U></span><br>
												(공급받는자용)

											</div>
											
											<div>
											<div class="row" style="float: right;">
												<div class="row"
													style="width: 35%; margin-right: 30px; margin-bottom: 10px; text-align: center;">
													<img src="/resimg/woobo/barcode/${barcode}.png"
														style="width: 200px; height: 40px;">
												</div>
											</div>
											
											<div class="row" style="margin-left: 10px; float: left;">
												<!-- <span style="font-size: 12px">작성일자 : ${outdate}</span> -->
												<span style="font-size: 12px">작성일자 :</span> &nbsp; <input
													type="text" id="outdate2" name="outdate2"
													style="width: 100px; border:0 solid black;" value="${prdate}" readonly/>

												<!-- <input type="text" id="outdate" name="outdate" value="${outdate} ">  -->
											</div>
											</div>

											<table style="border: hidden;">

												<tr>
													<td width="49%">
														<table width="100%" border="1" bordercolor="#A2AFCC">
															<colgroup>
																<col style="width: 10%">
																<col style="width: 16%">
																<col style="width: 29%">
																<col style="width: 16%">
																<col style="width: 29%">
															</colgroup>
															<tr>
																<td rowspan="4"
																	style="font-size: 11px; vertical-align: center; align-items: center">공<br>급<br>자
																</td>
																<td style="font-size: 11px; text-align: center;">번호
																</td>
																<td colspan="3"
																	style="font-size: 11px; text-align: center;">${cu_sano}</td>
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">상호</td>
																<td style="font-size: 5px; text-align: center;">${cu_sangho}
																</td>
																<td style="font-size: 11px; text-align: center;">성명</td>
																<td style="font-size: 11px; text-align: center;">${cu_master}</td>
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">주소</td>
																<c:choose>
																	<c:when test="${null ne cu_juso }">
																		<td colspan="3"
																			style="font-size: 9px; text-align: center;">${bak_juso}</td>
																	</c:when>
																	<c:otherwise>
																		<td colspan="3"
																			style="font-size: 9px; text-align: center;">${cu_juso}</td>
																	</c:otherwise>
																</c:choose>
																<!--  <td colspan="3" -->
																<!-- style="font-size: 8px; text-align: center;">${cu_juso}</td> -->
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

													<td width="2%" style="border: hidden;"></td>

													<td width="49%">
														<table style="width: 100%" border="1"
															bordercolor="#A2AFCC">
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
																<td style="font-size: 9px; text-align: center;">(주)우보테크
																</td>
																<td style="font-size: 11px; text-align: center;">성명</td>
																<td style="font-size: 11px; text-align: center;">정해일</td>
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">주소</td>
																<td colspan="3"
																	style="font-size: 9px; text-align: center;" id="wjuso2">
																	
																	${board[0].loc }
																
																</td>
															</tr>
															<tr>
																<td style="font-size: 11px; text-align: center;">업태</td>
																<td style="font-size: 11px; text-align: center;">제조
																</td>
																<td style="font-size: 11px; text-align: center;">종목</td>
																<td style="font-size: 11px; text-align: center;">자동차
																	부품</td>
															</tr>

														</table>
													</td>
												</tr>
											</table>




											<table border="1">
												<tr>
													<td style="width: 55%; border: hidden;">
														<table>
															<thead>
																<tr>
																	<th
																		style="text-align: center; font-size: 13px; width: 5%"">LOT
																		NO</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 20%">규격</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 45%">품명</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%"">납품</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%">발행여부</th>
																	<th
																		style="text-align: center; font-size: 13px; width: 10%">입하</th>


																</tr>
															</thead>
															<tbody>

																<c:choose>
																	<c:when test="${ board.size() > 0 }">
																		<c:forEach var="vo" items="${ board }"
																			varStatus="status">

																			<tr style="height: 30px;">
																				<td style="text-align: center; font-size: 13px">${vo.madate}</td>
																				<!--<td style="text-align: center;  visibility:hidden; font-size: 13px">${vo.itemcode1}</td> -->
																				<td style="text-align: center; font-size: 13px">${vo.itemqty}</td>
																				<td style="text-align: center; font-size: 13px; line-height: 115%;">
																					${fn:replace(vo.itemname,replaceChar,"<br/>")}
																				</td>
																				<td class="number"
																					style="text-align: center; font-size: 13px">${vo.i_qty}</td>
																				<td style="text-align: center; font-size: 13px"></td>
																				<td style="text-align: center; font-size: 13px"></td>

																			</tr>

																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="12">명세서에 표기할 내용이 없습니다.</td>
																		</tr>
																	</c:otherwise>

																</c:choose>--%>
																<%-- <c:forEach var="i" begin="1" end="${9 - board.size()}">

																	<tr style="height: 30px;">
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center">&nbsp;</td>
																		<td style="text-align: center; font-size: 13px"></td>
																		<td style="text-align: center; font-size: 13px"></td>
																	</tr>

																</c:forEach> --%>
															<%-- </tbody>
														</table>
													</td>
												</tr>
											</table>


											<table border="1">
												<tr>
													<td style="width: 55%; border: hidden;">
														<table>
															<tr style="height: 100px">
																<td style="width: 20%; text-align: center;" rowspan="2">
																	비<br>고
																</td>

																<td
																	style="width: 80%; text-align: center; padding-left: 10px"
																	rowspan="2"><span id="p_memo2"> ${memo}</span></td>
															</tr>
														</table>
													</td>

													<td style="width: 5%; border: hidden;"></td>

													<td style="width: 40%; border: hidden;">
														<table>
															<tr style="height: 50px">
																<td style="text-align: center;" rowspan="2">결<br>재
																</td>

																<td style="text-align: center; width: 30%">수입검사</td>
																<td style="text-align: center; width: 30%">자재검사</td>
																<td style="text-align: center; width: 30%">담당</td>
															</tr>
															<tr style="height: 50px">
																<td></td>
																<td></td>
															</tr>
														</table>
													</td>
												</tr>
											</table>

										</td>--%>
										<!--  //★★★★★삭제예정220721★★★★★끝 -->

									</tr>

								</table>

							</div>
						</page>
				</div>
				</form>
			</div>

		</div>
	</div>
	</div>
	<form id="formT" name="formT" action="mng_print" method="post">
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>

<script type="text/javascript">
	$('td.number').number(true, 0);
	
	$(document).ready(function() {
		//alert(${barcode})
		$("#p_barcode").val('${barcode}');
		
		var trbarcode = ${barcode};
				
		//alert(pageView);
		//alert(trbarcode);
		
		//document.getElementById("reTrnsBtn").style.display="none";
		
		
		
		//var branch = getCookie("branch");
		
		/* if(branch==='000'){
			document.getElementById("wjuso").innerText = '경기도 평택시 청북면 양교1길 134';
			document.getElementById("wjuso2").innerText = '경기도 평택시 청북면 양교1길 134';
		}else if(branck==='001'){
			document.getElementById("wjuso").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
			document.getElementById("wjuso2").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
		} */
		
		var loc1 = document.getElementById("wjuso").innerText;
		//var loc2 = document.getElementById("wjuso2").innerText;
		
		if(loc1==='000'){
			document.getElementById("wjuso").innerText = 'Al. Armii Krajowej 39, 44-240 Żory';
			//document.getElementById("wjuso2").innerText = '경기도 평택시 청북면 양교1길 134';
		}else if(loc1==='001'){
			document.getElementById("wjuso").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
			//document.getElementById("wjuso2").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
		}
		
		<c:forEach var="vo" items="${ board }"
			varStatus="status">
		<c:set var="n" value="${n+1 }"/>	
		//alert(trbarcode);
		//alert("${vo.itemcode1}");
		//document.getElementById("${vo.itemcode1 }+reTrnsBtn").style.display="none";
		//document.getElementById("reTrnsBtn").hide();
		//alert(trbarcode);
		
		var pno = $('#${vo.itemcode1 }').val();
		//alert(pno);
		
		var lacnt = ${vo.lacnt} * 1;
		//alert(cnt);cnt
		console.log(lacnt);
		if(lacnt>=1){
			//document.getElementById("${vo.itemcode1 }+reTrnsBtn").style.display="block";
			document.getElementById("${vo.itemcode1 }+reTrnsBtn").disabled=false;
			//document.getElementById("labelPrintAll").disabled=false;
			document.getElementById("label_text${n}").innerText = 'print';
		}else{
			document.getElementById("label_text${n}").innerText = 'unprinted';
		}
		
		/* $.ajax({
			type:"get",
			url:"mng_label_exist",
			//dataType:"text",
			data:{
				tradebarcode:trbarcode,
				pno:pno
			}
		}).done(function(data){
			//alert("done!");
			
			console.log(typeof data);
			console.log(data);
			alert(data);
			
			data = data*1
			
			if(data>=1){
				document.getElementById("${vo.itemcode1 }+reTrnsBtn").style.display="block";
			}
		}); */
		
	
	</c:forEach>
		
	});
	
	function jtrnsprint(barcode, memo){
		//var memo = document.getElementById('p_memo2').innerText;
			
		//var amount = ((({board.size()} / 10) + 1) * 10);
		var prdate = $("#outdate").val();
		var amount = $('#all').val();
		if(amount%10!=0){
			amount = (Math.floor(amount/10)+1)*10;
		}else{
			amount = amount;
		}
		var sumqty = document.getElementById('p_sumqty').innerText;
		
		//alert(amount);
				
		//alert("인쇄");
				
		window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo+"&prdate="+prdate+"&sumqty="+sumqty,"Report Print",'height=900, width=1500');
				
	}
	
	function fnPrint(){
		
		var form = $("#formT");
	
		var dt = $("#all_trans_print").html();
		
		$("#dt").val(dt);		
		
		
	 	//form.dt.value='1';
	 
	 	form.submit();
		//alert(data);
	}
	
	function fnReLabel(pno) {
		  
		  var trbarcode = ${barcode}
		
		  //alert("!");
		  //var pno = $('#${vo.itemcode1 }').val();
		  
		  //<c:forEach var="vo" items="${ board }">
		  //<c:set var="i" value="${i+1}"/>
		  	//var pno = $('#${vo.itemcode1 }').val();
		  	//alert(pno);
		  //alert(trbarcode);
		  //</c:forEach>
		  
		  //alert(pno);
		  console.log(pno);
		  
		  //alert(pno);
		  //alert(trbarcode);
		  	
			$.ajax({
				type : "post",
				url : "mng_label_reprint",
				dataType : "html",
				data : {
					pno:pno,
					trbarcode:trbarcode,
				}
			}).done(function(data) {
				//$("#modalPop3").html("");
				$("#modalPop3").modal('hide');
				$("#modalPop2").html("");
				$("#modalPop2").html(data);
				$('#modalPop2').modal({backdrop:'static'});
			});
		}
	
	/*
	  var g_oBeforeBody = document.getElementById('all_trans_print').innerHTML;
	  
      jQuery('.print_btn').click( function() {
			
          // 프린트를 보이는 그대로 나오기위한 셋팅
          window.onbeforeprint = function (ev) {
              document.body.innerHTML = g_oBeforeBody;
          };
          // window.onafterprint 로 다시 화면원복을 해주는게 맞으나,
          // 문제가 있기에 reload로 처리
          var initBody = document.body.innerHTML;
          window.onafterprint = function(){
              document.body.innerHTML = initBody;
          }
          window.print();
         // location.reload();
          // reload를 해주는 이유는 onbeforeprint 이벤트로
          // 화면을 다시 그렸기때문에 스크립트나 여러가지 이벤트가 해지되는 현상이 있음
          // 그래서 임시조치로 reload를 해줌
      });
      */
      
</script>
<script>
$(function() {
	/* $('#p_delivery_date').datepicker({
		format : 'yyyy-mm-dd'
	}); */
	
	$("#outdate").datepicker ({ 
		  format: 'yyyy-mm-dd',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
	
	
});
$(function() {
	$('span.number').number(true, 0);
	
	/* $('#outdate').datepicker({
		format : 'yyyy-mm-dd'
	}); */
	$('#outdate').datepicker({
		format : 'yyyy-mm-dd'
	}).on('change',function(){
		$('.datepicker').hide();
	});
	
});
var cnt = 0;
function changed(obj){
	
	let od2 = document.getElementById('outdate2');
	let changed = $("#outdate").val();	
	
	//alert(changed);
	//od2.style.backgroundColor = 'yellow';
	od2.value = changed;
}

function fnTrnsPop(barcode,prdate){
	var prdate = $("#outdate").val();
	//var chk_already = $('#label_text'+label_idx).text();
	
	//alert("최초발행분");
	
	if("" == prdate){
	  alert("Enter creation date");
	  return;
	}
	 
	/* if(chk_already==='발행완료'){
		window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	}else{
		alert("라벨을 먼저 발행해주세요.");
		return;
	} */	
	var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);
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
	var all = document.getElementById("all").value;
	all = all*1;
	//alert(all);
	
	/* if(cnt==all){
	}else{
		alert("라벨을 먼저 발행해주세요!");
	} */
	
	<c:forEach items="${board}" var = "vo">
	
		var chk = document.getElementById("label_text${vo.label_idx}").innerText;
		
		if(chk==="Issuance completed"){
			cnt = cnt+1;
		}
		
		//alert(cnt);
		
		/* if(cnt<all){
			cnt = 0;
		}else{
			cnt = cnt*1;
		} */
	
	</c:forEach>
	//window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	//alert(${board});
	//var all = Object.keys(${board}).length;
	//alert(all);
	
	//alert(all);
	if(cnt<all){
		cnt = 0;
	}else{
		cnt = cnt*1;
	}
	//alert(cnt);
	var memo2 = document.getElementById('p_memo3').innerText;
	
	//var memo = document.getElementById('p_memo2').innerText;
	
	//var amount = ((({board.size()} / 10) + 1) * 10);
	
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	if(cnt==all){
		cnt = 5;
		$("#print1").removeAttr("onclick");
		$("#print1").attr("onclick","fnTrnsRePop('${barcode}','${prdate}');");
		window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo,"Report Print",'height=1500, width=1000');
		//window.open("mng_print?barcode="+barcode+"&prdate="+prdate+"&memo2="+memo2,  "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	}else{
		alert("Please issue all labels");
	}
}


function fnTrnsRePop(barcode,prdate){
	var prdate = $("#outdate").val();
	//var chk_already = $('#label_text'+label_idx).text();
	
	//alert("재발행분");
	
	if("" == prdate){
	  alert("Enter creation date");
	  return;
	}
	
	/* if(chk_already==='발행완료'){
		window.open("mng_print?barcode="+barcode+"&prdate="+prdate, "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
	}else{
		alert("라벨을 먼저 발행해주세요.");
		return;
	} */	
	var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);
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
	var all = document.getElementById("all").value;
	all = all*1;
	//alert(all);
	var memo2 = document.getElementById('p_memo3').innerText;
	
	//var memo = document.getElementById('p_memo2').innerText;
	var memo = document.getElementById('p_memo').innerText;
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	var sumqty = document.getElementById('p_sumqty').innerText;
	/* if(cnt==all){
	}else{
		alert("라벨을 먼저 발행해주세요!");
	} */
	window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo,"Report Print",'height=500, width=500');
	//alert(${board});
	//var all = Object.keys(${board}).length;
	//alert(all);
	
	//window.open("mng_print?barcode="+barcode+"&text="+text,  "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
}
//★★★★★삭제예정220721★★★★★시작
function fnTrnsForcePop(barcode,prdate){
	var prdate = $("#outdate").val();
	//var chk_already = $('#label_text'+label_idx).text();
	
	//alert("재발행분");
	
	if("" == prdate){
	  alert("Enter creation date");
	  return;
	}
	
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
	//var all = document.getElementById("all").value;
	//all = all*1;
	//alert(all);
	//var memo = document.getElementById('p_memo2').innerText;
	var memo = document.getElementById('p_memo').innerText;
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	/* if(cnt==all){
	}else{
		alert("라벨을 먼저 발행해주세요!");
	} */
	code = prompt('Please enter your password. The temporary password is a1234. It will be changed when it is officially opened.');
	
	if(code === 'a1234'){
		window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo,"Report Print",'height=500, width=500');
	}
	else if(code !== 'a1234'){
		alert("Passwords don't match. Please check the password")
	}
	
	//alert(${board});
	//var all = Object.keys(${board}).length;
	//alert(all);
	
	//window.open("mng_print?barcode="+barcode+"&text="+text,  "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no,left=0, top=0",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
} //★★★★★삭제예정220721★★★★★끝
</script>

<script type="text/javascript">
</script>