<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
tr.space {
  border-bottom: 10px solid #fff;
}

.as {
	background-color:#000000;
	color: #ffffff;
}
@page { size: A4 portrait; margin:0; }   //A4 세로 출력
</style>
  <c:choose>
	<c:when test="${ board.size() > 2 }">
	<div class="modal-dialog" id="label_div" style="width: 60%; height:80%; overflow:scroll; margin-top: 50px">
	</c:when>
	<c:otherwise>
	
	<div class="modal-dialog" id="label_div" style="width: 60%; height:40%; overflow:scroll; margin-top: 50px">
	</c:otherwise>
	</c:choose>
	<div class="modal-content">
		<div class="modal-header">
			<!-- <button type="button" class="close" onclick="fnclose2()"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button> -->
			<h4 class="modal-title"><span> &nbsp;&nbsp;</span><!-- 라벨 바코드 재발행 -->Label Barcode reprinting <!--  <span> &nbsp;&nbsp;</span> <button type="button" class="btn btn-info"
					onclick="print()">발행</button>	<button type="button" class="btn btn-success"
					onclick="fnclose2()">취소</button> --></h4>
			
			<h4 class="modal-title">
					<label style="margin-right:50px;"><input type = "checkbox" name = "chk" value="1" id = "chk" style="margin-right:10px; onclick="asChk(this)">AS </label>
					<button type="button" class="btn btn-info"
					onclick="a4print('${board[0].pno}','${board[0].trbarcode }','${memo }')"><!-- A4 인쇄 -->A4 Print</button>	
					
					<button type="button" class="btn btn-info"
					onclick="a4double('${board[0].pno}','${board[0].trbarcode }','${memo }')"><!-- A4 인쇄(각 2부) -->A4 Print(Part 2 of each)</button>
					
					<button type="button" class="btn btn-info" style="margin-left : 20px;"
					onclick="rejprint('${board[0].pno}','${board[0].trbarcode }','${memo }')"><!-- 라벨 프린터 인쇄 -->Print a Label Printer</button>
					
					<button type="button" class="btn btn-info" 
					onclick="jprintdouble('${board[0].pno}','${board[0].trbarcode }','${memo }')"><!-- 라벨 프린터 인쇄(각 2부) -->Print a Label Printer(Part 2 of each)</button>
					
					<button type="button" class="btn btn-success" style="margin-left:20px;"
					onclick="fnclose2()">Cancel</button></h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="box-body" id="label_print">
			<table style=" width: 100%; padding-left: 15px; padding-right: 15px"  >
									
