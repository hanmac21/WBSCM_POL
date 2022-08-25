/**************************************************
*
*	SODA Calendar Control ver 2.0
*
*	만든날짜: 2004.04.03
*	만든사람: 홍준표(sorisoda72@hotmail.com)
*
*	향후버전: BtnCalendar에 textindex를 설정 텍스트박스배열에 적용토록 할 것
*
*	<사용법>
*	1. 반드시 <BODY>와 </BODY>태그 사이에서 Calendar.js를 INCLUDE하는 소스를 넣는다.
*		예) <script language="JavaScript" src="/Calendar.js"></script>
*	2. Calendar Control을 불러올 이미지아이콘(필)이 들어갈 위치에 
*		<script language="JavaScript">Exec_Calendar("달력과 함께 사용될 텍스트박스이름","아이콘경로");</script>
*		예) <script language="JavaScript">Exec_Calendar("SDATE","/images/calendar.gif");</script>
*
**************************************************/

/**************************************************
	● 전역변수 선언
**************************************************/

// Calendar Show OR Hide
var bShowHideCalendarDisplay;

// Calendar 기본폼 구성여부
var bInitCalendar;

// Calendar Size
var CalendarX,CalendarY;

// Year,Month,Day변수(순서대로-오늘,입력일자,처리(년,월))
var ToDay_Y,ToDay_M,ToDay_D;
var TxDay_Y,TxDay_M,TxDay_D;
var iCalendarYear,iCalendarMonth;

// FORM과 TEXTBOX
var eleCalendarF,eleCalendarN;

// Calendar 위치(true:위,false:아래)
var bCalendar_Pos,bCalendar_Pos_Old;

// Calendar의 수와 보이는 형식
var CalendarImageCount;

var Opacity_Run;

// default: none, 초기화진행
bShowHideCalendarDisplay = false;
bInitCalendar = true;

CalendarX = 187;
CalendarY = 145;

bCalendar_Pos = false;
bCalendar_Pos_Old = false;

CalendarImageCount = 0;


/**
 * input box - calendar function call
 * elt : input text element
 */
function InClick_Calendar(elt)
{
	if(Check_Calendar(elt))
	{
	Calendar_Display(elt);
	}
}

/**
 * input box - calendar function call , 현재 날짜 설정
 * elt : input text element
 * dataValue : 설정값 
 */
function InClick_Calendar(elt,dateValue)
{
	if(Check_Calendar(elt))
	{
	Calendar_Display(elt,dateValue);
	}
}


/**************************************************
	● Page HTML 구성 및 이벤트 발생
**************************************************/

// Calendar Control이 들어갈 위치(DIV) 만들기
document.write('<DIV id="CalendarControl" class="CalendarControl" STYLE="width:' + CalendarX + '; height:' + CalendarY + '; display:none;"></DIV>');

// 마우스 클릭 이벤트 발생시 함수로딩
document.onmouseup = ShowHide_Calendar;

function Exec_Calendar(tN,iM)
{
	CalendarImageCount = CalendarImageCount + 1;
	document.write('<img id="BtnCalendar'+CalendarImageCount+'" textname="'+tN+'" align="absmiddle" src="'+iM+'" border="0" style="cursor:hand;">');
}

/**************************************************
	● 이벤트 발생에 따른 처리
**************************************************/

function ShowHide_Calendar()
{
	if(bShowHideCalendarDisplay) Hide_Calendar();
	else Show_Calendar();
}

function Hide_Calendar()
{
	CalendarControl.style.position = 'absolute';
	CalendarControl.style.left = 0;
	CalendarControl.style.top = 0;
	CalendarControl.style.width = 0;
	CalendarControl.style.display = 'none';
	bShowHideCalendarDisplay = false;
}

