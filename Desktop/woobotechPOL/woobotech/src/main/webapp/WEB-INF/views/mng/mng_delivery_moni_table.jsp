<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
						<div class="">
							<div class="">
								<!-- /.box-header -->
								<div class="" >
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%"
			class="stripe row-border order-column">
			<thead style="padding-buttom: 30px;">
				<tr class="line head">
					<th style="font-size: 18px; text-align: center; width: 17%;">업 체 명<br>(Name)
					</th>
					<th style="font-size: 18px; text-align: center; width: 23%;">품 목<br>(Item)
					</th>
					<th style="font-size: 18px; text-align: center; width: 8%;">출발 지역<br>(From)
					</th>
					<th style="font-size: 18px; text-align: center; width: 12%;">출발 시간<br>(Dep Time)
					</th>
					<th style="font-size: 18px; text-align: center; width: 12%;">도착 예정 시간<br>(Arrive
						Time)
					</th>
					<th style="font-size: 18px; text-align: center; width: 12%;">결품 예상 시간<br>(Line Stop Time)
					</th>
					<th style="font-size: 18px; text-align: center; width: 10%;">상태<br>(Status)
					</th>
					<th style="font-size: 18px; text-align: center; width: 6%;">납품 list 조회<br>(Delivery
						list)
					</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>

					<c:when test="${ board.size() >= 10 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 18px; text-align: center">${vo.cname }</td>
								<td style="font-size: 18px; text-align: center" id="test">${vo.pname }</td>
								<td style="font-size: 18px; text-align: center">-</td>
								
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
								
								<td style="font-size: 18px; text-align: center">-</td>
								<%-- <td style="font-size: 18px; text-align: center" id="state+${vo.row_num }">${vo.dstate }</td> --%>
								<td style="font-size: 18px; text-align: center" id="${vo.row_num }" class="state">${vo.dstate }</td>
								<td style="font-size: 18px; text-align: center">
									<button class="btn btn-secondary" type="button" style="color: black; font-size: 20px; width: 80px;" onclick="show_list('${vo.cno}');">${vo.cnt }cases</button>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					
					<c:when test="${ board.size() > 0 and board.size() < 10 }">
						<c:forEach var="vo" items="${board }">
							<tr class="line" id="line+${vo.row_num }">
								<td style="font-size: 18px; text-align: center">${vo.cname }</td>
								<td style="font-size: 18px; text-align: center" id="test">${vo.pname }</td>
								<td style="font-size: 18px; text-align: center">-</td>
								
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
								
								<td style="font-size: 18px; text-align: center">-</td>
								<td style="font-size: 18px; text-align: center" id="${vo.row_num }" class="state">${vo.dstate }</td>
								<td style="font-size: 18px; text-align: center">
									<button class="btn btn-secondary" type="button" style="color: black; font-size: 20px; width: 80px;" onclick="show_list('${vo.cno}');">${vo.cnt }cases</button>
								</td>
							</tr>
						</c:forEach>
						<c:forEach var="num" begin="${board.size()+1 }" end="${10-board.size() + 1 }">
							<tr>
								<td style="font-size: 18px; text-align: center;"></td>
								<td style="font-size: 18px; text-align: center;" id="test"></td>
								<td style="font-size: 18px; text-align: center;"></td>
								<td style="font-size: 18px; text-align: center;"></td>
								<td style="font-size: 18px; text-align: center;"></td>
								<td style="font-size: 18px; text-align: center;"></td>
								<td style="font-size: 18px; text-align: center;" id="${vo.row_num }" class="state"></td>
								<td style="font-size: 18px; text-align: center;">
									
								</td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<td colspan="8" style="height: 100px; text-align: center;">해당
							일에는 자료가 없습니다.</td>
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
		<span style="padding-left: 15px;">※ 납품 이상 발생시 연락처 : 정혜영 차장 010-3374-0706</span>
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

<script type="text/javascript">
</script>