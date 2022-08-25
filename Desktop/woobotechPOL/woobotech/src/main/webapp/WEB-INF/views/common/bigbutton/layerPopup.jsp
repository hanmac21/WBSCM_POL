<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- popup -->
	<div id="window-mask"></div>

	<div id="window">
		<div id="windowHeader">
			<span id="windowTitle">팝업 제목</span>
			<a id="modalClose" href="#" onclick="BB_closePopupLayer();"></a>
		</div>
		<div id="windowContents">
			팝업 내용
		</div>
	</div>
<!-- popup end-->

<!-- 비밀번호 변경 -->
	<div id="popupPasswordChange" class="popupContents" >
		<form name="passwordForm" id="passwordEdit" onsubmit="return onPasswordSaveClick(this); false;" style="margin:30px;" >
		<input type="hidden" name="seq"/>
			<div class="inputForm" >
				<dl>
					<dt>기존 비밀번호 : </dt>
					<dd><input type="password" name="oldPw" class="input-text" style="width:80px; margin-right:15px;"></dd>
					<dt>신규 비밀번호 : </dt>
					<dd><input type="password" name="newPw" class="input-text" style="width:80px; margin-right:20px;"></dd>
					<dt>비밀번호 확인 : </dt>
					<dd><input type="password" name="newPwConfirm" class="input-text" style="width:80px; margin-right:20px;"></dd>
				</dl>
				<div class="clear"></div>
			</div>
			<div class="toolbox">
				<button type="submit" class="round big orange" style="margin:5px;" >저장</button>
				<a href="javascript:BB_closePopupLayer();" class="button round" >취소</a>
			</div>
		</form>
	</div>	
