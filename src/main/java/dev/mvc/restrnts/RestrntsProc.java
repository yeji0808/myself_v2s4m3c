package dev.mvc.restrnts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// ���� �̸� ����
@Component("dev.mvc.restrnts.RestrntsProc")
public class RestrntsProc implements RestrntsProcInter {
  // CategrpDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private RestrntsDAOInter restrntsDAO; 
  
  @Override
  public int create(RestrntsVO restcategrpVO) {
    int cnt = restrntsDAO.create(restcategrpVO);
    
    return cnt;
  }
  
  @Override
  public List<RestrntsVO> list_map() {
    List<RestrntsVO> list = restrntsDAO.list_map();
    
    return list;
  }
  
  @Override
  public List<RestrntsVO> list_by_rcateno(int rcateno) {
    List<RestrntsVO> list = restrntsDAO.list_by_rcateno(rcateno);
    
    return list;
  }

  @Override
  public RestrntsVO read(int rcateno) {
    RestrntsVO restrntsVO = restrntsDAO.read(rcateno);
    
    return restrntsVO;
  }

  @Override
  public int delete(int restno) {
    int count = restrntsDAO.delete(restno);
    
    return count;
  }
  
/*
  @Override
  public int update(RestrntsVO restcategrpVO) {
    // TODO Auto-generated method stub
    return 0;
  }*/


}



