<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<!-- /.box-header -->
			<div class="box-body tableWrapper" style="padding: 0 0 0 0px;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="f
				
				nCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="100%"
					class="stripe row-border order-column" cellspacing="0">
					<thead>
					<input type="hidden" id = "pp" value="${itemCountPerPage }">
						<tr>
							<th>Sequence</th>
							<th>Code</th>
							<th>Partner</th>
							<th>Item code</th>
							<th>Item name</th>
							<th>Car</th>
							<!-- th>창고재고</th-->
							<!-- th>출하예정</th -->
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
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay1}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay2}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay3}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay4}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay5}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay6}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay7}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay8}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay9}' />}</th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay10}' />}</th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay11}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay12}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay13}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay14}' /></th>
							<th style="font-size: 10px">Total</th>
							<!-- th>과부족</th-->
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ board.size() > 0 }">
								<c:forEach var="vo" items="${ board }" varStatus="status">

									<c:set var="i" value="${i+1 }" />

									<tr>
										<td style="text-align: center;">${i }</td>
										<td>${vo.custcode}</td>
										<td class="sangho">${vo.cu_sangho}</td>
										<td class="itemcode">${vo.itemcode1}</td>
										<td class="itemname">${vo.itemname}</td>
										<td>${vo.carname}</td>
										 <input type="hidden" id='day${i}' value = "${i}"> 
										<!--  >td></td-->
										<!--  >td></td-->
										
										<!-- 0이 아니면 공란 -->
										<c:if test="${vo.day1c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day1}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day1c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day1}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day2c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day2}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day2c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day2}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day3c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day3}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day3c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day3}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day4c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day4}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day4c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day4}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day5c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day5}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day5c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day5}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day6c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day6}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day6c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day6}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day7c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day7}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day7c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day7}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day8c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day8}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day8c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day8}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day9c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day9}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day9c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day9}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day10c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day10}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day10c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day10}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day11c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day11}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day11c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day11}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day12c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day12}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day12c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day12}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day13c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day13}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day13c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day13}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day14c == 1}">
											<td  bgcolor="#ec971f"  style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day14}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										<c:if test="${vo.day14c == 0}">
											<td style="text-align:right;" > <f:formatNumber var = "num" value="${vo.day14}" type="number"/>${num ne "0" ? num : ""}</td>
										</c:if>
										
										<td class="number" style="text-align:right;">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 ne "0" ? vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 : ""}</td>

									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="21" style="height: 100px; text-align: center;">No data found.</td>
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
 var pp = $('#pp').val();
//★★★★★삭제예정220721★★★★★ 시작
/* for(var i = 1; i<=pp; i++){
	var id2 = '#da1y'+i;
	console.log(id2+"aa"+$(id2).val());
	//console.log($(id2).val());
	if($(id2).val()==1){
		console.log(id2);
		$(id2).prev().css("background-color", "#ec971f");
		$(id2).prev().css("color", "#ffffff");
		
	}
} */
 var a = $('.number3').text();
 

/* var comma = $('.day1').text();
var comma2 = comma.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
$('.day1').text(comma2); */

	/* var itemCnt = $
	{
		itemCount
	};
	$(function() {
		//$("#tablebody").DataTable();
	}); */
	//★★★★★삭제예정220721★★★★★ 끝
</script>
