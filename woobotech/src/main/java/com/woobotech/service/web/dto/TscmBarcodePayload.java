package com.woobotech.service.web.dto;

public class TscmBarcodePayload {

  private String barcode;
  private String kind;
  private String indate;
  private String madate;
  private String lotno;
  private String cno;
  private String cname;
  private String pno;
  private String pname;
  private double qty;
  private String tradebarcode;
  private double totalqty;
  private String mktime;
  private double lotqty;
  
  public String getBarcode() {
    return barcode;
  }
  public void setBarcode(String barcode) {
    this.barcode = barcode;
  }
  public String getKind() {
    return kind;
  }
  public void setKind(String kind) {
    this.kind = kind;
  }
  public String getIndate() {
    return indate;
  }
  public void setIndate(String indate) {
    this.indate = indate;
  }
  public String getMadate() {
    return madate;
  }
  public void setMadate(String madate) {
    this.madate = madate;
  }
  public String getLotno() {
    return lotno;
  }
  public void setLotno(String lotno) {
    this.lotno = lotno;
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
  public double getQty() {
    return qty;
  }
  public void setQty(double qty) {
    this.qty = qty;
  }
  public String getTradebarcode() {
    return tradebarcode;
  }
  public void setTradebarcode(String tradebarcode) {
    this.tradebarcode = tradebarcode;
  }
  public double getTotalqty() {
    return totalqty;
  }
  public void setTotalqty(double totalqty) {
    this.totalqty = totalqty;
  }
  public String getMktime() {
    return mktime;
  }
  public void setMktime(String mktime) {
    this.mktime = mktime;
  }
  public double getLotqty() {
    return lotqty;
  }
  public void setLotqty(double lotqty) {
    this.lotqty = lotqty;
  }
  
  
}
