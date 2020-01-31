package dev.mvc.review;

public class ReviewVO {
  /** 댓글 번호 */
  private int reviewno;
  /** 관련 글 번호 */
  private int restno;
  /** 회원 번호 */
  private int memberno;
  /** 내용 */
  private String content;
  /** 패스워드 */
  private String passwd;
  /** 등록일 */
  private String rdate;
  

  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public int getRestno() {
    return restno;
  }
  public void setRestno(int restno) {
    this.restno = restno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
