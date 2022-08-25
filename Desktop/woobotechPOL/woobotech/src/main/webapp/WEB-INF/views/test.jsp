<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<OBJECT classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921"
codebase="http://download.videolan.org/pub/videolan/vlc/2.2.4/win32/vlc-2.2.4-win32.exe"
width="100%" height="100%" id="vlc" events="True">
    <embed type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" name="vlc" />
    <param name="Src" value="rtsp://duhyuncctv.withcctv.com:554/user=admin&password=aaaaaaa1&channel=1&stream=0.sdp" />
    <param name="autostart" value="true" />
    <param name="ShowDisplay" value="false" />
    <param name="AutoLoop" value="false" />
    <param name="AutoPlay" value="true" />
</OBJECT>



</body>



</html>