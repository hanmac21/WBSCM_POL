package com.woobotech.service.web.dto;

import lombok.Data;

public class CoListDTO {

  private String cu_code;
  private String cu_sangho;

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
}
