package dev.mvc.somoim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.somoim.SomoimDAOInter;

@Component("dev.mvc.somoim.SomoimProc")
public class SomoimProc implements SomoimProcInter {
  @Autowired
  private SomoimDAOInter somoimDAO;

  @Override
  public int create(SomoimVO somoimVO) {
    int count = somoimDAO.create(somoimVO);
    return count;
  }

  @Override
  public List<SomoimVO> list_somoimno_asc() {
    List<SomoimVO> list = somoimDAO.list_somoimno_asc();
    return list;
  }

  @Override
  public SomoimVO read(int somoimno) {
    SomoimVO somoimVO = somoimDAO.read(somoimno);
    return somoimVO;
  }

  @Override
  public int update(SomoimVO somoimVO) {
    int count = somoimDAO.update(somoimVO);
    return count;
  }

  @Override
  public int delete(int somoimno) {
    int count = somoimDAO.delete(somoimno);
    return count;
  } 
  
}
