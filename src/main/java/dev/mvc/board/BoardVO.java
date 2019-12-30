package dev.mvc.board;

public class BoardVO {
  public static char[] getBoardno;
  /** 게시판 번호 **/
  private int boardno;
  /** 게시판 이름 **/
  private String name;
  /** 게시판 등록 자료 수 **/
  private int count;
  public int getBoardno() {
    return boardno;
  }
  public void setBoardno(int boardno) {
    this.boardno = boardno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getCount() {
    return count;
  }
  public void setCount(int count) {
    this.count = count;
  }
}
