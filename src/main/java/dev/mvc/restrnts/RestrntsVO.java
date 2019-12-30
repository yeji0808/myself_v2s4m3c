package dev.mvc.restrnts;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class RestrntsVO {
  /** 음식점 번호 */
  private int restno;
  /**  분류 번호 */
  private int rcateno;
  /** 점주 번호*/
  private int memberno;
  /** 음식점 이름*/
  private String rname;
  /** 메인요리*/
  private String rmain;
  /** 한줄소개*/
  private String rintro;
  /** 영업시간*/
  private String rtime;
  /** 음식점 전화번호*/
  private String rcall;
  /** 우편 번호 */
  private String rzipcode = "";
  /** 주소 1 */
  private String raddress1 = "";
  /** 주소 2 */
  private String raddress2 = "";
  /** 검색어*/
  private String rword;
  /** 추천수*/
  private String rrecom;
  /** 조회수*/
  private String rcnt;
  /** 리뷰수*/
  private String reviewcnt;
  /** 원본 파일명*/
  private String fname;
  /** 업로드 파일명*/
  private String fupname;
  /** Thumb 파일*/
  private String thumb;
  /** 파일 사이즈*/
  private long fsize;
  
  /** Form의 파일을 MultipartFile로 변환하여 저장  */
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
 
  