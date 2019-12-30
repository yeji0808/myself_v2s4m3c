package dev.mvc.user_categrp;
 
public class CategrpVO {

  /** 카테고리 번호 */
  private int userno;
  /**  카테고리 이름 */
  private String user_name;
  /** 등록된 글수*/
  private int user_cnt;
  /** 출력 순서 */
  private int seqno;
  /** 출력 모드 */
  private String visible;
  
  public int getUserno() {
    return userno;
  }
  public void setUserno(int userno) {
    this.userno = userno;
  }
  public String getUser_name() {
    return user_name;
  }
  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }
  public int getUser_cnt() {
    return user_cnt;
  }
  public void setUser_cnt(int user_cnt) {
    this.user_cnt = user_cnt;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
} 
 
  