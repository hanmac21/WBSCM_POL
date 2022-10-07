package com.woobotech.service.web.dto;

public class StockDTO {
  private String branch;
  private String co_saname;
  private String subname;
  private String itemcode;
  private String itemcode1;
  private String itemname;
  private String spec;
  private String colorname;
  private String unit;
  private String carname;
  private String re_jegoqty;
  private String re_jegoqty1;
  private String f001qty;
  private String f003qty;
  private String m001qty;
  //private String p001qty;
  private String g001qty;
  private String f001qty1;
  private String f003qty1;
  private String m001qty1;
  //private String p001qty1;
  private String g001qty1;
  private String a0001qty;
  private String c0001qty;
  private String j0001qty;
  private String a0001qty1;
  private String c0001qty1;
  private String j0001qty1;
  private String e001qty;
  private String e001qty1;
  private String seq;

  public String getBranch() {
    return branch;
  }

  public void setBranch(String branch) {
    this.branch = branch;
  }

  public String getCo_saname() {
    return co_saname;
  }

  public void setCo_saname(String co_saname) {
    this.co_saname = co_saname;
  }

  public String getSubname() {
    return subname;
  }

  public void setSubname(String subname) {
    this.subname = subname;
  }

  public String getItemcode() {
    return itemcode;
  }

  public void setItemcode(String itemcode) {
    this.itemcode = itemcode;
  }

  public String getItemcode1() {
    return itemcode1;
  }

  public void setItemcode1(String itemcode1) {
    this.itemcode1 = itemcode1;
  }

  public String getItemname() {
    return itemname;
  }

  public void setItemname(String itemname) {
    this.itemname = itemname;
  }

  public String getSpec() {
    return spec;
  }

  public void setSpec(String spec) {
    this.spec = spec;
  }

  public String getUnit() {
    return unit;
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }

  public String getCarname() {
    return carname;
  }

  public void setCarname(String carname) {
    this.carname = carname;
  }

  /*
   * public String getCmb_itemtype() { return cmb_itemtype; }
   * 
   * public void setCmb_itemtype(String cmb_itemtype) { this.cmb_itemtype = cmb_itemtype; }
   */

  public String getF001qty() {
    
    return f001qty;
  }

