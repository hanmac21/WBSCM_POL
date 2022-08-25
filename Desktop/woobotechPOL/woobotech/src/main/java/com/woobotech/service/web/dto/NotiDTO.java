package com.woobotech.service.web.dto;

import lombok.Data;

public class NotiDTO {

  private String row_num;
  private String brd_no;
  private String brd_type;
  private String title;
  private String contents;
  private String cno;
  private String reg_date;
  private String cu_sangho;
  private String cpass; // 211014 혜인 자료실 비밀번호
  private String comment_cnt;
  private int hit;
  private String file_cnt;

  public String getRow_num() {
    return row_num;
  }

  public void setRow_num(String row_num) {
    this.row_num = row_num;
  }

  public String getBrd_no() {
    return brd_no;
  }

  public void setBrd_no(String brd_no) {
    this.brd_no = brd_no;
  }

  public String getBrd_type() {
    return brd_type;
  }

  public void setBrd_type(String brd_type) {
    this.brd_type = brd_type;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContents() {
    return contents;
  }

  public void setContents(String contents) {
    this.contents = contents;
  }

  public String getCno() {
    return cno;
  }

  public void setCno(String cno) {
    this.cno = cno;
  }

  public String getReg_date() {
    return reg_date;
  }

  public void setReg_date(String reg_date) {
    this.reg_date = reg_date;
  }

  public String getCu_sangho() {
    return cu_sangho;
  }

  public void setCu_sangho(String cu_sangho) {
    this.cu_sangho = cu_sangho;
  }

  public String getCpass() {
    return cpass;
  }

  public void setCpass(String cpass) {
    this.cpass = cpass;
  }

  public String getComment_cnt() {
    return comment_cnt;
  }

  public void setComment_cnt(String comment_cnt) {
    this.comment_cnt = comment_cnt;
  }

  public int getHit() {
    return hit;
  }

  public void setHit(int hit) {
    this.hit = hit;
  }

  public String getFile_cnt() {
    return file_cnt;
  }

  public void setFile_cnt(String file_cnt) {
    this.file_cnt = file_cnt;
  }

}
