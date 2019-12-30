package dev.mvc.wreply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.wreply.WreplyProc")
public class WreplyProc implements WreplyProcInter {

  @Autowired
  private WreplyDAOInter wreplyDAO;
  @Override
  public int create(WreplyVO wreplyVO) {
    int count = wreplyDAO.create(wreplyVO);
    return count;
  }
  @Override
  public List<WreplyVO> list() {
    List<WreplyVO> list = wreplyDAO.list();
    return list;
  }

}
