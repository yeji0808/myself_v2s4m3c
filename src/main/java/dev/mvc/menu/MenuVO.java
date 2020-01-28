package dev.mvc.menu;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
  /*    
    menuno                  NUMBER(10)        NOT NULL    PRIMARY KEY,
    restno                     NUMBER(10)        NULL ,
    mname                   VARCHAR2(100)    NOT NULL,
    mprice                    NUMBER(10)         NOT NULL,
   */
  /** �޴� ��ȣ */
  private int menuno;
  /** �� ��ȣ(FK) */
  private int restno;
  /** �޴� �̸� */
  private String mname;
  /** �޴� ���� */
  private String mprice;

  
  public int getMenuno() {
    return menuno;
  }
  public void setMenuno(int menuno) {
    this.menuno = menuno;
  }
  public int getRestno() {
    return restno;
  }
  public void setRestno(int restno) {
    this.restno = restno;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getMprice() {
    return mprice;
  }
  public void setMprice(String mprice) {
    this.mprice = mprice;
  }
  
  
}
