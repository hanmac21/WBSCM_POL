package com.woobotech.service.common;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class RequestWebData {
  public static String request(String Url, String data) throws Exception {
    String result = "";
    try {
      // Construct data
      // String data = URLEncoder.encode("key1", "UTF-8") + "=" + URLEncoder.encode("value1",
      // "UTF-8");
      // data += "&" + URLEncoder.encode("key2", "UTF-8") + "=" + URLEncoder.encode("value2",
      // "UTF-8");

      // Send data
      URL url = new URL(Url);
      URLConnection conn = url.openConnection();
      conn.setDoOutput(true);
      // conn.setRequestMethod("POST");
      String type = "application/json";

      conn.setRequestProperty("Content-Type", type);
      conn.setRequestProperty("Content-Length", Integer.toString(data.length()));

      OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());

      wr.write(data);
      wr.flush();

      // Get the response
      BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
      String line;
      while ((line = rd.readLine()) != null) {
        // Process line...
        result = result + line;
      }
      wr.close();
      rd.close();

    } catch (Exception e) {
      // TODO: handle exception
      throw e;
    }
    return result;
  }
}
