package dev.mvc.rec;

import java.util.List;


public interface RecDAOInter {
  public int create(RecVO recVO);
  public int update(RecVO recVO);
  public RecVO read(int recom_no);
  public int increase_cnt(int recom_no);
  public List<RecVO> list_by_cho_no(int cho_no);
  public int delete(int recom_no);
}