function Calendar_Show(cx,cy)
{
	CalendarControl.style.position = 'absolute';
	CalendarControl.style.left = cx-1;
	CalendarControl.style.top = cy;
	CalendarControl.style.width = CalendarX;
	CalendarControl.style.display = 'block';
	bShowHideCalendarDisplay = true;
	
	Calendar_Opacity(100);
}

function Calendar_Opacity(iOpacity)
{
	if(iOpacity < 90)
	{
		document.all["frmCalendarControl"].filters.alpha.opacity = iOpacity;
		Opacity_Run = setTimeout("Calendar_Opacity("+(iOpacity + 5)+");",50);
	}
	else
	{
		//document.all["frmCalendarControl"].filters.alpha.opacity = 100;
		Opacity_Run = null;
	}
}

function Show_Calendar()
{
	var elt,eltTN;
	var eltCN;

	// BtnCalendar로 시작되는 ID를 가진 Image Tag에서 Event발생
	elt = window.event.srcElement;
	
	eltTN = elt.tagName;

	if(eltTN == "IMG")
	{
		eltCN = elt.id;
		if(eltCN.substring(0,11) == "BtnCalendar")
		{
			// 소스검증 후 실처리함수 실행
			if(Check_Calendar(elt))
			{
				Calendar_Display(elt);
			}
		}
	}
}

function Calendar_Display(elt,dateValue)
{
	// Position 설정
	var frmPosX,frmPosY;
	if(elt != null)
	{
		frmPosX = GetLayerPositionX(elt);
		frmPosY = GetLayerPositionY(elt);
	}

	// 오늘날짜확인(To_Day)
	Set_ToDay(elt,dateValue);
	
	// 입력일자확인(Tx_Day)
	Set_TxDay(elt);
	
	// 일수와 월시작요일 가져오기
	var nDays,iWeek;
	nDays = GetDaysOfMonths(iCalendarYear,iCalendarMonth);
	iWeek = GetWeekOfDays(iCalendarYear,iCalendarMonth);
	
	// 초기화진행
	if(bInitCalendar || bCalendar_Pos != bCalendar_Pos_Old)
	{
		Calendar_Init();
		bCalendar_Pos_Old = bCalendar_Pos;
		bInitCalendar = false; // 초기화완료
	}
	
	// 해당월에 따른 실구성
	Make_Calendar(nDays,iWeek);
	
	document.frames["frmCalendarControl"].CalendarYear.innerHTML = iCalendarYear;
	if(iCalendarMonth < 10) document.frames["frmCalendarControl"].CalendarMonth.innerHTML = "0"+iCalendarMonth;
	else document.frames["frmCalendarControl"].CalendarMonth.innerHTML = iCalendarMonth;
	
	if(elt != null) Calendar_Show(frmPosX,frmPosY);
	
}

