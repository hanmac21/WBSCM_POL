<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- 미발행 분은 앞에 1개만 가져와서 표시하기 때문에 별도 jsp 페이지, 컨트롤러에서 분류 2022-04-25 정인우 -->
<%-- <div id="page" style="float:right;">
						<span>페이지 당</span>
							<select id="itemCountPerPage" class="selectpicker"
								style="width: 60px; height: 30px" onchange="getUserList('1')">
								<option value="30" ${itemCountPerPage =='30'  ? 'selected' :'' }>30</option>
								<option value="100" ${itemCountPerPage =='100' ? 'selected' :'' }>100</option>
								<option value="300" ${itemCountPerPage =='300' ? 'selected' :'' }>300</option>
							</select>
						<span>개 씩 표시</span>	
					</div> --%>
<div class="row" id="incomeArea" style="padding:0 0 0 0; width: 100%; display:flex;">
	<!-- <div style="float: left; width:20%;">
	</div> -->

	<div class="col-xs-12" style="padding:0 0 0 0; width:100%; float:left;">
		<div class="box" style="padding:0 0 0 0;">
			<!-- /.box-header -->
			<!-- <div class="box-body" style="overflow: scroll;"> -->
			<div class="box-body tableWrapper" style="padding:0 0 0 0;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="50%"
					class="stripe row-border order-column" cellspacing="0" style="margin-top:0px;">
					<thead class="thead">
						<tr class="son">
							<th style="text-align: center; width: 3%;">Unpublished order number</th>
							<th style="text-align: center; width: 7%">Partner<br>(Partner code)
							</th>
							<th style="text-align: center; width: 25%">Item code<br>(Item name)
							</th>
							<th style="text-align: center; width: 5%">Car</th>
							<th style="text-align: center;"><input type="hidden"
								class="icheck" name="boxAll" id="check_box1"
								onclick="checkAll(this, 'box1');" value="${str_day1}" />${str_day1}</th>
						</tr>
					</thead>
				<!-- </table>
				
				<div style="height: 400px; overflow:auto;" width="100%">	
				<table id="tablebody" width="100%"
					class="stripe row-border order-column scrolltable" cellspacing="0">	 -->
					<tbody>
						<c:choose>
							<c:when test="${ board.size() > 0 }">
								<c:forEach var="vo" items="${ board }" varStatus="status">

									<c:set var="i" value="${i+1 }" />
									<tr style="height: 70px;">
										<td style="text-align: center;">${i }</td>
										<td><span class="custname"><a href ="javascript:mailSend(${vo.custcode});">${vo.custname}</a></span><br>(<span
											class="custcode">${vo.custcode}</span>)</td>
										<td><span class="itemcode1">${vo.itemcode1}</span><br>
											<span class="itemname">${vo.itemname}</span></td>
										<td><span class="car_type">${vo.car_type}</span> <span
											class="unit" style="display: none;">${vo.unit}</span></td>
										<td style="padding: 0 0 0 0;">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<!--class="tr" -->
													<td width="40%"
														style="border: hidden; padding: 2px; font-size: 15pt;">
														<input type="checkbox" name="box1"
														id="box1${status.count}" value="${vo.day1}"
														onclick="checkValue(this.id,'box1','lot1_${status.count}','day1_${status.count}')">&nbsp;<span
														class="number">${vo.day1}</span>
														<%-- (<span id="${vo.day1 }">${-vo.day1 + vo.income1 }</span>) --%>
														(<span id="${vo.day1 }" class="number">${vo.income1 }</span>)
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<input type="text" class="day1" id="day1_${status.count}"
														value="${vo.day1}" size="10"
														style="display: none; width: 120px; text-align: right;">
													</td>
												</tr>

												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot1_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day1_lot"
																	id="lot1_${status.count}" autocomplete="off"
																	name="day1_lot" value="" size="10"
																	placeholder="yyyy-mm-dd"
																	style="display: none; width: 85px;"> --%>
																			
														<input type="date" class="day1_lot" id="lot1_${status.count}" name="day1_lot"
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
										</td>

									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="19" style="height: 100px; text-align: center;">No data found.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
				<!-- </div> -->
			</div>
		</div>
	</div>
	
	<!-- <div style="float: right; width:20%;">
	</div> -->
	
</div>

<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="margin-left: 10px;">number : ${ itemCount }</span>
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
$('span.number').number(true, 0);
	$(function() {
		/* $('input[name="day1_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		
		$('input[name="day2_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day3_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day4_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day5_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day6_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day7_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day8_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day9_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day10_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day11_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day12_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day13_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day14_lot"]').datepicker({
			format : 'yyyy-mm-dd'
		}).on('change',function(){
			$('.datepicker').hide();
		}); */
		//$("#tablebody").DataTable();
	});
</script>

