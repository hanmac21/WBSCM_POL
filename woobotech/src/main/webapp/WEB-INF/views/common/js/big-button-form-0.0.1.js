var isMobile = (
		navigator.userAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null 
		||
		navigator.userAgent.match(/LG|SAMSUNG|Samsung/) != null
);

/**
 * 컨트롤러의 체크 유무를 대상 오브젝트들에 동일하게 적용한다. : 전체 선택/취소
 * @param controller
 * @param target : string : 태그의 name 엘리먼트 값
 */
function checkAll(controller, target){
	var chk_arr = document.getElementsByName(target);
	for (i=0; i<chk_arr.length; i++) {
		chk_arr[i].checked = controller.checked;
	}
}

/**
 * checkbox에서 선택된 항목들의 값을 배열로 리턴한다.
 * @param checkbox
 * @returns {Array}
 */
function getCheckedListValue(checkbox) {
	var chk_arr = document.getElementsByName(checkbox);
	
	var str = new Array();
	var idx = 0;
	for (i=0; i<chk_arr.length; i++) {
		if (chk_arr[i].checked) {
			str[idx] = chk_arr[i].value;
			idx++;
		}
	}
	return str;
}

/**
 * String 값이 "" 이라면 true를 반환한다.
 * @param val
 * @returns {Boolean}
 */
function isEmpty(val) {
	if (val == "") {
		return true;
	} else {
		return false;
	}
}

/**
 * 라디오버튼에 선택된 값을 반환한다.<br>
 * getRadioButtonValue(document.testForm.testRadio); 
 * @param radioElement
 * @returns
 */
function getRadioButtonValue( radioElement ) { 
    for (var i =0; i<radioElement.length; i++) { 
        if( radioElement[i].checked == true ) { 
            return radioElement[i].value; 
        } 
    }
}

/**
 * 한글,영문,숫자만 입력가능합니다.
 * @param val
 * @returns {Boolean}
 */
function validKorEngNum(val) {
	val = val.replace(/^[0-9a-zA-Zㄱ-힣\s]*$/,"");
	if (val != ""){
		alert("한글,영문,숫자만 입력가능합니다.");
		return false;
	} else {
		return true;
	}
}
/**
 * 영문,숫자만 입력가능합니다.
 * @param val
 * @returns {Boolean}
 */
function validEngNum(val) {
	val = val.replace(/^[0-9a-zA-Z\s]*$/,"");
	if (val != ""){
		alert("영문,숫자만 입력가능합니다.");
		return false;
	} else {
		return true;
	}
}
/**
 * 영문만 입력가능합니다.
 * @param val
 * @returns {Boolean}
 */
function validEng(val) {
	val = val.replace(/^[a-zA-Z\s]*$/,"");
	if (val != ""){
		alert("영문만 입력가능합니다.");
		return false;
	} else {
		return true;
	}
}
/**
 * 숫자만 입력가능합니다.
 * @param val
 * @returns {Boolean}
 */
function validNum(val) {
	val = val.replace(/^[0-9\s]*$/,"");
	if (val != ""){
		alert("숫자만 입력가능합니다.");
		return false;
	} else {
		return true;
	}
}
/**
 * 영문,숫자,일부 특수문자(-_.)만 입력가능합니다.
 * @param val
 * @returns {Boolean}
 */
function validEngNumSp(val) {
	val = val.replace(/^[0-9a-zA-Z-_.\s]*$/,"");
	if (val != ""){
		alert("영문,숫자,일부 특수문자-_.만 입력가능합니다.");
		return false;
	} else {
		return true;
	}
}