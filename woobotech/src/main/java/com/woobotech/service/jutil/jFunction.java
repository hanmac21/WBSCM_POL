package com.woobotech.service.jutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class jFunction {
  public static final boolean TEST = false;

  public static String getDBMode() {
    if (TEST)
      return "test";

    return "dataSource";
  }

  public static void close(ResultSet rs, PreparedStatement ps, Connection conx) {
    try {
      if (rs != null) {
        rs.close();
        rs = null;
      }
      if (ps != null) {
        ps.close();
        ps = null;
      }
      if (conx != null) {
        conx.close();
        conx = null;
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }



  public static String getParsingEmpty(String str) {
    if (str.trim().length() == 0)
      return "";
    boolean check = false;
    String cc = "";
    for (int i = 0; i < str.length(); i++) {
      char c = str.charAt(i);
      if (c == ' ') {
        if (check)
          continue;
        check = true;
      } else {
        check = false;
      }
      cc += str.charAt(i);
    }
    return cc;
  }

  public static String getAddressParsing(String address) {
    String retValue = null;

    // '/'가 있는지 검색

    if (address.indexOf("/") != -1) {// '/'
      String[] arr = address.split("/");
      for (int i = 0; i < arr.length; i++) {
        if (arr[i].endsWith("동")) {// 끝자리에 동이 잇는 경우

          retValue = arr[i];
          break;
        }
      }

    } else if (address.indexOf(".") != -1) {// '/'
      String[] arr = address.split(".");
      for (int i = 0; i < arr.length; i++) {
        if (arr[i].endsWith("동")) {// 끝자리에 동이 잇는 경우
          retValue = arr[i];
          break;
        }
      }

    } else if (address.indexOf(",") != -1) {// '/'
      String[] arr = address.split(",");
      for (int i = 0; i < arr.length; i++) {
        if (arr[i].endsWith("동")) {// 끝자리에 동이 잇는 경우
          retValue = arr[i];
          break;
        }
      }

    } else if (address.indexOf("\\)") != -1) {// '/'
      String[] arr = address.split("\\)");
      for (int i = 0; i < arr.length; i++) {
        if (arr[i].endsWith("동")) {// 끝자리에 동이 잇는 경우
          retValue = arr[i];
          break;
        }
      }

    } else {// 그 외에는 한글만 남겨 놓는다.
      retValue = getHanGul(address);
    }
    return retValue;
  }

  public static String getHanGul(String str) {
    StringBuffer hangul = new StringBuffer();
    for (int i = 0; i < str.length(); i++) {
      if (checkHan(str.charAt(i))) {
        hangul.append(str.charAt(i));
      }
    }
    return hangul.toString();
  }

  private static boolean checkHan(char cValue) {
    if (cValue >= 0xAC00 && cValue <= 0xD743) {
      return true;
    } else {
      return false;
    }
  }

}
