<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.FileInputStream" %>   
<%@ page import="java.io.BufferedOutputStream" %> 
<%@ page import="java.io.File" %> 
<%@ page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jasper Label PDF</title>
</head>
<body>
	
	<%
		FileInputStream fis = null;
		BufferedOutputStream bos = null;
		
		out.clear();
		out=pageContext.pushBody();
		
		try{
			
			String fileName = "/report/WB_A4_Export1.pdf";
			File file = new File(fileName);
			
			response.setContentType("application/pdf");
			response.setHeader("Content-Description","JSP Generated Data");
			
			fis = new FileInputStream(file);
			int size = fis.available();
			
			byte[] buf = new byte[size];
			int readCount = fis.read(buf);
			
			response.flushBuffer();
			
			bos = new BufferedOutputStream(response.getOutputStream());
			bos.write(buf,0,readCount);
			bos.flush();
			
		}catch(Exception e){
			response.setContentType("text/html;charset=euc-kr");
		    out.println("<script language='javascript'>");
		    out.println("alert('파일 오픈 중 오류가 발생하였습니다.');");
		    out.println("</script>");
		    e.printStackTrace();
		}finally{
			try{
				if(fis!=null) fis.close();
				if(bos!=null) bos.close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	%>
	
	

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
		$(document).ready(function(){

	    });
	</script>
</body>
</html>