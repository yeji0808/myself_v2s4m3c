package dev.mvc.somoim;

import org.springframework.web.multipart.MultipartFile;

public class SomoimVO {
  /** 소모임 번호 */
  private int somoimno;
  /** 소모임 이름 */
  private String name;
  /** 소모임 종류 */
  private String somoimtype;
  /** 소모임 출력 순서 */
  private int seqno;
  /** 소모임 출력 모드 */
  private String visible;
  /** 소모임 생성 날자 */
  private String rdate;
  /** 소모임 파일 */
  private String file1;
  /** 소모임 Thumb1 이미지 */
  private String thumb1;
  /** 소모임 파일크기 */
  private long size1;
  /** 회원 수 */
  private int membercnt;
  /** 원본 파일명 */
  private String fname;
  /** 업로드 파일명 */
  private String fupname;
  /** Thumb 이미지 */
  private String thumb;
  /** 파일크기 */
  private long fsize;
  
  /** Form의 파일을 MultipartFile로 변환하여 저장  */
  private MultipartFile fnameMF;
  
  /** 파일 단위 출력 */
  private String flabel;
  
  
  public int getSomoimno() {
    return somoimno;
  }
  public void setSomoimno(int somoimno) {
    this.somoimno = somoimno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getSomoimtype() {
    return somoimtype;
  }
  public void setSomoimtype(String somoimtype) {
    this.somoimtype = somoimtype;
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }  
  public String getFile1() {
    return file1;
  }
  public void setFile1(String file1) {
    this.file1 = file1;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }
  public long getSize1() {
    return size1;
  }
  public void setSize1(long size1) {
    this.size1 = size1;
  }
  public int getMembercnt() {
    return membercnt;
  }
  public void setMembercnt(int membercnt) {
    this.membercnt = membercnt;
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
  public String getFlabel() {
    return flabel;
  }
  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }

  
  
  
}
