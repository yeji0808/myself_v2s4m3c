package dev.mvc.s_write;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.s_write.WriteProc")
public class S_WriteProc implements S_WriteProcInter {
  @Autowired
  private S_WriteDAOInter writeDAO;

  @Override
  public int create(S_WriteVO writeVO) {
    int count = writeDAO.create(writeVO);
    return count;
  }

  @Override
  public List<S_WriteVO> list_by_somoimno(int somoimno) {
    List<S_WriteVO> list = writeDAO.list_by_somoimno(somoimno);
    return list;
  }

  @Override
  public S_WriteVO read(int writeno) {
    S_WriteVO writeVO = writeDAO.read(writeno);
    return writeVO;
  }

  @Override
  public int update(S_WriteVO writeVO) {
    int count = writeDAO.update(writeVO);
    return count;
  }

  @Override
  public int delete(int writeno) {
    int count = writeDAO.delete(writeno);
    return count;
  }

  @Override
  public int count_by_somoimno(int somoimno) {
    int count = writeDAO.count_by_somoimno(somoimno);
    return count;
  }

  @Override
  public int delete_by_somoimno(int somoimno) {
    int count = writeDAO.delete_by_somoimno(somoimno);
    return count;
  }
 
  
}
