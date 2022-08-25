<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 모바일 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 브라우저 초기화 -->
<link rel="stylesheet" href="resources/css/nomalize.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="resources/css/devedu-custom.css?ver=4">


</head>
<body> 

 	<!-- 타이틀 -->
 	<div class="container-fluid container-board-detail-title">
		<div class="row-fluid">
			<div class="col-xs-12">
				<span class="span-board-subject">${board.title}</span>
			</div>
			
			<div class="col-xs-12 div-board-sub">
				<hr class="hr-board03">
			</div>
			
			<div class="col-xs-12 div-board-sub"> 
				<span class="span-board-writer">${board.userid}</span>
				<span class="span-board-date">${board.reg_date}</span>
			</div>
		</div>

		<div class="row-fluid">
			<div class="col-xs-12 padding-0">
				<hr class="hr-board02" style="margin-top: 12px;">
			</div>
		</div>
	</div>

 	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-12 padding-0">
				<hr class="hr-board01">
				<hr class="hr-board02">
			</div>
		</div>
	</div>


 	<!-- 내용 -->
 	<div class="container-fluid container-board-title">
		<div class="row-fluid" style="padding: 10px 15px 45px 15px;">
			<span class="span-board-content">${board.contents}</span> 
		</div>
	</div>
	
 	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-xs-12 padding-0">
				<hr class="hr-board02">
				<hr class="hr-board01">
			</div>
		</div>
	</div>
	
	<!-- 댓글 -->
 	<div class="container-fluid" style="margin-top: 5px;">
 	
		<div class="row-fluid padding-15">
			<div class="div-board-reply-id">sukwoo533</div> 
			<div class="div-board-reply-date"> | 2018-06-01 15:33</div> 
		</div>
		
		<div class="row-fluid padding-15"> 
			<div class="div-board-reply">댓글내용 ~!~! 댓글 내용이 들어가있습니다.</div> 
		</div>
		
		<hr class="hr-reply">
	</div>
	
	<!-- 댓글 -->
 	<div class="container-fluid" style="margin-top: 5px;">
 	
		<div class="row-fluid padding-15">
			<div class="div-board-reply-id">sukwoo533</div> 
			<div class="div-board-reply-date"> | 2018-06-01 15:33</div> 
		</div>
		
		<div class="row-fluid padding-15"> 
			<div class="div-board-reply">댓글내용 ~!~! 댓글 내용이 들어가있습니다.</div> 
		</div>
		
		<hr class="hr-reply">
	</div>
</body>





<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
</body>

<script type="text/javascript">

function fnSave(){
	
	
	if(!confirm("저장하시겠습니까?")){
		return;
	}
	var title = $("#title").val();
	var contents = $("#contents").val();
	
	if(title==''){
		alert('제목을 입력하세요');
		return;
	}
	
	if(contents==''){
		alert('내용을 입력하세요');
		return;
	}
	
	var brd_no =$("#brd_no").val();
	$.ajax({
 		type:"post",
 		url:"board_write_u",
 		dataType:"html",
 		data:{
 			brd_no:brd_no,
 			title: title,
 			contents:contents
 		}	
 		}).done(function(data){
 			var isOk = data;
			if (isOk == 1) {
				//$('#double_check').val("V").css("color", "red");
				alert('저장 되었습니다.');
				
			} else {
				
				alert('저장에 실패하였습니다. 시스템 관리자에게 문의하세요')
			}
 		
 		});
	
	
}	

</script>
</body>
</html>