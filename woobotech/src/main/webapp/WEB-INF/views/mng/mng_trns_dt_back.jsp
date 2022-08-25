<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
@page { size: A4 landscape; margin:0; }   //A4 세로 출력
</style>


<div class="modal-dialog" style="width: 80%;overflow:scroll;" >
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">거래명세서</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form2" id="form2" method="post">
					<div class="box-body" style="text-align: right">
							
						<input type="hidden" id="p_u_id" name="p_u_id" value="">
						<div style="width: 100%">
						        <button type="button" class="btn btn-success pull-right" style="margin-left: 10px"
									onclick="fnclose3()">닫기</button>
								<button type="button" class="btn btn-info pull-right"
									onclick="fnTransPrint()">인쇄</button>
								
							</div>
					<br>
					<br>
						<div id="all_trans_print">	
						<div class="form-group" id="trans_print">
							<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0"  border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
										<thead>
											
											<tr>
												<th colspan="6" style="text-align: center"><img src ="/resimg/woobo/barcode/${barcode}.png"  style="width: 260px; height: 50px;"><br>
												<th colspan="2" style="font-size: 13px">발행일자</th>
												<th colspan="1" style="font-size: 13px">${outdate}</th>
												<th colspan="2" style="font-size: 13px">입고일자</th>
												<th colspan="1" style="font-size: 13px">${indate}</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th rowspan="4" style="text-align: center; font-size: 13px">공<br>급<br>자</th>
												<th  style="font-size: 13px">사업자번호</th>
												<th colspan="4"  style="font-size: 13px">${cu_sano}</th>
												<th rowspan="4"style="text-align: center;font-size: 13px">공<br>급<br>받<br>는<br>자</th>
												<th  style="font-size: 13px">사업자번호</th>
												<th colspan="4"  style="font-size: 13px">137-81-29744</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th  style="font-size: 13px">상호</th>
												<th colspan="4"  style="font-size: 13px">${cu_sangho}</th>
												<th  style="font-size: 13px">상호</th>
												<th colspan="4"  style="font-size: 13px">우보테크</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th  style="font-size: 13px">사업장주소</th>
												<th colspan="4"  style="font-size: 13px">충남 아산시 도고면 신토길46번길 29</th>
												<th  style="font-size: 13px">사업장주소</th>
												<th colspan="4"  style="font-size: 13px">경기도 평택시 청북면 양교1길 134</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th  style="font-size: 13px">업 태</th>
												<th  style="font-size: 13px">제 조</th>
												<th  style="font-size: 13px">종목</th>
												<th colspan="2"  style="font-size: 13px">자동차부품</th>
												<th  style="font-size: 13px">업 태</th>
												<th  style="font-size: 13px">제 조</th>
												<th  style="font-size: 13px">종목</th>
												<th colspan="2"  style="font-size: 13px">자동차부품</th>
											</tr>
											
											
											
										</thead>
								</table>
								
								<table  width="100%"
										class="stripe row-border order-column" cellspacing="0"  border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
								<br>
								<thead>
										<tr>
												<th style="text-align: center;font-size: 13px;width: 5%"">NO</th>
												<th style="text-align: center;font-size: 13px;width: 12%"">생산일자</th>
												<th colspan="5" style="text-align: center;font-size: 13px;width: 37%">품명</th>
												<th style="text-align: center;font-size: 13px;width: 6%"">단위</th>
												<th style="text-align: center; font-size: 13px;width: 10%">수량</th>
												<th style="text-align: center; font-size: 13px;width: 10%">NG</th>
												<th style="text-align: center; font-size: 13px;width: 10%">OK</th>
												<th style="width: 10%">비고</th>
											</tr>
												</thead>
										<tbody>
										
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">

														<tr>
															<td style="text-align: center;font-size: 13px">${status.count}</td>
															<td style="text-align: center;font-size: 13px"">${vo.madate}</td>
															<td colspan="5" style="text-align:center;font-size: 13px">${vo.itemname}</td>
															<td style="text-align:center;font-size: 13px">${vo.unit}</td>
															<td class="number" style="text-align: center;font-size: 13px">${vo.i_qty}</td>
															<td></td>
															<td></td>
															<td ><span class="label"><input type="button"	class="btn btn-success" onclick="fnLabelViewSet(${vo.label_idx})" value="라벨발행하기" style="margin-left: 10x" /></span>
																<span id="label_text${vo.label_idx}"></span>
															</td>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
														<tr>
															<td colspan="12"> 명세서에 표기할 내용이 없습니다.</td>
														</tr>
												</c:otherwise>
												
											</c:choose>
												<c:forEach var="i" begin="1" end="${10- board.size()}">

    												<tr>
													<td style="text-align: center"></td>
													<td style="text-align: center"></td>
													<td colspan="5"></td>
													<td></td>
													<td style="text-align: center">&nbsp;</td>
													<td></td>
													<td></td>
													<td></td>
											   </tr>		

												</c:forEach>
										</tbody>
									</table>
						</div>

						
												<!-- /.box-footer -->
					
					<br>
					<br>
					<br>
					<br>
					<br>
					<hr>
					<br>
					
					
					<div class="form-group" id="trans_print">
							<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0"  border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
										<thead>
											
											<tr>
												<th colspan="6" style="text-align: center"><img src ="/resimg/woobo/barcode/${barcode}.png"  style="width: 260px; height: 50px;"><br>
												<th colspan="2" style="font-size: 13px">발행일자</th>
												<th colspan="1" style="font-size: 13px">${outdate}</th>
												<th colspan="2" style="font-size: 13px">입고일자</th>
												<th colspan="1" style="font-size: 13px">${indate}</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th rowspan="4" style="text-align: center; font-size: 13px">공<br>급<br>자</th>
												<th  style="font-size: 13px">사업자번호</th>
												<th colspan="4"  style="font-size: 13px">${cu_sano}</th>
												<th rowspan="4"style="text-align: center;font-size: 13px">공<br>급<br>받<br>는<br>자</th>
												<th  style="font-size: 13px">사업자번호</th>
												<th colspan="4"  style="font-size: 13px">137-81-29744</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th  style="font-size: 13px">상호</th>
												<th colspan="4"  style="font-size: 13px">${cu_sangho}</th>
												<th  style="font-size: 13px">상호</th>
												<th colspan="4"  style="font-size: 13px">우보테크</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th  style="font-size: 13px">사업장주소</th>
												<th colspan="4"  style="font-size: 13px">충남 아산시 도고면 신토길46번길 29</th>
												<th  style="font-size: 13px">사업장주소</th>
												<th colspan="4"  style="font-size: 13px">경기도 평택시 청북면 양교1길 134</th>
											</tr>
											<tr bgcolor="#F6F6F6">
												<th  style="font-size: 13px">업 태</th>
												<th  style="font-size: 13px">제 조</th>
												<th  style="font-size: 13px">종목</th>
												<th colspan="2"  style="font-size: 13px">자동차부품</th>
												<th  style="font-size: 13px">업 태</th>
												<th  style="font-size: 13px">제 조</th>
												<th  style="font-size: 13px">종목</th>
												<th colspan="2"  style="font-size: 13px">자동차부품</th>
											</tr>
											
											
											
										</thead>
								</table>
								
								<table  width="100%"
										class="stripe row-border order-column" cellspacing="0"  border="1" bordercolor="#A2AFCC" bordercolorlight="#ffffff" bodercolordark="#6c717d" cellspacing="0" cellpadding="0">
								<br>
								<thead>
										<tr>
												<th style="text-align: center;font-size: 13px;width: 5%"">NO</th>
												<th style="text-align: center;font-size: 13px;width: 12%"">생산일자</th>
												<th colspan="5" style="text-align: center;font-size: 13px;width: 37%">품명</th>
												<th style="text-align: center;font-size: 13px;width: 6%"">단위</th>
												<th style="text-align: center; font-size: 13px;width: 10%">수량</th>
												<th style="text-align: center; font-size: 13px;width: 10%">NG</th>
												<th style="text-align: center; font-size: 13px;width: 10%">OK</th>
												<th style="width: 10%">비고</th>
											</tr>
												</thead>
										<tbody>
										
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">

														<tr>
															<td style="text-align: center;font-size: 13px">${status.count}</td>
															<td style="text-align: center;font-size: 13px"">${vo.madate}</td>
															<td colspan="5" style="text-align:center;font-size: 13px">${vo.itemname}</td>
															<td style="text-align:center;font-size: 13px">${vo.unit}</td>
															<td class="number" style="text-align: center;font-size: 13px">${vo.i_qty}</td>
															<td></td>
															<td></td>
															<td ><span class="label"><input type="button"	class="btn btn-success" onclick="fnLabelViewSet(${vo.label_idx})" value="라벨발행하기" style="margin-left: 10x" /></span>
																<span id="label_2text${vo.label_idx}"></span>
															</td>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
														<tr>
															<td colspan="12"> 명세서에 표기할 내용이 없습니다.</td>
														</tr>
												</c:otherwise>
												
											</c:choose>
												<c:forEach var="i" begin="1" end="${10- board.size()}">

    												<tr>
													<td style="text-align: center"></td>
													<td style="text-align: center"></td>
													<td colspan="5"></td>
													<td></td>
													<td style="text-align: center">&nbsp;</td>
													<td></td>
													<td></td>
													<td></td>
											   </tr>		

												</c:forEach>
										</tbody>
									</table>
						</div>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	$('td.number').number(true, 0);
	$(document).ready(function() {
		//alert(${barcode})
		$("#p_barcode").val(${barcode})
		
	});
	
	
	
	
</script>