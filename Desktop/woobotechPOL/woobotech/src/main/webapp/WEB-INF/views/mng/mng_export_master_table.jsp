<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



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
			<div class="box-body tableWrapper" style="overflow: scroll; padding: 0 0 0 0;">
				<!-- input type="button" class="btn btn-warning navbar-right" onclick="fnCancelPop()" value="삭제"/></td-->
				<table id="tablebody" width="100%" class="stripe row-border order-column" cellspacing="0" >
										<thead>
											<tr>
												<th width="3%" style="text-align: center;">번호</th>
												<th width="7%" style="text-align: center;">바코드번호</th>
												<th width="3%" style="text-align: center;">지역</th>
												<th width="6%" style="text-align: center;">입고일자</th>
												<th width="6%" style="text-align: center;">협력사코드</th>
												<th width="11%" style="text-align: center;">협력사명</th>
												<th width="5%" style="text-align: center;">수량</th>
												<th width="14%" style="text-align: center;">반출증</th>
												<th width="8%" style="text-align: center;">작성일</th>
												<th width="7%" style="text-align: center;">
													<input type="checkbox" name="chk_del" id="del_all" value="del_all" class="chkall">&nbsp;&nbsp;&nbsp;
													<button type="button" id="all_del" onclick="fnAllDel()">삭제</button>
												</th>
											</tr>
										</thead>
										<tbody>
												<c:choose>
												
												<c:when test="${ board.size() > 0 }">
												
													<c:forEach var="vo" items="${ board }" varStatus="status">
													
														<tr>
															<td style="text-align: center;">${vo.row_num}</td>
															<td style="text-align: center;">${vo.barcode}</td>
															<td style="text-align: center;" id="${vo.row_num }">${vo.plant }</td>
															<td style="text-align: center;">${vo.indate}</td>
															<td style="text-align: center;">${vo.cno}</td>
															<td style="text-align: center;">${vo.cname}</td>
															<td class="number" style="font-size: 18px;text-align: center;">${vo.t_qty}</td>													
															<td style="text-align: center;">
																 <input type="button" class="btn bg-maroon"
																onclick="exportJ('${vo.barcode}','${vo.indate }')"
																style="font-size: 18px" value="반출증발행" /></td>
															</td>
															<td style="text-align: center;">${vo.prdate}</td>
															<td style="text-align: center;">
																<input type="checkbox" name="del" id="${vo.barcode }" data-chkBar="${vo.barcode }" class="chkbox">&nbsp;&nbsp;&nbsp;
																<button type="button" onclick="fnDel('${vo.barcode}')">삭제</button>
															</td>
													
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
<script type="text/javascript">
	var chkall = document.querySelector('.chkall');
	var chkbox = document.querySelectorAll('.chkbox');

	chkall.onclick = function(){
		//alert('chk!');
		//alert(chkbox.length);
		if(chkall.checked == false){
			for(var i = 0; i<chkbox.length; i++){chkbox[i].checked = false;}
		}else{
			for(var i = 0; i<chkbox.length; i++){chkbox[i].checked = true;}
		}
	}

	for(var i=0;i<chkbox.length;i++){
		chkbox[i].onclick=function(){
			//alert('chk!!');
			if(this.checked==false){chkall.checked=false;}
		}
	}
	
	$(document).ready(function() {
		//$('#Progress_Loading').hide();
		
		<c:forEach items="${board}" var="vo">
			var region = document.getElementById("${vo.row_num}").innerText;
			
			if(region==="000"){
				document.getElementById("${vo.row_num}").innerText = "평택";
			}else if(region==="001"){
				document.getElementById("${vo.row_num}").innerText = "울산";
			}
		</c:forEach>
		
	});
	
	
	
	/* var itemCnt = $
	{
		itemCount
	};
	$(function() {
		//$("#tablebody").DataTable();
	}); */
</script>
