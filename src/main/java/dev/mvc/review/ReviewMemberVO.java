package dev.mvc.review;

public class ReviewMemberVO {
  /** ���̵� */
  private String id = "";
  
  /** ��� ��ȣ */
  private int reviewno;
  /** ���� �� ��ȣ */
  private int restno;
  /** ȸ�� ��ȣ */
  private int memberno;
  /** ���� */
  private String content;
  /** �н����� */
  private String passwd;
  /** ����� */
  private String rdate;
  
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }

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
