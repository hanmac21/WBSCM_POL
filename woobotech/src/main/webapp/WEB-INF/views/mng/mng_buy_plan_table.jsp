<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							<c:forEach var="ad" items="${ arrayDay }" varStatus="status">
								<c:set var="a" value="${a+1 }" />								
								<th style="text-align: center;">
								<fmt:parseDate value='${ad}' var='tempDay' pattern='yyyyMMdd'/>
								<input type="hidden" class="icheck buyPlan" name="boxAll" id="check_box${a}"
								onclick="checkAll(this, 'box${a}');" value="${ad}" /><fmt:formatDate pattern='dd.MM.yyyy' value='${tempDay}' /></th>
							</c:forEach>
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
									<c:set var="dayTotal" value="0" />
									<c:set var="incomeTotal" value="0" />
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
											
										<c:if test="${arrayCnt >= 15}">
											<td <c:if test="${vo.day1c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day1}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income1 }" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<!--class="tr" -->
														<td width="60%" 
															style="border: hidden; padding: 2px; font-size: 15pt;" >
															<input type="checkbox" name="box1"
															id="box1${status.count}" value="${vo.day1}"
															onclick="checkValue(this.id,'box1','lot1_${status.count}','day1_${status.count}')">&nbsp;<span
															class="number tqty ">${vo.day1}</span>
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
															<input type="text" placeholder="dd-mm-yyyy" class="day1_lot" id="lot1_${status.count}" name="day1_lot" readonly
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
										
											<td <c:if test="${vo.day2c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day2}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income2 }" />
											<table style="margin: 0px; border: 0px;">
												<tr style="height: 15px;" class="tr">
													<td width="60%"
														style="border: hidden; padding: 2px; font-size: 15pt">
														<input type="checkbox" name="box2"
														id="box2${status.count}" value="${vo.day2}"
														onclick="checkValue(this.id,'box2','lot2_${status.count}','day2_${status.count}')">&nbsp;<span
														class="number tqty">${vo.day2}</span>														
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
														<input type="text" placeholder="dd-mm-yyyy" class="day2_lot" id="lot2_${status.count}" name="day2_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
										</td>
										
										<td <c:if test="${vo.day3c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day3}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income3 }" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day3_lot" id="lot3_${status.count}" name="day3_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day4c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day4}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income4 }" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day4_lot" id="lot4_${status.count}" name="day4_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
										</td>
										
										<td <c:if test="${vo.day5c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day5}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income5}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day5_lot" id="lot5_${status.count}" name="day5_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day6c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day6}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income6}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day6_lot" id="lot6_${status.count}" name="day6_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
																				
										<td <c:if test="${vo.day7c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day7}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income7}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day7_lot" id="lot7_${status.count}" name="day7_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day8c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day8}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income8}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day8_lot" id="lot8_${status.count}" name="day8_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day9c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day9}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income9}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day9_lot" id="lot9_${status.count}" name="day9_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day10c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day10}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income10}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day10_lot" id="lot10_${status.count}" name="day10_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day11c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day11}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income11}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day11_lot" id="lot11_${status.count}" name="day11_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day12c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day12}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income12}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day12_lot" id="lot12_${status.count}" name="day12_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
										
										<td <c:if test="${vo.day13c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day13}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income13}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day13_lot" id="lot13_${status.count}" name="day13_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>

										</td>
									
										<td <c:if test="${vo.day14c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
											<c:set var="dayTotal" value="${dayTotal + vo.day14}" />
											<c:set var="incomeTotal" value="${incomeTotal + vo.income14}" />
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
														<input type="text" placeholder="dd-mm-yyyy" class="day14_lot" id="lot14_${status.count}" name="day14_lot" readonly='true'
																value="" size="10" style="width:120px; display:none;"/>
													</td>
												</tr>
											</table>
											</td>
											
											<td <c:if test="${vo.day15c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day15}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income15}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box15"
															id="box15${status.count}" value="${vo.day15}"
															onclick="checkValue(this.id,'box15','lot15_${status.count}','day15_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day15}</span>
															(<span id="${vo.day15 }" class="number">${vo.income15 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day15"
															id="day15_${status.count}" value="${vo.day15}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot15_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day15_lot" id="lot15_${status.count}" name="day15_lot" readonly='true'
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>	
										</c:if>
										<c:if test="${arrayCnt >= 30}">
											<td <c:if test="${vo.day16c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day16}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income16}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box16"
															id="box16${status.count}" value="${vo.day16}"
															onclick="checkValue(this.id,'box16','lot16_${status.count}','day16_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day16}</span>
															(<span id="${vo.day16 }" class="number">${vo.income16 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day16"
															id="day16_${status.count}" value="${vo.day16}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot16_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day16_lot" id="lot16_${status.count}" name="day16_lot" readonly='true'
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day17c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day17}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income17}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box17"
															id="box17${status.count}" value="${vo.day17}"
															onclick="checkValue(this.id,'box17','lot17_${status.count}','day17_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day17}</span>
															(<span id="${vo.day17 }" class="number">${vo.income17 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day17"
															id="day17_${status.count}" value="${vo.day17}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot17_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day17_lot" id="lot17_${status.count}" name="day17_lot" readonly='true'
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day18c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day18}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income18}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box18"
															id="box18${status.count}" value="${vo.day18}"
															onclick="checkValue(this.id,'box18','lot18_${status.count}','day18_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day18}</span>
															(<span id="${vo.day18 }" class="number">${vo.income18 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day18"
															id="day18_${status.count}" value="${vo.day18}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot18_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day18_lot" id="lot18_${status.count}" name="day18_lot" readonly='true'
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day19c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day19}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income19}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box19"
															id="box19${status.count}" value="${vo.day19}"
															onclick="checkValue(this.id,'box19','lot19_${status.count}','day19_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day19}</span>
															(<span id="${vo.day19 }" class="number">${vo.income19 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day19"
															id="day19_${status.count}" value="${vo.day19}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot19_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day19_lot" id="lot19_${status.count}" name="day19_lot" readonly='true'
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day20c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day20}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income20}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box20"
															id="box20${status.count}" value="${vo.day20}"
															onclick="checkValue(this.id,'box20','lot20_${status.count}','day20_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day20}</span>
															(<span id="${vo.day20 }" class="number">${vo.income20 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day20"
															id="day20_${status.count}" value="${vo.day20}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot20_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day20_lot" id="lot20_${status.count}" name="day20_lot" readonly='true'
																	value="" size="10" style="width:120px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day21c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day21}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income21}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box21"
															id="box21${status.count}" value="${vo.day21}"
															onclick="checkValue(this.id,'box21','lot21_${status.count}','day21_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day21}</span>
															(<span id="${vo.day21 }" class="number">${vo.income21 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day21"
															id="day21_${status.count}" value="${vo.day21}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot21_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day21_lot" id="lot21_${status.count}" name="day21_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day22c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day22}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income22}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box22"
															id="box22${status.count}" value="${vo.day22}"
															onclick="checkValue(this.id,'box22','lot22_${status.count}','day22_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day22}</span>
															(<span id="${vo.day22 }" class="number">${vo.income22 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day22"
															id="day22_${status.count}" value="${vo.day22}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot22_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day22_lot" id="lot22_${status.count}" name="day22_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day23c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day23}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income23}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box23"
															id="box23${status.count}" value="${vo.day23}"
															onclick="checkValue(this.id,'box23','lot23_${status.count}','day23_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day23}</span>
															(<span id="${vo.day23 }" class="number">${vo.income23 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day23"
															id="day23_${status.count}" value="${vo.day23}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot23_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day23_lot" id="lot23_${status.count}" name="day23_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day24c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day24}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income24}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box24"
															id="box24${status.count}" value="${vo.day24}"
															onclick="checkValue(this.id,'box24','lot24_${status.count}','day24_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day24}</span>
															(<span id="${vo.day24 }" class="number">${vo.income24 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day24"
															id="day24_${status.count}" value="${vo.day24}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot24_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day24_lot" id="lot24_${status.count}" name="day24_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day25c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day25}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income25}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box25"
															id="box25${status.count}" value="${vo.day25}"
															onclick="checkValue(this.id,'box25','lot25_${status.count}','day25_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day25}</span>
															(<span id="${vo.day25 }" class="number">${vo.income25 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day25"
															id="day25_${status.count}" value="${vo.day25}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot25_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day25_lot" id="lot25_${status.count}" name="day25_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day26c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day26}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income26}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box26"
															id="box26${status.count}" value="${vo.day26}"
															onclick="checkValue(this.id,'box26','lot26_${status.count}','day26_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day26}</span>
															(<span id="${vo.day26 }" class="number">${vo.income26 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day26"
															id="day26_${status.count}" value="${vo.day26}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot26_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day26_lot" id="lot26_${status.count}" name="day26_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day27c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day27}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income27}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box27"
															id="box27${status.count}" value="${vo.day27}"
															onclick="checkValue(this.id,'box27','lot27_${status.count}','day27_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day27}</span>
															(<span id="${vo.day27 }" class="number">${vo.income27 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day27"
															id="day27_${status.count}" value="${vo.day27}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot27_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day27_lot" id="lot27_${status.count}" name="day27_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day28c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day28}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income28}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box28"
															id="box28${status.count}" value="${vo.day28}"
															onclick="checkValue(this.id,'box28','lot28_${status.count}','day28_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day28}</span>
															(<span id="${vo.day28 }" class="number">${vo.income28 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day28"
															id="day28_${status.count}" value="${vo.day28}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot28_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day28_lot" id="lot28_${status.count}" name="day28_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day29c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day29}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income29}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box29"
															id="box29${status.count}" value="${vo.day29}"
															onclick="checkValue(this.id,'box29','lot29_${status.count}','day29_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day29}</span>
															(<span id="${vo.day29 }" class="number">${vo.income29 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day29"
															id="day29_${status.count}" value="${vo.day29}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot29_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day29_lot" id="lot29_${status.count}" name="day29_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day30c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day30}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income30}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box30"
															id="box30${status.count}" value="${vo.day30}"
															onclick="checkValue(this.id,'box30','lot30_${status.count}','day30_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day30}</span>
															(<span id="${vo.day30 }" class="number">${vo.income30 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day30"
															id="day30_${status.count}" value="${vo.day30}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot30_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day30_lot" id="lot30_${status.count}" name="day30_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
										</c:if>
										<c:if test="${arrayCnt >= 60}">
											<td <c:if test="${vo.day31c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day31}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income31}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box31"
															id="box31${status.count}" value="${vo.day31}"
															onclick="checkValue(this.id,'box31','lot31_${status.count}','day31_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day31}</span>
															(<span id="${vo.day31 }" class="number">${vo.income31 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day31"
															id="day31_${status.count}" value="${vo.day31}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot31_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day31_lot" id="lot31_${status.count}" name="day31_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day32c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day32}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income32}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box32"
															id="box32${status.count}" value="${vo.day32}"
															onclick="checkValue(this.id,'box32','lot32_${status.count}','day32_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day32}</span>
															(<span id="${vo.day32 }" class="number">${vo.income32 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day32"
															id="day32_${status.count}" value="${vo.day32}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot32_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day32_lot" id="lot32_${status.count}" name="day32_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day33c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day33}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income33}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box33"
															id="box33${status.count}" value="${vo.day33}"
															onclick="checkValue(this.id,'box33','lot33_${status.count}','day33_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day33}</span>
															(<span id="${vo.day33 }" class="number">${vo.income33 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day33"
															id="day33_${status.count}" value="${vo.day33}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot33_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day33_lot" id="lot33_${status.count}" name="day33_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day34c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day34}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income34}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box34"
															id="box34${status.count}" value="${vo.day34}"
															onclick="checkValue(this.id,'box34','lot34_${status.count}','day34_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day34}</span>
															(<span id="${vo.day34 }" class="number">${vo.income34 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day34"
															id="day34_${status.count}" value="${vo.day34}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot34_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day34_lot" id="lot34_${status.count}" name="day34_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day35c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day35}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income35}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box35"
															id="box35${status.count}" value="${vo.day35}"
															onclick="checkValue(this.id,'box35','lot35_${status.count}','day35_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day35}</span>
															(<span id="${vo.day35 }" class="number">${vo.income35 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day35"
															id="day35_${status.count}" value="${vo.day35}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot35_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day35_lot" id="lot35_${status.count}" name="day35_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day36c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day36}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income36}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box36"
															id="box36${status.count}" value="${vo.day36}"
															onclick="checkValue(this.id,'box36','lot36_${status.count}','day36_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day36}</span>
															(<span id="${vo.day36 }" class="number">${vo.income36 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day36"
															id="day36_${status.count}" value="${vo.day36}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot36_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day36_lot" id="lot36_${status.count}" name="day36_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day37c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day37}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income37}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box37"
															id="box37${status.count}" value="${vo.day37}"
															onclick="checkValue(this.id,'box37','lot37_${status.count}','day37_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day37}</span>
															(<span id="${vo.day37 }" class="number">${vo.income37 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day37"
															id="day37_${status.count}" value="${vo.day37}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot37_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day37_lot" id="lot37_${status.count}" name="day37_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day38c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day38}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income38}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box38"
															id="box38${status.count}" value="${vo.day38}"
															onclick="checkValue(this.id,'box38','lot38_${status.count}','day38_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day38}</span>
															(<span id="${vo.day38 }" class="number">${vo.income38 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day38"
															id="day38_${status.count}" value="${vo.day38}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot38_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day38_lot" id="lot38_${status.count}" name="day38_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day39c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day39}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income39}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box39"
															id="box39${status.count}" value="${vo.day39}"
															onclick="checkValue(this.id,'box39','lot39_${status.count}','day39_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day39}</span>
															(<span id="${vo.day39 }" class="number">${vo.income39 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day39"
															id="day39_${status.count}" value="${vo.day39}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot39_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day39_lot" id="lot39_${status.count}" name="day39_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day40c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day40}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income40}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box40"
															id="box40${status.count}" value="${vo.day40}"
															onclick="checkValue(this.id,'box40','lot40_${status.count}','day40_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day40}</span>
															(<span id="${vo.day40 }" class="number">${vo.income40 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day40"
															id="day40_${status.count}" value="${vo.day40}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot40_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day40_lot" id="lot40_${status.count}" name="day40_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day41c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day41}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income41}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box41"
															id="box41${status.count}" value="${vo.day41}"
															onclick="checkValue(this.id,'box41','lot41_${status.count}','day41_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day41}</span>
															(<span id="${vo.day41 }" class="number">${vo.income41 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day41"
															id="day41_${status.count}" value="${vo.day41}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot41_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day41_lot" id="lot41_${status.count}" name="day41_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day42c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day42}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income42}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box42"
															id="box42${status.count}" value="${vo.day42}"
															onclick="checkValue(this.id,'box42','lot42_${status.count}','day42_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day42}</span>
															(<span id="${vo.day42 }" class="number">${vo.income42 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day42"
															id="day42_${status.count}" value="${vo.day42}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot42_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day42_lot" id="lot42_${status.count}" name="day42_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day43c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day43}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income43}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box43"
															id="box43${status.count}" value="${vo.day43}"
															onclick="checkValue(this.id,'box43','lot43_${status.count}','day43_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day43}</span>
															(<span id="${vo.day43 }" class="number">${vo.income43 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day43"
															id="day43_${status.count}" value="${vo.day43}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot43_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day43_lot" id="lot43_${status.count}" name="day43_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day44c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day44}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income44}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box44"
															id="box44${status.count}" value="${vo.day44}"
															onclick="checkValue(this.id,'box44','lot44_${status.count}','day44_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day44}</span>
															(<span id="${vo.day44 }" class="number">${vo.income44 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day44"
															id="day44_${status.count}" value="${vo.day44}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot44_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day44_lot" id="lot44_${status.count}" name="day44_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day45c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day45}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income45}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box45"
															id="box45${status.count}" value="${vo.day45}"
															onclick="checkValue(this.id,'box45','lot45_${status.count}','day45_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day45}</span>
															(<span id="${vo.day45 }" class="number">${vo.income45 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day45"
															id="day45_${status.count}" value="${vo.day45}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot45_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day45_lot" id="lot45_${status.count}" name="day45_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day46c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day46}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income46}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box46"
															id="box46${status.count}" value="${vo.day46}"
															onclick="checkValue(this.id,'box46','lot46_${status.count}','day46_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day46}</span>
															(<span id="${vo.day46 }" class="number">${vo.income46 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day46"
															id="day46_${status.count}" value="${vo.day46}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot46_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day46_lot" id="lot46_${status.count}" name="day46_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day47c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day47}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income47}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box47"
															id="box47${status.count}" value="${vo.day47}"
															onclick="checkValue(this.id,'box47','lot47_${status.count}','day47_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day47}</span>
															(<span id="${vo.day47 }" class="number">${vo.income47 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day47"
															id="day47_${status.count}" value="${vo.day47}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot47_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day47_lot" id="lot47_${status.count}" name="day47_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day48c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day48}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income48}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box48"
															id="box48${status.count}" value="${vo.day48}"
															onclick="checkValue(this.id,'box48','lot48_${status.count}','day48_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day48}</span>
															(<span id="${vo.day48 }" class="number">${vo.income48 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day48"
															id="day48_${status.count}" value="${vo.day48}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot48_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day48_lot" id="lot48_${status.count}" name="day48_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day49c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day49}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income49}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box49"
															id="box49${status.count}" value="${vo.day49}"
															onclick="checkValue(this.id,'box49','lot49_${status.count}','day49_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day49}</span>
															(<span id="${vo.day49 }" class="number">${vo.income49 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day49"
															id="day49_${status.count}" value="${vo.day49}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot49_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day49_lot" id="lot49_${status.count}" name="day49_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day50c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day50}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income50}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box50"
															id="box50${status.count}" value="${vo.day50}"
															onclick="checkValue(this.id,'box50','lot50_${status.count}','day50_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day50}</span>
															(<span id="${vo.day50 }" class="number">${vo.income50 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day50"
															id="day50_${status.count}" value="${vo.day50}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot50_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day50_lot" id="lot50_${status.count}" name="day50_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day51c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day51}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income51}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box51"
															id="box51${status.count}" value="${vo.day51}"
															onclick="checkValue(this.id,'box51','lot51_${status.count}','day51_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day51}</span>
															(<span id="${vo.day51 }" class="number">${vo.income51 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day51"
															id="day51_${status.count}" value="${vo.day51}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot51_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day51_lot" id="lot51_${status.count}" name="day51_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day52c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day52}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income52}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box52"
															id="box52${status.count}" value="${vo.day52}"
															onclick="checkValue(this.id,'box52','lot52_${status.count}','day52_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day52}</span>
															(<span id="${vo.day52 }" class="number">${vo.income52 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day52"
															id="day52_${status.count}" value="${vo.day52}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot52_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day52_lot" id="lot52_${status.count}" name="day52_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day53c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day53}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income53}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box53"
															id="box53${status.count}" value="${vo.day53}"
															onclick="checkValue(this.id,'box53','lot53_${status.count}','day53_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day53}</span>
															(<span id="${vo.day53 }" class="number">${vo.income53 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day53"
															id="day53_${status.count}" value="${vo.day53}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot53_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day53_lot" id="lot53_${status.count}" name="day53_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day54c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day54}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income54}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box54"
															id="box54${status.count}" value="${vo.day54}"
															onclick="checkValue(this.id,'box54','lot54_${status.count}','day54_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day54}</span>
															(<span id="${vo.day54 }" class="number">${vo.income54 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day54"
															id="day54_${status.count}" value="${vo.day54}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot54_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day54_lot" id="lot54_${status.count}" name="day54_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day55c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day55}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income55}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box55"
															id="box55${status.count}" value="${vo.day55}"
															onclick="checkValue(this.id,'box55','lot55_${status.count}','day55_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day55}</span>
															(<span id="${vo.day55 }" class="number">${vo.income55 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day55"
															id="day55_${status.count}" value="${vo.day55}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot55_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day55_lot" id="lot55_${status.count}" name="day55_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day56c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day56}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income56}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box56"
															id="box56${status.count}" value="${vo.day56}"
															onclick="checkValue(this.id,'box56','lot56_${status.count}','day56_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day56}</span>
															(<span id="${vo.day56 }" class="number">${vo.income56 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day56"
															id="day56_${status.count}" value="${vo.day56}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot56_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day56_lot" id="lot56_${status.count}" name="day56_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day57c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day57}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income57}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box57"
															id="box57${status.count}" value="${vo.day57}"
															onclick="checkValue(this.id,'box57','lot57_${status.count}','day57_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day57}</span>
															(<span id="${vo.day57 }" class="number">${vo.income57 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day57"
															id="day57_${status.count}" value="${vo.day57}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot57_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day57_lot" id="lot57_${status.count}" name="day57_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day58c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day58}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income58}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box58"
															id="box58${status.count}" value="${vo.day58}"
															onclick="checkValue(this.id,'box58','lot58_${status.count}','day58_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day58}</span>
															(<span id="${vo.day58 }" class="number">${vo.income58 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day58"
															id="day58_${status.count}" value="${vo.day58}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot58_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day58_lot" id="lot58_${status.count}" name="day58_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day59c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day59}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income59}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box59"
															id="box59${status.count}" value="${vo.day59}"
															onclick="checkValue(this.id,'box59','lot59_${status.count}','day59_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day59}</span>
															(<span id="${vo.day59 }" class="number">${vo.income59 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day59"
															id="day59_${status.count}" value="${vo.day59}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot59_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day59_lot" id="lot59_${status.count}" name="day59_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day60c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day60}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income60}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box60"
															id="box60${status.count}" value="${vo.day60}"
															onclick="checkValue(this.id,'box60','lot60_${status.count}','day60_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day60}</span>
															(<span id="${vo.day60 }" class="number">${vo.income60 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day60"
															id="day60_${status.count}" value="${vo.day60}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot60_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day60_lot" id="lot60_${status.count}" name="day60_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
										</c:if>
										<c:if test="${arrayCnt >= 90}">
											<td <c:if test="${vo.day61c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day61}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income61}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box61"
															id="box61${status.count}" value="${vo.day61}"
															onclick="checkValue(this.id,'box61','lot61_${status.count}','day61_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day61}</span>
															(<span id="${vo.day61 }" class="number">${vo.income61 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day61"
															id="day61_${status.count}" value="${vo.day61}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot61_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day61_lot" id="lot61_${status.count}" name="day61_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day62c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day62}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income62}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box62"
															id="box62${status.count}" value="${vo.day62}"
															onclick="checkValue(this.id,'box62','lot62_${status.count}','day62_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day62}</span>
															(<span id="${vo.day62 }" class="number">${vo.income62 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day62"
															id="day62_${status.count}" value="${vo.day62}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot62_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day62_lot" id="lot62_${status.count}" name="day62_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day63c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day63}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income63}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box63"
															id="box63${status.count}" value="${vo.day63}"
															onclick="checkValue(this.id,'box63','lot63_${status.count}','day63_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day63}</span>
															(<span id="${vo.day63 }" class="number">${vo.income63 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day63"
															id="day63_${status.count}" value="${vo.day63}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot63_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day63_lot" id="lot63_${status.count}" name="day63_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day64c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day64}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income64}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box64"
															id="box64${status.count}" value="${vo.day64}"
															onclick="checkValue(this.id,'box64','lot64_${status.count}','day64_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day64}</span>
															(<span id="${vo.day64 }" class="number">${vo.income64 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day64"
															id="day64_${status.count}" value="${vo.day64}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot64_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day64_lot" id="lot64_${status.count}" name="day64_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day65c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day65}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income65}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box65"
															id="box65${status.count}" value="${vo.day65}"
															onclick="checkValue(this.id,'box65','lot65_${status.count}','day65_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day65}</span>
															(<span id="${vo.day65 }" class="number">${vo.income65 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day65"
															id="day65_${status.count}" value="${vo.day65}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot65_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day65_lot" id="lot65_${status.count}" name="day65_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day66c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day66}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income66}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box66"
															id="box66${status.count}" value="${vo.day66}"
															onclick="checkValue(this.id,'box66','lot66_${status.count}','day66_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day66}</span>
															(<span id="${vo.day66 }" class="number">${vo.income66 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day66"
															id="day66_${status.count}" value="${vo.day66}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot66_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day66_lot" id="lot66_${status.count}" name="day66_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day67c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day67}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income67}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box67"
															id="box67${status.count}" value="${vo.day67}"
															onclick="checkValue(this.id,'box67','lot67_${status.count}','day67_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day67}</span>
															(<span id="${vo.day67 }" class="number">${vo.income67 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day67"
															id="day67_${status.count}" value="${vo.day67}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot67_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day67_lot" id="lot67_${status.count}" name="day67_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day68c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day68}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income68}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box68"
															id="box68${status.count}" value="${vo.day68}"
															onclick="checkValue(this.id,'box68','lot68_${status.count}','day68_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day68}</span>
															(<span id="${vo.day68 }" class="number">${vo.income68 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day68"
															id="day68_${status.count}" value="${vo.day68}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot68_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day68_lot" id="lot68_${status.count}" name="day68_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day69c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day69}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income69}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box69"
															id="box69${status.count}" value="${vo.day69}"
															onclick="checkValue(this.id,'box69','lot69_${status.count}','day69_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day69}</span>
															(<span id="${vo.day69 }" class="number">${vo.income69 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day69"
															id="day69_${status.count}" value="${vo.day69}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot69_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day69_lot" id="lot69_${status.count}" name="day69_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day70c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day70}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income70}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box70"
															id="box70${status.count}" value="${vo.day70}"
															onclick="checkValue(this.id,'box70','lot70_${status.count}','day70_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day70}</span>
															(<span id="${vo.day70 }" class="number">${vo.income70 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day70"
															id="day70_${status.count}" value="${vo.day70}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot70_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day70_lot" id="lot70_${status.count}" name="day70_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day71c == 1}">bgcolor="#ec971f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day71}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income71}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box71"
															id="box71${status.count}" value="${vo.day71}"
															onclick="checkValue(this.id,'box71','lot71_${status.count}','day71_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day71}</span>
															(<span id="${vo.day71 }" class="number">${vo.income71 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day71"
															id="day71_${status.count}" value="${vo.day71}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot71_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day71_lot" id="lot71_${status.count}" name="day71_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day72c == 1}">bgcolor="#ec972f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day72}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income72}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box72"
															id="box72${status.count}" value="${vo.day72}"
															onclick="checkValue(this.id,'box72','lot72_${status.count}','day72_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day72}</span>
															(<span id="${vo.day72 }" class="number">${vo.income72 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day72"
															id="day72_${status.count}" value="${vo.day72}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot72_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day72_lot" id="lot72_${status.count}" name="day72_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day73c == 1}">bgcolor="#ec973f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day73}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income73}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box73"
															id="box73${status.count}" value="${vo.day73}"
															onclick="checkValue(this.id,'box73','lot73_${status.count}','day73_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day73}</span>
															(<span id="${vo.day73 }" class="number">${vo.income73 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day73"
															id="day73_${status.count}" value="${vo.day73}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot73_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day73_lot" id="lot73_${status.count}" name="day73_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day74c == 1}">bgcolor="#ec974f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day74}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income74}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box74"
															id="box74${status.count}" value="${vo.day74}"
															onclick="checkValue(this.id,'box74','lot74_${status.count}','day74_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day74}</span>
															(<span id="${vo.day74 }" class="number">${vo.income74 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day74"
															id="day74_${status.count}" value="${vo.day74}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot74_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day74_lot" id="lot74_${status.count}" name="day74_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day75c == 1}">bgcolor="#ec975f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day75}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income75}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box75"
															id="box75${status.count}" value="${vo.day75}"
															onclick="checkValue(this.id,'box75','lot75_${status.count}','day75_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day75}</span>
															(<span id="${vo.day75 }" class="number">${vo.income75 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day75"
															id="day75_${status.count}" value="${vo.day75}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot75_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day75_lot" id="lot75_${status.count}" name="day75_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day76c == 1}">bgcolor="#ec976f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day76}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income76}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box76"
															id="box76${status.count}" value="${vo.day76}"
															onclick="checkValue(this.id,'box76','lot76_${status.count}','day76_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day76}</span>
															(<span id="${vo.day76 }" class="number">${vo.income76 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day76"
															id="day76_${status.count}" value="${vo.day76}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot76_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day76_lot" id="lot76_${status.count}" name="day76_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day77c == 1}">bgcolor="#ec977f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day77}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income77}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box77"
															id="box77${status.count}" value="${vo.day77}"
															onclick="checkValue(this.id,'box77','lot77_${status.count}','day77_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day77}</span>
															(<span id="${vo.day77 }" class="number">${vo.income77 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day77"
															id="day77_${status.count}" value="${vo.day77}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot77_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day77_lot" id="lot77_${status.count}" name="day77_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day78c == 1}">bgcolor="#ec978f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day78}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income78}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box78"
															id="box78${status.count}" value="${vo.day78}"
															onclick="checkValue(this.id,'box78','lot78_${status.count}','day78_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day78}</span>
															(<span id="${vo.day78 }" class="number">${vo.income78 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day78"
															id="day78_${status.count}" value="${vo.day78}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot78_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day78_lot" id="lot78_${status.count}" name="day78_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day79c == 1}">bgcolor="#ec979f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day79}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income79}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box79"
															id="box79${status.count}" value="${vo.day79}"
															onclick="checkValue(this.id,'box79','lot79_${status.count}','day79_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day79}</span>
															(<span id="${vo.day79 }" class="number">${vo.income79 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day79"
															id="day79_${status.count}" value="${vo.day79}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot79_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day79_lot" id="lot79_${status.count}" name="day79_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day80c == 1}">bgcolor="#ec980f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day80}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income80}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box80"
															id="box80${status.count}" value="${vo.day80}"
															onclick="checkValue(this.id,'box80','lot80_${status.count}','day80_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day80}</span>
															(<span id="${vo.day80 }" class="number">${vo.income80 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day80"
															id="day80_${status.count}" value="${vo.day80}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot80_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day80_lot" id="lot80_${status.count}" name="day80_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day81c == 1}">bgcolor="#ec981f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day81}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income81}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box81"
															id="box81${status.count}" value="${vo.day81}"
															onclick="checkValue(this.id,'box81','lot81_${status.count}','day81_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day81}</span>
															(<span id="${vo.day81 }" class="number">${vo.income81 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day81"
															id="day81_${status.count}" value="${vo.day81}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot81_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day81_lot" id="lot81_${status.count}" name="day81_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day82c == 1}">bgcolor="#ec982f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day82}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income82}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box82"
															id="box82${status.count}" value="${vo.day82}"
															onclick="checkValue(this.id,'box82','lot82_${status.count}','day82_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day82}</span>
															(<span id="${vo.day82 }" class="number">${vo.income82 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day82"
															id="day82_${status.count}" value="${vo.day82}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot82_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day82_lot" id="lot82_${status.count}" name="day82_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day83c == 1}">bgcolor="#ec983f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day83}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income83}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box83"
															id="box83${status.count}" value="${vo.day83}"
															onclick="checkValue(this.id,'box83','lot83_${status.count}','day83_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day83}</span>
															(<span id="${vo.day83 }" class="number">${vo.income83 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day83"
															id="day83_${status.count}" value="${vo.day83}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot83_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day83_lot" id="lot83_${status.count}" name="day83_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day84c == 1}">bgcolor="#ec984f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day84}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income84}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box84"
															id="box84${status.count}" value="${vo.day84}"
															onclick="checkValue(this.id,'box84','lot84_${status.count}','day84_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day84}</span>
															(<span id="${vo.day84 }" class="number">${vo.income84 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day84"
															id="day84_${status.count}" value="${vo.day84}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot84_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day84_lot" id="lot84_${status.count}" name="day84_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day85c == 1}">bgcolor="#ec985f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day85}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income85}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box85"
															id="box85${status.count}" value="${vo.day85}"
															onclick="checkValue(this.id,'box85','lot85_${status.count}','day85_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day85}</span>
															(<span id="${vo.day85 }" class="number">${vo.income85 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day85"
															id="day85_${status.count}" value="${vo.day85}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot85_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day85_lot" id="lot85_${status.count}" name="day85_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day86c == 1}">bgcolor="#ec986f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day86}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income86}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box86"
															id="box86${status.count}" value="${vo.day86}"
															onclick="checkValue(this.id,'box86','lot86_${status.count}','day86_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day86}</span>
															(<span id="${vo.day86 }" class="number">${vo.income86 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day86"
															id="day86_${status.count}" value="${vo.day86}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot86_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day86_lot" id="lot86_${status.count}" name="day86_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day87c == 1}">bgcolor="#ec987f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day87}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income87}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box87"
															id="box87${status.count}" value="${vo.day87}"
															onclick="checkValue(this.id,'box87','lot87_${status.count}','day87_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day87}</span>
															(<span id="${vo.day87 }" class="number">${vo.income87 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day87"
															id="day87_${status.count}" value="${vo.day87}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot87_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day87_lot" id="lot87_${status.count}" name="day87_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day88c == 1}">bgcolor="#ec988f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day88}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income88}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box88"
															id="box88${status.count}" value="${vo.day88}"
															onclick="checkValue(this.id,'box88','lot88_${status.count}','day88_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day88}</span>
															(<span id="${vo.day88 }" class="number">${vo.income88 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day88"
															id="day88_${status.count}" value="${vo.day88}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot88_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day88_lot" id="lot88_${status.count}" name="day88_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day89c == 1}">bgcolor="#ec989f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day89}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income89}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box89"
															id="box89${status.count}" value="${vo.day89}"
															onclick="checkValue(this.id,'box89','lot89_${status.count}','day89_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day89}</span>
															(<span id="${vo.day89 }" class="number">${vo.income89 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day89"
															id="day89_${status.count}" value="${vo.day89}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot89_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day89_lot" id="lot89_${status.count}" name="day89_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day90c == 1}">bgcolor="#ec990f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day90}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income90}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box90"
															id="box90${status.count}" value="${vo.day90}"
															onclick="checkValue(this.id,'box90','lot90_${status.count}','day90_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day90}</span>
															(<span id="${vo.day90 }" class="number">${vo.income90 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day90"
															id="day90_${status.count}" value="${vo.day90}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot90_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day90_lot" id="lot90_${status.count}" name="day90_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
										</c:if>
										<c:if test="${arrayCnt >= 120}">
											<td <c:if test="${vo.day91c == 1}">bgcolor="#ec991f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day91}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income91}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box91"
															id="box91${status.count}" value="${vo.day91}"
															onclick="checkValue(this.id,'box91','lot91_${status.count}','day91_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day91}</span>
															(<span id="${vo.day91 }" class="number">${vo.income91 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day91"
															id="day91_${status.count}" value="${vo.day91}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot91_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day91_lot" id="lot91_${status.count}" name="day91_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day92c == 1}">bgcolor="#ec992f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day92}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income92}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box92"
															id="box92${status.count}" value="${vo.day92}"
															onclick="checkValue(this.id,'box92','lot92_${status.count}','day92_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day92}</span>
															(<span id="${vo.day92 }" class="number">${vo.income92 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day92"
															id="day92_${status.count}" value="${vo.day92}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot92_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day92_lot" id="lot92_${status.count}" name="day92_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day93c == 1}">bgcolor="#ec993f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day93}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income93}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box93"
															id="box93${status.count}" value="${vo.day93}"
															onclick="checkValue(this.id,'box93','lot93_${status.count}','day93_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day93}</span>
															(<span id="${vo.day93 }" class="number">${vo.income93 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day93"
															id="day93_${status.count}" value="${vo.day93}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot93_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day93_lot" id="lot93_${status.count}" name="day93_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day94c == 1}">bgcolor="#ec994f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day94}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income94}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box94"
															id="box94${status.count}" value="${vo.day94}"
															onclick="checkValue(this.id,'box94','lot94_${status.count}','day94_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day94}</span>
															(<span id="${vo.day94 }" class="number">${vo.income94 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day94"
															id="day94_${status.count}" value="${vo.day94}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot94_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day94_lot" id="lot94_${status.count}" name="day94_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day95c == 1}">bgcolor="#ec995f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day95}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income95}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box95"
															id="box95${status.count}" value="${vo.day95}"
															onclick="checkValue(this.id,'box95','lot95_${status.count}','day95_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day95}</span>
															(<span id="${vo.day95 }" class="number">${vo.income95 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day95"
															id="day95_${status.count}" value="${vo.day95}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot95_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day95_lot" id="lot95_${status.count}" name="day95_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day96c == 1}">bgcolor="#ec996f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day96}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income96}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box96"
															id="box96${status.count}" value="${vo.day96}"
															onclick="checkValue(this.id,'box96','lot96_${status.count}','day96_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day96}</span>
															(<span id="${vo.day96 }" class="number">${vo.income96 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day96"
															id="day96_${status.count}" value="${vo.day96}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot96_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day96_lot" id="lot96_${status.count}" name="day96_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day97c == 1}">bgcolor="#ec997f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day97}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income97}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box97"
															id="box97${status.count}" value="${vo.day97}"
															onclick="checkValue(this.id,'box97','lot97_${status.count}','day97_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day97}</span>
															(<span id="${vo.day97 }" class="number">${vo.income97 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day97"
															id="day97_${status.count}" value="${vo.day97}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot97_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day97_lot" id="lot97_${status.count}" name="day97_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day98c == 1}">bgcolor="#ec998f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day98}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income98}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box98"
															id="box98${status.count}" value="${vo.day98}"
															onclick="checkValue(this.id,'box98','lot98_${status.count}','day98_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day98}</span>
															(<span id="${vo.day98 }" class="number">${vo.income98 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day98"
															id="day98_${status.count}" value="${vo.day98}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot98_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day98_lot" id="lot98_${status.count}" name="day98_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day99c == 1}">bgcolor="#ec999f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day99}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income99}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box99"
															id="box99${status.count}" value="${vo.day99}"
															onclick="checkValue(this.id,'box99','lot99_${status.count}','day99_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day99}</span>
															(<span id="${vo.day99 }" class="number">${vo.income99 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day99"
															id="day99_${status.count}" value="${vo.day99}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot99_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day99_lot" id="lot99_${status.count}" name="day99_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day100c == 1}">bgcolor="#ec1009f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day100}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income100}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box100"
															id="box100${status.count}" value="${vo.day100}"
															onclick="checkValue(this.id,'box100','lot100_${status.count}','day100_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day100}</span>
															(<span id="${vo.day100 }" class="number">${vo.income100 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day100"
															id="day100_${status.count}" value="${vo.day100}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot100_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day100_lot" id="lot100_${status.count}" name="day100_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day101c == 1}">bgcolor="#ec1019f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day101}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income101}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box101"
															id="box101${status.count}" value="${vo.day101}"
															onclick="checkValue(this.id,'box101','lot101_${status.count}','day101_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day101}</span>
															(<span id="${vo.day101 }" class="number">${vo.income101 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day101"
															id="day101_${status.count}" value="${vo.day101}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot101_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day101_lot" id="lot101_${status.count}" name="day101_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day102c == 1}">bgcolor="#ec1029f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day102}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income102}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box102"
															id="box102${status.count}" value="${vo.day102}"
															onclick="checkValue(this.id,'box102','lot102_${status.count}','day102_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day102}</span>
															(<span id="${vo.day102 }" class="number">${vo.income102 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day102"
															id="day102_${status.count}" value="${vo.day102}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot102_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day102_lot" id="lot102_${status.count}" name="day102_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day103c == 1}">bgcolor="#ec1039f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day103}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income103}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box103"
															id="box103${status.count}" value="${vo.day103}"
															onclick="checkValue(this.id,'box103','lot103_${status.count}','day103_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day103}</span>
															(<span id="${vo.day103 }" class="number">${vo.income103 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day103"
															id="day103_${status.count}" value="${vo.day103}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot103_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day103_lot" id="lot103_${status.count}" name="day103_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day104c == 1}">bgcolor="#ec1049f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day104}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income104}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box104"
															id="box104${status.count}" value="${vo.day104}"
															onclick="checkValue(this.id,'box104','lot104_${status.count}','day104_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day104}</span>
															(<span id="${vo.day104 }" class="number">${vo.income104 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day104"
															id="day104_${status.count}" value="${vo.day104}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot104_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day104_lot" id="lot104_${status.count}" name="day104_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day105c == 1}">bgcolor="#ec1059f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day105}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income105}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box105"
															id="box105${status.count}" value="${vo.day105}"
															onclick="checkValue(this.id,'box105','lot105_${status.count}','day105_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day105}</span>
															(<span id="${vo.day105 }" class="number">${vo.income105 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day105"
															id="day105_${status.count}" value="${vo.day105}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot105_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day105_lot" id="lot105_${status.count}" name="day105_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day106c == 1}">bgcolor="#ec1069f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day106}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income106}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box106"
															id="box106${status.count}" value="${vo.day106}"
															onclick="checkValue(this.id,'box106','lot106_${status.count}','day106_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day106}</span>
															(<span id="${vo.day106 }" class="number">${vo.income106 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day106"
															id="day106_${status.count}" value="${vo.day106}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot106_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day106_lot" id="lot106_${status.count}" name="day106_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day107c == 1}">bgcolor="#ec1079f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day107}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income107}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box107"
															id="box107${status.count}" value="${vo.day107}"
															onclick="checkValue(this.id,'box107','lot107_${status.count}','day107_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day107}</span>
															(<span id="${vo.day107 }" class="number">${vo.income107 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day107"
															id="day107_${status.count}" value="${vo.day107}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot107_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day107_lot" id="lot107_${status.count}" name="day107_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day108c == 1}">bgcolor="#ec1089f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day108}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income108}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box108"
															id="box108${status.count}" value="${vo.day108}"
															onclick="checkValue(this.id,'box108','lot108_${status.count}','day108_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day108}</span>
															(<span id="${vo.day108 }" class="number">${vo.income108 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day108"
															id="day108_${status.count}" value="${vo.day108}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot108_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day108_lot" id="lot108_${status.count}" name="day108_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day109c == 1}">bgcolor="#ec1099f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day109}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income109}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box109"
															id="box109${status.count}" value="${vo.day109}"
															onclick="checkValue(this.id,'box109','lot109_${status.count}','day109_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day109}</span>
															(<span id="${vo.day109 }" class="number">${vo.income109 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day109"
															id="day109_${status.count}" value="${vo.day109}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot109_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day109_lot" id="lot109_${status.count}" name="day109_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day110c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day110}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income110}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box110"
															id="box110${status.count}" value="${vo.day110}"
															onclick="checkValue(this.id,'box110','lot110_${status.count}','day110_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day110}</span>
															(<span id="${vo.day110 }" class="number">${vo.income110 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day110"
															id="day110_${status.count}" value="${vo.day110}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot110_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day110_lot" id="lot110_${status.count}" name="day110_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day111c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day111}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income111}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box111"
															id="box111${status.count}" value="${vo.day111}"
															onclick="checkValue(this.id,'box111','lot111_${status.count}','day111_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day111}</span>
															(<span id="${vo.day111 }" class="number">${vo.income111 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day111"
															id="day111_${status.count}" value="${vo.day111}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot111_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day111_lot" id="lot111_${status.count}" name="day111_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day112c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day112}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income112}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box112"
															id="box112${status.count}" value="${vo.day112}"
															onclick="checkValue(this.id,'box112','lot112_${status.count}','day112_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day112}</span>
															(<span id="${vo.day112 }" class="number">${vo.income112 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day112"
															id="day112_${status.count}" value="${vo.day112}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot112_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day112_lot" id="lot112_${status.count}" name="day112_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day113c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day113}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income113}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box113"
															id="box113${status.count}" value="${vo.day113}"
															onclick="checkValue(this.id,'box113','lot113_${status.count}','day113_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day113}</span>
															(<span id="${vo.day113 }" class="number">${vo.income113 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day113"
															id="day113_${status.count}" value="${vo.day113}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot113_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day113_lot" id="lot113_${status.count}" name="day113_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day114c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day114}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income114}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box114"
															id="box114${status.count}" value="${vo.day114}"
															onclick="checkValue(this.id,'box114','lot114_${status.count}','day114_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day114}</span>
															(<span id="${vo.day114 }" class="number">${vo.income114 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day114"
															id="day114_${status.count}" value="${vo.day114}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot114_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day114_lot" id="lot114_${status.count}" name="day114_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day115c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day115}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income115}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box115"
															id="box115${status.count}" value="${vo.day115}"
															onclick="checkValue(this.id,'box115','lot115_${status.count}','day115_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day115}</span>
															(<span id="${vo.day115 }" class="number">${vo.income115 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day115"
															id="day115_${status.count}" value="${vo.day115}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot115_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day115_lot" id="lot115_${status.count}" name="day115_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day116c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day116}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income116}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box116"
															id="box116${status.count}" value="${vo.day116}"
															onclick="checkValue(this.id,'box116','lot116_${status.count}','day116_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day116}</span>
															(<span id="${vo.day116 }" class="number">${vo.income116 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day116"
															id="day116_${status.count}" value="${vo.day116}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot116_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day116_lot" id="lot116_${status.count}" name="day116_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day117c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day117}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income117}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box117"
															id="box117${status.count}" value="${vo.day117}"
															onclick="checkValue(this.id,'box117','lot117_${status.count}','day117_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day117}</span>
															(<span id="${vo.day117 }" class="number">${vo.income117 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day117"
															id="day117_${status.count}" value="${vo.day117}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot117_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day117_lot" id="lot117_${status.count}" name="day117_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day118c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day118}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income118}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box118"
															id="box118${status.count}" value="${vo.day118}"
															onclick="checkValue(this.id,'box118','lot118_${status.count}','day118_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day118}</span>
															(<span id="${vo.day118 }" class="number">${vo.income118 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day118"
															id="day118_${status.count}" value="${vo.day118}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot118_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day118_lot" id="lot118_${status.count}" name="day118_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day119c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day119}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income119}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box119"
															id="box119${status.count}" value="${vo.day119}"
															onclick="checkValue(this.id,'box119','lot119_${status.count}','day119_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day119}</span>
															(<span id="${vo.day119 }" class="number">${vo.income119 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day119"
															id="day119_${status.count}" value="${vo.day119}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot119_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day119_lot" id="lot119_${status.count}" name="day119_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
											<td <c:if test="${vo.day120c == 1}">bgcolor="#ec1109f"</c:if> style="padding: 0 0 0 0;" class="top buyPlan">
												<c:set var="dayTotal" value="${dayTotal + vo.day120}" />
												<c:set var="incomeTotal" value="${incomeTotal + vo.income120}" />
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;" class="tr">
														<td width="60%"
															style="border: hidden; padding: 2px; font-size: 15pt">
															<input type="checkbox" name="box120"
															id="box120${status.count}" value="${vo.day120}"
															onclick="checkValue(this.id,'box120','lot120_${status.count}','day120_${status.count}')">&nbsp;<span
															class="number tqty">${vo.day120}</span>
															(<span id="${vo.day120 }" class="number">${vo.income120 }</span>)
														</td>
														<td align=right width="40%" style="border: hidden; padding: 2px;font-size: 15pt;">
															<input type="text" class="day120"
															id="day120_${status.count}" value="${vo.day120}" size="12"
															style="display: none; width: 70px; text-align: right;">
														</td>
													</tr>
												</table>
												<table style="margin: 0px; border: 0px;">
													<tr style="height: 15px;">
														<td width="40%" style="border: hidden; padding: 2px;">
															<span style="display: none;"
															id="text_lot120_${status.count}">Production date&nbsp; :</span>
														</td>
														<td width="60%" style="border: hidden; padding: 2px;">														
															<input type="text" placeholder="dd-mm-yyyy" class="day120_lot" id="lot120_${status.count}" name="day120_lot" readonly='true'
																	value="" size="10" style="width:121px; display:none;"/>
														</td>
													</tr>
												</table>
											</td>
										</c:if>
										<td  style="font-size: 15pt;"><span class="number tqty">${dayTotal}</span>
										(<span  class="number">${incomeTotal}</span>)</td>

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
		<strong>Copyright &copy; 2022 <a href="#">WOOBOTECH</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>

<script type="text/javascript">

for(var i =1; i<121; i++){
	var dId = ".day"+i+"_lot";
	$(function() {
		$(dId).datepicker ({ 
			  format: 'dd-mm-yyyy',
			  todayBtn:true,
			  todayBtn:'linked'
			  
		  }).on('change',function(){
				$('.datepicker').hide();
		  });
	});
}

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

