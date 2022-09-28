

<%@page import="com.woobotech.tools.F"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	function move() {

		var url = "member_add.do";
		var f = document.getElementById("form1");
		f.action = url;
		f.submit();
	}
</script>
<style type="text/css" class="init">


</style>

<%
	HttpSession leftSes = request.getSession();
	String adminId = (String) leftSes.getAttribute("adminid");
	String text = (String) leftSes.getAttribute("cu_sangho");
	String admin_id = (String) leftSes.getAttribute("admin_id");
	String lang = (String) leftSes.getAttribute("lang");
	//System.out.print("211026 jsp ==>"+text);
	int menuPage = Integer.parseInt(F.nullCheck(request.getParameter("menu"), "0"));
	String menu[] = new String[18];
	for (int i = 0; i < menu.length; i++) {

		if (i == menuPage) {
			menu[i] = "active";
		} else {
			menu[i] = "";
		}

	}

	String treeview[] = new String[7];
	if (menuPage == 0 || menuPage == 1 || menuPage == 2 || menuPage == 3 || menuPage == 4 || menuPage == 5
			|| menuPage == 6 || menuPage == 7 || menuPage == 8 || menuPage == 9 || menuPage == 10) {
		treeview[0] = "active";
	} else if (menuPage == 11 || menuPage == 12 || menuPage == 13) {
		treeview[3] = "active";
	} else if (menuPage == 14) {
		treeview[4] = "active";
	} else if (menuPage == 15 || menuPage == 16 || menuPage == 17) {
		treeview[5] = "active";
	} else if (menuPage == 18) {
		treeview[6] = "active";
	}
%>

<div class="container  pull-left" style="width:90%">
	<div class="navbar-header">
		<a href="mng_buy_plan?menu=0" class="navbar-brand"><img src="resources/img/logo6.png" style="height: 30px; padding-bottom: 5px;"></a>
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#navbar-collapse">
			<i class="fa fa-bars"></i>
		</button>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->


	<div class="collapse navbar-collapse pull-left" id="navbar-collapse">

		<ul class="nav navbar-nav">
			<li class="<%=menu[8]%>"><a href="mng_re_trns?menu=8" style="font-size:17px;">Transaction statement</a></li>
			<li class="<%=menu[0]%>"><a href="mng_buy_plan?menu=0" style="font-size:17px;">Purchase Plan</a></li>
			<li class="<%=menu[1]%>"><a href="mng_biz_plan?menu=1" style="font-size:17px;">sale plan</a></li>
			<li class="<%=menu[2]%>"><a href="mng_production_plan?menu=2" style="font-size:17px;">Production plan </a></li>
			<li class="<%=menu[3]%>"><a href="mng_stock_plan?menu=3" style="font-size:17px;">Inventory view</a></li>
			<!-- li class="<%=menu[5]%>"><a href="mng_delivery?menu=5">배송관리</a></li-->
			
			 <%-- <li class="<%=menu[11]%>"><a href="mng_export_master?menu=11">반출증 관리</a></li> --%>
			
			<li class="<%=menu[4]%>"><a href="mng_noti?menu=4" style="font-size:17px;">Notice - Bulletin Board</a></li>
			<li class="<%=menu[6]%>"><a href="mng_cw_noti?menu=6" style="font-size:17px;">Partner - Bulletin Board</a></li>
			<li class="<%=menu[7]%>"><a href="mng_data_file?menu=7" style="font-size:17px;">library</a></li>
			
			<!-- 메일 발송용 협력사 관리자 관리용 관리자 관리 탭 --> 
			<%if("master".equals(admin_id)){ %>
				<li class="<%=menu[9]%>"><a href="mng_partner_whole?menu=9"  style="font-size:17px;">Partner management</a></li>
			<%} %>
			<%-- <%if("master".equals(admin_id)){ %>
				<li class="<%=menu[10]%>"><a href="mng_member_whole?menu=10"><spring:message code="MANmgmt" text="MANmgmt"/></a></li>
			<%} %> --%>
		</ul>
	</div>

