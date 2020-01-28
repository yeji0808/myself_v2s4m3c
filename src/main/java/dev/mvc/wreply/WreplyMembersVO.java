package dev.mvc.wreply;

public class WreplyMembersVO {
  /** 아이디 */
  private String id = "";
  /** 댓글 번호 */
  private int wreplyno;
  /** 관련 글 번호 */
  private int wno;
  /** 회원 번호 */
  private int memberno;
  /** 내용 */
  private String rcontent;
  /** 패스워드 */
  private String rpasswd;
  /** 등록일 */
  private String rrdate;
  
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public int getWreplyno() {
    return wreplyno;
  }
  public void setWreplyno(int wreplyno) {
    this.wreplyno = wreplyno;
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
  public String getRcontent() {
    return rcontent;
  }
  public void setRcontent(String rcontent) {
    this.rcontent = rcontent;
  }
  public String getRpasswd() {
    return rpasswd;
  }
  public void setRpasswd(String rpasswd) {
    this.rpasswd = rpasswd;
  }
  public String getRrdate() {
    return rrdate;
  }
  public void setRrdate(String rrdate) {
    this.rrdate = rrdate;
  }
}
