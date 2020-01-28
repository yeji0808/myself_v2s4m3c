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
  
  /** �۾��� ��ȣ **/
  private int wno;
  /** �۾��� ���� **/
  private String wtitle;
  /** �۾��� ���� **/
  private String wcontent;
  /** �۾��� ��ȸ �� **/
  private int wrecom;
  /** �۾��� ���� �� **/
  private int wreplycnt;
  /** �۾��� ��� �� **/
  private String rdate;
  /** �۾��� �˻��� **/
  private String wword;
  /** ȸ�� ��ȣ **/
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
