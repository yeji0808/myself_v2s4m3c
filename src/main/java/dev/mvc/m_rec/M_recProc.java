package dev.mvc.m_rec;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.restrnts.RestrntsVO;


//빈의 이름 지정
@Component("dev.mvc.m_rec.M_recProc")
public class M_recProc implements M_recProcInter{

  @Autowired
  private M_recDAOInter m_recDAO; 
  
  @Override
  public int increaseRecom(int restno) {
    int count = m_recDAO.increaseRecom(restno);
    
    return count;
  }
  
  @Override
  public int decreaseRecom(int restno) {
    int count = m_recDAO.decreaseRecom(restno);
    
    return count;
  }


  @Override
  public int checkRecom(Map<String, Object> map) {
    int count = m_recDAO.checkRecom(map);
    
    return count;
  }

  @Override
  public int create_rec(Map<String, Object> map) {
    int count = m_recDAO.create_rec(map);
    
    return count;
  }

  @Override
  public int delete_rec(Map<String, Object> map) {
    int count = m_recDAO.delete_rec(map);
    
    return count;
  }

  @Override
  public M_recVO read(Map<String, Object> map) {
    M_recVO m_recVO = m_recDAO.read(map);
    
    return m_recVO;
  }



}
