<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "<br><br>"); %>

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
	<div class="modal-dialog" style="width: 55%; overflow: scroll;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id="close"
					aria-label="Close">
					<!-- <span aria-hidden="true">&times;</span> -->
				</button>
				
				<div style="float:left;">
					<h4 class="modal-title">반출증</h4>
				</div>
				
				<div style="width: 100%" style="float: right;">
								<button type="button" class="btn btn-success pull-right modal-close"
									style="margin-left: 10px" onclick="fnClCon()">닫기</button>
				
								<%-- <c:choose> --%>
								
									<%-- <c:when test="">
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="exportPop()">인쇄</button>
										<button type="button" class="btn btn-info pull-right print_btn" id="print2"  
											style="margin-left: 10px" onclick="fnTrnsForcePop('')">인쇄 (라벨발행 무시)</button>
									</c:when>	
									<c:otherwise> --%>
										<button type="button" class="btn btn-info pull-right print_btn" id="print1"  
											style="margin-left: 15px" onclick="exportprint('${barcode}','${indate }','${cname}')">인쇄</button>
									<%-- </c:otherwise> --%>
									
								<%-- </c:choose>	 --%>
								<%-- <button type="button" class="btn btn-info pull-right print_btn" 
									style="margin-left: 10px" onclick="fnTrnsPop('${barcode}','${prdate}')">Report</button> --%>
									
								<button type="button" class="btn btn-warning pull-right"
									style="margin-right: 10px" onclick="fnMemoSet('')" id="ok">적용</button>
								<!-- <input type="text" class="pull-right"
									placeholder="비고에 들어갈 내용을 작성하세요" value=""  
									style="width: 300px; height: 30px; margin-right: 10px"
									id="s_memo1" onKeypress="javascript:if(event.keyCode==13){$('#ok').click(); $('#s_memo1').val('');}">
								<span class="pull-right" style="margin-top:5px; margin-right: 5px;">비고 :  </span>	 -->
								<!-- ★★★★★삭제예정220721★★★★★시작 -->
								<c:forEach var="vo" items="" varStatus="status">
									<c:choose>
										<c:when test="">
											<button type="button" class="btn  btn-warning pull-right"
												style="margin-right: 10px"
												onclick="fnDelivertView('','배송중')"
												style="font-size: 15px">출하준비중</button>
										</c:when>

										<c:when test="">
											<input type="button" class="btn  btn-primary pull-right"
												style="margin-right: 10px"
												onclick="fndelivery_u2('','배송완료')"
												style="font-size: 15px" value="배송중" />
										</c:when>
										<c:otherwise>
											<input type="button" class="btn  btn-info pull-right"
												style="margin-right: 10px" style="font-size: 15px"
												value="배송완료" />
										</c:otherwise>
									</c:choose>
								</c:forEach> 
								<!-- ★★★★★삭제예정220721★★★★★끝 -->
								<input type="hidden" value="">
							</div>
			</div>
			<div class="modal-body" id="modalbody1">
				<div class="">
				<!-- <div class="box box-info"> -->

					<!-- /.box-header -->
					<!-- form start -->
							<input type="hidden" id="p_u_id" name="p_u_id" value="">
							
							<page size="A4">

							<div id="all_trans_print">

								<table style="border: 3px solid #00C0EF; width: 100%; padding: 0 0 0 0;">
									<tr>
										<td width="50%">
											
											<div class="row"
												style="width: 100%; margin-bottom: 10px; text-align: center">
												<span style="font-size: 20px"><U><B>반출증</B></U></span><br>
												(공급자용)
												<input type="hidden"  value="${board.size() }" id="all"/>
											</div>
											<div>
												<div class="row" style="float: right;">
													<div class="row"
														style="width: 35%; margin-right: 30px; margin-bottom: 10px; text-align: center;">
														<%-- <img src="/resimg/woobo/barcode/${barcode}.png"
															style="width: 200px; height: 40px;"> --%>
													</div>
												</div>
												<div class="row" style="margin-left: 10px; float: left;">			
													<%-- <span style="font-size: 12px; ">수량합계 :</span> &nbsp; &nbsp;<span id="p_sumqty" style="height:26px;"><fmt:formatNumber value="" pattern="#,##0" /></span><br>										
													<span style="font-size: 12px">발행순번 : </span> &nbsp; <input type="text" id="s_memo2" name="s_memo2" style="width: 100px" 
													 onKeypress="javascript:if(event.keyCode==13){$('#ok2').click(); $('#s_memo2').val('');}"/>
													<button type="button" class="btn" onclick="fnMemoSet2('')" style="font-size: 12px;" id="ok2">적용</button> <br> --%>
													<!-- <span style="font-size: 12px">작성일자 : ${outdate}</span> -->
													<span style="font-size: 12px">작성일자 :</span> &nbsp; <input
														type="text" id="outdate" name="outdate", autocomplete='off', 
														style="width: 100px" value="${prdate}" onchange="changed(this)"/>
														<button type="button" class="btn" onclick="fnMemoSet3('')" style="font-size: 12px;" id="ok2">적용</button> <br>
													<!-- <input type="text" id="outdate" name="outdate" value="${outdate} ">  -->
													
												</div>
											</div>

											<table
												style="border: hidden; width: 100%; word-wrap: break-all;">
												
												<tr>
													<td width="49%">
														<table border="1" bordercolor="#A2AFCC"
															style="width: 100%; word-break: break-all">
															<thead>
															<colgroup>
																<col style="width: 4%">
																<col style="width: 6%">
																<col style="width: 13%">
																<col style="width: 12%">
																<col style="width: 15%">
																<col style="width: 10%">
																<col style="width: 10%">
																<col style="width: 30%">
																
															</colgroup>
															<tr>
																<th colspan="2" style="font-size: 13px; text-align: center;">반출부서</th>
																<th style="font-size: 13px; text-align: center;">구매관리팀</th>
																<th style="font-size: 13px; text-align: center;">담당구역</th>														
																<th style="font-size: 13px; text-align: center;">H/rest A/rest</th>
																<th colspan="2" style="font-size: 13px; text-align: center;">관리번호</th>
																<th style="font-size: 13px; text-align: center;">${barcode}</th>
															</tr>
															<tr>
																<th style="font-size: 13px; text-align: center;">번호</th>
																<th style="font-size: 13px; text-align: center;">차종</th>
																<th colspan="3" style="font-size: 13px; text-align: center;">품명</th>
																<th style="font-size: 13px; text-align: center;">단위</th>
																<th style="font-size: 13px; text-align: center;">수량</th>
																<th style="font-size: 13px; text-align: center;">반출사유</th>
															</tr>
															<tr>
																
															</tr>
															<tr>
																
															</tr>
														</thead>
														<tbody>
															<c:choose>
																	
																	<c:when test="${ board.size() > 0 }">
																		<c:forEach var="vo" items="${ board }"
																			varStatus="status">
																		<c:set var="i" value=""/>	

																			<tr style="height: 30px;">
																				<td style="text-align: center; font-size: 13px">${status.count}</td>
																				<td style="text-align: center; font-size: 13px">${vo.carname}</td>
																				<td colspan="3" style="text-align: center; font-size: 13px">${vo.itemname}</td>
																				<td style="text-align: center; font-size: 13px">EA</td>
																				<td style="text-align: center; font-size: 13px">${vo.i_qty}</td>
																				<%-- <td style="text-align: center; visibility:hidden; font-size: 13px">${vo.itemcode1}</td> --%>
																				<td style="text-align: center; font-size: 13px"><input type="text" style="width:250px; border:none;"></td>
																				<%-- <td style="text-align: center; font-size: 13px; line-height: 115%;">
																					${fn:replace(vo.itemname,replaceChar,"<br/>")}
																				</td>
																				<td class="number"
																					style="text-align: center; font-size: 13px"></td>
																				 --%>
																				<%-- <c:choose>
																					<c:when test="${pageview eq 'mng_export_data'}">
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text$"></span></td>
																					</c:when>
	
																					<c:otherwise>
																						<td style="text-align: center; font-size: 13px"><span
																							id="label_text"></span></td>
																					</c:otherwise>
																				</c:choose> --%>

																				<%-- <c:choose>
																					<c:when test="${pageview eq 'mng_export_data'}">
																						<td style="text-align: center; font-size: 13px; padding: 0 0 0 0;">
																							<input type="button"
																								class="btn btn-success"
																								onclick="fnLabelViewSet()"
																								value="라벨발행" style="font-size:12px; margin: 0px; border: 0px;" />
																								</td>
																					</c:when>

																					<c:otherwise>
																						<td style="text-align: center; font-size: 13px"><span
																							class="label"></span></td>
																					</c:otherwise>
																				</c:choose> --%>
																			</tr>

																		</c:forEach>
																	</c:when>
																	<c:otherwise>
																		<tr>
																			<td colspan="12">명세서에 표기할 내용이 없습니다.</td>
																		</tr>
																	</c:otherwise>

																</c:choose>
														</tbody>
														</table>
													</td>
												</tr>
											</table>

											<table border="1">
												<tr>
													<td style="width: 55%; border: hidden; ">
														<table>
															<thead>
															<colgroup>
																<col style="width: 10%">
																<col style="width: 15%">
																<col style="width: 11%">
																<col style="width: 12%">
																<col style="width: 12%">
																<col style="width: 10%">
																<col style="width: 30%">
																
															</colgroup>
																<tr>
																	<td rowspan="2" style="text-align: center; font-size: 11px;">업체명</td>
																	<td rowspan="2" style="text-align: center; font-size: 11px;">${cname}</td>
																	<td style="text-align: center; font-size: 11px; ">발송자</td>
																	<td colspan="2" style="text-align: center; font-size: 11px;"><input type="text" style="border:none; width:200px;"></td>
																	<td style="text-align: center; font-size: 11px; ">확인</td>
																	<td style="text-align: center; font-size: 11px; "></td>
																</tr>
																<tr>
																	<td style="text-align: center; font-size: 11px; ">수령자</td>
																	<td colspan="2" style="text-align: center; font-size: 11px;"><input type="text" style="border:none;  width:200px;"></td>
																	<td style="text-align: center; font-size: 11px; ">확인</td>
																	<td style="text-align: center; font-size: 11px; "></td>
																</tr>
															</thead>
															<tbody>

															</tbody>
														</table>
													</td>
												</tr>
											</table>
										</td>
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
	$('td.number').number(true, 0);
	
	$(document).ready(function() {
		//alert(${barcode})
		$("#p_barcode").val('${barcode}');
		
		var trbarcode = ${barcode};

		
		//var loc1 = document.getElementById("wjuso").innerText;
		//var loc2 = document.getElementById("wjuso2").innerText;
		
		//if(loc1==='000'){
			//document.getElementById("wjuso").innerText = '경기도 평택시 청북면 양교1길 134';
			//document.getElementById("wjuso2").innerText = '경기도 평택시 청북면 양교1길 134';
		//}else if(loc2==='001'){
			//document.getElementById("wjuso").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
			//document.getElementById("wjuso2").innerText = '울산광역시 울주군 언양읍 반천산업로 108-67';
		//}
		
		<c:forEach var="vo" items="${ board }"
			varStatus="status">
		<c:set var="n" value="${n+1 }"/>	
	
		var pno = $('#${vo.itemcode1 }').val();
	
		
	
	</c:forEach>
		
	});
	
	//반출증 인쇄
	function exportprint(barcode,indate,cname){
		var prdate = $('#outdate').val();
		var amount = $('#all').val();
		console.log(cname);
		amount = (Math.floor(amount/10)+1)*15;
		//var sumqty = document.getElementById('p_sumqty').innerText;
		window.open("mng_export_jprint?qprbarcode="+barcode+"&amount="+amount+"&qprdate="+indate+"&prdate="+prdate+"&cname="+encodeURIComponent(encodeURIComponent(cname)),"Report Print",'height=1000, width=1500');		
		//window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo+"&sumqty="+sumqty,"Report Print",'height=500, width=500');
				
	}
	//	//★★★★★삭제예정220721★★★★★시작
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
	
		  console.log(pno);
		
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
	
	//★★★★★삭제예정220721★★★★★끝
      
