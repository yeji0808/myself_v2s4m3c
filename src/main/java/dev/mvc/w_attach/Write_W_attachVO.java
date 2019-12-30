package dev.mvc.w_attach;

public class Write_W_attachVO {
//----------writeVO----------
//------------------------------------
  /** 글쓰기 제목 **/
  private String wtitle;
  /** 글쓰기 내용 **/
  private String wcontent;
  /** 글쓰기 조회 수 **/
  private int wrecom;
  /** 글쓰기 뎃글 수 **/
  private int wreplycnt;
  /** 글쓰기 검색어 **/
  private String wword;
  /** 글쓰기 보드 넘버 **/
  private int boardno;
 
 // attachfile 테이블
 // ------------------------------------
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
  public String getWtitle() {
    return wtitle;
  }
  public void setWtitle(String wtitle) {
    this.wtitle = wtitle;
  }
  public String getWcontent() {
    return wcontent;
  }
  public void setWcontent(String wcontent) {
    this.wcontent = wcontent;
  }
  public int getWrecom() {
    return wrecom;
  }
  public void setWrecom(int wrecom) {
    this.wrecom = wrecom;
  }
  public int getWreplycnt() {
    return wreplycnt;
  }
  public void setWreplycnt(int wreplycnt) {
    this.wreplycnt = wreplycnt;
  }
  public String getWword() {
    return wword;
  }
  public void setWword(String wword) {
    this.wword = wword;
  }
  public int getBoardno() {
    return boardno;
  }
  public void setBoardno(int boardno) {
    this.boardno = boardno;
  }
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
  public String getW_file_rdate() {
    return w_file_rdate;
  }
  public void setW_file_rdate(String w_file_rdate) {
    this.w_file_rdate = w_file_rdate;
  } 
  
}
