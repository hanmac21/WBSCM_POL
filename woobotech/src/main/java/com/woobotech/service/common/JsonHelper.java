package com.woobotech.service.common;

import org.json.simple.JSONObject;


public class JsonHelper {
  public static int getIntFromJson(JSONObject jsonObj, String property) {
    int result = 0;
    try {
      Object tmpObj = jsonObj.get(property);
      String tmpStr = String.valueOf(tmpObj);
      result = Integer.valueOf(tmpStr);
    } catch (Exception e) {
      // TODO: handle exception
    }
    return result;
  }
}
