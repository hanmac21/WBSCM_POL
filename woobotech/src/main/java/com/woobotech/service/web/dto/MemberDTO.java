package com.woobotech.service.web.dto;

import lombok.Data;

public class MemberDTO {

  private String id;
  private String pw;
  private String plant;
  private String grade;
  private String email;
  private String row_seq;

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }

  public String getPlant() {
    return plant;
  }

  public void setPlant(String plant) {
    this.plant = plant;
  }

  public String getGrade() {
    return grade;
  }

  public void setGrade(String grade) {
    this.grade = grade;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getRow_seq() {
    return row_seq;
  }

  public void setRow_seq(String row_seq) {
    this.row_seq = row_seq;
  }

}
