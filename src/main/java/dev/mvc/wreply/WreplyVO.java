package dev.mvc.wreply;

public class WreplyVO {
  /** 댓글 번호 **/
  private int wreplyno;
  /** 댓글 내용 **/
  private String rcontent;
  /** 댓글 등록일 **/
  private String rrdate;
  /** 댓글 비번 **/
  private int rpasswd;
  /** 글 번호 **/
  private int wno;
  
  public int getWreplyno() {
    return wreplyno;
  }
  public void setWreplyno(int wreplyno) {
    this.wreplyno = wreplyno;
  }
  public String getRcontent() {
    return rcontent;
  }
  public void setRcontent(String rcontent) {
    this.rcontent = rcontent;
  }
  public String getRrdate() {
    return rrdate;
  }
  public void setRrdate(String rrdate) {
    this.rrdate = rrdate;
  }
  public int getRpasswd() {
    return rpasswd;
  }
  public void setRpasswd(int rpasswd) {
    this.rpasswd = rpasswd;
  }
  public int getWno() {
    return wno;
  }
  public void setWno(int wno) {
    this.wno = wno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  /** 회원 번호 **/
  private int memberno;
}
