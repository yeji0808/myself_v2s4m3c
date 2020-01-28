package dev.mvc.rec_img;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Rec_imgVO {

      private int img_no;
      private String fname;
      private String fupname;
      private String thumb;
      private long fsize;
      private int recom_no;
      /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
      private List<MultipartFile> fnamesMF;
      public int getImg_no() {
        return img_no;
      }
      public void setImg_no(int img_no) {
        this.img_no = img_no;
      }
      public List<MultipartFile> getFnamesMF() {
        return fnamesMF;
      }
      public void setFnamesMF(List<MultipartFile> fnamesMF) {
        this.fnamesMF = fnamesMF;
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
      public int getRecom_no() {
        return recom_no;
      }
      public void setRecom_no(int recom_no) {
        this.recom_no = recom_no;
      }
}
