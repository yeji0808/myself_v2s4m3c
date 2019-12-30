package dev.mvc.w_attach;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class W_attachVO {
     /** 첨부 파일 번호 **/
     private int w_attachno;
     /** 첨부 파일 이름 **/
     private String w_attachname;
     /** 업로드 파일 **/
     private String w_attachupfile;
     /** thumb 파일 **/
     private String w_attachthumb;
     /** 첨부 파일 크기 **/
     private long w_attachfsize;
     /** 글 번호 **/
     private int wno;
     /** 첨부 파일 등록일 **/
     private String w_file_rdate; 

     /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
     private List<MultipartFile> fnamesMF;
     public int getW_attachno() {
      return w_attachno;
    }
    public void setW_attachno(int w_attachno) {
      this.w_attachno = w_attachno;
    }
    public String getW_attachname() {
      return w_attachname;
    }
    public void setW_attachname(String w_attachname) {
      this.w_attachname = w_attachname;
    }
    public String getW_attachupfile() {
      return w_attachupfile;
    }
    public void setW_attachupfile(String w_attachupfile) {
      this.w_attachupfile = w_attachupfile;
    }
    public String getW_attachthumb() {
      return w_attachthumb;
    }
    public void setW_attachthumb(String w_attachthumb) {
      this.w_attachthumb = w_attachthumb;
    }
    public long getW_attachfsize() {
      return w_attachfsize;
    }
    public void setW_attachfsize(long w_attachfsize) {
      this.w_attachfsize = w_attachfsize;
    }
    public int getWno() {
      return wno;
    }
    public void setWno(int wno) {
      this.wno = wno;
    }
    public List<MultipartFile> getFnamesMF() {
      return fnamesMF;
    }
    public void setFnamesMF(List<MultipartFile> fnamesMF) {
      this.fnamesMF = fnamesMF;
    }
    public String getW_file_rdate() {
      return w_file_rdate;
    }
    public void setW_file_rdate(String w_file_rdate) {
      this.w_file_rdate = w_file_rdate;
    }
 
}
