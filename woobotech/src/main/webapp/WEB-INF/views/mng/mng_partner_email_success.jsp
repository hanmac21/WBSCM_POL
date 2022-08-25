<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	#btn:hover {
		background: black;
		color: white;
	}
</style>
</head>
<body>

	<div style="position: relative;top: 170px;left: 70px;">
		<h1 style="font-size: 40px;"><!-- 메일 전송이 완료되었습니다. -->Mail transmission is complete.<br><!-- 3초 후 자동으로 닫힙니다. -->It closes automatically after 3 seconds.</h1>
	</div>
	<button id="btn" style="position: absolute;top: 350px;left: 230px;width: 200px;height: 50px;border: 0;background-color: lightgray;font-size: 18px;">close window</button>
</body>
<script type="text/javascript">

	$(document).ready(function() {
		setTimeout("window.close()", 3000);
	});

	$('#btn').click(function() {
		console.log("클릭!");
		window.close();
	})
	
</script>
</html>