package dev.mvc.wreply;

public class WreplyVO {
  /** ��� ��ȣ **/
  private int wreplyno;
  /** ��� ���� **/
  private String rcontent;
  /** ��� ����� **/
  private String rrdate;
  /** ��� ��� **/
  private int rpasswd;
  /** �� ��ȣ **/
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
  /** ȸ�� ��ȣ **/
  private int memberno;
}
