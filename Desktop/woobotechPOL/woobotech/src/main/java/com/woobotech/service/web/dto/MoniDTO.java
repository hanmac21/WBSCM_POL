package com.woobotech.service.web.dto;

import lombok.Data;

public class MoniDTO {
  private String row_num;
  private String dtime;
  private String cname;
  private String dtime2;
  private String dstate;
  private String pname;
  private String cnt;
  private String cno;
  private String area;
  private String tradebarcode;

  public String getRow_num() {
    return row_num;
  }

  public void setRow_num(String row_num) {
    this.row_num = row_num;
  }

  public String getDtime() {
    return dtime;
  }

  public void setDtime(String dtime) {
    this.dtime = dtime;
  }

  public String getCname() {
    return cname;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }

  public String getDtime2() {
    return dtime2;
  }

  public void setDtime2(String dtime2) {
    this.dtime2 = dtime2;
  }

  public String getDstate() {
    return dstate;
  }

  public void setDstate(String dstate) {
    this.dstate = dstate;
  }

  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }

  public String getCnt() {
    return cnt;
  }

  public void setCnt(String cnt) {
    this.cnt = cnt;
  }

  public String getCno() {
    return cno;
  }

  public void setCno(String cno) {
    this.cno = cno;
  }

  public String getArea() {
    return area;
  }

  public void setArea(String area) {
    this.area = area;
  }

  public String getTradebarcode() {
    return tradebarcode;
  }

  public void setTradebarcode(String tradebarcode) {
    this.tradebarcode = tradebarcode;
  }

}
