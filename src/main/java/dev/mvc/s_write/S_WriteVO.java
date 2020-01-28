package dev.mvc.s_write;

public class S_WriteVO {
//  writeno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
//  somoimno                          NUMBER(10)     NOT NULL ,
//  memberno                        NUMBER(10)     NOT NULL ,
//  title                             VARCHAR2(300)    NOT NULL,
//  content                           CLOB           NOT NULL,
//  recom                             NUMBER(7)    DEFAULT 0     NOT NULL,
//  cnt                               NUMBER(7)    DEFAULT 0     NOT NULL,
//  replycnt                          NUMBER(10)     DEFAULT 0     NOT NULL,
//  rdate                             DATE     NOT NULL,
//  word                              VARCHAR2(100)    NULL ,
  
  /** 컨텐츠 번호 */
  private int writeno;
  
  /** 소모임 번호 */
  private int somoimno;
  
  /** 회원 번호 */
  private int memberno;
  
  /** 제목 */
  private String title;
  
  /** 내용 */
  private String content;
  
  /** 추천수 */
  private int recom;
  
  /** 조회수 */
  private int cnt;
  
  /** 댓글수 */
  private int replycnt;
  
  /** 등록일 */
  private String rdate;
  
  /** 검색어 */
  private String word;

  public int getWriteno() {
    return writeno;
  }

  public void setWriteno(int writeno) {
    this.writeno = writeno;
  }

  public int getSomoimno() {
    return somoimno;
  }

  public void setSomoimno(int somoimno) {
    this.somoimno = somoimno;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getRecom() {
    return recom;
  }

  public void setRecom(int recom) {
    this.recom = recom;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getReplycnt() {
    return replycnt;
  }

  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }
  
  
}