// Calendar Basic Form 만들기
function Calendar_Init()
{
	var str;
	var strScript,sPos;
	var rt;
	var tM,tD;
	
	if(ToDay_M < 10) tM = "0"+ToDay_M;
	else tM = ToDay_M;
	if(ToDay_D >= 10) tD = ToDay_D;
	else tD = "0"+ToDay_D;
	
	if(bCalendar_Pos) sPos="bottom";
	else sPos="top";
	
	rt = '\r\n';
	strScript = "SCRIPT";
	
	str = '' +
	'<HTML><HEAD>' + rt +
	'<META HTTP-EQUIV="Content-Type" Content="text/html; charset=ks_c_5601-1987">' + rt +
	'<style type="text/css">' + rt +
	'a {text-decoration: none;color:#008080;}' + rt +
	'a:active,' + rt +
	'a:hover {text-decoration: none;color:#008080;}' + rt +
	'a * {cursor: pointer;}' + rt +
	'* {margin: 0;padding: 0;font-family:"tahoma","verdana","돋움","굴림",Dotum,Gulim,Helvetica,AppleGothic,Sans-serif;-webkit-text-size-adjust:none;}' + rt +
	'body {margin: 0;padding: 0;background:#999;font-size:11px;letter-spacing:-1px;color:#575757;word-wrap:break-word;word-break:break-all;overflow: hidden;*overflow-x: hidden;*overflow-y: hidden;}' + rt +
	'dl, ol, li {list-style:none;}' + rt +
	'/* calendar */' + rt +
	'.sch {margin:0;padding:0;background:#a9ccd3;height:22px;border-bottom:1px solid #80b0b0;text-align:center;}' + rt +
	'.sch ul {margin:0;padding:0;width:160px;}' + rt +
	'.sch ul li {float:left;margin:5px 0 0;padding:0;}' + rt +
	'.sch ul li.prevBtn {width:40px;text-align:center;}' + rt +
	'.sch ul li.thisYear {width:50px;text-align:center;font-weight:bold;color:#008080;}' + rt +
	'.sch ul li.thisMonth {width:30px;text-align:center;font-weight:bold;color:#008080;}' + rt +
	'.sch ul li.nextBtn {width:40px;text-align:center;}' + rt +
	'.sch ul li a {font-size:12pt;}' + rt +
	'' + rt +
	'.calendar {clear:both;margin:0 0 9px;padding:0;}' + rt +
	'.calendar table {margin:0;padding:0;width:100%;border-collapse:collapse;}' + rt +
	'.calendar table tr {background:#f3f3f3;}' + rt +
	'.calendar table tbody tr {height:17px;border-bottom:1px solid #e2e2e2;}' + rt +
	'.calendar table tbody tr td {text-align:center;}' + rt +
	'.calendar table tbody tr.b0 {border-bottom:0;}' + rt +
	'.calendar table tbody tr.bimg {border-bottom:0;height:6px;}' + rt +
	'.calendar table tbody tr.b0 td a {text-align:center;}' + rt +
	'.calendar table tbody tr.bimg {background:none;}' + rt +
	'.calendar table tbody tr.bimg td table {width:100%;border-collapse:collapse;height:6px;line-height:6px;}' + rt +
	'.calendar table tbody tr.bimg td table tr {border-bottom:0;height:6px;background:none;}' + rt +
	'.calendar table tbody tr.bimg td table tr td.bimg_left {background:url("/gadget/img/bg-calendar-left.png") no-repeat left bottom;}' + rt +
	'.calendar table tbody tr.bimg td table tr td.bimg_center {background:#f3f3f3;height:6px;color:#fff;}' + rt +
	'.calendar table tbody tr.bimg td table tr td.bimg_right {background:url("/gadget/img/bg-calendar-right.png") no-repeat right bottom;}' + rt +
	'' + rt +
	'.calendar table th,' + rt +
	'.calendar table td {text-align:center;font-size:8pt;}' + rt +
	'.calendar table th.sun {color:#e60d0d;}' + rt +
	'.calendar table th.sat {color:#63abdd;}' + rt +
	'.calendar table td.sun {color:#e60d0d;}' + rt +
	'.calendar table td.sat {color:#0075b2;}' + rt +
	'.calendar table td.nm a {color:#b3b3b3;}' + rt +
	'.calendar table td.sat.sat_nm a {color:#7ab7d4;}' + rt +
	'.calendar table td.sun.sun_nm a {color:#d9968d;}' + rt +
	'.calendar table td.dday a {display:inline-block;margin:0 auto;padding:2px 0 0;width:18px;height:12px;border:1px solid #ccc;background:url("/gadget/img/bg-dday.png") repeat-x left top;}' + rt +
	'.calendar table td.today a {display:inline-block;margin:0 auto;padding:2px 0 0;width:18px;height:12px;border:1px solid #d6c963;background:url("/gadget/img/bg-today.png") repeat-x left top;}' + rt +
	'.calendar table th {height:16px;font-size:10px;font-family:"verdana";}' + rt +
	'.calendar table td a {font-family:"Tahoma";font-size:9px;color:#555;}' + rt +
	'</style>' + rt +

	'<' + strScript + ' language="JavaScript">' + rt +
	'' + rt +
	'function MoveCalendar(mcv)' + rt +
	'{' + rt +
	'	parent.GetYMDOfMC(mcv);' + rt +
	'}' + rt +
	'' + rt +
	'function MoveYear(mcv)' + rt +
	'{' + rt +
	'	parent.Move_Year(mcv);' + rt +
	'}' + rt +
	'' + rt +
	'function ClickDay(mcv)' + rt +
	'{' + rt +
	'	parent.GetYMDOfCD(mcv);' + rt +
	'}' + rt +
	'' + rt +
	'function ToDayCalendar()' + rt +
	'{' + rt +
	'	parent.GetYMDOfTD();' + rt +
	'}' + rt +
	'' + rt +
	'</' + strScript + '>' + rt +
	'</HEAD><BODY style="margin:0; padding:0; background:#fff;">' + rt +

	'<div class="sch">' + rt +
	'	<ul>' + rt +
	'		<li class="prevBtn"><a href="javascript:MoveYear(-1);">◀</a> <a href="javascript:MoveCalendar(-1);">◁</a></li>' + rt +
	'		<li class="thisYear"><span id="CalendarYear"></span>년</li>' + rt +
	'		<li class="thisMonth"><span id="CalendarMonth"></span>월</li>' + rt +
	'		<li class="nextBtn"><a href="javascript:MoveCalendar(1);">▶</a> <a href="javascript:MoveYear(1);">▷</a></li>' + rt +
	'	</ul>' + rt +
	'</div>' + rt +
	'<div class="calendar">' + rt +
	'	<table>' + rt +
	'	<colgroup>' + rt +
	'		<col width="14%" />' + rt +
	'		<col width="14%" />' + rt +
	'		<col width="14%" />' + rt +
	'		<col width="14%" />' + rt +
	'		<col width="14%" />' + rt +
	'		<col width="14%" />' + rt +
	'		<col width="14%" />' + rt +
	'	</colgroup>' + rt +
	'	<thead>' + rt +
	'		<tr>' + rt +
	'			<th class="sun">Su</th>' + rt +
	'			<th>Mo</th>' + rt +
	'			<th>Tu</th>' + rt +
	'			<th>We</th>' + rt +
	'			<th>Th</th>' + rt +
	'			<th>Fr</th>' + rt +
	'			<th class="sat">Sa</th>' + rt +
	'		</tr>' + rt +
	'	</thead>' + rt +
	'	</table>' + rt +
	'	<span name="CalendarTable" id="CalendarTable"></span>' + rt +
	'</div>' + rt +


	'</body></html>' + rt +
	'';

	var istrTemp;
	istrTemp = '<div style="z-index:10000;"><iframe width="'+CalendarX+'" height="'+CalendarY+'" name="frmCalendarControl" frameborder="0" scrolling="no" style="border:1px solid #555;"></iframe></div>';
	
	document.all["CalendarControl"].innerHTML = istrTemp;
	frmCalendarControl.document.open();
	frmCalendarControl.document.write(str);
	frmCalendarControl.document.close();
	str = null;
}

