<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
<div class="row" style="padding:0 0 0 0;">
	<div class="col-xs-12" style="padding:0 0 0 0;">
		<div class="box" style="padding:0 0 0 0;">
			<!-- /.box-header -->
			<!-- <div class="box-body" style="overflow: scroll;"> -->
			<div class="box-body tableWrapper" style="padding:0 0 0 0;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="100%" 
					class="stripe row-border order-column"  style="margin-top:0px; borderSpacing:0; border-collapse:'collapse';">
					<thead class="thead">
						<tr class="son">
							<th style="text-align: center;" class="buyPlan">Overall order</th>
							<th style="text-align: center;" class="buyPlan">Hide</th>
							<th style="text-align: center; " class="buyPlan">partner<br>(partner Code)</th>
							<th style="text-align: center; " class="buyPlan">Item code<br>(item name)</th>
							<th style="text-align: center;" class="buyPlan">Car</th>
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
							<th style="text-align: center;"><input type="hidden"
								class="icheck buyPlan" name="boxAll" id="check_box1"
								onclick="checkAll(this, 'box1');" value="${str_day1}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay1}' /></th>
							<th style="text-align: center;"class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box2"
								onclick="checkAll(this, 'box2');" value="${str_day2}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay2}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box3"
								onclick="checkAll(this, 'box3');" value="${str_day3}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay3}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box4"
								onclick="checkAll(this, 'box4');" value="${str_day4}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay4}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box5"
								onclick="checkAll(this, 'box5');" value="${str_day5}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay5}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box6"
								onclick="checkAll(this, 'box6');" value="${str_day6}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay6}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box7"
								onclick="checkAll(this, 'box7');" value="${str_day7}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay7}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box8"
								onclick="checkAll(this, 'box8');" value="${str_day8}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay8}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box9"
								onclick="checkAll(this, 'box9');" value="${str_day9}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay9}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box10"
								onclick="checkAll(this, 'box10');" value="${str_day10}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay10}' /></th>
							<th style="text-align: center; " class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box11"
								onclick="checkAll(this, 'box11');" value="${str_day11}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay11}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box12"
								onclick="checkAll(this, 'box12');" value="${str_day12}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay12}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box13"
								onclick="checkAll(this, 'box13');" value="${str_day13}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay13}' /></th>
							<th style="text-align: center;" class="buyPlan"><input type="hidden"
								class="icheck" name="boxAll" id="check_box14"
								onclick="checkAll(this, 'box14');" value="${str_day14}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${strDay14}' /></th>
							<th style="text-align: center; width: 5%" class="buyPlan">Total</th>
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
									<tr class="buyPlan" style="height: 70px;" id="tr_${i }">
										<td class="buyPlan" style="text-align: center;">${i }</td>
										<td class="buyPlan" style="text-align: center;"><img src="resources/img/hideImg.png"  style="height: 20px; cursor:pointer;" onclick="hideRow('${i }')"></td>
										<td class="buyPlan"><span class="custname"><a href ="javascript:mailSend(${vo.custcode});">${vo.custname}</a></span><br>(<span
											class="custcode">${vo.custcode}</span>)</td>
										<td class="buyPlan"><span class="itemcode1">${vo.itemcode1}</span><br>
											<span class="itemname">${vo.itemname}</span></td>
										<td class="buyPlan"><span class="car_type">${vo.car_type}</span> <span
											class="unit" style="display: none;">${vo.unit}</span></td>
										<c:if test="${vo.day1c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<!--class="tr" -->
													<td width="60%" 
														style="border: hidden; padding: 2px; font-size: 15pt;" >
														<input type="checkbox" name="box1"
														id="box1${status.count}" value="${vo.day1}"
														onclick="checkValue(this.id,'box1','lot1_${status.count}','day1_${status.count}')">&nbsp;<span
														class="number tqty ">${vo.day1}</span>
														<%-- (<span id="${vo.day1 }">${-vo.day1 + vo.income1 }</span>) --%>
														(<span id="${vo.day1 }" class="number">${vo.income1 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day1" id="day1_${status.count}"
														value="${vo.day1}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot1_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day1_lot"
																	id="lot1_${status.count}" autocomplete="off"
																	name="day1_lot" value="" size="10"
																	placeholder="dd-mm-yyyy"
																	style="display: none; width: 85px;"> --%>
																			
														<input type="text" placeholder="dd-mm-yyyy" class="day1_lot" id="lot1_${status.count}" name="day1_lot" readonly
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
										</td>
										</c:if>
										<c:if test="${vo.day1c == 0}">
											<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<!--class="tr" -->
													<td width="60%" 
														style="border: hidden; padding: 2px; font-size: 15pt;" >
														<input type="checkbox" name="box1"
														id="box1${status.count}" value="${vo.day1}"
														onclick="checkValue(this.id,'box1','lot1_${status.count}','day1_${status.count}')">&nbsp;<span
														class="number tqty ">${vo.day1}</span>
														<%-- (<span id="${vo.day1 }">${-vo.day1 + vo.income1 }</span>) --%>
														(<span id="${vo.day1 }" class="number">${vo.income1 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day1" id="day1_${status.count}"
														value="${vo.day1}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot1_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day1_lot"
																	id="lot1_${status.count}" autocomplete="off"
																	name="day1_lot" value="" size="10"
																	placeholder="dd-mm-yyyy"
																	style="display: none; width: 85px;"> --%>
																			
														<input type="text" placeholder="dd-mm-yyyy" class="day1_lot" id="lot1_${status.count}" name="day1_lot" readonly
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
										</td>
										</c:if>
										<c:if test="${vo.day2c ==1}">
											<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box2"
														id="box2${status.count}" value="${vo.day2}"
														onclick="checkValue(this.id,'box2','lot2_${status.count}','day2_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day2}</span>
														<%-- (<span id="${vo.day2 }">${-vo.day2 + vo.income2 }</span>) --%>
														(<span id="${vo.day2 }" class="number">${vo.income2 }</span>)
													</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day2" id="day2_${status.count}"
														value="${vo.day2}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">

												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot2_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day2_lot"
														id="lot2_${status.count}" autocomplete="off"
														name="day2_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day2_lot" id="lot2_${status.count}" name="day2_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day2c == 0}">
											<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box2"
														id="box2${status.count}" value="${vo.day2}"
														onclick="checkValue(this.id,'box2','lot2_${status.count}','day2_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day2}</span>
														<%-- (<span id="${vo.day2 }">${-vo.day2 + vo.income2 }</span>) --%>
														(<span id="${vo.day2 }" class="number">${vo.income2 }</span>)
													</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day2" id="day2_${status.count}"
														value="${vo.day2}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">

												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot2_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day2_lot"
														id="lot2_${status.count}" autocomplete="off"
														name="day2_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day2_lot" id="lot2_${status.count}" name="day2_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day3c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box3"
														id="box3${status.count}" value="${vo.day3}"
														onclick="checkValue(this.id,'box3','lot3_${status.count}','day3_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day3}</span>
														<%-- (<span id="${vo.day3 }">${-vo.day3 + vo.income3 }</span>) --%>
														(<span id="${vo.day3 }" class="number">${vo.income3 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day3" id="day3_${status.count}"
														value="${vo.day3}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot3_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day3_lot"
														id="lot3_${status.count}" autocomplete="off"
														name="day3_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day3_lot" id="lot3_${status.count}" name="day3_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if >
										
										<c:if test="${vo.day3c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box3"
														id="box3${status.count}" value="${vo.day3}"
														onclick="checkValue(this.id,'box3','lot3_${status.count}','day3_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day3}</span>
														<%-- (<span id="${vo.day3 }">${-vo.day3 + vo.income3 }</span>) --%>
														(<span id="${vo.day3 }" class="number">${vo.income3 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day3" id="day3_${status.count}"
														value="${vo.day3}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot3_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day3_lot"
														id="lot3_${status.count}" autocomplete="off"
														name="day3_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day3_lot" id="lot3_${status.count}" name="day3_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day4c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box4"
														id="box4${status.count}" value="${vo.day4}"
														onclick="checkValue(this.id,'box4','lot4_${status.count}','day4_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day4}</span>
														<%-- (<span id="${vo.day4 }">${-vo.day4 + vo.income4 }</span>) --%>
														(<span id="${vo.day4 }" class="number">${vo.income4 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day4" id="day4_${status.count}"
														value="${vo.day4}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot4_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day4_lot"
														id="lot4_${status.count}" autocomplete="off"
														name="day4_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day4_lot" id="lot4_${status.count}" name="day4_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day4c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box4"
														id="box4${status.count}" value="${vo.day4}"
														onclick="checkValue(this.id,'box4','lot4_${status.count}','day4_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day4}</span>
														<%-- (<span id="${vo.day4 }">${-vo.day4 + vo.income4 }</span>) --%>
														(<span id="${vo.day4 }" class="number">${vo.income4 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day4" id="day4_${status.count}"
														value="${vo.day4}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot4_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day4_lot"
														id="lot4_${status.count}" autocomplete="off"
														name="day4_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day4_lot" id="lot4_${status.count}" name="day4_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day5c == 1}">
										<td  bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box5"
														id="box5${status.count}" value="${vo.day5}"
														onclick="checkValue(this.id,'box5','lot5_${status.count}','day5_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day5}</span>
														<%-- (<span id="${vo.day5 }">${-vo.day5 + vo.income5 }</span>) --%>
														(<span id="${vo.day5 }" class="number">${vo.income5 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day5" id="day5_${status.count}"
														value="${vo.day5}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot5_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day5_lot"
														id="lot5_${status.count}" autocomplete="off"
														name="day5_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day5_lot" id="lot5_${status.count}" name="day5_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day5c == 0}"
										>
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box5"
														id="box5${status.count}" value="${vo.day5}"
														onclick="checkValue(this.id,'box5','lot5_${status.count}','day5_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day5}</span>
														<%-- (<span id="${vo.day5 }">${-vo.day5 + vo.income5 }</span>) --%>
														(<span id="${vo.day5 }" class="number">${vo.income5 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day5" id="day5_${status.count}"
														value="${vo.day5}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot5_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day5_lot"
														id="lot5_${status.count}" autocomplete="off"
														name="day5_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day5_lot" id="lot5_${status.count}" name="day5_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day6c == 1}" >
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box6"
														id="box6${status.count}" value="${vo.day6}"
														onclick="checkValue(this.id,'box6','lot6_${status.count}','day6_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day6}</span>
														<%-- (<span id="${vo.day6 }">${-vo.day6 + vo.income6 }</span>) --%>
														(<span id="${vo.day6 }" class="number">${vo.income6 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day6" id="day6_${status.count}"
														value="${vo.day6}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot6_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day6_lot"
														id="lot6_${status.count}" autocomplete="off"
														name="day6_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day6_lot" id="lot6_${status.count}" name="day6_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day6c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box6"
														id="box6${status.count}" value="${vo.day6}"
														onclick="checkValue(this.id,'box6','lot6_${status.count}','day6_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day6}</span>
														<%-- (<span id="${vo.day6 }">${-vo.day6 + vo.income6 }</span>) --%>
														(<span id="${vo.day6 }" class="number">${vo.income6 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day6" id="day6_${status.count}"
														value="${vo.day6}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot6_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day6_lot"
														id="lot6_${status.count}" autocomplete="off"
														name="day6_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day6_lot" id="lot6_${status.count}" name="day6_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day7c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box7"
														id="box7${status.count}" value="${vo.day7}"
														onclick="checkValue(this.id,'box7','lot7_${status.count}','day7_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day7}</span>
														<%-- (<span id="${vo.day7 }">${-vo.day7 + vo.income7 }</span>) --%>
														(<span id="${vo.day7 }" class="number">${vo.income7 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day7" id="day7_${status.count}"
														value="${vo.day7}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot7_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day7_lot"
														id="lot7_${status.count}" autocomplete="off"
														name="day7_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day7_lot" id="lot7_${status.count}" name="day7_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day7c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box7"
														id="box7${status.count}" value="${vo.day7}"
														onclick="checkValue(this.id,'box7','lot7_${status.count}','day7_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day7}</span>
														<%-- (<span id="${vo.day7 }">${-vo.day7 + vo.income7 }</span>) --%>
														(<span id="${vo.day7 }" class="number">${vo.income7 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day7" id="day7_${status.count}"
														value="${vo.day7}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot7_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day7_lot"
														id="lot7_${status.count}" autocomplete="off"
														name="day7_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day7_lot" id="lot7_${status.count}" name="day7_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day8c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table bgcolor="#ec971f"style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box8"
														id="box8${status.count}" value="${vo.day8}"
														onclick="checkValue(this.id,'box8','lot8_${status.count}','day8_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day8}</span>
														<%-- (<span id="${vo.day8 }">${-vo.day8 + vo.income8 }</span>) --%>
														(<span id="${vo.day8 }" class="number">${vo.income8 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day8" id="day8_${status.count}"
														value="${vo.day8}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot8_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day8_lot"
														id="lot8_${status.count}" autocomplete="off"
														name="day8_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day8_lot" id="lot8_${status.count}" name="day8_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day8c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box8"
														id="box8${status.count}" value="${vo.day8}"
														onclick="checkValue(this.id,'box8','lot8_${status.count}','day8_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day8}</span>
														<%-- (<span id="${vo.day8 }">${-vo.day8 + vo.income8 }</span>) --%>
														(<span id="${vo.day8 }" class="number">${vo.income8 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day8" id="day8_${status.count}"
														value="${vo.day8}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot8_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day8_lot"
														id="lot8_${status.count}" autocomplete="off"
														name="day8_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day8_lot" id="lot8_${status.count}" name="day8_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day9c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box9"
														id="box9${status.count}" value="${vo.day9}"
														onclick="checkValue(this.id,'box9','lot9_${status.count}','day9_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day9}</span>
														<%-- (<span id="${vo.day9 }">${-vo.day9 + vo.income9 }</span>) --%>
														(<span id="${vo.day9 }" class="number">${vo.income9 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day9" id="day9_${status.count}"
														value="${vo.day9}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot9_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day9_lot"
														id="lot9_${status.count}" autocomplete="off"
														name="day9_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day9_lot" id="lot9_${status.count}" name="day9_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day9c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box9"
														id="box9${status.count}" value="${vo.day9}"
														onclick="checkValue(this.id,'box9','lot9_${status.count}','day9_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day9}</span>
														<%-- (<span id="${vo.day9 }">${-vo.day9 + vo.income9 }</span>) --%>
														(<span id="${vo.day9 }" class="number">${vo.income9 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day9" id="day9_${status.count}"
														value="${vo.day9}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot9_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day9_lot"
														id="lot9_${status.count}" autocomplete="off"
														name="day9_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day9_lot" id="lot9_${status.count}" name="day9_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day10c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box10"
														id="box10${status.count}" value="${vo.day10}"
														onclick="checkValue(this.id,'box10','lot10_${status.count}','day10_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day10}</span>
														<%-- (<span id="${vo.day10 }">${-vo.day10 + vo.income10 }</span>) --%>
														(<span id="${vo.day10 }" class="number">${vo.income10 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day5" id="day10_${status.count}"
														value="${vo.day10}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot10_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day10_lot"
														id="lot10_${status.count}" autocomplete="off"
														name="day10_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day10_lot" id="lot10_${status.count}" name="day10_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day10c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box10"
														id="box10${status.count}" value="${vo.day10}"
														onclick="checkValue(this.id,'box10','lot10_${status.count}','day10_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day10}</span>
														<%-- (<span id="${vo.day10 }">${-vo.day10 + vo.income10 }</span>) --%>
														(<span id="${vo.day10 }" class="number">${vo.income10 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day5" id="day10_${status.count}"
														value="${vo.day10}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot10_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day10_lot"
														id="lot10_${status.count}" autocomplete="off"
														name="day10_lot" value="" size="10"
														placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day10_lot" id="lot10_${status.count}" name="day10_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day11c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box11"
														id="box11${status.count}" value="${vo.day11}"
														onclick="checkValue(this.id,'box11','lot11_${status.count}','day11_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day11}</span>
														<%-- (<span id="${vo.day11 }">${-vo.day11 + vo.income11 }</span>) --%>
														(<span id="${vo.day11 }" class="number">${vo.income11 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day11"
														id="day11_${status.count}" value="${vo.day11}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot11_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day11_lot"
														id="lot11_${status.count}" value="" size="10"
														name="day11_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day11_lot" id="lot11_${status.count}" name="day11_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day11c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box11"
														id="box11${status.count}" value="${vo.day11}"
														onclick="checkValue(this.id,'box11','lot11_${status.count}','day11_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day11}</span>
														<%-- (<span id="${vo.day11 }">${-vo.day11 + vo.income11 }</span>) --%>
														(<span id="${vo.day11 }" class="number">${vo.income11 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day11"
														id="day11_${status.count}" value="${vo.day11}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot11_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day11_lot"
														id="lot11_${status.count}" value="" size="10"
														name="day11_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day11_lot" id="lot11_${status.count}" name="day11_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day12c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box12"
														id="box12${status.count}" value="${vo.day12}"
														onclick="checkValue(this.id,'box12','lot12_${status.count}','day12_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day12}</span>
														<%-- (<span id="${vo.day12 }">${-vo.day12 + vo.income12 }</span>) --%>
														(<span id="${vo.day12 }" class="number">${vo.income12 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day12"
														id="day12_${status.count}" value="${vo.day12}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot12_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day12_lot"
														id="lot12_${status.count}" value="" size="10"
														name="day12_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day12_lot" id="lot12_${status.count}" name="day12_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day12c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box12"
														id="box12${status.count}" value="${vo.day12}"
														onclick="checkValue(this.id,'box12','lot12_${status.count}','day12_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day12}</span>
														<%-- (<span id="${vo.day12 }">${-vo.day12 + vo.income12 }</span>) --%>
														(<span id="${vo.day12 }" class="number">${vo.income12 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day12"
														id="day12_${status.count}" value="${vo.day12}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot12_${status.count}">Production date[${status.count}]&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day12_lot"
														id="lot12_${status.count}" value="" size="10"
														name="day12_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day12_lot" id="lot12_${status.count}" name="day12_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day13c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box13"
														id="box13${status.count}" value="${vo.day13}"
														onclick="checkValue(this.id,'box13','lot13_${status.count}','day13_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day13}</span>
														<%-- (<span id="${vo.day13 }">${-vo.day13 + vo.income13 }</span>) --%>
														(<span id="${vo.day13 }" class="number">${vo.income13 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day13"
														id="day13_${status.count}" value="${vo.day13}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot13_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day13_lot"
														id="lot13_${status.count}" value="" size="10"
														name="day13_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day13_lot" id="lot13_${status.count}" name="day13_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										<c:if test="${vo.day13c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box13"
														id="box13${status.count}" value="${vo.day13}"
														onclick="checkValue(this.id,'box13','lot13_${status.count}','day13_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day13}</span>
														<%-- (<span id="${vo.day13 }">${-vo.day13 + vo.income13 }</span>) --%>
														(<span id="${vo.day13 }" class="number">${vo.income13 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day13"
														id="day13_${status.count}" value="${vo.day13}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot13_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day13_lot"
														id="lot13_${status.count}" value="" size="10"
														name="day13_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day13_lot" id="lot13_${status.count}" name="day13_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										</c:if>
										
										<c:if test="${vo.day14c == 1}">
										<td bgcolor="#ec971f" style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box14"
														id="box14${status.count}" value="${vo.day14}"
														onclick="checkValue(this.id,'box14','lot14_${status.count}','day14_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day14}</span>
														(<span id="${vo.day14 }" class="number">${vo.income14 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day14"
														id="day14_${status.count}" value="${vo.day14}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot14_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day14_lot"
														id="lot14_${status.count}" value="" size="10"
														name="day14_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day14_lot" id="lot14_${status.count}" name="day14_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
										</td>
										</c:if>
										<c:if test="${vo.day14c == 0}">
										<td style="padding: 0 0 0 0;" class="top buyPlan">

											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box14"
														id="box14${status.count}" value="${vo.day14}"
														onclick="checkValue(this.id,'box14','lot14_${status.count}','day14_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day14}</span>
														(<span id="${vo.day14 }" class="number">${vo.income14 }</span>)
													</td>
													<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
														<input type="text" class="day14"
														id="day14_${status.count}" value="${vo.day14}" size="12"
														style="display: none; width: 70px; text-align: right;">
													</td>
												</tr>
											</table>
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;">
													<td width="40%" style="border: hidden; padding: 2px;">
														<span style="display: none;"
														id="text_lot14_${status.count}">Production date&nbsp; :</span>
													</td>
													<td width="60%" style="border: hidden; padding: 2px;">
														<%-- <input type="text" class="day14_lot"
														id="lot14_${status.count}" value="" size="10"
														name="day14_lot" placeholder="dd-mm-yyyy"
														style="display: none; width: 85px; text-align: right;"> --%>
														<input type="text" placeholder="dd-mm-yyyy" class="day14_lot" id="lot14_${status.count}" name="day14_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
											</td>
											</c:if>
										<td  style="font-size: 15pt;"><span class="number tqty">${vo.day1+vo.day2+vo.day3+vo.day4+vo.day5+vo.day6+vo.day7+vo.day8+vo.day9+vo.day10+vo.day11+vo.day12+vo.day13+vo.day14}</span>
										(<span  class="number">${vo.income1+vo.income2+vo.income3+vo.income4+vo.income5+vo.income6+vo.income7+vo.income8+vo.income9+vo.income10+vo.income11+vo.income12+vo.income13+vo.income14}</span>)</td>

									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="20" style="height: 100px; text-align: center;">No data found.</td>
								</tr>
							</c:otherwise>

						</c:choose>
					</tbody>
				</table>
				<!-- </div> -->
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
$(function() {
	$(".day1_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day2_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day3_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day4_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day5_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day6_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day7_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day8_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day9_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day10_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day11_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day12_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day13_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$(function() {
	$(".day14_lot").datepicker ({ 
		  format: 'dd-mm-yyyy',
		  todayBtn:true,
		  todayBtn:'linked'
		  
	  }).on('change',function(){
			$('.datepicker').hide();
	  });
});
$('span.number').number(true, 0);
	$(function() {
		/* $('input[name="day1_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		
		$('input[name="day2_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day3_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day4_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day5_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day6_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day7_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day8_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day9_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day10_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day11_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day12_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day13_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		});
		$('input[name="day14_lot"]').datepicker({
			format : 'dd-mm-yyyy'
		}).on('change',function(){
			$('.datepicker').hide();
		}); */
		//$("#tablebody").DataTable();
	});
</script>

