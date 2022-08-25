package com.woobotech.service.web.dto;

import lombok.Data;

public class LabelDTO {

  private String pname;
  private String cname;
  private String pno;
  private String carkind;
  private String qty;
  private String madate;
  private String mkdate;
  private String barcode;
  private String trbarcode;

  private String madate2;
  private String madate3;
  private String production; // 생산량
  private String production2;
  private String production3;
  
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
  
  public String getMadate2() {
    return madate2;
  }

  public void setMadate2(String madate2) {
    this.madate2 = madate2;
  }

  public String getMadate3() {
    return madate3;
  }

  public void setMadate3(String madate3) {
    this.madate3 = madate3;
  }

  public String getProduction() {
    return production;
  }

  public void setProduction(String production) {
    this.production = production;
  }

  public String getProduction2() {
    return production2;
  }

  public void setProduction2(String production2) {
    this.production2 = production2;
  }

  public String getProduction3() {
    return production3;
  }

  public void setProduction3(String production3) {
    this.production3 = production3;
  }

}