</div>
<div class="navbar-custom-menu pull-right">
	<ul class="nav navbar-nav">
		<li><a href="logout.do"><i class="fa fa-sign-out"></i></a></li>
	</ul>
</div>
<div class="navbar-custom-menu pull-right">
	<ul class="nav navbar-nav">
		<li><a href="javascript:fnMangerView()"><span>[<%= text %>]</span></a></li> <!-- 사용자관리 -->	
	</ul>
</div>

<script>

 
//쿠키 생성 함수
function setCookie(cName, cValue, cDay) {
	var expire = new Date();
	expire.setDate(expire.getDate() + cDay);
	cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	if (typeof cDay != 'undefined')
		cookies += ';expires=' + expire.toGMTString() + ';';
	document.cookie = cookies;
}
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

function fnMangerView(){
	$.ajax({
		type : "post",
		url : "mng_manger_view",
		dataType : "html",
		data : {
		}
	}).done(function(data) {
			
		$("#modalPop4").html("");
		console.log("show1");
		$('#modalPop4').modal('show');
		console.log("show2");
		$("#modalPop4").html(data);
		
		
		console.log("show3");
		
		//	$('span.number').number( true, 0 );
	});
}

   function closeP(){
 		console.log("자식창에서 호출");
 		$('#modalPop4').modal('hide');
 		console.log("숨김");
 	}

function fnMangerSave(){
	var p_deliveryhour =$('#p_deliveryhour').val(); 
	var p_deliverymin = $('#p_deliverymin').val();
	var u_deliveryhour = $('#u_deliveryhour').val();
	var u_deliverymin = $('#u_deliverymin').val();
	var new_pw = $('#p_new_pw').val();
	var org_pw = $('#p_org_pw').val();
	var new_pw_ok = $('#p_new_pw_ok').val();//211027 비밀번호 확인
	var area = $('#area').val();
	var payment =$('#ment').val();
	
	//이메일 5개 추가 20220422 정인우
	var email1 = $('#email1').val();
	var email2 = $('#email2').val();
	var email3 = $('#email3').val();
	var email4 = $('#email4').val();
	var email5 = $('#email5').val();
	var user1 = $('#user1').val();
	var user2 = $('#user2').val();
	var user3 = $('#user3').val();
	var user4 = $('#user4').val();
	var user5 = $('#user5').val();
	var orPw = $('#p_org_pw').val();
	if(orPw==null || orPw==""){
		alert("Please enter your current password.");
		return;
	}
	if(new_pw !=new_pw_ok ){//211027 변경된 비밀번호와 비밀번호 확인을 일치 하지 않을 경우
		alert("변경 비밀번호와 비밀번호확인이 일치하지 않습니다. ");
		return;
	}
	
	if(area == ""){
		area = " ";
	}
	
	var payment = $("#ment").val();
	
	if(payment==""){
		payment="";
	}
	
	setCookie("payment",payment,365);
	
	/* var loginId =  $("#loginId").val();
  	setCookie("loginId",loginId,365)
  	var branch =  $("#branch").val();
  	setCookie("branch",branch,365);
  	var payment =$("#ment").val();
  	setCookie("payment",payment,365); */

	$.ajax({
		type : "post",
		url : "mng_manger_view_u",
		dataType : "html",
		data : {
			p_deliveryhour : p_deliveryhour,
			p_deliverymin : p_deliverymin,
			u_deliveryhour : u_deliveryhour,
			u_deliverymin : u_deliverymin,
			new_pw : new_pw,
			org_pw : org_pw,
			area : area,
			email1 : email1,
			email2 : email2,
			email3 : email3,
			email4 : email4,
			email5 : email5,
			user1 : user1,
			user2 : user2,
			user3 : user3,
			user4 : user4,
			user5 : user5
		}
	}).done(function(data) {
		var isOk = data;
		if (isOk == 1) {
			alert('Successfully processed.');
  			
  			$('#modalPop4').modal('hide');
			//location.reload();
		}else if(isOk ==-1){
			alert("Passwords don't match");
		}else{
			alert('Registration failed');
		}

	});
	
}

</script>