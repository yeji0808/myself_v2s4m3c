package dev.mvc.choice;

public class ChoiceVO { 
  /** 선택 테이블 칼럼 번호 **/
  private int cho_no              ;
  /** 제목 **/
  private String cho_title        ;
  /** 내용 **/
  private String cho_content;
  /** 등록일 **/
  private String rdate;
  /** 검색어 **/
  private String cho_word    ;
  /** 회원번호 **/
  private int memberno             ;
  
  public String getCho_content() {
    return cho_content;
  }
  public void setCho_content(String cho_content) {
    this.cho_content = cho_content;
  }
  public int getCho_no() {
    return cho_no;
  }
  public void setCho_no(int cho_no) {
    this.cho_no = cho_no;
  }
  public String getCho_title() {
    return cho_title;
  }
  public void setCho_title(String cho_title) {
    this.cho_title = cho_title;
  }
  
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getCho_word() {
    return cho_word;
  }
  public void setCho_word(String cho_word) {
    this.cho_word = cho_word;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  
}
