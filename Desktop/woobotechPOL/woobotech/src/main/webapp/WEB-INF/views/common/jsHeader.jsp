<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta charset="utf-8">
  
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>우보테크</title>
 
 <!-- start: Javascript -->
 
<% request.setCharacterEncoding("utf-8"); %>
<%
 response.setHeader("Cache-Control","no-cache"); 
 response.setHeader("Pragma","no-cache"); 
 response.setDateHeader("Expires",0); 
 HttpSession ses = request.getSession();
	String admin = (String)ses.getAttribute("admin_id");
	String session_cu_sangho = (String)ses.getAttribute("cu_sangho");
	if(admin==null || "null".equals(admin)){
		response.sendRedirect("mng_login.do");
	}
 
	
 
%>
 