// 입력일 확인
function Set_TxDay(elt)
{
	if(elt != null)
	{
		if(CheckYMD())
		{
			var YMDValue;
			var YMDArr;
			
			YMDValue = eleCalendarN.value;
			YMDArr = YMDValue.split('/');
			
			TxDay_Y = parseInt(YMDArr[0],10);
			TxDay_M = parseInt(YMDArr[1],10);
			TxDay_D = parseInt(YMDArr[2],10);
			
			iCalendarYear = TxDay_Y;
			iCalendarMonth = TxDay_M;
		}
		else
		{
			TxDay_Y = 0;
			TxDay_M = 0;
			TxDay_D = 0;
		}
	}
}

/**************************************************
	● 보조함수
**************************************************/

// Position 계산
function GetLayerPositionX(ele)
{
	var sx,scx,ix,iw,rx,wx;
	
	wx	= window.document.body.offsetWidth - 21;
	sx	= window.event.clientX;
	scx	= document.body.scrollLeft;
	ix	= window.event.offsetX;
	iw	= ele.offsetWidth;
	
	rx	= sx + scx - ix;
	if(wx < (rx + CalendarX))
	{
		rx = wx - CalendarX + scx;
		if(rx < 0) rx = 10;
	}
	return rx;
}

function GetLayerPositionY(ele)
{
	var sy,scy,iy,ih,ry,wy;
	
	wy	= window.document.body.offsetHeight - 5;
	sy	= window.event.clientY;
	scy	= document.body.scrollTop;
	iy	= window.event.offsetY;
	ih	= ele.offsetHeight;
	
	bCalendar_Pos = false;
	ry = sy + scy + (ih - iy);
	if(wy < (ry + CalendarY))
	{
		if(CalendarY < (ry - ih))
		{
			ry = sy - (iy + CalendarY + 3) + scy;
			bCalendar_Pos = true;
		}
	}
	return ry;
}

