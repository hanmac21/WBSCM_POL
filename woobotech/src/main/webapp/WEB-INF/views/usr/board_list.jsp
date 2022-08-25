<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스위취백</title>

<!-- 모바일 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 브라우저 초기화 -->
<link rel="stylesheet" href="resources/css/nomalize.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<!-- 커스텀 CSS -->
<link rel="stylesheet" href="resources/css/devedu-custom.css?ver=5">


</head>
<form method="post" name="form1" id="form1" action="">
<input type="hidden" id="p_room_cd" name="p_room_cd">
<input type="hidden" id="p_room_nm" name="p_room_nm"> 
</form>
<body> 

	<div class="container-fluid container1">
		<div class="row-fluid">
			<div class="col-xs-8" style="height: 55px;">
				<div class="row-fluid">
					<div class="col-xs-12 div-coin-top">
						<img class="img-coin-mini" alt="bitcoin-icon"
							src="resources/img/ic_logo_mini_blue.png"> 
							<span class="span-top-coin-name">SwitchBack</span> 
							<span class="span-top-coin-KRW">토론방</span>
							<span class="span-top-coin-exchanege" id="title_coin">(BTC)</span>
					</div>

					<div class="col-xs-12" style="margin-top: 13px; padding: 0px;">
						<select name="board_type" id="board_type" style="width: 100%; height:23px; padding: 0px;" onChange="fnSelect(this.value)">
								<c:forEach var="by" items="${ board_type }">
									<option value="${ by.room_cd }"  ${by.room_cd ==p_board_type ? 'selected' :'' }>${ by.room_nm}</option>
								</c:forEach>
						</select>
						
					</div>
				</div>
			</div>

			<div class="col-xs-4"style="height: 55px;">
				<img class="img-board-write" alt="img-board-write" src="resources/img/btn_write.png" onclick="fnMove()"> 
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
	<c:choose>
		<c:when test="${ board.size() > 0 }">
			<c:forEach var="vo" items="${ board }">
				<!-- 게시글 한개 -->
				<div class="container-fluid container-board-title">
					<div class="row-fluid">
						<div class="col-xs-12">
							<span class="span-board-subject"><a href="board_list_dt?brd_no=${vo.brd_no}">${vo.title}</a></span>
						</div>

						<div class="col-xs-12 div-board-sub">
							<hr class="hr-board03">
						</div>

						<div class="col-xs-12 div-board-sub">
							<span class="span-board-writer">${vo.userid}</span> <span
								class="span-board-date">${vo.reg_date}</span> <span
								class="span-board-date" style="float: right;">${vo.reply_cnt}</span> <img
								class="img-board-title-reply" alt="ic_board_title_reply"
								src="resources/img/ic_board_title_reply.png">

						</div>
					</div>

					<div class="row-fluid">
						<div class="col-xs-12 padding-0">
							<hr class="hr-board02" style="margin-top: 12px;">
						</div>
					</div>
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="2" style="height: 100px; text-align: center;">검색된
					자료가 없습니다.</td>
			</tr>
		</c:otherwise>

	</c:choose>
	<!-- 게시글 한개 -->
	
</body>






<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//alert('${board_type.size()}');
	<c:choose>
	<c:when test="${board_type.size()>0}">
		<c:forEach var="vo" items="${board_type}" varStatus="status">
		//alert('${p_board_type}');
		
		<c:choose>
		<c:when test="${vo.room_cd==p_board_type}">
			$("#title_coin").text('(${vo.room_nm})');
		</c:when>
		</c:choose>
		 </c:forEach>
	</c:when>
	</c:choose>	

});


function fnSelect(board_type){
	location.href="board_list?board_type="+board_type;
}
function fnMove(){
	var  room_nm =$('#board_type option:checked').text();
	var  room_cd =$('#board_type').val();
    $("#p_room_cd").val(room_cd);
    $("#p_room_nm").val(room_nm);
   
    
    $("#form1").attr("action", "board_write");
    $( "#form1" ).submit();
}


</script>


</body>
</html>