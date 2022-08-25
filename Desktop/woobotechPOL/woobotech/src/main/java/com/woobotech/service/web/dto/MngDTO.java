package com.woobotech.service.web.dto;

public class MngDTO {

  private String cu_code;
  private String cu_sangho;
  private String cu_master; // 회사 대표 이름
  private String cu_sano;
  private String cu_juso;

  public String getCu_juso() {
    return cu_juso;
  }

  public void setCu_juso(String cu_juso) {
    this.cu_juso = cu_juso;
  }

  public String getCu_code() {
    return cu_code;
  }

  public void setCu_code(String cu_code) {
    this.cu_code = cu_code;
  }

  public String getCu_sangho() {
    return cu_sangho;
  }

  public void setCu_sangho(String cu_sangho) {
    this.cu_sangho = cu_sangho;
  }

  public String getCu_master() {
    return cu_master;
  }

  public void setCu_master(String cu_master) {
    this.cu_master = cu_master;
  }

  public String getCu_sano() {
    return cu_sano;
  }

  public void setCu_sano(String cu_sano) {
    this.cu_sano = cu_sano;
  }



}
