package dev.mvc.rest_categrp;
 
public class RestCategrpVO {
  /** 음식점 카테고리 번호 */
  private int rcateno;
  /**  음식점 카테고리 이름 */
  private String rcatename;
  /** 등록된 글수*/
  private int rcnt;
  
  public int getRcateno() {
    return rcateno;
  }
  public void setRcateno(int rcateno) {
    this.rcateno = rcateno;
  }
  public String getRcatename() {
    return rcatename;
  }
  public void setRcatename(String rcatename) {
    this.rcatename = rcatename;
  }
  public int getRcnt() {
    return rcnt;
  }
  public void setRcnt(int rcnt) {
    this.rcnt = rcnt;
  }

  
} 
 
  