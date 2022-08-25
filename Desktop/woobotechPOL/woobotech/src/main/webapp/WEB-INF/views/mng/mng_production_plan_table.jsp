<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<!-- /.box-header -->
			<div class="box-body tableWrapper" style="padding: 0 0 0 0px;">
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
												<th>${str_day1}</th>
												<th>${str_day2}</th>
												<th>${str_day3}</th>
												<th>${str_day4}</th>
												<th>${str_day5}</th>
												<th>${str_day6}</th>
												<th>${str_day7}</th>
												<th>${str_day8}</th>
												<th>${str_day9}</th>
												<th>${str_day10}</th>
												<th>${str_day11}</th>
												<th>${str_day12}</th>
												<th>${str_day13}</th>
												<th>${str_day14}</th>
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
															
															<td   style="text-align:right;" > <f:formatNumber var = "num" value="${vo.plan_qty}" type="number"/>${num ne "0" ? num : ""}</td>
															<td   style="text-align:right;" > <f:formatNumber var = "num" value="${vo.stock_qty}" type="number"/>${num ne "0" ? num : ""}</td>
															<td   style="text-align:right;" > <f:formatNumber var = "num" value="${vo.safetystock}" type="number"/>${num ne "0" ? num : ""}</td>
															
															<%-- <td bgcolor="#ec971f"  style="text-align:right;" ><f:formatNumber value=${vo.day1 ne "0" ? vo.day1 : ""} type="number"/></td> --%>
															<c:if test="${vo.dayc1 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day1}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc1 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day1}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc2 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day2}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc2 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day2}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc3 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day3}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc3 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day3}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc4 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day4}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc4 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day4}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc5 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day5}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc5 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day5}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc6 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day6}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc6 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day6}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc7 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day7}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc7 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day7}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc8 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day8}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc8 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day8}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc9 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day9}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc9 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day9}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc10 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day10}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc10 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day10}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc11 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day11}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc11 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day11}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc12 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day12}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc12 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day12}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc13 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day13}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc13 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day13}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc14 == 1}">
																<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day14}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															<c:if test="${vo.dayc14 == 0}">
																<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day14}" type="number"/>${num ne "0" ? num : ""}</td>
															</c:if>
															
															<td  class="number" style="text-align:right">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 ne "0" ? vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 : ""}</td>
															<td  class="number" style="text-align:right">${vo.stock_qty-vo.plan_qty+vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 ne "0" ? vo.stock_qty-vo.plan_qty+vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 : ""}</td>
														</tr>

													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="23"
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
		<div style="width:25%;"><span style="margin-left: 10px;">number : ${ itemCount }</span></div>
		<div style=""><span style="margin-left: 40px; margin-top:10px;">Plans whose quantity has changed within the last 12 hours are displayed with an <span style="background-color:#ec971f" >orange</span> background.</span></div>
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
<script type="text/javascript">
$('.number3').number(true);
/* (function($){$('td.number2').number2( true, 0 );
})
} */
	/* var itemCnt = $
	{
		itemCount
	};
	$(function() {
		//$("#tablebody").DataTable();
	}); */
</script>
