package com.woobotech.service.web.dto;

import lombok.Data;

public class ShortageVO {
  // SELECT A.*, c.cu_sangho, d.deliveryname, i.itemcode1, i.itemname, i.cmb_product, nvl(s.qty,0)
  // as qty

  private String stockQty;
  private String itemcode1;
  private String itemname;
 
  private String day1b;
  private String day2b;
  private String day3b;
  private String day4b;
  private String day5b;
  private String day6b;
  private String day7b;
  private String day8b;
  private String day9b;
  private String day10b;
  private String day1p;
  private String day2p;
  private String day3p;
  private String day4p;
  private String day5p;
  private String day6p;
  private String day7p;
  private String day8p;
  private String day9p;
  private String day10p;
 


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

  public String getStockQty() {
    return stockQty;
  }

  public void setStockQty(String stockQty) {
    this.stockQty = stockQty;
  }

  public String getDay1b() {
    return day1b;
  }

  public void setDay1b(String day1b) {
    this.day1b = day1b;
  }

  public String getDay2b() {
    return day2b;
  }

  public void setDay2b(String day2b) {
    this.day2b = day2b;
  }

  public String getDay3b() {
    return day3b;
  }

  public void setDay3b(String day3b) {
    this.day3b = day3b;
  }

  public String getDay4b() {
    return day4b;
  }

  public void setDay4b(String day4b) {
    this.day4b = day4b;
  }

  public String getDay5b() {
    return day5b;
  }

  public void setDay5b(String day5b) {
    this.day5b = day5b;
  }

  public String getDay6b() {
    return day6b;
  }

  public void setDay6b(String day6b) {
    this.day6b = day6b;
  }

  public String getDay7b() {
    return day7b;
  }

  public void setDay7b(String day7b) {
    this.day7b = day7b;
  }

  public String getDay8b() {
    return day8b;
  }

  public void setDay8b(String day8b) {
    this.day8b = day8b;
  }

  public String getDay9b() {
    return day9b;
  }

  public void setDay9b(String day9b) {
    this.day9b = day9b;
  }

  public String getDay10b() {
    return day10b;
  }

  public void setDay10b(String day10b) {
    this.day10b = day10b;
  }

  public String getDay1p() {
    return day1p;
  }

  public void setDay1p(String day1p) {
    this.day1p = day1p;
  }

  public String getDay2p() {
    return day2p;
  }

  public void setDay2p(String day2p) {
    this.day2p = day2p;
  }

  public String getDay3p() {
    return day3p;
  }

  public void setDay3p(String day3p) {
    this.day3p = day3p;
  }

  public String getDay4p() {
    return day4p;
  }

  public void setDay4p(String day4p) {
    this.day4p = day4p;
  }

  public String getDay5p() {
    return day5p;
  }

  public void setDay5p(String day5p) {
    this.day5p = day5p;
  }

  public String getDay6p() {
    return day6p;
  }

  public void setDay6p(String day6p) {
    this.day6p = day6p;
  }

  public String getDay7p() {
    return day7p;
  }

  public void setDay7p(String day7p) {
    this.day7p = day7p;
  }

  public String getDay8p() {
    return day8p;
  }

  public void setDay8p(String day8p) {
    this.day8p = day8p;
  }

  public String getDay9p() {
    return day9p;
  }

  public void setDay9p(String day9p) {
    this.day9p = day9p;
  }

  public String getDay10p() {
    return day10p;
  }

  public void setDay10p(String day10p) {
    this.day10p = day10p;
  }

 
}
