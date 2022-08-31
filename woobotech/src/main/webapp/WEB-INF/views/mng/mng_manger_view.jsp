<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	HttpSession leftSes = request.getSession();
    String adminId = (String) leftSes.getAttribute("adminid");
	String text = (String) leftSes.getAttribute("cu_sangho");
	//System.out.print("211026 jsp ==>"+text);
%>

<style>
@page {
	size: A4 landscape;
	margin: 0;
}
.manageV {
	border: 2px solid #bbc6d3;
	padding: 10px;
	border-collapse:collapse;
}

.mng{
	padding:1px;
	background-color:#e7e7e7;
	//border:0px;
}
.mng2{
	padding:1px;
	//border:0px;
}
.mng3{
	padding:6px;
	background-color:#e7e7e7;
	//border:0px;
}
.mng4{
	padding:6px;
	//border:0px;
}
</style>

<div class="modal-dialog" style="max-width: 100%;width:auto;display:table;">

	<div class="modal-content">
		<div style="margin-top:10px; margin-left:10px; padding-top:10px;">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close" style="margin-right:10px;">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title" style="margin-bottom:5px; margin-top:10px; bottom-border:3px solid #00C0EF"><!-- 사용자관리 -->User Management</h4>
		</div>
		
		<div style="padding:10px;">
			<table class="manageV">
				<thead >
					<tr >
						<th style="width:50% ;  text-align:center;" class="mng manageV">Current Password</th>
						<td class="mng2"><input type="password" class="form-control manageV" placeholder="" value="" id="p_org_pw" style="width:100%;"></td>
					</tr>
					<tr>
						<th style="width:50%; text-align:center" class="mng manageV">Change Password</th>
						<td class="mng2"><input type="password" class="form-control manageV" placeholder="" value=""	id="p_new_pw" style="width:100%;"></td>
					</tr>
					<tr>
						<th style="width:50%; text-align:center" class="mng color manageV">Confirm Change Password</th>
						<td class="mng2"><input type="password" class="form-control manageV" placeholder="" value="" id="p_new_pw_ok" style="width:100%;"></td>
					</tr>
					<tr>
						<th style="width:50%; text-align:center" class="mng manageV">Departure area</th>
						<td class="mng2"><input type="text" class="form-control manageV" placeholder="" value="${board.area }"	id="area" name="area" style="width:100%;"></td>
					</tr>
					<tr>
						<th style="width:50%; text-align:center" class="mng3 manageV">Average delivery time</th>
						<td  class="mng4 manageV"><select id="p_deliveryhour" name="p_deliveryhour">
							<option value="00" ${board.p_deliveryhour =='00' ? 'selected' :'' }>00</option>
							<option value="01" ${board.p_deliveryhour =='01' ? 'selected' :'' }>01</option>
							<option value="02" ${board.p_deliveryhour =='02' ? 'selected' :'' }>02</option>
							<option value="03" ${board.p_deliveryhour =='03' ? 'selected' :'' }>03</option>
							<option value="04" ${board.p_deliveryhour =='04' ? 'selected' :'' }>04</option>
							<option value="05" ${board.p_deliveryhour =='05' ? 'selected' :'' }>05</option>
							<option value="06" ${board.p_deliveryhour =='06' ? 'selected' :'' }>06</option>
							<option value="07" ${board.p_deliveryhour =='07' ? 'selected' :'' }>07</option>
							<option value="08" ${board.p_deliveryhour =='08' ? 'selected' :'' }>08</option>
							<option value="09" ${board.p_deliveryhour =='09' ? 'selected' :'' }>09</option>
							<option value="10" ${board.p_deliveryhour =='10' ? 'selected' :'' }>10</option>
						</select>
						Hour
						<select id="p_deliverymin" name="p_deliverymin">
							<option value="00"  ${board.p_deliverymin =='00' ? 'selected' :'' }>00</option>
							<option value="10"  ${board.p_deliverymin =='10' ? 'selected' :'' }>10</option>
							<option value="20"  ${board.p_deliverymin =='20' ? 'selected' :'' }>20</option>
							<option value="30"  ${board.p_deliverymin =='30' ? 'selected' :'' }>30</option>
							<option value="40"  ${board.p_deliverymin =='40' ? 'selected' :'' }>40</option>
							<option value="50"  ${board.p_deliverymin =='50' ? 'selected' :'' }>50</option>
						</select>
						Minute</td>
					</tr>
					<%-- <tr>
						<th style="width:50%; text-align:center" class="mng3 manageV">울산 평균배송 소요시간</th>
						<td class="mng4 manageV"><select id="u_deliveryhour" name="u_deliveryhour">
								<option value="00" ${board.u_deliveryhour =='00' ? 'selected' :'' }>00</option>
								<option value="01" ${board.u_deliveryhour =='01' ? 'selected' :'' }>01</option>
								<option value="02" ${board.u_deliveryhour =='02' ? 'selected' :'' }>02</option>
								<option value="03" ${board.u_deliveryhour =='03' ? 'selected' :'' }>03</option>
								<option value="04" ${board.u_deliveryhour =='04' ? 'selected' :'' }>04</option>
								<option value="05" ${board.u_deliveryhour =='05' ? 'selected' :'' }>05</option>
								<option value="06" ${board.u_deliveryhour =='06' ? 'selected' :'' }>06</option>
								<option value="07" ${board.u_deliveryhour =='07' ? 'selected' :'' }>07</option>
								<option value="08" ${board.u_deliveryhour =='08' ? 'selected' :'' }>08</option>
								<option value="09" ${board.u_deliveryhour =='09' ? 'selected' :'' }>09</option>
								<option value="10" ${board.u_deliveryhour =='10' ? 'selected' :'' }>10</option>
							</select>
							시
							<select id="u_deliverymin" name="u_deliverymin">
								<option value="00"  ${board.u_deliverymin =='00' ? 'selected' :'' }>00</option>
								<option value="10"  ${board.u_deliverymin =='10' ? 'selected' :'' }>10</option>
								<option value="20"  ${board.u_deliverymin =='20' ? 'selected' :'' }>20</option>
								<option value="30"  ${board.u_deliverymin =='30' ? 'selected' :'' }>30</option>
								<option value="40"  ${board.u_deliverymin =='40' ? 'selected' :'' }>40</option>
								<option value="50"  ${board.u_deliverymin =='50' ? 'selected' :'' }>50</option>
							</select>
							분</td>
					</tr> --%>
					<tr>
						<th style="width:50%; text-align:center" class="mng3 manageV">Direct delivery</th>
						<td class="mng4 manageV"><select id="ment" style="width:180px;">
								<option value="<%=text %>"  ${ment =='001' ? 'selected' :'' }><%=text %></option>
								<option value="WOOBOTECH" ${ment =='002' ? 'selected' :'' }>WOOBOTECH</option>
								<option value="WOOBOTECH[<%=text %>]"  ${ment =='000' ? 'selected' :'' }>WOOBOTECH[<%=text %>]</option>
							</select></td>
					</tr>
					<tr ><td colspan=2 style="height:40px;"></td></tr>
				</thead>
				<tbody style="margin-top:20px;">
					<tr>
						<th style="width:50%; text-align:center; font-size:14px;" class="mng3 manageV">E-Mail</th>
						<th style="width:50%; text-align:center; font-size:14px;" class="mng3 manageV">Name</th>
					</tr>
					<tr>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.email1 }"	id="email1" name="email1" style="width : 100%; font-size:15px;"></td>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.user1 }"	id="user1" name="user1" style="width : 100%; font-size:15px;"></td>
					</tr>
					<tr>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.email2 }"	id="email2" name="email2" style="width : 100%; font-size:15px;"></td>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.user2 }"	id="user2" name="user2" style="width : 100%; font-size:15px;"></td>
					</tr>
					<tr>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.email3 }"	id="email3" name="email3" style="width : 100%; font-size:15px;"></td>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.user3 }"	id="user3" name="user3" style="width : 100%; font-size:15px;"></td>
					</tr>
					<tr>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.email4 }"	id="email4" name="email4" style="width : 100%; font-size:15px;"></td>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.user4 }"	id="user4" name="user4" style="width : 100%; font-size:15px;"></td>
					</tr>
					<tr>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.email5 }"	id="email5" name="email5" style="width : 100%; font-size:15px;"></td>
						<td class="mng2 manageV"><input type="text" class="form-control" placeholder="" value="${board.user5 }"	id="user5" name="user5" style="width : 100%; font-size:15px;"></td>
					</tr>
				</tbody>
						</table>
		<div class="modal-footer" >
			<div >
				<button type="button" class="btn btn-primary" onclick="fnMangerSave()">Change</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<script type="text/javascript">
function callP(){
	console.log("부모창에 있는 함수 call호출");
	closeP();
}
var msg = "${msg}";
if (msg!= "") {
	alert(msg);
	callP();
}	 
 $(function () {
    
    var loginId = getCookie("loginId");
    //alert(loginId);
    //$("#loginId").val(loginId);
    var payment= getCookie("payment");
    $("#ment").val(payment);
  });
 
//쿠키 가져오기 함수
 function getCookie(cName) {
 	cName = cName + '=';
 	var cookieData = document.cookie;
 	var start = cookieData.indexOf(cName);
 	var cValue = '';
 	if (start != -1) {
 		start += cName.length;
 		var end = cookieData.indexOf(';', start);
 		if (end == -1)
 			end = cookieData.length;
 		cValue = cookieData.substring(start, end);
 	}
 	return unescape(cValue);
 }
 
 function setCookie(cName, cValue, cDay) {
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
		cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
		if (typeof cDay != 'undefined')
			cookies += ';expires=' + expire.toGMTString() + ';';
		document.cookie = cookies;
	}
 
</script>

