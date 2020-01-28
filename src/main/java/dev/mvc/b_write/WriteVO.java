package dev.mvc.b_write;

public class WriteVO {

  /*CREATE TABLE write(
      wno                               NUMBER(10)     NOT NULL    PRIMARY KEY,
      wtitle                            VARCHAR2(100)    NOT NULL,
      wcontent                          CLOB     NOT NULL,
      wrecom                            NUMBER(10)     DEFAULT 0     NOT NULL,
      wreplycnt                         NUMBER(10)     DEFAULT 0     NULL ,
      rdate                             DATE     NOT NULL,
      wword                             VARCHAR2(100)    NULL ,
      boardno                           NUMBER(10)     NULL ,
    FOREIGN KEY (boardno) REFERENCES board (boardno)
  );*/
  
  /** 글쓰기 번호 **/
  private int wno;
  /** 글쓰기 제목 **/
  private String wtitle;
  /** 글쓰기 내용 **/
  private String wcontent;
  /** 글쓰기 조회 수 **/
  private int wrecom;
  /** 글쓰기 뎃글 수 **/
  private int wreplycnt;
  /** 글쓰기 등록 일 **/
  private String rdate;
  /** 글쓰기 검색어 **/
  private String wword;
  /** 회원 번호 **/
  private int memberno;
  
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getWno() {
    return wno;
  }
  public void setWno(int wno) {
    this.wno = wno;
  }
  public String getWtitle() {
    return wtitle;
  }
  public void setWtitle(String wtitle) {
    this.wtitle = wtitle;
  }
  public String getWcontent() {
    return wcontent;
  }
  public void setWcontent(String wcontent) {
    this.wcontent = wcontent;
  }
  public int getWrecom() {
    return wrecom;
  }
  public void setWrecom(int wrecom) {
    this.wrecom = wrecom;
  }
  public int getWreplycnt() {
    return wreplycnt;
  }
  public void setWreplycnt(int wreplycnt) {
    this.wreplycnt = wreplycnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getWword() {
    return wword;
  }
  public void setWword(String wword) {
    this.wword = wword;
  }

}
