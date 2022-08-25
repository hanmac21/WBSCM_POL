package com.woobotech.service.jutil;

public class Script {

  public static String href(String alertMessage, String locationPath) {
    StringBuilder sb = new StringBuilder();

    sb.append("<script>");
    sb.append("alert('" + alertMessage + "');");
    sb.append("location.href = '" + locationPath + "';");
    sb.append("</script>");

    return sb.toString();
  }

  public static String back(String alertMessage) {
    StringBuilder sb = new StringBuilder();

    sb.append("<script>");
    sb.append("alert('" + alertMessage + "');");
    sb.append("history.back();"); // 뒤로 가기
    sb.append("</script>");

    return sb.toString();
  }

}
