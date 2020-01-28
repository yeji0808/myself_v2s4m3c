package nation.web.calendar;

public class CalendarDTO {
/*
  calendarno  INT          NOT NULL   AUTO_INCREMENT PRIMARY KEY,
  labeldate   VARCHAR(10)  NOT NULL, -- ����� ��¥ 2013-10-20 
  label       VARCHAR(20)  NOT NULL, -- �޷¿� ��µ� ���̺�
  title       VARCHAR(100) NOT NULL, -- ����(*)
  content     TEXT          NOT NULL, -- �� ����
  cnt         INT           DEFAULT 0, -- ��ȸ��
  regdate     DATETIME      NOT NULL  -- ��� ��¥  
 */

  /** �� ��ȣ */
  private int calendarno;
  /** ���̺� ��� ��¥ */
  private String labeldate;
  /** ���̺� */
  private String label;  
  /** ���� */
  private String title;
  /** ���� */
  private String content;
  /** ��ȸ�� */
  private int cnt;
  /** �� ����� */
  private String regdate;
  /** �Ҹ��� ��ȣ */
  private int somoimno;
  
  
  public int getCalendarno() {
    return calendarno;
  }
  public void setCalendarno(int calendarno) {
    this.calendarno = calendarno;
  }
  public String getLabeldate() {
    return labeldate;
  }
  public void setLabeldate(String labeldate) {
    this.labeldate = labeldate;
  }
  public String getLabel() {
    return label;
  }
  public void setLabel(String label) {
    this.label = label;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
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
  public String getRegdate() {
    return regdate;
  }
  public void setRegdate(String regdate) {
    this.regdate = regdate;
  }
  public int getSomoimno() {
    return somoimno;
  }
  public void setSomoimno(int somoimno) {
    this.somoimno = somoimno;
  }
  
  
  
}



