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
	<input type="hidden" id="room_cd" value="${room_cd}">
	<div class="container-fluid container1">
		<div class="row-fluid">
			<div class="col-xs-8">
				<div class="row-fluid">
					<div class="col-xs-12 div-coin-top">
						<img class="img-coin-mini" alt="bitcoin-icon"
							src="resources/img/ic_coin_bitcoin.png"> 
							<span class="span-top-coin-name">${room_nm}</span> 
							<span class="span-top-coin-KRW">게시판</span>
							<span class="span-top-coin-exchanege">글작성</span>
					</div>
				</div>
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


 	<!-- 게시글 한개 -->
 	<div class="container-fluid container-board-title">
		<div class="row-fluid">
			<div class="col-xs-12">
				<input class="" type="text" placeholder="제목을 입력해주세요" style="width: 100%; padding-left: 10px;" id="title" /> 
			</div>
			
			<div class="col-xs-12 div-board-sub" style="margin-top: 10px;">
				<textarea  placeholder="내용을 입력해주세요" style="width: 100%; min-height: 200px; padding: 10px;" id="contents"></textarea>
			</div>
						
			<div class="col-xs-12 div-board-sub" style="margin-top: 20px;">
				<button type="button" class="btn btn-primary" style="width: 100%; padding: 10px;" onclick="fnSave()">작성완료</button>
			</div>
		</div>
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
	var board_type =$("#room_cd").val();
	
	if(board_type==''){
		location.href="board_list";
		return;
	}
	
	if(title==''){
		alert('제목을 입력하세요');
		return;
	}
	
	if(contents==''){
		alert('내용을 입력하세요');
		return;
	}
	
	
	$.ajax({
 		type:"post",
 		url:"board_write_i",
 		dataType:"html",
 		data:{
 			board_type:board_type,
 			title: title,
 			contents:contents
 		}	
 		}).done(function(data){
 			var isOk = data;
			if (isOk == 1) {
				//$('#double_check').val("V").css("color", "red");
				alert('저장 되었습니다.');
				location.href="board_list?board_type="+board_type;
			} else {
				
				alert('저장에 실패하였습니다. 시스템 관리자에게 문의하세요')
			}
 		
 		});
	
	
}	


</script>
</html>