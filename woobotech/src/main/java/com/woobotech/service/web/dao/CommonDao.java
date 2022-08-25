package com.woobotech.service.web.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.woobotech.service.common.ServiceConst;
import com.woobotech.service.jutil.jFunction;

public class CommonDao {
  private static final Logger logger = LoggerFactory.getLogger(CommonDao.class);
  DataSource dataSource;

  public CommonDao() {
    ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
    dataSource = (DataSource) ac.getBean(jFunction.getDBMode());

  }

  // 주문번호 생성
  public String cmm_order_no() {

    String order_no = "";
    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    StringBuffer sql = new StringBuffer();

    try {
      conx = dataSource.getConnection();

      sql.append(
          " select       ifnull(MAX(seq),0) +1 as seq																			\n");
      sql.append("             ,date_format(now(), '%Y%m%d') as order_date   \n");
      sql.append(
          "  from t_order_no                                                             \n");
      sql.append(" where order_no=date_format(now(), '%Y%m%d');                                \n");


      ps = conx.prepareStatement(sql.toString());
      rs = ps.executeQuery();

      if (rs.next()) {

        StringBuffer sb = new StringBuffer();

        String order_date = rs.getString("order_date");
        sb.append(order_date);
        String seq = rs.getString("seq");
        int k = seq.length();

        for (int i = k; i < 5; i++) {
          sb.append("0");
        }
        sb.append(seq);
        order_no = sb.toString();

        ps.close();
        sql.setLength(0);
        sql.append("update t_order_no \n");
        sql.append("   set order_no =?, seq=?");

        ps = conx.prepareStatement(sql.toString());
        ps.setString(1, order_date);
        ps.setString(2, seq);

        if (ps.executeUpdate() <= 0) {
          throw new Exception("업데이트 실패");
        }


      }


    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      jFunction.close(rs, ps, conx);
    }


    return order_no;


  }



  @SuppressWarnings("unchecked")
  public int fcm_push(JSONObject json) {

    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    StringBuffer sql = new StringBuffer();
    int result = -1;
    try {

      // CVO, CVI : VOIP통신
      String tx_code = (String) json.get("tx_code");
      String title = (String) json.get("title");
      String contents = (String) json.get("contents");
      String j_data = (String) json.get("j_data");
      String u_id = (String) json.get("p_u_id");

      // String token
      // ="eWW8SGL5Jzs:APA91bENzK6cCsZ5DX1_Bl1UERmcDyw6SD1K4Gw7S8NxXP0VZNT31q709O3qLz3MJHhpl4BWdjYDtRK02jOQ79QM8Amr2EcJ60i5BpkcOMD0gzaSuDz47cBkWTuy6ANd-FVJ0GQ0VWLq";
      String token = "";

      conx = dataSource.getConnection();

      sql.append("select token from t_member where u_id=");
      sql.append(u_id);
      sql.append(" \n and push_yn='y'");

      ps = conx.prepareStatement(sql.toString());

      rs = ps.executeQuery();
      if (rs.next()) {
        token = rs.getString("token");


        StringBuffer sb = new StringBuffer();
        URL obj = new URL(ServiceConst.FIRE_BASE_URL); // 호출할 url
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Authorization", "key=" + ServiceConst.FIRE_BASE_API_KEY);
        con.setDoOutput(true);


        // String input = "{\"notification\" : {\"title\" : \" 여기다 제목넣기 \", \"body\" : \"여기다 내용
        // 넣기\"},
        // \"to\":\"fGrSOo9VAyc:APA91bHuSxloRkx9UoTSx48_wj1QvARkwvoYijUjOcBVeu93e9-9GISqBQa4N3NH80dyxRnk2pMJeEtn0oP6zB4A-ESKLQXQ4je11yCkOGGiBg1K9dfESAJCaxSdogqN-DAL9PnAXB01\"}";
        JSONObject resJson = new JSONObject();
        JSONObject jsonObj = new JSONObject();


        jsonObj.put("tx_code", tx_code);
        jsonObj.put("j_data", j_data);
        jsonObj.put("title", title);
        jsonObj.put("body", contents);
        jsonObj.put("p_u_id", u_id);
        resJson.put("notification", jsonObj);
        resJson.put("data", jsonObj);
        resJson.put("to", token);
        // resJson.put("to",
        // "fGrSOo9VAyc:APA91bHuSxloRkx9UoTSx48_wj1QvARkwvoYijUjOcBVeu93e9-9GISqBQa4N3NH80dyxRnk2pMJeEtn0oP6zB4A-ESKLQXQ4je11yCkOGGiBg1K9dfESAJCaxSdogqN-DAL9PnAXB01");
        String data = resJson.toJSONString();

        con.getOutputStream().write(data.getBytes("UTF-8")); // POST 호출

        int responseCode = con.getResponseCode();// 200이 정상


        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
          response.append(inputLine);
        }
        in.close();
        // print result
        System.out.println(response.toString());

        System.out.println(sb.toString());
        if (responseCode == 200) {
          result = 1;
        }


      } else {
        throw new Exception("▷▶▷▶▷▶토큰이 존재하지 않습니다.");
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      jFunction.close(rs, ps, conx);
    }

    return result;
  }


