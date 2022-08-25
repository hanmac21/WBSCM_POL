package com.woobotech.service.app;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.HttpClients;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.ContextLoader;

import com.woobotech.service.jutil.DateUtil;
import com.woobotech.service.jutil.jFunction;
import com.woobotech.service.web.dao.CommonDao;

public class AppDao {
  DataSource dataSource;

  public AppDao() {
    try {
      ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
      dataSource = (DataSource) ac.getBean(jFunction.getDBMode());
      // dataSource2 = (DataSource) ac.getBean("dataSource2");
      setDataSource(dataSource);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  private static final Logger logger = LoggerFactory.getLogger(AppDao.class);
  private JdbcTemplate jdbcTemplate;

  private void setDataSource(DataSource dataSource) {
    this.jdbcTemplate = new JdbcTemplate(dataSource);
  }

  // 로그인
  @SuppressWarnings("unchecked")
  public JSONObject m_app_login(JSONObject json) {

    // System.out.println("app_login");
    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    JSONObject resJson = new JSONObject();
    StringBuffer sql = new StringBuffer();

    // uniq_key --SNS 교유키
    // email --이메일
    // password --패스워드
    // token --토큰
    // lat --위도
    // lon --경도
    logger.info("m_app_login :" + json);
    String email = (String) json.get("email");
    String password = (String) json.get("password");
    String token = (String) json.get("token");
    // 간편로그인 경우
    String uniq_key = (String) json.get("uniq_key");
    String easy_type = (String) json.get("easy_type");
    String easy_yn = (String) json.get("easy_yn");
    String rsp_code = "999";
    try {

      conx = dataSource.getConnection();
      conx.setAutoCommit(false);

      sql.setLength(0);
      sql.append(
          "select 																																\n");
      sql.append("			 u_id          \n");
      sql.append("			,uniq_key   /*간편로그인키 (간편로그인 가입일 경우)    */        \n");
      sql.append("			,name      /*이름                                     */        \n");
      sql.append(
          "			,ifnull(token,'') as token     /*토큰                                     */        \n");
      sql.append("			,email     /*이메일  (이메일 가입일 경우우에만 필수)  */        \n");
      sql.append("			,handphone     /*연락처  */        \n");
      sql.append("			,road_address       \n");
      sql.append("			,road_address_dtl   \n");
      sql.append("			,jibun_address      \n");
      sql.append("			,jibun_address_dtl  \n");
      sql.append("			,add1               \n");
      sql.append("			,add2               \n");
      sql.append("			,add3               \n");
      sql.append("			,zip                \n");
      sql.append(
          "			,ifnull(point,'0')  as point     /*포인트                                     */        \n");
      sql.append("			,level     /*등급                                     */        \n");
      sql.append(
          "			,state     /*0무료 1:VIP 9:탈퇴                                    */        \n");
      sql.append("			,push_yn     /*알림설정                                  */        \n");
      sql.append(" from t_member t                                                             \n");

      if (!("y".equals(easy_yn) || easy_yn == null)) {
        sql.append(" where email=? \n");
        sql.append("   and password=? \n");
        ps = conx.prepareStatement(sql.toString());
        ps.setString(1, email);
        ps.setString(2, password);
      } else {
        sql.append(" where easy_type =? and uniq_key=? \n");
        ps = conx.prepareStatement(sql.toString());
        ps.setString(1, easy_type);
        ps.setString(2, uniq_key);
      }

      // System.out.println(sql.toString());

      rs = ps.executeQuery();
      if (rs.next()) {
        resJson.put("u_id", rs.getString("u_id"));
        resJson.put("name", rs.getString("name"));
        resJson.put("token", rs.getString("token"));
        resJson.put("handphone", rs.getString("handphone"));
        resJson.put("email", rs.getString("email"));
        resJson.put("state", rs.getString("state"));
        resJson.put("level", rs.getString("level"));
        resJson.put("point", rs.getString("point"));
        resJson.put("easy_yn", easy_yn);
        resJson.put("push_yn", rs.getString("push_yn"));

        resJson.put("road_address", rs.getString("road_address"));
        resJson.put("road_address_dtl", rs.getString("road_address_dtl"));
        resJson.put("jibun_address", rs.getString("jibun_address"));
        resJson.put("jibun_address_dtl", rs.getString("jibun_address_dtl"));
        resJson.put("add1", rs.getString("add1"));
        resJson.put("add2", rs.getString("add2"));
        resJson.put("add3", rs.getString("add3"));
        resJson.put("zip", rs.getString("zip"));

        String u_id = rs.getString("u_id");

        sql.setLength(0);
        sql.append("update t_member \n");
        sql.append("   set token ='");
        sql.append(token);
        sql.append("'");
        sql.append(" , mod_date=now() \n");
        sql.append(" where u_id =");
        sql.append(u_id);
        ps.close();

        ps = conx.prepareStatement(sql.toString());
        if (ps.executeUpdate() > 0) {
          ps.close();
          rs.close();
          // 로그인 기록을 해준다.
          rsp_code = "100";

        } else {// token update 실패
          rsp_code = "300";
          throw new Exception("토큰 등록 실패");
        }

      } else {// 아이디가 다른 경우
        // resJson.put("RSP_CODE", "300");
        rsp_code = "200";
        throw new Exception("아이디 패스워드 확인 실패");

      }

      conx.commit();
    } catch (Exception e) {
      logger.info("로그인 오류" + e.getMessage());
      try {
        conx.rollback();
      } catch (Exception e2) {
        // TODO: handle exception
      }

    } finally {
      resJson.put("rsp_code", rsp_code);
      jFunction.close(rs, ps, conx);
    }

    return resJson;

  }

  // 버젼 체크
  @SuppressWarnings("unchecked")
  public JSONObject m_app_version(JSONObject json) {
    // System.out.println("app_login");
    ResultSet rs = null;
    PreparedStatement ps = null;
    Connection conx = null;
    JSONObject resJson = new JSONObject();
    StringBuffer sql = new StringBuffer();
    try {
      conx = dataSource.getConnection();

      sql.append(
          " select  version																											\n");
      sql.append("       ,ver_nm                                                        \n");
      sql.append("       ,use_yn                                                        \n");
      sql.append(
          "       ,date_format(reg_date, '%y-%m-%d %h:%m')  as reg_date                                          \n");
      sql.append("   from t_app_version                                                 \n");
      sql.append("where seq = (select max(seq) from t_app_version where use_yn='y')     \n");
      ps = conx.prepareStatement(sql.toString());
      // System.out.println(sql.toString());

      rs = ps.executeQuery();
      if (rs.next()) {
        resJson.put("version", rs.getString("version"));
        resJson.put("ver_nm", rs.getString("ver_nm"));
        resJson.put("use_yn", rs.getString("use_yn"));
        resJson.put("reg_date", rs.getString("reg_date"));
        resJson.put("rsp_code", "100");
      } else {// 없는 경우
        resJson.put("rsp_code", "300");

      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      jFunction.close(rs, ps, conx);
    }

    return resJson;

  }

}
