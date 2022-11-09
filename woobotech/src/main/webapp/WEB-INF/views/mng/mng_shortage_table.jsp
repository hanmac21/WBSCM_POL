<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<!-- /.box-header -->
			<div class="box-body tableWrapper" style="padding: 0 0 0 0px;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="100%"
					class="stripe row-border order-column" cellspacing="0">
					<thead>
					<input type="hidden" id = "pp" value="${itemCountPerPage }">
						<tr>
							<th>Sequence</th>
							<!-- <th>Code</th>
							<th>Partner</th> -->
							<th>Item code</th>
							<th>Item name</th>
							<th>Plan</th>
							<th>Basic Stock</th>
							<!-- <th>Car</th> -->
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
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay1}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay2}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay3}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay4}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay5}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay6}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay7}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay8}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay9}' /></th>
							<th style="font-size: 10px"><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay10}' /></th>
							
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
										<%-- <td>${vo.custcode}</td>
										<td class="sangho">${vo.cu_sangho}</td> --%>
										<td class="itemcode">${vo.itemcode1}</td>
										<td class="itemname">${vo.itemname}</td>
										<%-- <td>${vo.carname}</td> --%>
										 <input type="hidden" id='day${i}' value = "${i}"> 
										<td style="text-align:center; padding:0 0 0 0;">
											<table style="margin: 0px; border: 0px;">
												<tr><td>Production</td></tr>
												<tr><td>Stock</td></tr>
												<tr><td>Buy</td></tr>
											</table>
										</td>
										<td id ="bs_${status.count}" style="text-align:center; padding:0 0 0 0;"><f:formatNumber var = "num" value="${vo.stockQty}" type="number"/>${num ne "0" ? num : "0"} </td>
										
										<!-- 0이 아니면 공란 -->
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro1_${status.count}"><f:formatNumber var = "num" value="${vo.day1p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock1_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy1_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day1b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro2_${status.count}"><f:formatNumber var = "num" value="${vo.day2p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock2_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy2_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day2b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro3_${status.count}"><f:formatNumber var = "num" value="${vo.day3p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock3_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy3_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day3b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro4_${status.count}"><f:formatNumber var = "num" value="${vo.day4p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock4_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy4_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day4b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>	
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro5_${status.count}"><f:formatNumber var = "num" value="${vo.day5p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock5_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy5_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day5b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro6_${status.count}"><f:formatNumber var = "num" value="${vo.day6p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock6_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy6_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day6b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro7_${status.count}"><f:formatNumber var = "num" value="${vo.day7p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock7_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy7_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day7b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro8_${status.count}"><f:formatNumber var = "num" value="${vo.day8p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock8_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy8_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day8b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro9_${status.count}"><f:formatNumber var = "num" value="${vo.day9p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock9_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy9_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day9b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "pro10_${status.count}"><f:formatNumber var = "num" value="${vo.day10p}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="stock10_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="buy10_${status.count}"><f:formatNumber var = "num" value="${board2[status.index].day10b}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<%-- <td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td><f:formatNumber var = "num" value="${vo.day11}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td>0</td></tr>
											<tr><td>0</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td><f:formatNumber var = "num" value="${vo.day12}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td>0</td></tr>
											<tr><td>0</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td><f:formatNumber var = "num" value="${vo.day13}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td>0</td></tr>
											<tr><td>0</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td><f:formatNumber var = "num" value="${vo.day14}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td>0</td></tr>
											<tr><td>0</td></tr>
										</table>
										</td> --%>
										
										
										<%-- <td class="number" style="text-align:right;">${vo.day1b+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 ne "0" ? vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14 : ""}</td> --%>

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
		<strong>Copyright &copy; 2022 <a href="#">WOOBOTECH</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>
<script type="text/javascript">
$(document).ready(function() {
	var test = $("#buy_1").text();
	var pro = "";
	var stock="";
	var buy = "";
//한줄확인
	for(var j = 0; j<${ board.size()}; j++){
		for(var i = 0; i<10; i++){
			if(i==0){
				stock=$("#bs_"+(j+1)).text();
				console.log("재고확인 #bs_"+(j+1)+"|"+stock);
			}else{
				stock = $("#stock"+(i)+"_"+(j+1)).text();
			}
			if(stock==null){
				stock=0;
			}
			pro = $("#pro"+(i+1)+"_"+(j+1)).text();
			pro = pro.replace(",","");
			stock = stock.replace(",","");
			buy = buy.replace(",","");
			console.log("재고확인 #pro"+(i+1)+"_"+(j+1)+"|"+pro+"|"+Number(pro));
			buy = $("#buy"+(i+1)+"_"+(j+1)).text();
			var stockN = Number(stock)-Number(pro)+Number(buy);
			var result = stockN.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			console.log(i+"확인"+Number(stock)+"|"+Number(pro)+"|"+Number(buy));
			$("#stock"+(i+1)+"_"+(j+1)).text(result);
			
			
		}
	}
	
});
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
