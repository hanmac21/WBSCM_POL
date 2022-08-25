

<%@page import="com.woobotech.tools.F"%>
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

<%
	HttpSession leftSes = request.getSession();
	String adminId = (String) leftSes.getAttribute("adminid");
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
	if (menuPage == 0 || menuPage == 1 || menuPage == 2 ||menuPage == 3 ||menuPage == 4 || menuPage == 5 || menuPage == 6||menuPage == 7||menuPage == 8||menuPage == 9||menuPage == 10) {
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




<!-- start:Left Menu -->
<ul class="sidebar-menu">
	<li class="header">MAIN Menu</li>
	<li class="<%=treeview[0]%> treeview"><a href="#"> <i
			class="fa fa-dashboard"></i> <span>관리자 관리</span> <span
			class="pull-right-container"> <i
				class="fa fa-angle-left pull-right"></i>
		</span>
	</a>
		<ul class="treeview-menu">
			<li class="<%=menu[0]%>"><a href="mng_buy_plan?menu=0"><i
					class="fa fa-circle-o"></i>구매계획관리</a></li>

			<li class="<%=menu[1]%>"><a href="mng_biz_plan?menu=1"><i
					class="fa fa-circle-o"></i>영업계획관리</a></li>
			<!--li ><a href="member_info_list.do?menu=1"><i class="fa fa-circle-o"></i>개인별 포인트</a></li-->
			<li class="<%=menu[2]%>"><a href="mng_production_plan?menu=2"><i
					class="fa fa-circle-o"></i>생산계획관리</a></li>
			<li class="<%=menu[3]%>"><a href="mng_stock_plan?menu=3"><i
					class="fa fa-circle-o"></i>재고조회</a></li>
			<li class="<%=menu[5]%>"><a href="mng_delivery?menu=5"><i
					class="fa fa-circle-o"></i>배송관리</a></li>		
			<li class="<%=menu[4]%>"><a href="mng_noti?menu=4"><i
					class="fa fa-circle-o"></i>공지사항-게시판</a></li>				
												
			<li class="<%=menu[6]%>"><a href="mng_cw_noti?menu=6"><i
					class="fa fa-circle-o"></i>협력사-게시판</a></li>
			<li class="<%=menu[7]%>"><a href="mng_data_file?menu=7"><i
					class="fa fa-circle-o"></i>자료실</a></li>		
					
		</ul>
		
		<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li><a href="logout.do"><i class="fa fa-sign-out"></i></a></li>
					</ul>
				</div>
		
	</li>










</ul>