  public void setF001qty(String f001qty) {
    if(isInteger(f001qty)) {
      this.f001qty = f001qty;
    }else {
      double db = Double.parseDouble(f001qty);
      this.f001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getF003qty() {
    return f003qty;
  }

  public void setF003qty(String f003qty) {
    if(isInteger(f003qty)) {
      this.f003qty = f003qty;
    }else {
      double db = Double.parseDouble(f003qty);
      this.f003qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getM001qty() {
    return m001qty;
  }

  public void setM001qty(String m001qty) {
    if(isInteger(m001qty)) {
      this.m001qty = m001qty;
    }else {
      double db = Double.parseDouble(m001qty);
      this.m001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  /*
   * public String getP001qty() { return p001qty; }
   * 
   * public void setP001qty(String p001qty) { this.p001qty = p001qty; }
   */

  public String getG001qty() {
    return g001qty;
  }

  public void setG001qty(String g001qty) {
    if(isInteger(g001qty)) {
      this.g001qty = g001qty;
    }else {
      double db = Double.parseDouble(g001qty);
      this.g001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getF001qty1() {
    return f001qty1;
  }

  public void setF001qty1(String f001qty1) {
    if(isInteger(f001qty1)) {
      this.f001qty1 = f001qty1;
    }else {
      double db = Double.parseDouble(f001qty1);
      this.f001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getF003qty1() {
    return f003qty1;
  }

  public void setF003qty1(String f003qty1) {
    if(isInteger(f003qty1)) {
      this.f003qty1 = f003qty1;
    }else {
      double db = Double.parseDouble(f003qty1);
      this.f003qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getM001qty1() {
    return m001qty1;
  }

  public void setM001qty1(String m001qty1) {
    if(isInteger(m001qty1)) {
      this.m001qty1 = m001qty1;
    }else {
      double db = Double.parseDouble(m001qty1);
      this.m001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  /*
   * public String getP001qty1() { return p001qty1; }
   * 
   * public void setP001qty1(String p001qty1) { this.p001qty1 = p001qty1; }
   */

  public String getG001qty1() {
    return g001qty1;
  }

  public void setG001qty1(String g001qty1) {
    if(isInteger(g001qty1)) {
      this.g001qty1 = g001qty1;
    }else {
      double db = Double.parseDouble(g001qty1);
      this.g001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getA0001qty() {
    return a0001qty;
  }

  public void setA0001qty(String a0001qty) {
    if(isInteger(a0001qty)) {
      this.a0001qty = a0001qty;
    }else {
      double db = Double.parseDouble(a0001qty);
      this.a0001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  /*
   * public String getB0001qty() { return b0001qty; }
   * 
   * public void setB0001qty(String b0001qty) { this.b0001qty = b0001qty; }
   * 
   * public String getK0001qty() { return k0001qty; }
   * 
   * public void setK0001qty(String k0001qty) { this.k0001qty = k0001qty; }
   */

  public String getA0001qty1() {
    return a0001qty1;
  }

  public void setA0001qty1(String a0001qty1) {
    if(isInteger(a0001qty1)) {
      this.a0001qty1 = a0001qty1;
    }else {
      double db = Double.parseDouble(a0001qty1);
      this.a0001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getRe_jegoqty() {
    return re_jegoqty;
  }

  public void setRe_jegoqty(String re_jegoqty) {
    this.re_jegoqty = re_jegoqty;
  }

  public String getRe_jegoqty1() {
    return re_jegoqty1;
  }

  public void setRe_jegoqty1(String re_jegoqty1) {
    this.re_jegoqty1 = re_jegoqty1;
  }

  public String getC0001qty() {
    return c0001qty;
  }

  public void setC0001qty(String c0001qty) {
    if(isInteger(c0001qty)) {
      this.c0001qty = c0001qty;
    }else {
      double db = Double.parseDouble(c0001qty);
      this.c0001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getJ0001qty() {
    return j0001qty;
  }

  public void setJ0001qty(String j0001qty) {
    if(isInteger(j0001qty)) {
      this.j0001qty = j0001qty;
    }else {
      double db = Double.parseDouble(j0001qty);
      this.j0001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  
  }

  public String getC0001qty1() {
    return c0001qty1;
  }

  public void setC0001qty1(String c0001qty1) {
    if(isInteger(c0001qty1)) {
      this.c0001qty1 = c0001qty1;
    }else {
      double db = Double.parseDouble(c0001qty1);
      this.c0001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getJ0001qty1() {
    return j0001qty1;
  }

  public void setJ0001qty1(String j0001qty1) {
    if(isInteger(j0001qty1)) {
      this.j0001qty1 = j0001qty1;
    }else {
      double db = Double.parseDouble(j0001qty1);
      this.j0001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getE001qty() {
    return e001qty;
  }

  public void setE001qty(String e001qty) {
    if(isInteger(e001qty)) {
      this.e001qty = e001qty;
    }else {
      double db = Double.parseDouble(e001qty);
      this.e001qty = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getE001qty1() {
    return e001qty1;
  }

  public void setE001qty1(String e001qty1) {
    if(isInteger(e001qty1)) {
      this.e001qty1 = e001qty1;
    }else {
      double db = Double.parseDouble(e001qty1);
      this.e001qty1 = String.valueOf(Math.round(db*10000)/10000.0);
    }
  }

  public String getSeq() {
    return seq;
  }

  public void setSeq(String seq) {
    this.seq = seq;
  }

  public String getColorname() {
    return colorname;
  }

  public void setColorname(String colorname) {
    this.colorname = colorname;
  }
  public static boolean isInteger(String num){
    double d = Double.parseDouble(num);
    if(d==(int)d) {
      return true;
    }else {
      return false;
    }
  }

  /*
   * public String getB0001qty1() { return b0001qty1; }
   * 
   * public void setB0001qty1(String b0001qty1) { this.b0001qty1 = b0001qty1; }
   * 
   * public String getK0001qty1() { return k0001qty1; }
   * 
   * public void setK0001qty1(String k0001qty1) { this.k0001qty1 = k0001qty1; }
   */



}
