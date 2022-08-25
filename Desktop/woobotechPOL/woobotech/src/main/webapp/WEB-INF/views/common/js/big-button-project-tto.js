/**********************************************************************************
 * 공통
 **********************************************************************************/

/**
 * 로딩중 이미지
 */
var spinnerImage = "<div class=\"spinner\"><img src=\"/images/gnome-spinner.gif\"></div>";



/**
 * 아이디 중복 체크
 */
function idDupCheck(frm, obj) {
	$.ajax({
		type:"POST",
		url:"/user_idCheck.do",
		dataType:"html",
		data:"id="+obj.value,
		success:function(msg) {
			if (msg == 0) {
				$("#idCheckResult").css("color","#48f");
				$("#idCheckResult").html("사용할 수 있는 아이디입니다.");
				frm.isCorrectId.value = "1";
			} else {
				$("#idCheckResult").css("color","#f84");
				$("#idCheckResult").html("사용할 수 없는 아이디입니다.");
				frm.isCorrectId.value = "0";
			}
		}
	});
}


/**
 * 비밀번호 변경 팝업 오픈
 */
function onPasswordChangePopClick() {
	BB_popupLayer("비밀번호 변경","#popupPasswordChange");
}
/**
 * 비밀번호 변경 실행
 * @param frm
 * @returns {Boolean}
 */
function onPasswordSaveClick(frm) {
	var oldPw = frm.oldPw.value;
	var newPw = frm.newPw.value;
	var newPwConfirm = frm.newPwConfirm.value;
	if (oldPw=="" || newPw=="" || newPwConfirm=="") {
		alert("기존 비밀번호, 신규비밀번호, 비밀번호 확인을 모두 입력해주세요.");
		return false;
	}
	if (newPw != newPwConfirm) {
		alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		frm.newPw.value = "";
		frm.newPwConfirm.value = "";
		frm.newPw.focus();
		return false;
	} else {
		frm.target = "nullFrame";
		frm.action = "/user_pwChange.do";
		frm.submit();
		BB_closePopupLayer();
		return false;
	}
}
