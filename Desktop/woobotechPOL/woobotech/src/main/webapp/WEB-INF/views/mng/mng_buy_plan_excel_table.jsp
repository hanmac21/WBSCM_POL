<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- ★★★★★삭제예정220721★★★★★  -->
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
<div class="row">

						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body" style="overflow: scroll;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%"
										class="stripe row-border order-column" cellspacing="0">
										<thead>
											<tr>
												<th style="text-align: center; width: 3%;">Sequence
												</th>
												<th style="text-align: center; width: 7%;">Partner<br>(partner code)
												</th>
												<th style="text-align: center; width: 25%;">Item code<br>(item name)
												</th>
												<th style="text-align: center; width: 5%;">Car</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box1"
													onclick="checkAll(this, 'box1');" value="${str_day1}" />${str_day1}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box2"
													onclick="checkAll(this, 'box2');" value="${str_day2}" />${str_day2}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box3"
													onclick="checkAll(this, 'box3');" value="${str_day3}" />${str_day3}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box4"
													onclick="checkAll(this, 'box4');" value="${str_day4}" />${str_day4}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box5"
													onclick="checkAll(this, 'box5');" value="${str_day5}" />${str_day5}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box6"
													onclick="checkAll(this, 'box6');" value="${str_day6}" />${str_day6}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box7"
													onclick="checkAll(this, 'box7');" value="${str_day7}" />${str_day7}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box8"
													onclick="checkAll(this, 'box8');" value="${str_day8}" />${str_day8}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box9"
													onclick="checkAll(this, 'box9');" value="${str_day9}" />${str_day9}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box10"
													onclick="checkAll(this, 'box10');" value="${str_day10}" />${str_day10}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box11"
													onclick="checkAll(this, 'box11');" value="${str_day11}" />${str_day11}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box12"
													onclick="checkAll(this, 'box12');" value="${str_day12}" />${str_day12}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box13"
													onclick="checkAll(this, 'box13');" value="${str_day13}" />${str_day13}</th>
												<th style="text-align: center;"><input type="hidden"
													class="icheck" name="boxAll" id="check_box14"
													onclick="checkAll(this, 'box14');" value="${str_day14}" />${str_day14}</th>
												<th style="text-align: center; width: 5%;">Total</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
														<c:set var="i" value="${i+1 }"/>
														<tr style="height: 40px;">
															<td style="text-align: center;">${i }</td>
															<td><span class="custname">${vo.custname}</span><br> (<span
																class="custcode">${vo.custcode}</span>)</td>
															<td><span class="itemcode1">${vo.itemcode1}</span><br>
																<span class="itemname">${vo.itemname}</span></td>
															<td><span class="car_type">${vo.car_type}</span> <span
																class="unit" style="display: none;">${vo.unit}</span></td>
															<td>

																<span class="number" style="font-size:15pt">${vo.day1}</span>
																		
															</td>
															<td>

																<span class="number" style="font-size:15pt">${vo.day2}</span>
																		
															</td>


															<td>

																<span class="number" style="font-size:15pt">${vo.day3}</span>
																		
															</td>

															<td>

																<span class="number" style="font-size:15pt">${vo.day4}</span>
																		
															</td>

															<td>

																<span class="number" style="font-size:15pt">${vo.day5}</span>
																		
															</td>
															<td>

																<span class="number" style="font-size:15pt">${vo.day6}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day7}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day8}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day9}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day10}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day11}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day12}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day13}</span>
																		
															</td>
															
															<td>

																<span class="number" style="font-size:15pt">${vo.day14}</span>
																		
															</td>
															
															<td class="number" style="font-size: 15pt;">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14}</td>

														</tr>

													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="18" style="height: 100px; text-align: center;">No data found.</td>
													</tr>
												</c:otherwise>

											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>





<script type="text/javascript">
$('span.number').number(true, 0);
	$(function() {
		$('input[name="day1_lot"]').datepicker({
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
		});
		//$("#tablebody").DataTable();
	});
</script>

