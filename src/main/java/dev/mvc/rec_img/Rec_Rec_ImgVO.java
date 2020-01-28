package dev.mvc.rec_img;

public class Rec_Rec_ImgVO {
  
  // rec_img 테이블
  // ------------------------------------
  private int img_no;
  private String fname;
  private String fupname;
  private String thumb;
  private int fsize;
  private int recom_no;
  
  // rec 테이블
  // ------------------------------------
  private int cho_no;
  private String content;
  private int cnt;
  public int getImg_no() {
    return img_no;
  }
  public void setImg_no(int img_no) {
    this.img_no = img_no;
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
  public int getFsize() {
    return fsize;
  }
  public void setFsize(int fsize) {
    this.fsize = fsize;
  }
  public int getRecom_no() {
    return recom_no;
  }
  public void setRecom_no(int recom_no) {
    this.recom_no = recom_no;
  }
  public int getCho_no() {
    return cho_no;
  }
  public void setCho_no(int cho_no) {
    this.cho_no = cho_no;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  
  
}
