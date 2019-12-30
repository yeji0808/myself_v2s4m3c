package dev.mvc.user_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.user_categrp.CategrpProc")
public class CategrpProc implements CategrpProcInter {
  // CategrpDAOInter가 MyBATIS를 호출하는 코드가 자동구현됨.
  // 자동 구현된 클래스의 객체가 자동 할당됨.
  @Autowired
  private CategrpDAOInter categrpDAO; 

  @Override
  public int create(CategrpVO categrpVO) {
    int cnt = categrpDAO.create(categrpVO);
    return cnt;
  }
  
  @Override
  public List<CategrpVO> list_categrpno_asc() {
    List<CategrpVO> list = categrpDAO.list_categrpno_asc();
    
    return list;
  }
  
  @Override
  public CategrpVO read(int userno) {
    CategrpVO categrpVO = categrpDAO.read(userno);
    return categrpVO;
  }
  
  @Override
  public int update(CategrpVO categrpVO) {
    int count = categrpDAO.update(categrpVO);
    return count;
  }

  @Override
  public int delete(int userno) {
    int count = categrpDAO.delete(userno);
    
    return count;
  }
}



