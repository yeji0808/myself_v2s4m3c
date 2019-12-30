package dev.mvc.restrnts;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RestrntsVO {
  /** ������ ��ȣ */
  private int restno;
  /**  �з� ��ȣ */
  private int rcateno;
  /** ���� ��ȣ*/
  private int memberno;
  /** ������ �̸�*/
  private String rname;
  /** ���ο丮*/
  private String rmain;
  /** ���ټҰ�*/
  private String rintro;
  /** �����ð�*/
  private String rtime;
  /** ������ ��ȭ��ȣ*/
  private String rcall;
  /** ���� ��ȣ */
  private String rzipcode = "";
  /** �ּ� 1 */
  private String raddress1 = "";
  /** �ּ� 2 */
  private String raddress2 = "";
  /** �˻���*/
  private String rword;
  /** ��õ��*/
  private String rrecom;
  /** ��ȸ��*/
  private String rcnt;
  /** �����*/
  private String reviewcnt;
  /** ���� ���ϸ�*/
  private String fname;
  /** ���ε� ���ϸ�*/
  private String fupname;
  /** Thumb ����*/
  private String thumb;
  /** ���� ������*/
  private long fsize;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� ����  */
  private MultipartFile fnameMF;

  public int getRestno() {
    return restno;
  }

  public void setRestno(int restno) {
    this.restno = restno;
  }

  public int getRcateno() {
    return rcateno;
  }

  public void setRcateno(int rcateno) {
    this.rcateno = rcateno;
  }

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public String getRname() {
    return rname;
  }

  public void setRname(String rname) {
    this.rname = rname;
  }

  public String getRmain() {
    return rmain;
  }

  public void setRmain(String rmain) {
    this.rmain = rmain;
  }

  public String getRintro() {
    return rintro;
  }

  public void setRintro(String rintro) {
    this.rintro = rintro;
  }

  public String getRtime() {
    return rtime;
  }

  public void setRtime(String rtime) {
    this.rtime = rtime;
  }

  public String getRcall() {
    return rcall;
  }

  public void setRcall(String rcall) {
    this.rcall = rcall;
  }

  public String getRzipcode() {
    return rzipcode;
  }

  public void setRzipcode(String rzipcode) {
    this.rzipcode = rzipcode;
  }

  public String getRaddress1() {
    return raddress1;
  }

  public void setRaddress1(String raddress1) {
    this.raddress1 = raddress1;
  }

  public String getRaddress2() {
    return raddress2;
  }

  public void setRaddress2(String raddress2) {
    this.raddress2 = raddress2;
  }

  public String getRword() {
    return rword;
  }

  public void setRword(String rword) {
    this.rword = rword;
  }

  public String getRrecom() {
    return rrecom;
  }

  public void setRrecom(String rrecom) {
    this.rrecom = rrecom;
  }

  public String getRcnt() {
    return rcnt;
  }

  public void setRcnt(String rcnt) {
    this.rcnt = rcnt;
  }

  public String getReviewcnt() {
    return reviewcnt;
  }

  public void setReviewcnt(String reviewcnt) {
    this.reviewcnt = reviewcnt;
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

  public MultipartFile getFnameMF() {
    return fnameMF;
  }

  public void setFnameMF(MultipartFile fnameMF) {
    this.fnameMF = fnameMF;
  }

  
    
  
} 
 
  