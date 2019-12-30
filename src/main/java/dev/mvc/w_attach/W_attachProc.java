package dev.mvc.w_attach;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



// 빈의 이름 지정
@Component("dev.mvc.w_attach.W_attachProc")
public class W_attachProc implements W_attachProcInter {
  @Autowired
  private W_attachDAOInter w_attachDAO;

  @Override
  public int create(W_attachVO w_attachVO) {
    int count = w_attachDAO.create(w_attachVO);
    return count;
  }

  @Override 
  public List<Write_W_attachVO> list()  {
    List<Write_W_attachVO> list = w_attachDAO.list();
    return list;
  }

  @Override
  public List<W_attachVO> list_by_wno(int wno) {
    List<W_attachVO> list = w_attachDAO.list_by_wno(wno);
    return list;
  }

  @Override
  public int delete(int w_attachno) {
    int count = w_attachDAO.delete(w_attachno);
    return count;
  }

  @Override
  public int count_by_wno(int wno) {
    int count = w_attachDAO.count_by_wno(wno);
    return count;
  }

  @Override
  public int delete_by_wno(int wno) {
    int count = w_attachDAO.delete_by_wno(wno);
    return count;
  } 

}