  @SuppressWarnings("unchecked")
  public int fcm_push2(Map<String, String> map) {

    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    StringBuffer sql = new StringBuffer();
    int result = -1;
    try {

      // CVO, CVI : VOIP통신
      String tx_code = (String) map.get("tx_code");
      String title = (String) map.get("title");
      String contents = (String) map.get("contents");
      String u_id = (String) map.get("p_u_id");

      // String token
      // ="eWW8SGL5Jzs:APA91bENzK6cCsZ5DX1_Bl1UERmcDyw6SD1K4Gw7S8NxXP0VZNT31q709O3qLz3MJHhpl4BWdjYDtRK02jOQ79QM8Amr2EcJ60i5BpkcOMD0gzaSuDz47cBkWTuy6ANd-FVJ0GQ0VWLq";
      String token = "";

      conx = dataSource.getConnection();

      sql.append("select token from t_member where u_id=");
      sql.append(u_id);
      sql.append(" \n and push_yn='y'");

      ps = conx.prepareStatement(sql.toString());

      rs = ps.executeQuery();
      if (rs.next()) {
        token = rs.getString("token");


        StringBuffer sb = new StringBuffer();
        URL obj = new URL(ServiceConst.FIRE_BASE_URL); // 호출할 url
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Authorization", "key=" + ServiceConst.FIRE_BASE_API_KEY);
        con.setDoOutput(true);


        // String input = "{\"notification\" : {\"title\" : \" 여기다 제목넣기 \", \"body\" : \"여기다 내용
        // 넣기\"},
        // \"to\":\"fGrSOo9VAyc:APA91bHuSxloRkx9UoTSx48_wj1QvARkwvoYijUjOcBVeu93e9-9GISqBQa4N3NH80dyxRnk2pMJeEtn0oP6zB4A-ESKLQXQ4je11yCkOGGiBg1K9dfESAJCaxSdogqN-DAL9PnAXB01\"}";
        JSONObject resJson = new JSONObject();
        JSONObject jsonObj = new JSONObject();


        jsonObj.put("tx_code", tx_code);
        jsonObj.put("title", title);
        jsonObj.put("body", contents);
        jsonObj.put("p_u_id", u_id);
        resJson.put("notification", jsonObj);
        resJson.put("data", jsonObj);
        resJson.put("to", token);
        // resJson.put("to",
        // "fGrSOo9VAyc:APA91bHuSxloRkx9UoTSx48_wj1QvARkwvoYijUjOcBVeu93e9-9GISqBQa4N3NH80dyxRnk2pMJeEtn0oP6zB4A-ESKLQXQ4je11yCkOGGiBg1K9dfESAJCaxSdogqN-DAL9PnAXB01");
        String data = resJson.toJSONString();

        con.getOutputStream().write(data.getBytes("UTF-8")); // POST 호출

        int responseCode = con.getResponseCode();// 200이 정상


        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
          response.append(inputLine);
        }
        in.close();
        // print result
        System.out.println(response.toString());

        System.out.println(sb.toString());
        if (responseCode == 200) {
          result = 1;
        }


      } else {
        throw new Exception("▷▶▷▶▷▶토큰이 존재하지 않습니다.");
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      jFunction.close(rs, ps, conx);
    }

    return result;
  }



