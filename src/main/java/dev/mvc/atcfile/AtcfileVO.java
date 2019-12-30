package dev.mvc.atcfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class AtcfileVO {
  /** ÷�����Ϲ�ȣ */
  private int atcfileno;
  /** �۹�ȣ */
  private int writeno;
  /** ���� ���ϸ� */
  private String fname;
  /** ���ε� ���ϸ� */
  private String fupname;
  /** Thumb ���� */
  private String thumb;
  /** ���� ũ�� */
  private long fsize;
  /** ����� */
  private String rdate;
  
  /** Form�� ������ MultipartFile�� ��ȯ�Ͽ� List�� ���� */
  private List<MultipartFile> fnamesMF;
  
  // private MultipartFile fnamesMF; // �ϳ��� ���� ó��
  /** ���� ���� ��� */
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
