package dev.mvc.rec;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.rec.RecProc")
public class RecProc implements RecProcInter {

  @Autowired
  private RecDAOInter recDAO;
  
  @Override
  public int create(RecVO recVO) {
    int count = recDAO.create(recVO);
    return count;
  }


  @Override
  public int update(RecVO recVO) {
    int count = recDAO.update(recVO);
    return count;
  }

  @Override
  public int increase_cnt(int recom_no) {
     int count = recDAO.increase_cnt(recom_no);
     return count;
  }

  @Override
  public List<RecVO> list_by_cho_no(int cho_no) {
    List<RecVO> list = recDAO.list_by_cho_no(cho_no);
    return list;
  }


  @Override
  public RecVO read(int recom_no) {
    RecVO recVO = recDAO.read(recom_no);
    return recVO;
  }


  @Override
  public int delete(int recom_no) {
    int count = recDAO.delete(recom_no);
    return count;
  }


}
