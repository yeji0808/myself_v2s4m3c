package dev.mvc.w_attach;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class W_attachVO {
     /** ÷�� ���� ��ȣ **/
     private int w_attachno;
     /** ÷�� ���� �̸� **/
     private String w_attachname;
     /** ���ε� ���� **/
     private String w_attachupfile;
     /** thumb ���� **/
     private String w_attachthumb;
     /** ÷�� ���� ũ�� **/
     private long w_attachfsize;
     /** �� ��ȣ **/
     private int wno;
     /** ÷�� ���� ����� **/
     private String w_file_rdate; 

     /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ����  */
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
