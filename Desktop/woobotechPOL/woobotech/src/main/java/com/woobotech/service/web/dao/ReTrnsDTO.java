package com.woobotech.service.web.dao;

import lombok.Data;

public class ReTrnsDTO {

  private String barcode;
  private String cno;
  private String cname;
  private String carkind;
  private String t_qty;
  private String indate;
  private String delivery_yn;
  private String dstate;
  private String deliveryno;
  private String prdate;
  private String row_num;
  private String plant;

  public String getBarcode() {
    return barcode;
  }

  public void setBarcode(String barcode) {
    this.barcode = barcode;
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

  public String getT_qty() {
    return t_qty;
  }

  public void setT_qty(String t_qty) {
    this.t_qty = t_qty;
  }

  public String getIndate() {
    return indate;
  }

  public void setIndate(String indate) {
    this.indate = indate;
  }

  public String getDelivery_yn() {
    return delivery_yn;
  }

  public void setDelivery_yn(String delivery_yn) {
    this.delivery_yn = delivery_yn;
  }

  public String getDstate() {
    return dstate;
  }

  public void setDstate(String dstate) {
    this.dstate = dstate;
  }

  public String getDeliveryno() {
    return deliveryno;
  }

  public void setDeliveryno(String deliveryno) {
    this.deliveryno = deliveryno;
  }

  public String getPrdate() {
    return prdate;
  }

  public void setPrdate(String prdate) {
    this.prdate = prdate;
  }

  public String getRow_num() {
    return row_num;
  }

  public void setRow_num(String row_num) {
    this.row_num = row_num;
  }

  public String getPlant() {
    return plant;
  }

  public void setPlant(String plant) {
    this.plant = plant;
  }

  public String getCarkind() {
    return carkind;
  }

  public void setCarkind(String carkind) {
    this.carkind = carkind;
  }

}