</script>
<script>
$(function() {
	$('span.number').number(true, 0);
	
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

	od2.value = changed;
}

function exportPop(barcode,prdate){
	var prdate = $("#outdate").val();
	var cname = $('#cname').val();
	
	if("" == prdate){
	  alert("작성일자를 입력하세요");
	  return;
	}
	 
	
	var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);
	
	var all = document.getElementById("all").value;
	all = all*1;
	
	
	<c:forEach items="${board}" var = "vo">
	
		var chk = document.getElementById("label_text${vo.label_idx}").innerText;
		
		if(chk==="발행완료"){
			cnt = cnt+1;
		}

	
	</c:forEach>

	if(cnt<all){
		cnt = 0;
	}else{
		cnt = cnt*1;
	}
	//alert(cnt);
	var memo2 = document.getElementById('p_memo3').innerText;
	
	var memo = document.getElementById('p_memo').innerText;		//220618
	var sumqty = document.getElementById('p_sumqty').innerText;
	
	
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	if(cnt==all){
		cnt = 5;
		$("#print1").removeAttr("onclick");
		$("#print1").attr("onclick","fnTrnsRePop('${barcode}','${prdate}');");
		window.open("mng_export_jprint?qprbarcode="+barcode+"&amount="+15+"&qprdate="+indate,"Report Print",'height=500, width=500');
		//window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo+"&prdate="+prdate+"&sumqty="+sumqty,"Report Print",'height=500, width=500');
	}else{
		alert("라벨을 모두 발행해주세요!");
	}
}
//★★★★★삭제예정220721★★★★★시작
function fnTrnsRePop(barcode,prdate){
	var prdate = $("#outdate").val();
	
	if("" == prdate){
	  alert("작성일자를 입력하세요");
	  return;
	}
	
	var text = prdate.substring(0,4)+"-" +prdate.substring(5,7)+"-" +prdate.substring(8,10);

	var all = document.getElementById("all").value;
	all = all*1;

	var memo2 = document.getElementById('p_memo3').innerText;

	var memo = document.getElementById('p_memo').innerText;
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	var sumqty = document.getElementById('p_sumqty').innerText;

	window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo+"&prdate="+prdate+"&sumqty="+sumqty,"Report Print",'height=500, width=500');
	
}

function fnTrnsForcePop(barcode,prdate){
	var prdate = $("#outdate").val();

	if("" == prdate){
	  alert("작성일자를 입력하세요");
	  return;
	}

	var memo = document.getElementById('p_memo').innerText;			//220618 
	var amount = $('#all').val();
	
	amount = (Math.floor(amount/10)+1)*10;
	
	var sumqty = document.getElementById('p_sumqty').innerText;

	code = prompt('비밀번호를 입력해주세요. 임시비밀번호는 a1234입니다. 정식 오픈 시 변경될 예정입니다.');
	
	if(code === 'a1234'){
		window.open("mng_trns_jprint?barcode="+barcode+"&amount="+amount+"&memo="+memo+"&prdate="+prdate+"&sumqty="+sumqty,"Report Print",'height=500, width=500');
	}
	else if(code !== 'a1234'){
		alert('비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.')
	}

}
//★★★★★삭제예정220721★★★★★끝
</script>

<script type="text/javascript"></script>