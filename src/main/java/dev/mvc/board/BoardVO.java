package dev.mvc.board;

public class BoardVO {
  public static char[] getBoardno;
  /** �Խ��� ��ȣ **/
  private int boardno;
  /** �Խ��� �̸� **/
  private String name;
  /** �Խ��� ��� �ڷ� �� **/
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
