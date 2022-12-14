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
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay1}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay2}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay3}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay4}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay5}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay6}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay7}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay8}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay9}' /></th>
							<th><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay10}' /></th>
							
							<th style="width:5%">Total</th>
							<th>Expected</th>
							
							<!-- th>과부족</th-->
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ board.size() > 0 }">
								<c:forEach var="vo" items="${ board }" varStatus="status">
									
									<c:set var="i" value="${i+1 }" />
									<c:if test="${division=='001'}">
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
												<tr><td>Sales</td></tr>
												<tr><td>Stock</td></tr>
											</table>
										</td>
										<td id ="bs_${status.count}" style="text-align:center; padding:0 0 0 0;"><f:formatNumber var = "num" value="${vo.stockQty}" type="number"/>${num ne "0" ? num : "0"} </td>
										
										<!-- 0이 아니면 공란 -->
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus1_${status.count}"><f:formatNumber var = "num" value="${vo.day1w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus1_${status.count}"><f:formatNumber var = "num" value="${vo.day1p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock1_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus2_${status.count}"><f:formatNumber var = "num" value="${vo.day2w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus2_${status.count}"><f:formatNumber var = "num" value="${vo.day2p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock2_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus3_${status.count}"><f:formatNumber var = "num" value="${vo.day3w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus3_${status.count}"><f:formatNumber var = "num" value="${vo.day3p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock3_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus4_${status.count}"><f:formatNumber var = "num" value="${vo.day4w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus4_${status.count}"><f:formatNumber var = "num" value="${vo.day4p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock4_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>	
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus5_${status.count}"><f:formatNumber var = "num" value="${vo.day5w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus5_${status.count}"><f:formatNumber var = "num" value="${vo.day5p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock5_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus6_${status.count}"><f:formatNumber var = "num" value="${vo.day6w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus6_${status.count}"><f:formatNumber var = "num" value="${vo.day6p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock6_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus7_${status.count}"><f:formatNumber var = "num" value="${vo.day7w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus7_${status.count}"><f:formatNumber var = "num" value="${vo.day7p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock7_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus8_${status.count}"><f:formatNumber var = "num" value="${vo.day8w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus8_${status.count}"><f:formatNumber var = "num" value="${vo.day8p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock8_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus9_${status.count}"><f:formatNumber var = "num" value="${vo.day9w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus9_${status.count}"><f:formatNumber var = "num" value="${vo.day9p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock9_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus10_${status.count}"><f:formatNumber var = "num" value="${vo.day10w}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus10_${status.count}"><f:formatNumber var = "num" value="${vo.day10p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock10_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										<td style="text-align:right; padding:0 0 0 0;">
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "sum1_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="sum2_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td>ㅤ</td></tr>
										</table>
										</td>
										<td style="text-align:right; padding:0 0 0 0;">
										<table style="margin: 0px; border: 0px;">
											<tr><td>ㅤ</td></tr>
											<tr><td>ㅤ</td></tr>
											<tr><td id="stock_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
										</table>
										</td>
										
									</tr>
									</c:if>
									
									<c:if test="${division=='002'}">
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
												<tr><td>Purchase</td></tr>
												<tr><td>Sales</td></tr>
												<tr><td>Stock</td></tr>
											</table>
										</td>
										<td id ="bs_${status.count}" style="text-align:center; padding:0 0 0 0;"><f:formatNumber var = "num" value="${vo.stockQty}" type="number"/>${num ne "0" ? num : "0"} </td>
										
										<!-- 0이 아니면 공란 -->
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus1_${status.count}"><f:formatNumber var = "num" value="${vo.day1b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus1_${status.count}"><f:formatNumber var = "num" value="${vo.day1p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock1_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus2_${status.count}"><f:formatNumber var = "num" value="${vo.day2b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus2_${status.count}"><f:formatNumber var = "num" value="${vo.day2p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock2_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus3_${status.count}"><f:formatNumber var = "num" value="${vo.day3b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus3_${status.count}"><f:formatNumber var = "num" value="${vo.day3p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock3_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus4_${status.count}"><f:formatNumber var = "num" value="${vo.day4b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus4_${status.count}"><f:formatNumber var = "num" value="${vo.day4p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock4_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>	
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus5_${status.count}"><f:formatNumber var = "num" value="${vo.day5b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus5_${status.count}"><f:formatNumber var = "num" value="${vo.day5p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock5_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus6_${status.count}"><f:formatNumber var = "num" value="${vo.day6b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus6_${status.count}"><f:formatNumber var = "num" value="${vo.day6p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock6_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus7_${status.count}"><f:formatNumber var = "num" value="${vo.day7b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus7_${status.count}"><f:formatNumber var = "num" value="${vo.day7p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock7_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus8_${status.count}"><f:formatNumber var = "num" value="${vo.day8b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus8_${status.count}"><f:formatNumber var = "num" value="${vo.day8p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock8_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus9_${status.count}"><f:formatNumber var = "num" value="${vo.day9b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus9_${status.count}"><f:formatNumber var = "num" value="${vo.day9p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock9_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
										<td style="text-align:right; padding:0 0 0 0;" > 
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "plus10_${status.count}"><f:formatNumber var = "num" value="${vo.day10b}" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="minus10_${status.count}"><f:formatNumber var = "num" value="${vo.day10p}" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td id="stock10_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										<td style="text-align:right; padding:0 0 0 0;">
										<table style="margin: 0px; border: 0px;">
											<tr><td id = "sum1_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td>
											</tr>
											<tr><td id="sum2_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											<tr><td>ㅤ</td></tr>
											
										</table>
										</td>
										<td style="text-align:right; padding:0 0 0 0;">
										<table style="margin: 0px; border: 0px;">
											<tr><td>ㅤ</td></tr>
											<tr><td>ㅤ</td></tr>
											<tr><td id="stock_${status.count}"><f:formatNumber var = "num" value="" type="number"/>${num ne "0" ? num : "0"}</td></tr>
											
										</table>
										</td>
										
									</tr>
									</c:if>
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
		<%-- <div style="width:25%;"><span style="margin-left: 10px;">number : ${ itemCount }</span></div> --%>
		<!-- <div style=""><span style="margin-left: 40px; margin-top:10px;">Plans whose quantity has changed within the last 12 hours are displayed with an <span style="background-color:#ec971f" >orange</span> background.</span></div> -->
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
	var test = $("#minus_1").text();
	var plus = "";
	var stock="";
	var minus = "";
	
//한줄확인
	for(var j = 0; j<${ board.size()}; j++){
		var sum1 = 0;
		var sum2 = 0;
		var stockL = 0;
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
			plus = $("#plus"+(i+1)+"_"+(j+1)).text();
			plus = plus.replace(",","");
			stock = stock.replace(",","");
			minus = $("#minus"+(i+1)+"_"+(j+1)).text();
			minus = minus.replace(",","");
			console.log("재고확인 #plus"+(i+1)+"_"+(j+1)+"|"+plus+"|"+Number(plus));
			var stockN = Number(stock)+Number(plus)-Number(minus);
			var result = stockN.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			console.log(i+"확인"+Number(stock)+"|"+Number(plus)+"|"+Number(minus));
			
			$("#stock"+(i+1)+"_"+(j+1)).text(result);
			if(result<0){
				$("#stock"+(i+1)+"_"+(j+1)).css("color","#ff0000");
			}
			sum1 = sum1+Number(plus);
			sum2 = sum2+Number(minus);
			stockL = result
		}
		$("#sum1"+"_"+(j+1)).text(sum1);
		$("#sum2"+"_"+(j+1)).text(sum2);
		if(stockL<0){
			$("#stock"+"_"+(j+1)).css("color","#ff0000");
		}
		$("#stock"+"_"+(j+1)).text(stockL);
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
