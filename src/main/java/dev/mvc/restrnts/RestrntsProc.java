package dev.mvc.restrnts;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.restrnts.RestrntsProc")
public class RestrntsProc implements RestrntsProcInter {
  // CategrpDAOInter가 MyBATIS를 호출하는 코드가 자동구현됨.
  // 자동 구현된 클래스의 객체가 자동 할당됨.
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