// 오늘
function Set_ToDay(elt,dateValue)
{
	if (dateValue==undefined || dateValue=="") {
		var Today = new Date();
		ToDay_Y = Today.getFullYear();
		ToDay_M = Today.getMonth() + 1;
		ToDay_D = Today.getDate();
	} else {
		dArr = dateValue.split("-");
		ToDay_Y = Number(dArr[0]);
		ToDay_M = Number(dArr[1]);
		ToDay_D = Number(dArr[2]);
	}
	if(elt != null)
	{
		iCalendarYear = ToDay_Y;
		iCalendarMonth = ToDay_M;
	}
}

// 월별일수
function GetDaysOfMonths(iY,iM)
{
	var intTemp;
	
	if(iM == 2) intTemp = CheckLeapYear(iY);
	else intTemp = CheckMonthDays(iM);
	
	return intTemp;
}

// 주시작요일
function GetWeekOfDays(iY,iM)
{
	var intTemp;
	var iDate;
	iDate = new Date(iY + '/' + iM + '/1');
	intTemp = iDate.getDay();
	
	return intTemp;
}

// 윤달계산
function CheckLeapYear(iY)
{
	var iDays;
	if(((iY % 4 == 0) && (iY % 100 != 0)) || (iY % 400 == 0)) iDays = 29;
	else iDays = 28;
	return iDays;
}

// 일수리턴
function CheckMonthDays(iM)
{
	var iDays;
	if((iM == 4 || iM == 6) || (iM == 9 || iM == 11)) iDays = 30;
	else iDays = 31;
	return iDays;
}

// 입력일 검증 및 가져오기(검증:true)
function CheckYMD()
{
	var YMDValue;
	var cFlag;
	var yVal,mVal,dVal,cVal;
	
	YMDValue = eleCalendarN.value;
	cFlag = false;

	//YMDValue = YMDValue.replace(/\-/g,"-");
	eleCalendarN.value = YMDValue;
	
	if(YMDValue.match(/\d+\/\d+\/\d+/g) == YMDValue) cFlag = true;
	if(cFlag)
	{
		ymdArr = YMDValue.split('/');
		if(ymdArr[0].length == 4 && ymdArr[1].length <= 2 && ymdArr[2].length <= 2)
		{
			yVal = parseInt(ymdArr[0],10);
			if(1900 > yVal || 2200 < yVal) cFlag = false;
			mVal = parseInt(ymdArr[1],10);
			if(12 < mVal || 0 >= mVal) cFlag = false;
			dVal = parseInt(ymdArr[2],10);
			if(mVal == 2) cVal = CheckLeapYear(yVal);
			else cVal = CheckMonthDays(mVal)
			if(cVal < dVal || 0 >= dVal) cFlag = false;
		}
		else
		{
			cFlag = false;
		}
	}
	if(cFlag) return true;
	return false;
}

