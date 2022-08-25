<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta charset="utf-8">
  
  <meta name="keyword" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>커몬(관리자)</title>
 
 <!-- start: Javascript -->
 
<% request.setCharacterEncoding("utf-8"); %>
<%
 response.setHeader("Cache-Control","no-cache"); 
 response.setHeader("Pragma","no-cache"); 
 response.setDateHeader("Expires",0); 
 HttpSession ses = request.getSession();
	String admin = (String)ses.getAttribute("u_id");
	if(admin==null || "null".equals(admin)){
		response.sendRedirect("rp_login.do");
	}
 
 
%>
 

