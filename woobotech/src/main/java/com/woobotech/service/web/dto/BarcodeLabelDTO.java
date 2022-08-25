package com.woobotech.service.web.dto;

public class BarcodeLabelDTO {
  private String barcode;//// 바코드
  private String kind;//// 업무구분(생산,구매,영업등) //1:생산, 구매:2, 영업:3
  private String indate;//// 입고일자
  private String madate;//// 생산일자(협력사 입력)
  private String lotno;//// LOTNO(협력사 입력)
  private String orderno;//// 주문번호(ERP연동 확인)
  private String cno;//// 납품처코드
  private String cname;//// 납품처명
  private String pno;//// 품번
  private String pname;//// 품명
  private String qty;//// 수량
  private String state;//// 비고

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

  public String getOrderno() {
    return orderno;
  }

  public void setOrderno(String orderno) {
    this.orderno = orderno;
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

  public String getState() {
    return state;
  }

  public void setState(String state) {
    this.state = state;
  }



}
