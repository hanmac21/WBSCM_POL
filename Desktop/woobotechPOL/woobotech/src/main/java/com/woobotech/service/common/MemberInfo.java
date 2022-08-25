package com.woobotech.service.common;

public class MemberInfo {
  String userID = "";
  String authCode = "";
  String userName = "";
  String COMPANY_ID = "";
  String MOBILE_NUM = "";
  String COMPANY_NAME = "";
  String B_CODE = "";
  String E_CODE = "";

  boolean authorized = false;
  int tryCount = 0;

  public String getUserID() {
    return userID;
  }

  public void setUserID(String userID) {
    this.userID = userID;
  }

  public String getAuthCode() {
    return authCode;
  }

  public void setAuthCode(String authCode) {
    this.authCode = authCode;
  }

  public boolean getAuthorized() {
    return authorized;
  }

  public void setAuthorized(boolean authorized) {
    this.authorized = authorized;
  }

  public int getTryCount() {
    return tryCount;
  }

  public void setTryCount(int tryCount) {
    this.tryCount = tryCount;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getCOMPANY_ID() {
    return COMPANY_ID;
  }

  public void setCOMPANY_ID(String cOMPANY_ID) {
    COMPANY_ID = cOMPANY_ID;
  }

  public String getMOBILE_NUM() {
    return MOBILE_NUM;
  }

  public void setMOBILE_NUM(String mOBILE_NUM) {
    MOBILE_NUM = mOBILE_NUM;
  }

  public String getCOMPANY_NAME() {
    return COMPANY_NAME;
  }

  public void setCOMPANY_NAME(String cOMPANY_NAME) {
    COMPANY_NAME = cOMPANY_NAME;
  }

  public String getB_CODE() {
    return B_CODE;
  }

  public void setB_CODE(String b_CODE) {
    B_CODE = b_CODE;
  }

  public String getE_CODE() {
    return E_CODE;
  }

  public void setE_CODE(String e_CODE) {
    E_CODE = e_CODE;
  }

}