  @SuppressWarnings("unchecked")
  public int mng_fcm_push(Map<String, String> map) {

    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    StringBuffer sql = new StringBuffer();
    int result = -1;
    try {

      // CVO, CVI : VOIP통신
      String tx_code = (String) map.get("tx_code");
      String title = (String) map.get("title");
      String contents = (String) map.get("contents");
      String admin_id = (String) map.get("admin_id");

      // String token
      // ="eWW8SGL5Jzs:APA91bENzK6cCsZ5DX1_Bl1UERmcDyw6SD1K4Gw7S8NxXP0VZNT31q709O3qLz3MJHhpl4BWdjYDtRK02jOQ79QM8Amr2EcJ60i5BpkcOMD0gzaSuDz47cBkWTuy6ANd-FVJ0GQ0VWLq";
      String token = "";

      conx = dataSource.getConnection();

      sql.append("select token from t_mng where admin_id='");
      sql.append(admin_id);
      sql.append("'");

      ps = conx.prepareStatement(sql.toString());

      rs = ps.executeQuery();
      if (rs.next()) {
        token = rs.getString("token");


        StringBuffer sb = new StringBuffer();
        URL obj = new URL(ServiceConst.FIRE_BASE_URL); // 호출할 url
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Authorization", "key=" + ServiceConst.FIRE_BASE_API_KEY);
        con.setDoOutput(true);


        // String input = "{\"notification\" : {\"title\" : \" 여기다 제목넣기 \", \"body\" : \"여기다 내용
        // 넣기\"},
        // \"to\":\"fGrSOo9VAyc:APA91bHuSxloRkx9UoTSx48_wj1QvARkwvoYijUjOcBVeu93e9-9GISqBQa4N3NH80dyxRnk2pMJeEtn0oP6zB4A-ESKLQXQ4je11yCkOGGiBg1K9dfESAJCaxSdogqN-DAL9PnAXB01\"}";
        JSONObject resJson = new JSONObject();
        JSONObject jsonObj = new JSONObject();


        jsonObj.put("tx_code", tx_code);
        jsonObj.put("title", title);
        jsonObj.put("body", contents);
        // jsonObj.put("p_u_id", u_id);
        resJson.put("notification", jsonObj);
        resJson.put("data", jsonObj);
        resJson.put("to", token);
        // resJson.put("to",
        // "fGrSOo9VAyc:APA91bHuSxloRkx9UoTSx48_wj1QvARkwvoYijUjOcBVeu93e9-9GISqBQa4N3NH80dyxRnk2pMJeEtn0oP6zB4A-ESKLQXQ4je11yCkOGGiBg1K9dfESAJCaxSdogqN-DAL9PnAXB01");
        String data = resJson.toJSONString();

        con.getOutputStream().write(data.getBytes("UTF-8")); // POST 호출

        int responseCode = con.getResponseCode();// 200이 정상


        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
          response.append(inputLine);
        }
        in.close();
        // print result
        System.out.println(response.toString());

        System.out.println(sb.toString());
        if (responseCode == 200) {
          result = 1;
        }


      } else {
        throw new Exception("▷▶▷▶▷▶토큰이 존재하지 않습니다.");
      }

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      jFunction.close(rs, ps, conx);
    }

    return result;
  }



  @SuppressWarnings("unchecked")
  public int fcm_push(Map<String, String> map, String type) {
    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    StringBuffer sql = new StringBuffer();
    int result = -1;
    try {

      String title = map.get("title");
      String token = "";
      String body = map.get("contents");
      conx = dataSource.getConnection();

      ArrayList<String> arr_token = new ArrayList<String>();

      sql.append("SELECT token FROM t_member where token is not null");
      ps = conx.prepareStatement(sql.toString());

      rs = ps.executeQuery();

      while (rs.next()) {

        arr_token.add(rs.getString("token"));
      }
      JSONObject resJson = new JSONObject();
      JSONObject jsonObj = new JSONObject();

      jsonObj.put("body", body);
      jsonObj.put("title", title);
      jsonObj.put("tx_code", "mng");
      resJson.put("data", jsonObj);
      resJson.put("notification", jsonObj);
      JSONArray jsonTokenArray = new JSONArray();

      int data_cnt = arr_token.size();

      int send_cnt = 500;
      int remain_data = data_cnt % send_cnt;

      for (int i = 0; i < data_cnt; i++) {
        // System.out.println("token : " + arr_token.get(i));
        jsonTokenArray.add(arr_token.get(i));

        if (i % send_cnt == 0) {
          logger.info("▷▶▷▶▷▶ fcm_push 전송 :" + i);
          resJson.put("registration_ids", jsonTokenArray);

          URL obj = new URL(ServiceConst.FIRE_BASE_URL); // 호출할 url
          HttpURLConnection con = (HttpURLConnection) obj.openConnection();
          con.setRequestMethod("POST");
          con.setRequestProperty("Content-Type", "application/json");
          con.setRequestProperty("Authorization", "key=" + ServiceConst.FIRE_BASE_API_KEY);
          con.setDoOutput(true);

          String data = resJson.toJSONString();
          // System.out.println(data);
          con.getOutputStream().write(data.getBytes("UTF-8")); // POST
                                                               // 호출

          int responseCode = con.getResponseCode();// 200이 정상
          BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
          String inputLine;
          StringBuffer response = new StringBuffer();

          while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
          }
          in.close();
          // print result
          System.out.println(response.toString());

          // System.out.println(sb.toString());
          if (responseCode == 200) {
            result = 1;
          }
          resJson.remove("registration_ids");
          jsonTokenArray.clear();
        }
      }

      if (remain_data > 0) {

        resJson.put("registration_ids", jsonTokenArray);
        URL obj = new URL(ServiceConst.FIRE_BASE_URL); // 호출할 url
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Authorization", "key=" + ServiceConst.FIRE_BASE_API_KEY);
        con.setDoOutput(true);

        String data = resJson.toJSONString();
        // System.out.println(data);
        con.getOutputStream().write(data.getBytes("UTF-8")); // POST
                                                             // 호출

        int responseCode = con.getResponseCode();// 200이 정상
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();

        while ((inputLine = in.readLine()) != null) {
          response.append(inputLine);
        }
        in.close();
        // print result
        // System.out.println(response.toString());

        // System.out.println(sb.toString());
        if (responseCode == 200) {
          result = 1;
        }
      }

    } catch (Exception e) {
      e.printStackTrace();

    } finally {
      jFunction.close(rs, ps, conx);
    }

    return result;
  }
}
