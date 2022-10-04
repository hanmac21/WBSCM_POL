<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<!-- /.box-header -->
			<div class="box-body tableWrapper" style="overflow: scroll; padding: 0 0 0 0;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" style="borderSpacing:0; borderCollapse:separate; ">
									
										<thead>
											<tr>
												<th rowspan="3"style="text-align: center;">Sequence</th>
												<th rowspan="3"style="text-align: center;">Workplace</th>
												<th rowspan="3"style="text-align: center;">Car</th>
												<th rowspan="3"style="text-align: center;">Part Number</th>
												<th rowspan="3" style="text-align: center;">Item name</th>
												<th rowspan="3"style="text-align: center;">Spec</th>
												<th rowspan="3"style="text-align: center;">Unit</th>
												<!-- <th rowspan="3" style="text-align: center;">Standard</th>
												<th rowspan="3" style="text-align: center;">Item classification</th>
												<th rowspan="3" style="text-align: center;">Unit</th> -->
												<th colspan="4" style="text-align: center;">Warehouse inventory</th>
												<th colspan="2" style="text-align: center;">WIP inventory</th>
												<th rowspan="2" colspan="2" style="text-align: center;">Total Qty</th>
												<th rowspan="3" colspan="2" style="text-align: center;">Total Qty</th>
												
												
											</tr>
											<tr>
												<th colspan="2" style="text-align: center;">Material Warehouse </th>
												<!-- <th colspan="2" style="text-align: center;">Outside Warehouse</th> -->
												<th colspan="2" style="text-align: center;">Products Warehouse</th>
												<!-- <th colspan="2" style="text-align: center;">폐기</th> -->
												<th colspan="2" style="text-align: center;">Poland Workshop</th>
												<!-- <th colspan="2" style="text-align: center;">Porm</th>
												<th colspan="2" style="text-align: center;">A/REST</th> -->
												<!-- <th colspan="2" style="text-align: center;">Total Qty</th> -->
											</tr>	
											<tr>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<!-- <th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th> -->
												<!-- <th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th>
												<th style="text-align: center;">OK</th>
												<th style="text-align: center;">NG</th> -->
											</tr>		
										</thead>
										<tbody>
												<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="text-align: center;">${i }</td>
															<td>${vo.co_saname}</td>
															<td>${vo.carname}</td>
															<td>${vo.itemcode}</td>
															<td>${vo.itemname}</td>
															<td>${vo.spec}</td>
															<td>${vo.unit}</td>
															<td>${vo.f001qty ne "0" ? vo.f001qty : ""}</td>
															<td>${vo.f001qty1 ne "0" ? vo.f001qty1 : ""}</td>
															<td>${vo.m001qty ne "0" ? vo.m001qty : ""}</td>
															<td>${vo.m001qty1 ne "0" ? vo.m001qty1 : ""}</td>
															<td>${vo.j0001qty ne "0" ? vo.j0001qty : ""}</td>
															<td>${vo.j0001qty1 ne "0" ? vo.j0001qty1 : ""}</td>
															<%-- <td>${vo.p001qty ne "0" ? vo.p001qty : ""}</td> --%>
															<%-- <td>${vo.g001qty ne "0" ? vo.g001qty : ""}</td>
															<td>${vo.f001qty1 ne "0" ? vo.f001qty1 : ""}</td>
															<td>${vo.f003qty1 ne "0" ? vo.f003qty1 : ""}</td> --%>
															
															<%-- <td>${vo.p001qty1 ne "0" ? vo.p001qty1 : ""}</td> --%>
															<%-- <td>${vo.g001qty1 ne "0" ? vo.g001qty1 : ""}</td>
															<td>${vo.a0001qty ne "0" ? vo.a0001qty : ""}</td>
															<td>${vo.c0001qty ne "0" ? vo.c0001qty : ""}</td>
															<td>${vo.j0001qty ne "0" ? vo.j0001qty : ""}</td>
															<td>${vo.a0001qty1 ne "0" ? vo.a0001qty1 : ""}</td> --%>
															<td>${vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty ne "0" ? vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty : ""}</td>
															<td>${vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 ne "0" ? vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 : ""}</td>
															<td>${vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty +vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 ne "0" ? vo.f001qty + vo.f003qty+vo.m001qty +vo.g001qty+vo.e001qty + vo.a0001qty +vo.c0001qty + vo.j0001qty+vo.f001qty1+vo.f003qty1+vo.m001qty1 +vo.g001qty1+vo.e001qty+vo.a0001qty1 + vo.c0001qty1+ vo.j0001qty1 : ""}</td>
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

			</div>
		</div>
	</div>
</div>




<div class="row" style="display:flex;">

	<div class="" style="padding-top: 0px; width: 33%; float: left;">
		<%-- <span style="margin-left: 10px;">number : ${ itemCount }</span> --%>
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
	$(function() {
		//$("#tablebody").DataTable();
	});
</script>
