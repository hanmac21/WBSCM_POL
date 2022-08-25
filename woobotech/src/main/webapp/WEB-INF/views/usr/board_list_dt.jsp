<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="resources/css/devedu-custom.css?ver=15">


</head>
<body> 
	<input type="hidden" id="brd_no" value="${board.brd_no}">
	<input type="hidden" id="board_type" value="${board.board_type}">
 	<!-- 타이틀 -->
 	<div class="container-fluid container-board-detail-title">
		<div class="row-fluid"> 
			<div class="col-xs-12">
				<span class="span-board-subject" id="title"><a href="board_list?board_type=${board.board_type}">${board.title}</a></span>
			</div>
			
			<div class="col-xs-12 div-board-sub">
				<hr class="hr-board03">
			</div>
			 
			<div class="col-xs-12 div-board-sub"> 
				<span class="span-board-writer">${board.userid}</span>
				<span class="span-board-date">${board.reg_date}</span>
				<c:choose>
				<c:when test="${board.userid==session_userid}">
				<span class="span-board-du"><a href="javascript:fnSave()">수정</a></span>
				<span class="span-board-temp">|</span>
				<span class="span-board-du"><a href="javascript:fnDelete()">삭제</a></span>
				</c:when>
				<c:otherwise>
				<span class="span-board-du"><a href="javascript:alert('수정권한이 없습니다.')">수정</a></span>
				<span class="span-board-temp">|</span>
				<span class="span-board-du"><a href="javascript:alert('삭제권한이 없습니다.')">삭제</a></span>
				</c:otherwise>
				</c:choose>  
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
			<textarea  placeholder="내용을 입력해주세요" style="width: 100%; min-height: 200px; padding: 10px;" id="contents">${board.contents}</textarea> 
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
	
	<div class="container-fluid" style="margin-top: 5px; margin-bottom: 5px;">
		<div class="row-fluid">
			<div class="col-xs-12 padding-0" style="padding: 15px;"> 
				<textarea style="width: 100%; min-height: 50px; padding: 8px;" id="reply"></textarea> 
				
				<button type="button" class="btn btn-primary btn-login" style="float: right; width: 100%; margin-top: 5px;" onclick="fnReplySave()">댓글 입력</button> 
			</div>
		</div>
	</div>

	
	<hr class="hr-reply">
	<c:choose>
		<c:when test="${ reply.size() > 0 }">
			<c:forEach var="vo" items="${ reply }">
				<!-- 댓글 -->
				<div class="container-fluid" style="margin-top: 5px;">

					<div class="row-fluid padding-15">
						<div class="div-board-reply-id">${vo.userid}</div>
						<div class="div-board-reply-date">| ${vo.reg_date}</div>
						<c:choose>
						<c:when test="${vo.userid==session_userid}">
						 <span class="span-board-du"><a href="javascript:fnReplyDelete('${vo.id}')">삭제</a></span>
						</c:when>
						<c:otherwise>
							<span class="span-board-du"><a href="javascript:alert('삭제권한이 없습니다.')">삭제</a></span>
						</c:otherwise>
						</c:choose>
					</div>

					<div class="row-fluid padding-15">
						<div class="div-board-reply">${vo.reply}</div>
					</div>

					<hr class="hr-reply">
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>
</body>






<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
//수정
function fnSave(){
	
	if(!confirm("저장하시겠습니까?")){
		return;
	}
	var title = $("#title").text();
	var contents = $("#contents").val();
	var board_type =$("#board_type").val();
	/*
	if(title==''){
		alert('제목을 입력하세요');
		return;
	}
	*/
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
				location.href="board_list?board_type="+board_type;
			} else {
				alert('저장에 실패하였습니다.')
			}
 		
 		});
	
	
}	

//삭제
function fnDelete(){
	if(!confirm("삭제 하시겠습니까?")){
		return;
	}
	
	var brd_no =$("#brd_no").val();
	var board_type =$("#board_type").val();
	$.ajax({
 		type:"post",
 		url:"board_write_d",
 		dataType:"html",
 		data:{
 			brd_no:brd_no,
 		}	
 		}).done(function(data){
 			var isOk = data;
			if (isOk == 1) {
				alert('삭제 되었습니다.');
				location.href="board_list?board_type="+board_type;
			} else {
				alert('삭제에 실패하였습니다.')
			}
 		});
	
}	


//댓글
function fnReplySave(){
	
	if(!confirm("댓글을 저장하시겠습니까?")){
		return;
	}
	var brd_no =$("#brd_no").val();
	var reply = $("#reply").val();
	if(reply==''){
		alert('내용을 입력하세요');
		return;
	}
	
	
	$.ajax({
 		type:"post",
 		url:"board_reply_i",
 		dataType:"html",
 		data:{
 			brd_no:brd_no,
 			reply: reply,
 		}	
 		}).done(function(data){
 			var isOk = data;
			if (isOk == 1) {
				//$('#double_check').val("V").css("color", "red");
				alert('저장 되었습니다.');
				location.reload();
			} else {
				alert('저장에 실패하였습니다.')
			}
 		
 		});
	
	
}	

//댓글 삭제
function fnReplyDelete(id){
	if(!confirm("댓글을 삭제 하시겠습니까?")){
		return;
	}
	
	
	$.ajax({
 		type:"post",
 		url:"board_reply_d",
 		dataType:"html",
 		data:{
 			id:id,
 		}	
 		}).done(function(data){
 			var isOk = data;
			if (isOk == 1) {
				alert('삭제 되었습니다.');
				location.reload();
			} else {
				alert('삭제에 실패하였습니다.')
			}
 		});
	
}	

</script>	
	
	
</body>
</html>