<!-- 여기까지 -->
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
<!-- 여기까지 -->
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
				<c:choose>
						<c:when test="${ board.size() > 0 }">
							<c:forEach var="vo" items="${ board }" varStatus="status">
									<c:choose>
									<c:when test="${ board.size() >1 }">
									<input type="hidden" value="${board.size() }" id="boardSize">
									<c:if test="${(status.count) %2 ==1}">
										<tr>
									</c:if>				
									
									<td>
											<div class="bar-wrap" style="margin-top: 5px;">
												<table class="table2" width="100%" height="250px"  border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td class="td"  width="20%" style="text-align: center;"><!-- 공급업체 -->supplier</td>
															<!--  <td class="td" colspan="3" width="80%" style="text-align: center;" >${custname}</td> -->
															<td class="td" colspan="3" width="40%" style="text-align: center;" >${vo.cname}</td>
														</tr>
														<tr>
															<td class="td" width="20%" style="text-align: center;"><!-- 품번 -->Part No.</td>
															<td class="td" width="30%" style="text-align: center;"><span style="font-size: 12px;">${vo.pno}</span></td>
															<td class="td" width="20%" style="text-align: center;">Color</td>
															<td class="td" width="30%" style="text-align: center;"><span style="font-size: 12px;">${color }</span></td>
														</tr>
														<tr>
															<td class="td"   width="20%" style="text-align: center;"><!-- 품명 -->Part Name</td>
															
															
															<c:choose>
															    <c:when test="${fn:length( vo.pname )> 20}">
															        <td class="asPname"  colspan="3" width="80%" style="font-size: 12px;text-align: center" id ="asPname${status.count}"><strong>${vo.pname}</strong></td>
															    </c:when>
															    <c:otherwise>
															       <td class="asPname"  colspan="3" width="80%" style="text-align: center" id ="asPname${status.count}"><strong>${vo.pname}</strong></td>
															    </c:otherwise>
															</c:choose>
															
															
														</tr>
														
														
														<tr>
															
															<td class="td" width="20%" style="text-align: center;"><!-- 차종 -->Program</td>
															<c:choose>
																<c:when test="${fn:length( vo.carkind )> 10}">
																	<td class="td"  width="30%" style="text-align: center;"><strong>
																		${fn:substringBefore(vo.carkind,',') } etc
																	</strong></td>
																</c:when>
																<c:otherwise>
																	<td class="td"  width="30%" style="text-align: center;"><strong>${vo.carkind}</strong></td>
																</c:otherwise>
															</c:choose>
															<td class="td" style="text-align: center;">Qty</td>
															<td class="td" style="text-align: center;"><strong>${vo.qty}</strong></td>
															
														</tr>
														
														<tr>
															
															
															<td class="td" style="text-align: center;"><span style="font-size: 12px;">Delivery<br>Date</span></td>
															<fmt:parseDate value='${vo.indate}' var='indate' pattern='yyyy-MM-dd'/>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;"><fmt:formatDate pattern='dd-MM-yyyy' value='${indate}' /></span></td>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;"><!-- 생산일자 -->Lot No.</span></td>
															<fmt:parseDate value='${vo.madate}' var='madate' pattern='yyyy-MM-dd'/>
															<td class="td" style="text-align: center;"><span style="font-size: 12px;"><fmt:formatDate pattern='dd-MM-yyyy' value='${madate}' /></span></td>
														</tr>
														<tr>
															<!-- <td class="td" style="font-size: 12px;text-align: center;">바코드번호</td>
															<td class="td" style="font-size: 12px;text-align: center;">${vo.barcode}</td> -->
															<td class="td" style="font-size: 12px;text-align: center;">ETC<!-- 비고 --></td>
															<!--<td class="td" style="font-size: 12px;text-align: center;"><input type="text" style="border: none; background: transparent;" value="">${memo}</td> -->
															<td class="td" style="font-size: 12px;text-align: center;" colspan="3">${memo}</td>
															
															
														</tr>
														
														
														<tr>
															<td colspan="4" class="td" style="text-align: center; padding-bottom: 0">
															
																<img src ="/resimg/woobo/barcode/${vo.barcode}.png"  style="width: 260px; height: 50px;">	
																
															
															</td>
														</tr>
													</tbody>
												</table>
											</div>
						
									</td>
															
									
									<c:if test="${(status.count) %2 ==0}">
										</tr>
									</c:if>
									</c:when>
									<c:otherwise>
										<tr>
										<td>
											<div class="bar-wrap" style="margin-top: 10px;">
												<table class="table2" width="100%" height="250px" border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
													<tbody>
														<tr>
															<td class="td"   width="20%" style="text-align: center;">Item name</td>
															
															
															<c:choose>
															    <c:when test="${fn:length( vo.pname )> 20}">
															        <td class="td"  colspan="3" width="80%" style="font-size: 12px;"  id ="asPname"><strong>${vo.pname}</strong></td>
															    </c:when>
															    <c:otherwise>
															       <td class="td"  colspan="3" width="80%"  id ="asPname"><strong>${vo.pname}</strong></td>
															    </c:otherwise>
															</c:choose>
															
															
														</tr>
														<tr>
															<td class="td"  width="20%" style="text-align: center;"><!-- 공급업체 -->Supplier</td>
															<td class="td" colspan="3" width="80%" >${vo.cname}</td>
														</tr>
														
														<tr>
															<td class="td" width="20%" style="text-align: center;"><!-- 품번 -->Item code</td>
															<td class="td" width="30%" style="text-align: center;" ><span style="font-size: 12px;">${vo.pno}</span></td>
															<td class="td" width="20%" style="text-align: center;"><!-- 차종 -->Car</td>
															<c:choose>
																<c:when test="${fn:length( vo.carkind )> 10}">
																	<td class="td"  width="30%" style="text-align: center;"><strong>
																		${fn:substringBefore(vo.carkind,',') } etc
																	</strong></td>
																</c:when>
																<c:otherwise>
																	<td class="td"  width="30%" style="text-align: center;"><strong>${vo.carkind}</strong></td>
																</c:otherwise>
															</c:choose>
															
														</tr>
														
														<tr>
															
															<td class="td" style="text-align: center;"><!-- 수량 -->QTY</td>
															<td class="td" style="text-align: center;"><strong>${vo.qty}</strong></td>
															<td class="td" style="text-align: center;"><span style="font-size: 14px;"><!-- 입고일자 -->Date</span></td>
															<fmt:parseDate value='${vo.indate}' var='indate' pattern='yyyy-MM-dd'/>
															<td class="td" style="text-align: center;"><span style="font-size: 14px;"><fmt:formatDate pattern='dd-MM-yyyy' value='${indate}' /></span></td>
															
														</tr>
														<tr>
															<!-- <td class="td" style="font-size: 12px;text-align: center;">바코드번호</td>
															<td class="td" style="font-size: 12px;text-align: center;">${vo.barcode}</td> -->
															<td class="td" style="font-size: 14px;text-align: center;">ETC</td>
															<td class="td" style="font-size: 14px;text-align: center;"></td>
															<td class="td" style="text-align: center;"><span style="font-size: 14px;"><!-- 생산일자 -->Production date</span></td>
															<fmt:parseDate value='${vo.mkdate}' var='mkdate' pattern='yyyy-MM-dd'/>
															<td class="td" style="text-align: center;"><span style="font-size: 14px;"><fmt:formatDate pattern='dd-MM-yyyy' value='${mkdate}' /></span></td>
															
														</tr>
														
														
														<tr>
															<td colspan="4" class="td" style="text-align: center; padding-bottom: 0">
															
																<img src ="/resimg/woobo/barcode/${vo.barcode}.png"  style="width: 260px; height: 50px;">	
																
															
															</td>
														</tr>
													</tbody>
												</table>
											</div>
						
									</td>
									<td style="width:50%">
											<div class="bar-wrap" style="margin-top: 20px;" >
											</div>
						
									</td>
									</tr>
									
									
									
									</c:otherwise>
									</c:choose>
									<c:if test="${(status.count) %8 ==0 && board.size()>status.count}">
									<tr>
									</tr>
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
<!-- 여기까지 -->
									<tr class="space">
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
										
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
										
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									<tr class="space">
									</tr>
									
									</c:if>	
									
														
							</c:forEach>
						</c:when>
				</c:choose>
			</table>
		</div>
		<div class="box-footer" >
			<div class="col-xs-7; text-center"> <!-- col-xs-8 ,pull-right -->
					<button type="button" class="btn btn-info"
					onclick="a4print('${board[0].pno}','${board[0].trbarcode }','${memo }')">A4 Print</button>
					
					<button type="button" class="btn btn-info"
					onclick="a4double('${board[0].pno}','${board[0].trbarcode }','${memo }')">A4 Print(Part 2 of each)</button>	
					
					<button type="button" class="btn btn-info" style="margin-left : 20px;"
					onclick="rejprint('${board[0].pno}','${board[0].trbarcode }','${memo }')">Print a Label Printer</button>
					
					<button type="button" class="btn btn-info" 
					onclick="jprintdouble('${board[0].pno}','${board[0].trbarcode }','${memo }')">Print a Label Printer(Part 2 of each)</button>
					
					<button type="button" class="btn btn-success" style="margin-left:20px;"
					onclick="fnclose2()">Cancel</button>
				
			</div>
		</div>
		<!-- /.box-footer -->
	</div>
</div>
<script type="text/javascript">

var boardSize = $("#boardSize").val();
$("#chk").change(function() {
	var element = Number(document.getElementById('.asPname'));
    if(this.checked) {	
    	for(var i = 1 ; i<=boardSize; i++){
    		var id = "asPname"+i;
    		document.getElementById(id).className = 'as';
    	}
    }else{
    	for(var i = 1 ; i<=boardSize; i++){
    		var id = "asPname"+i;
    		document.getElementById(id).classList.remove('as');
    	}
    	document.getElementById("asPname1").classList.remove('as');
    }
});
	
	$(document).ready(function() {
		//alert(${barcode})
		//alert("re");
		//alert(${board.size()} )
		
	});
	
	
	
	
</script>