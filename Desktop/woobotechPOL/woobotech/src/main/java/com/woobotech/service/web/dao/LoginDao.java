package com.woobotech.service.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.context.ContextLoader;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.woobotech.service.jutil.jFunction;
import com.woobotech.service.web.dto.Management;
import com.woobotech.service.web.dto.Member;
import com.woobotech.service.web.dto.MngDTO;


public class LoginDao {
  DataSource dataSource;

  public LoginDao() {
    ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
    dataSource = (DataSource) ac.getBean(jFunction.getDBMode());
    setDataSource(dataSource);

  }

  private JdbcTemplate jdbcTemplate;

  private void setDataSource(DataSource dataSource) {
    this.jdbcTemplate = new JdbcTemplate(dataSource);
  }

  private RowMapper mapper2 = new RowMapper() {
    public MngDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
      MngDTO info = new MngDTO();

      info.setCu_code(rs.getString("cu_code"));
      info.setCu_master(rs.getString("cu_master"));
      info.setCu_sangho(rs.getString("cu_sangho"));
      info.setCu_sano(rs.getString("cu_sano"));
      info.setCu_juso(rs.getString("cu_juso"));


      return info;
    }
  };


  public void addManagement(final Management management) {
    String query = "" + "INSERT INTO T_MANAGEMENT " + "	(USER_ID, PASSWORD, USER_NAME) " + "VALUES "
        + "	(?, PWDENCRYPT(?), ?) ";
    this.jdbcTemplate.update(query, new Object[] {management.getUSER_ID(), management.getPASSWORD(),
        management.getUSER_NAME()});
  }

  public void deleteManagement(String userid) {
    String query = "DELETE FROM T_MANAGEMENT WHERE USER_ID = ? ";
    this.jdbcTemplate.update(query, new Object[] {userid});
  }



  public MngDTO getMngManagement(String admin_id) {
    StringBuffer sql = new StringBuffer();
    System.out.println("getMngManagement@@@@@@@@@@@@");
    sql.append(
        "select  cu_code 																		\n");
    sql.append("       ,cu_sangho                                   \n");
    sql.append("       ,cu_master                                   \n");
    sql.append("       ,cu_sano                                     \n");
    sql.append("       ,cu_juso                                    \n");
    sql.append("  from  c_cust where  cu_sano =? \n");

    // String query = "" +
    // "select admin_id, admin_pwd, admin_name \n"+
    // "from t_mng " +
    // "where admin_id = ? ";



    return (MngDTO) this.jdbcTemplate.queryForObject(sql.toString(), new Object[] {admin_id},
        this.mapper2);
  }

  public int ccustChk(String loginId) {

    StringBuffer sql = new StringBuffer();

    sql.append("SELECT COUNT(*) FROM C_CUST WHERE cu_sano='");
    sql.append(loginId);
    sql.append("'");

    System.out.println(sql.toString());

    return this.jdbcTemplate.queryForObject(sql.toString(), Integer.class);
  }

  public int tscmChk(String loginId) {

    StringBuffer sql = new StringBuffer();

    sql.append("SELECT 		COUNT(*)					\n");
    sql.append("FROM		C_CUST a					\n");
    sql.append("JOIN		T_SCM_CUST b				\n");
    sql.append("ON			a.cu_code = b.custcode 		\n");
    sql.append("WHERE		cu_sano='");
    sql.append(loginId);
    sql.append("'");

    System.out.println(sql.toString());

    return this.jdbcTemplate.queryForObject(sql.toString(), Integer.class);
  }

  public String getCucode(String loginId) {

    StringBuffer sql = new StringBuffer();

    sql.append("SELECT cu_code FROM C_CUST WHERE cu_sano='");
    sql.append(loginId);
    sql.append("'");

    System.out.println(sql.toString());
    return this.jdbcTemplate.queryForObject(sql.toString(), String.class);

  }

  public void insertInScm(String cu_code) throws SQLException {

    java.sql.Connection conn = null;
    java.sql.PreparedStatement pstmt = null;
    ResultSet rs = null;

    StringBuffer sql = new StringBuffer();
    System.out.println(cu_code);

    try {

      conn = dataSource.getConnection();
      conn.setAutoCommit(false);

      sql.append(
          "INSERT INTO T_SCM_CUST(CUSTCODE,CUSTPW,P_DELIVERYHOUR,P_DELIVERYMIN,AREA,U_DELIVERYHOUR,U_DELIVERYMIN,EMAIL1,EMAIL2,EMAIL3,EMAIL4,EMAIL5)		\n");
      sql.append("				VALUES('");
      sql.append(cu_code);
      sql.append("','a1234',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ')");

      pstmt = conn.prepareStatement(sql.toString());

      pstmt.executeUpdate();
      conn.commit();

    } catch (Exception e) {
      e.printStackTrace();
      conn.rollback();
    } finally {
      jFunction.close(rs, pstmt, conn);
    }

  }

  public int getCount() {
    String query = "" + "SELECT COUNT(USER_ID) AS cnt " + "FROM T_MANAGEMENT ";
    return this.jdbcTemplate.queryForObject(query, Integer.class);
  }


  public boolean pwdCheck(String cu_code, String pwd) {
    System.out.println("pwdCHECK@@@@@@@@@@@@");
    boolean retvalue = false;

    String query = "select count(*) from  T_SCM_CUST where custcode=? and custpw=?";

    System.out.println(cu_code);
    System.out.println(pwd);

    try {
      int i = this.jdbcTemplate.queryForObject(query, new Object[] {cu_code, pwd}, Integer.class);
      System.out.println(i);
      if (i == 1) {
        retvalue = true;
      }
    } catch (Exception e) {
      retvalue = false;
    }
    return retvalue;
  }

  // 로그인 체크
  public boolean loginCheck(String loginid, String password) {
    boolean retvalue = false;
    String query = "SELECT COUNT(CU_SANO) FROM c_cust WHERE CU_SANO = ?";
    try {
      int i = this.jdbcTemplate.queryForObject(query, new Object[] {loginid}, Integer.class);
      if (i == 1) {
        retvalue = true;
      }
    } catch (Exception e) {


      retvalue = false;
    }
    return retvalue;
  }

  // 로그인 체크
  public boolean loginMngCheck(String id, String password) {
    boolean retvalue = false;
    if ("master".equals(id) && ("woo#*".equals(password) || "woobo2330".equals(password))) { // 마스터로그인
      return true;
    }
    return retvalue;
  }


}
