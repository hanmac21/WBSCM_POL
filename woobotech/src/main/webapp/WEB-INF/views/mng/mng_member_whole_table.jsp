<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

				<div class="row">
						<div class="col-xs-12">
							<div class="box">
								<!-- /.box-header -->
								<div class="box-body tableWrapper" style="overflow: scroll; padding: 0 0 0 0;">
									<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
									<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
									
										<thead>
											<tr>
												<th rowspan="1" style="text-align: center;">순번</th>
												<th rowspan="1" style="text-align: center;">ID</th>
												<th rowspan="1" style="text-align: center;">지역</th>
												<th rowspan="1" style="text-align: center;">
													<input type="checkbox" name="chk_del" id="del_all" value="del_all" class="chkall">&nbsp;&nbsp;&nbsp;
													<button type="button" id="all_del" onclick="fnAllDel()">삭제</button>
												</th>
											</tr>
										</thead>
										
										<tbody>
												<c:choose>
												<c:when test="${ board.size() > 0 }">
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														<c:set var="i" value="${i+1 }" />
														<tr>
															<td style="text-align: center;">${i }</td>
															<td style="text-align: center;">${vo.id }</td>
															<td style="text-align: center;" id="${vo.row_seq }">${vo.plant }</td>
															<td style="text-align: center;">
																<input type="checkbox" name="del" id="${vo.id }" data-chkBar="${vo.id }" class="chkbox">&nbsp;&nbsp;&nbsp;
																<button type="button" onclick="fnDel('${vo.id}')">삭제</button>
															</td>
														</tr>
										
													</c:forEach>
											</c:when>
												<c:otherwise>
													<tr>
														<td colspan="4" style="height: 100px; text-align: center;">검색된
															자료가 없습니다.</td>
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
		<span style="margin-left: 10px;">건수 : ${ itemCount }</span>
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
		<strong>Copyright &copy; 2021 <a href="#">우보테크</a>.
		</strong> All rights reserved.
		</div>
	</div>
	
</div>

<!-- jQuery 2.2.3 -->
	<script src="asset/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="asset/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.number.min.js"></script>
	<script src="resources/js/jquery.number.js"></script>

	<!-- FastClick -->
	<script src="asset/plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="asset/dist/js/app.min.js"></script>
	<!-- Sparkline -->
	<script src="asset/plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="asset/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="asset/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

	<script src="asset/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
	<!-- DataTables -->
	<script src="asset/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="asset/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="asset/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="asset/plugins/chartjs/Chart.min.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<!-- script src="asset/dist/js/pages/dashboard2.js"></script-->
	<!-- AdminLTE for demo purposes -->
	<script src="asset/dist/js/demo.js"></script>
		<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/jquery.print-preview.js"></script>
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="resources/js/printThis.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.2.61/jspdf.min.js"></script>

	<script type="text/javascript">
	$(document).ready(function() {
		
		<c:forEach var="vo" items="${board}">
			var region = document.getElementById("${vo.row_seq }").innerText;
			
			if(region==="000"){
				document.getElementById("${vo.row_seq }").innerText = "평택";
			}else if(region==="001"){
				document.getElementById("${vo.row_seq }").innerText = "울산";
			}
		</c:forEach>

	});
	
	var chkall = document.querySelector('.chkall');
	var chkbox = document.querySelectorAll('.chkbox');
	
	chkall.onclick = function(){
		if(chkall.checked == false){
			for(var i = 0; i<chkbox.length; i++){chkbox[i].checked = false;}
		}else{
			for(var i = 0; i<chkbox.length; i++){chkbox[i].checked = true;}
		}
	}
	
	for(var i=0;i<chkbox.length;i++){
		chkbox[i].onclick=function(){
			if(this.checked==false){chkall.checked=false;}
		}
	}
	
	function fnDel(m_id){
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type:"get",
				url:"mng_member_del",
				dataType:"html",
				data:{
					m_id:m_id
				}
			}).done(function(data){
				document.getElementById('start').click();
			});						
		}else{
			return false;
		}
	}
	
	function fnAllDel(){
		
		var cnt = $("input[class='chkbox']:checked").length;
		
		if(cnt==0){
			alert("선택된 내역이 없습니다.");
			return false;
		}
		
		if(confirm(cnt+"개의 관리자를 삭제 하시겠습니까?")){
			
			var checkArr = new Array();
			
			$("input[class='chkbox']:checked").each(function(){
				checkArr.push($(this).attr("data-chkBar"));
			});
			
			$.ajax({
				type:"get",
				url:"mng_member_delAll",
				dataType:"html",
				data:{
					delList : checkArr
				}
			}).done(function(data){
				document.getElementById('start').click();
			});
			
		}else{
			return false;
		}
		
	}
	
	</script>