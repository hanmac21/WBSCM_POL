package com.woobotech.service.web.dto;

public class QnADTO {
  private String brd_no;// 게시글 번호
  private String qna;// 댓글 or 답글
  private String upd_date;// 댓글이나 답글 담은 시간
  private String qpass;// 비밀번호
  private String cno;// 작성하는 아이디값
  private String brd_type;// 공지사항게시판와 협력사 게시판 구분
  private String idx;

  public String getBrd_no() {
    return brd_no;
  }

  public void setBrd_no(String brd_no) {
    this.brd_no = brd_no;
  }

  public String getQna() {
    return qna;
  }

  public void setQna(String qna) {
    this.qna = qna;
  }

  public String getUpd_date() {
    return upd_date;
  }

  public void setUpd_date(String upd_date) {
    this.upd_date = upd_date;
  }

  public String getQpass() {
    return qpass;
  }

  public void setQpass(String qpass) {
    this.qpass = qpass;
  }

  public String getCno() {
    return cno;
  }

  public void setCno(String cno) {
    this.cno = cno;
  }

  public String getBrd_type() {
    return brd_type;
  }

  public void setBrd_type(String brd_type) {
    this.brd_type = brd_type;
  }

  public String getIdx() {
    return idx;
  }

  public void setIdx(String idx) {
    this.idx = idx;
  }



}
