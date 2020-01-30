package dev.mvc.rest_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// ���� �̸� ����
@Component("dev.mvc.rest_categrp.RestCategrpProc")
public class RestCategrpProc implements RestCategrpProcInter {
  // CategrpDAOInter�� MyBATIS�� ȣ���ϴ� �ڵ尡 �ڵ�������.
  // �ڵ� ������ Ŭ������ ��ü�� �ڵ� �Ҵ��.
  @Autowired
  private RestCategrpDAOInter restcategrpDAO; 
  
  @Override
  public List<RestCategrpVO> list_categrpno_asc() {
    List<RestCategrpVO> list = restcategrpDAO.list_categrpno_asc();
    
    return list;
  }

  @Override
  public int create(RestCategrpVO restcategrpVO) {
    int cnt = restcategrpDAO.create(restcategrpVO);
    
    return cnt;
  }

  @Override
  public RestCategrpVO read(int rcateno) {
    RestCategrpVO restcategrpVO = restcategrpDAO.read(rcateno);
    
    return restcategrpVO;
  }

  @Override
  public int update(RestCategrpVO restcategrpVO) {
    int cnt = restcategrpDAO.update(restcategrpVO);
    
    return cnt;
  }

  @Override
  public int delete(int rcateno) {
    int cnt = restcategrpDAO.delete(rcateno);
    
    return cnt;
  }
  
  @Override
  public int increaseCnt(int rcateno) {
    int count = restcategrpDAO.increaseCnt(rcateno);
    return count;
  }

  @Override
  public int decreaseCnt(int rcateno) {
    int count = restcategrpDAO.decreaseCnt(rcateno);
    return count;
  }

  @Override
  public int cnt_zero(int rcateno) {
    int count = restcategrpDAO.cnt_zero(rcateno);
    return count;
  }


}



