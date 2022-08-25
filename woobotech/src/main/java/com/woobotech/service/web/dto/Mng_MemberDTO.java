package com.woobotech.service.web.dto;

public class Mng_MemberDTO {
  private String u_id;
  private String reg_date;
  private String userid;
  private String name;
  private String handphone;
  private String road_add1;
  private String road_add2;
  private String state;
  private String my_point;
  private String sum_pay_amount;
  private String sum_ct;
  private String pay_type;
  private String comment;
  private String c_gb;
  private String month_amount;
  private String rp_address;// 기사 방문 가능 주소
  private String rp_address_cd;// 기사 방문 가능 주소코드
  private String acco_no;
  private String bank_nm;
  private String acco_nm;// 예금주명

  public String getAcco_nm() {
    return acco_nm;
  }

  public void setAcco_nm(String acco_nm) {
    this.acco_nm = acco_nm;
  }

  public String getAcco_no() {
    return acco_no;
  }

  public void setAcco_no(String acco_no) {
    this.acco_no = acco_no;
  }

  public String getBank_nm() {
    return bank_nm;
  }

  public void setBank_nm(String bank_nm) {
    this.bank_nm = bank_nm;
  }

  public String getRp_address_cd() {
    return rp_address_cd;
  }

  public void setRp_address_cd(String rp_address_cd) {
    this.rp_address_cd = rp_address_cd;
  }

  public String getRp_address() {
    return rp_address;
  }

  public void setRp_address(String rp_address) {
    this.rp_address = rp_address;
  }

  public String getMonth_amount() {
    return month_amount;
  }

  public void setMonth_amount(String month_amount) {
    this.month_amount = month_amount;
  }

  public String getC_gb() {
    return c_gb;
  }

  public void setC_gb(String c_gb) {
    this.c_gb = c_gb;
  }

  public String getU_id() {
    return u_id;
  }

  public void setU_id(String u_id) {
    this.u_id = u_id;
  }

  public String getReg_date() {
    return reg_date;
  }

  public void setReg_date(String reg_date) {
    this.reg_date = reg_date;
  }

  public String getUserid() {
    return userid;
  }

  public void setUserid(String userid) {
    this.userid = userid;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getHandphone() {
    return handphone;
  }

  public void setHandphone(String handphone) {
    this.handphone = handphone;
  }

  public String getRoad_add1() {
    return road_add1;
  }

  public void setRoad_add1(String road_add1) {
    this.road_add1 = road_add1;
  }

  public String getRoad_add2() {
    return road_add2;
  }

  public void setRoad_add2(String road_add2) {
    this.road_add2 = road_add2;
  }

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }

  public String getMy_point() {
    return my_point;
  }

  public void setMy_point(String my_point) {
    this.my_point = my_point;
  }

  public String getSum_pay_amount() {
    return sum_pay_amount;
  }

  public void setSum_pay_amount(String sum_pay_amount) {
    this.sum_pay_amount = sum_pay_amount;
  }

  public String getSum_ct() {
    return sum_ct;
  }

  public void setSum_ct(String sum_ct) {
    this.sum_ct = sum_ct;
  }


  public String getPay_type() {
    return pay_type;
  }

  public void setPay_type(String pay_type) {
    this.pay_type = pay_type;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }


}