/**************************************************
	● 소스검증
**************************************************/
function Check_Calendar(elt)
{
	var strCalendar;
	var parentEle;
	var strFORM;
	var bRUN;
	var ieleN;

	// 처리전검증1 - TextBox와 Calendar Image Icon Connect1
	strCalendar = elt.getAttribute("textname");
	if(strCalendar == null || strCalendar == "")
	{
		alert('Calendar Image Icon에 "textname"이란 Property를 만들고,\n\n관련 TextBox의 Name값을 입력해 주십시오.');
		return false;
	}
	else
	{
		// 처리전검증2 - FORM Tage 존재
		strFORM = "";
		bRUN = false;
			
		parentEle = elt.parentElement;
		while(strFORM == "")
		{
			if(parentEle.tagName == "FORM" || parentEle.tagName == "BODY" || parentEle.tagName == "HTML")
			{
				if(parentEle.tagName == "FORM")
				{
					strFORM = parentEle.name;
					bRUN = true;
				}
				else
				{
					strFORM = "BODY";
				}
			}
			else
			{
				parentEle = parentEle.parentElement;
			}
		}
		if(!bRUN)
		{
			alert('Calendar Control은 FORM태그 안에서만 사용가능합니다.\n\nFORM태그를 만들어 주십시오.');
			return false;
		}

		var iMax;
		bRUN = false;

		// 처리전검증3 - TextBox와 Calendar Image Icon Connect2
		eleCalendarF = eval('document.' + strFORM);
		iMax = eleCalendarF.elements.length;
		ieleN = 0;
		for(var i = 0; i < iMax; i++)
		{
			if(eleCalendarF.elements[i].name == strCalendar)
			{
				bRUN = true;
				eleCalendarN = eval('document.' + strFORM + '.' + strCalendar);
				ieleN += 1;
				//i = iMax + 1;
			}
		}
		if(ieleN > 1)
		{
			alert('동일한 이름의 TextBox가 '+ieleN+'개 있습니다.\n\nCalendar Control은 동일한 이름의 TextBox를 사용할 수 없습니다.');
			return false;
		}
		if(!bRUN)
		{
			alert('Calendar Image가 종속된 TextBox가 없습니다.\n\ntextname의 값과 일치하는 TextBox를 설정해 주십시오.');
			return false;
		}
	}
	return true;
}

