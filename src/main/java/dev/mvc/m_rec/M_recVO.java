package dev.mvc.m_rec;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class M_recVO {
  /*    
    recno                  NUMBER(10)        NOT NULL    PRIMARY KEY,
    restno                 NUMBER(10)    NOT NULL ,
    memberno           NUMBER(10)     NOT NULL,
   */
  /** 추천 번호 */
  private int recno;
  /** 음식점 번호(FK) */
  private int restno;
  /** 멤버 번호(FK) */
  private int memberno;
  
  public int getRecno() {
    return recno;
  }
  public void setRecno(int recno) {
    this.recno = recno;
  }
  public int getRestno() {
    return restno;
  }
  public void setRestno(int restno) {
    this.restno = restno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }


  
}
