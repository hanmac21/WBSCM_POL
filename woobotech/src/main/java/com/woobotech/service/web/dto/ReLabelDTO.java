package com.woobotech.service.web.dto;

import lombok.Data;

public class ReLabelDTO {

  private String pname;
  private String cname;
  private String pno;
  private String carkind;
  private String qty;
  private String madate;
  private String mkdate;
  private String barcode;
  private String trbarcode;
  private String indate;

  public String getPname() {
    return pname;
  }

  public void setPname(String pname) {
    this.pname = pname;
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

  public String getCarkind() {
    return carkind;
  }

  public void setCarkind(String carkind) {
    this.carkind = carkind;
  }

  public String getQty() {
    return qty;
  }

  public void setQty(String qty) {
    this.qty = qty;
  }

  public String getMadate() {
    return madate;
  }

  public void setMadate(String madate) {
    this.madate = madate;
  }

  public String getMkdate() {
    return mkdate;
  }

  public void setMkdate(String mkdate) {
    this.mkdate = mkdate;
  }

  public String getBarcode() {
    return barcode;
  }

  public void setBarcode(String barcode) {
    this.barcode = barcode;
  }

  public String getTrbarcode() {
    return trbarcode;
  }

  public void setTrbarcode(String trbarcode) {
    this.trbarcode = trbarcode;
  }

  public String getIndate() {
    return indate;
  }

  public void setIndate(String indate) {
    this.indate = indate;
  }

}
