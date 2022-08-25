<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title">배송상세</h4>
			<h4 class="modal-title" style="text-align: center;" id="sp_p_biz_nm"></h4>
		</div>
		<div class="modal-body" id="modalbody1">
			<div class="box box-info">

				<!-- /.box-header -->
				<!-- form start -->
				<form class="form-horizontal" name="form2" id="form2" method="post">
					<div class="box-body" style="overflow: scroll;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
										<thead>
											<tr>
												
												<th>품번</th>
												<th>픔명</th>
												<th>수량</th>
												<!-- th>과부족</th-->
											</tr>
										</thead>
										<tbody>
												<c:choose>
												
												<c:when test="${ board.size() > 0 }">
												
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														
														<tr>
															<td>${vo.pno}</td>
															<td>${vo.pname}</td>
															<td>${vo.qty}</td>
															
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
													
													<tr>
														<td colspan="11" style="height: 100px; text-align: center;">검색된
															자료가 없습니다.</td>
													</tr>
												</c:otherwise>
	
											</c:choose>
										</tbody>
									</table>

			</div>
				</form>
			</div>

		</div>
	</div>
</div>
<script type="text/javascript">
	var h_tag_cnt=0;
	$(document).ready(function() {
	
		
		
	});
	
	
	
</script>