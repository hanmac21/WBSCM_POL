<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<select id="itemCountPerPage" class="selectpicker">
	<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
	<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
	<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
</select>
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
				<li>&nbsp;&nbsp;</li>
			</c:if>

			<li><a href="javascript:getUserList(${maxPage},'');">&nbsp;&gt;&gt;&nbsp;</a></li>

		</ul>
	</div>
</div>
<script type="text/javascript">
	var itemCnt = $
	{
		itemCount
	};
	$(function() {
		//$("#tablebody").DataTable();
	});
</script>
