package dev.mvc.s_reply;

public class S_ReplyMemberVO {
  //----------------------------------
  // MembersVO
  //----------------------------------
  /** ���̵� */
  private String id= "";
  /** �̸� */
  private String name= "";
  //----------------------------------
  // S_ReplyVO
  //----------------------------------
  /** ��� ��ȣ */
  private int replyno;
  /** ���� �� ��ȣ */
  private int writeno;
  /** ȸ�� ��ȣ */
  private int memberno;
  /** ����  */
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
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getReplyno() {
    return replyno;
  }
  public void setReplyno(int replyno) {
    this.replyno = replyno;
  }
  public int getWriteno() {
    return writeno;
  }
  public void setWriteno(int writeno) {
    this.writeno = writeno;
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
