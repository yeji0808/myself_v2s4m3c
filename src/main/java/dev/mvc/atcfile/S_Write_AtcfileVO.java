package dev.mvc.atcfile;

public class S_Write_AtcfileVO {
  // write 테이블
  //-----------------------------
  /** 회원 번호 */
  private int memberno;

  /** 소모임 번호 */
  private int somoimno;

  /** 제목 */
  private String title;

  /** 내용 */
  private String content;

  /** 추천수 */
  private int recom;

  /** 조회수 */
  private int cnt;

  /** 댓글수 */
  private int replycnt;

  /** 검색어 */
  private String word;

  //atcfile 테이블
  //-----------------------------  
  /** 파일 번호 */
  private int atcfileno;

  /** 컨텐츠 번호(FK) */
  private int writeno;

  /** 파일명 */
  private String fname;

  /** 업로드된 파일명 */
  private String fupname;

  /** Thumb 이미지 */
  private String thumb;

  /** 파일크기 */
  private long fsize;

  /** 등록일, atcfile 테이블 */
  private String rdate;

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public int getSomoimno() {
    return somoimno;
  }

  public void setSomoimno(int somoimno) {
    this.somoimno = somoimno;
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

  public int getRecom() {
    return recom;
  }

  public void setRecom(int recom) {
    this.recom = recom;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public int getReplycnt() {
    return replycnt;
  }

  public void setReplycnt(int replycnt) {
    this.replycnt = replycnt;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

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

  
  
  

}
