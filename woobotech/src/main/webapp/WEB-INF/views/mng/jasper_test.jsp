<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>
		<button type="button" onclick="onPrint()">인쇄</button>
		
		<div id="bodyWrap">
			<%-- <jsp:include page="simpleTest.jsp"/> --%>
		</div>
			
		<div id="printWrap" style="display: none; height: 0">
		
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
	
	<script type="text/javascript">

	$(document).ready(function() {
		//alert("load");
		//var folderPath = "${folderPath}";
		var folderPath = "C:\\report\\";
		//alert("${folderPath}");
		//alert(folderPath);
		
		$(function(){
			$("#bodyWrap").load("resources/report/simpleTest.html");
			window.setTimeout(function(){
				var html = $("#bodyWrap").children("table").children("tbody").children("tr").children("td")[1];
				var imgs = $(html).find("img");
				for(let i=0;i<imgs.length;i++){
					imgs[i].src=folderPath + imgs[i].src;
				};
			}, 1000);
		});
	});
	
		/* var folderPath = "${folderPath}";
		$(function(){
			$("#bodyWrap").load("resources/report/simpleTest.html");
			window.setTimeout(function(){
				var html = $("#bodyWrap").children("table").children("tbody").children("tr").children("td")[1];
				var imgs = $(html).find("img");
				for(let i=0;i<imgs.length;i++){
					imgs[i].src=folderPath + imgs[i].src;
				};
			}, 1000;);
		}); */
	
	
	</script>
</body>
</html>