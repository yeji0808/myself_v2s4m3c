package dev.mvc.atcfile;

public class S_Write_AtcfileVO {
  // write ���̺�
  //-----------------------------
  /** ȸ�� ��ȣ */
  private int memberno;

  /** �Ҹ��� ��ȣ */
  private int somoimno;

  /** ���� */
  private String title;

  /** ���� */
  private String content;

  /** ��õ�� */
  private int recom;

  /** ��ȸ�� */
  private int cnt;

  /** ��ۼ� */
  private int replycnt;

  /** �˻��� */
  private String word;

  //atcfile ���̺�
  //-----------------------------  
  /** ���� ��ȣ */
  private int atcfileno;

  /** ������ ��ȣ(FK) */
  private int writeno;

  /** ���ϸ� */
  private String fname;

  /** ���ε�� ���ϸ� */
  private String fupname;

  /** Thumb �̹��� */
  private String thumb;

  /** ����ũ�� */
  private long fsize;

  /** �����, atcfile ���̺� */
  private String rdate;

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getSomoimno() {
    return somoimno;
  }

  public void setSomoimno(int somoimno) {
    this.somoimno = somoimno;
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

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  public int getAtcfileno() {
    return atcfileno;
  }

  public void setAtcfileno(int atcfileno) {
    this.atcfileno = atcfileno;
  }

  public int getWriteno() {
    return writeno;
  }

  public void setWriteno(int writeno) {
    this.writeno = writeno;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public String getFupname() {
    return fupname;
  }

  public void setFupname(String fupname) {
    this.fupname = fupname;
  }

  public String getThumb() {
    return thumb;
  }

  public void setThumb(String thumb) {
    this.thumb = thumb;
  }

  public long getFsize() {
    return fsize;
  }

  public void setFsize(long fsize) {
    this.fsize = fsize;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  
  
  

}