/**************************************************
	● 주요소스(달력만들기)
**************************************************/
function Make_Calendar(nD,iW)
{
	var str;
	var rt;
	var strnbsp;
	var irow;
	var i;
	var iDay_o,iDay_x;
	var sD1,sD2;
	
	rt = "\r\n";
	strnbsp = '	<td align="center" class="day">&nbsp;</td>' + rt;
	irow = 0;
	iDay_o = 0;
	iDay_x = 0;
	sD1 = '';
	sD2 = '';
	
	// 입력일과 같은 달인 경우
	if(TxDay_Y == iCalendarYear && TxDay_M == iCalendarMonth)
	{
		iDay_x = TxDay_D;
		sD1 = 'font-weight:bold;text-decoration:underline;';
	}
	// 오늘이 있는 달인 경우
	if(ToDay_Y == iCalendarYear && ToDay_M == iCalendarMonth) {
		iDay_o = ToDay_D;
		sD1 = 'font-weight:bold;text-decoration:underline;';
	}
	
	str = '<table width="159" border="0" cellpadding="0" cellspacing="0" class="calendar">' + rt + '<tbody>' + rt + '<tr style="background:#fff;">' + rt;
	
	for(i = 0; i < iW; i++)
	{
		str += strnbsp;
		irow += 1;
	}
	
	for (i = 1; i <= nD; i++)
	{
		if (irow % 7 == 0 && irow > 0) {
			if (i == nD) {
				str += '</tr>' + rt + '<tr class="b0" style="background:#fff;">' + rt;
			} else {
				str += '</tr>' + rt + '<tr style="background:#fff;">' + rt;
			}
		}
		if (ToDay_Y == iCalendarYear && ToDay_M == iCalendarMonth && i == ToDay_D) {
			sD1 = "font-weight:bold;";
			sD2 = ' style="cursor:pointer;'+sD1+'"';
		} else {
			sD2 = ' style="cursor:pointer;"';
		}

//		if(iDay_x == i) sD2 = ' style="cursor:pointer;'+sD1+'"';
//		else sD2 = ' style="cursor:pointer;"';
		switch (irow % 7)
		{
			case 0:
				if(iDay_o == i) str += '<td class="sun" '+sD2+' OnClick="JavaScript:ClickDay('+i+')"; align="center">' + i + '</td>' + rt;
				else str += '<td class="sun" '+sD2+' OnClick="JavaScript:ClickDay('+i+')"; align="center">' + i + '</td>' + rt;
				break;
			case 6:
				if(iDay_o == i) str += '<td class="sat" '+sD2+' OnClick="JavaScript:ClickDay('+i+')"; align="center">' + i + '</td>' + rt;
				else str += '<td class="sat" '+sD2+' OnClick="JavaScript:ClickDay('+i+')"; align="center">' + i + '</td>' + rt;
				break;
			default:
				if(iDay_o == i) str += '<td class="day" '+sD2+' OnClick="JavaScript:ClickDay('+i+')"; align="center">' + i + '</td>' + rt;
				else str += '<td class="day" '+sD2+' OnClick="JavaScript:ClickDay('+i+')"; align="center">' + i + '</td>' + rt;
				break;
		}
		irow += 1;
	}
	
	irow = 7 - (irow % 7);
	if(irow == 7) irow = 0;
	for(i = 1; i <= irow; i++)
	{
		str += strnbsp;
	}
	
	str += '</tr>' + rt + '</tbody>' + rt + '</table>';
	
	document.frames["frmCalendarControl"].CalendarTable.innerHTML = str;
	str = null;
}

/**************************************************
	● 달력 내 이벤트
**************************************************/

// 월이동
function GetYMDOfMC(mcv)
{
	var itmp;
	
	itmp = iCalendarMonth + mcv;
	if(itmp >= 1 && itmp <= 12)
	{
		iCalendarMonth = itmp;
	}
	else
	{
		if(itmp < 1)
		{
			iCalendarMonth = 12 + itmp;
			iCalendarYear -= 1;
		}
		else
		{
			iCalendarMonth = itmp - 12;
			iCalendarYear += 1;
		}
	}
	
	Move_Calendar();
}


// 년이동(=12개월 이동)
function Move_Year(mcv)
{
	var itmp;
	
	itmp = iCalendarMonth + parseInt(mcv)*12;
	if(itmp >= 1 && itmp <= 12)
	{
		iCalendarMonth = itmp;
	}
	else
	{
		if(itmp < 1)
		{
			iCalendarMonth = 12 + itmp;
			iCalendarYear -= 1;
		}
		else
		{
			iCalendarMonth = itmp - 12;
			iCalendarYear += 1;
		}
	}
	
	Move_Calendar();
}


function GetYMDOfTD()
{
	iCalendarMonth = ToDay_M;
	iCalendarYear = ToDay_Y;
	//eleCalendarN.focus();
	Move_Calendar();
}

function GetYMDOfCD(mcv)
{
	var	mcvMonth, mcvDay;
	if(iCalendarMonth < 10) mcvMonth = '0' + iCalendarMonth;
	else mcvMonth = '' + iCalendarMonth;
	if(mcv < 10) mcvDay = '0' + mcv;
	else mcvDay = '' + mcv
	eleCalendarN.value = iCalendarYear + '-' + mcvMonth + '-' + mcvDay;
	Hide_Calendar();
}

function Move_Calendar()
{
	Calendar_Display(null);
}