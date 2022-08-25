package com.woobotech.service.web.dto;

import lombok.Data;

public class DeliveryDTO {

  private String indate;
  private String cno;
  private String cname;
  private String pno;
  private String pname;
  private String qty;
  private String dstate;
  private String dtime;
  private String dtime2;
  private String deliveryno;
  private String remain_h;
  private String remain_m;
  private String d_ct;
  private int inRemain_h;
  private int inRemain_m;

  private int progress_rate;

  private String tradebarcode;

  private String tqty2;

  public String getIndate() {
    return indate;
  }

  public void setIndate(String indate) {
    this.indate = indate;
  }

  public String getCno() {
    return cno;
  }

  public void setCno(String cno) {
    this.cno = cno;
  }

  public String getCname() {
    return cname;
  }

  public void setCname(String cname) {
    this.cname = cname;
  }

  public String getPno() {
    return pno;
  }

  public void setPno(String pno) {
    this.pno = pno;
  }

  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
  }

  public String getQty() {
    return qty;
  }

  public void setQty(String qty) {
    this.qty = qty;
  }

  public String getDstate() {
    return dstate;
  }

  public void setDstate(String dstate) {
    this.dstate = dstate;
  }

  public String getDtime() {
    return dtime;
  }

  public void setDtime(String dtime) {
    this.dtime = dtime;
  }

  public String getDtime2() {
    return dtime2;
  }

  public void setDtime2(String dtime2) {
    this.dtime2 = dtime2;
  }

  public String getDeliveryno() {
    return deliveryno;
  }

  public void setDeliveryno(String deliveryno) {
    this.deliveryno = deliveryno;
  }

  public String getRemain_h() {
    return remain_h;
  }

  public void setRemain_h(String remain_h) {
    this.remain_h = remain_h;
  }

  public String getRemain_m() {
    return remain_m;
  }

  public void setRemain_m(String remain_m) {
    this.remain_m = remain_m;
  }

  public String getD_ct() {
    return d_ct;
  }

  public void setD_ct(String d_ct) {
    this.d_ct = d_ct;
  }

  public int getInRemain_h() {
    return inRemain_h;
  }

  public void setInRemain_h(int inRemain_h) {
    this.inRemain_h = inRemain_h;
  }

  public int getInRemain_m() {
    return inRemain_m;
  }

  public void setInRemain_m(int inRemain_m) {
    this.inRemain_m = inRemain_m;
  }

  public int getProgress_rate() {
    return progress_rate;
  }

  public void setProgress_rate(int progress_rate) {
    this.progress_rate = progress_rate;
  }

  public String getTradebarcode() {
    return tradebarcode;
  }

  public void setTradebarcode(String tradebarcode) {
    this.tradebarcode = tradebarcode;
  }

  public String getTqty2() {
    return tqty2;
  }

  public void setTqty2(String tqty2) {
    this.tqty2 = tqty2;
  }

}
