<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div style="float:left; font-size:30px; padding: 15px;">
			<img src="resources/img/woobo-logo.png" height="45px" width="60px" style="vertical-align: middle;"> 
			<!-- 실시간 배송 현황 --> Delivery Monitoring
		</div>
	
		<div style="float:right; padding: 15px;">
			<span id="set_timer" class="pull-right"
				style="margin-right: 20px; font-size: 30px;"></span>
		</div>
	
	<hr style="clear: both;">
	<div style="font-size: 25px; text-align: center; padding: 3px; display:flex;">
		<div align="left" style="float: left; width: 33%; padding-left: 15px;">
			<span id="date"></span>
		</div>
		<div align="center" style="float: left; width: 33%;">
			<span>Delivery Status Total ${itemCount } cases</span>
		</div>
		<div align="right" style="float: right; width: 33%; padding-right: 15px;">
			<span>page(${currentPage } / ${maxPage })</span>
		</div>
	</div>
		<!-- <hr style="clear: both; color: white;"> -->
		<table id="tablebody" width="100%"
			class="stripe row-border order-column">
			<thead style="padding-buttom: 30px;">
				<tr class="line head">
					<th style="font-size: 18px; text-align: center; width: 19%;"><!-- 업 체 명 -->Company Name<!-- <br>(Name) -->
					</th>
					<th style="font-size: 18px; text-align: center; width: 25%;">Item Name<!-- <br>(Item) -->
					</th>
					<th style="font-size: 18px; text-align: center; width: 8%;">Departure Area<!-- <br>(From) -->
					</th>
					<th style="font-size: 18px; text-align: center; width: 13%;">Departure Time<!-- <br>(Dep Time) -->
					</th>
					<th style="font-size: 18px; text-align: center; width: 13%;">Arrive Time<!-- <br>(Arrive Time) -->
						Time)
					</th>
					<th style="font-size: 18px; text-align: center; width: 12%;">Line Stop Time<!-- 결품 예상 시간<br>(Line Stop Time) -->
					</th>
					<th style="font-size: 18px; text-align: center; width: 10%;">Status<!-- <br>(Status) -->
					</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>

					<c:when test="${ board.size() >= 10 and vo.dtime ne ' '}">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">-</td>
								<%-- <td style="font-size: 18px; text-align: center" id="state+${vo.row_num }">${vo.dstate }</td> --%>
								<td style="font-size: 22px; text-align: center" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${ board.size() >= 10 and vo.dtime eq ' '}">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">-</td>
								<%-- <td style="font-size: 18px; text-align: center" id="state+${vo.row_num }">${vo.dstate }</td> --%>
								<td style="font-size: 22px; text-align: center" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() > 0 and board.size() < 5 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="${board.size() }" end="${10 - board.size() }">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 5 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="5">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 6 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="4">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 7 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="3">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 8 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="2">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() eq 9 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 22px; text-align: center;">${vo.cname }</td>
								<td style="font-size: 22px; text-align: center;" id="test">${vo.pname }</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime" value="${vo.dtime }"/>
									${fn:substring(dtime,0,10) } <br>
									${fn:substring(dtime,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center">
									<c:set var = "dtime2" value="${vo.dtime2 }"/>
									${fn:substring(dtime2,0,10) } <br>
									${fn:substring(dtime2,11,16) }
								</td>
								
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state">${vo.dstate }</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="1" end="1">
							<tr>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="test"></td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;">-</td>
								<td style="font-size: 22px; text-align: center;"></td>
								<td style="font-size: 22px; text-align: center;" id="${vo.row_num }" class="state"></td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<td colspan="8" style="height: 100px; text-align: center;">There are no data available for that day.</td>
					</c:otherwise>

				</c:choose>
			</tbody>
		</table>
		<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<span style="padding-left: 15px;">※ Contact in case of delivery abnormality : 정혜영 차장 010-3374-0706</span>
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
	
	</div>
	
</div>
		<span style="padding-left: 15px;">※ Contact in case of delivery abnormality : 정혜영 차장 010-3374-0706</span>

<script type="text/javascript">
</script>