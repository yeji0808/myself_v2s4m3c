package dev.mvc.atcfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AtcfileVO {
  /** 첨부파일번호 */
  private int atcfileno;
  /** 글번호 */
  private int writeno;
  /** 원본 파일명 */
  private String fname;
  /** 업로드 파일명 */
  private String fupname;
  /** Thumb 파일 */
  private String thumb;
  /** 파일 크기 */
  private long fsize;
  /** 등록일 */
  private String rdate;
  
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장 */
  private List<MultipartFile> fnamesMF;
  
  // private MultipartFile fnamesMF; // 하나의 파일 처리
  /** 파일 단위 출력 */
  private String flabel;
  
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
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  public String getFlabel() {
    return flabel;
  }
  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }
  
  
  
}
