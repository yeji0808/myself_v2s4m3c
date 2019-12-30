package dev.mvc.s_write;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.s_write.WriteProc")
public class WriteProc implements WriteProcInter {
  @Autowired
  private WriteDAOInter writeDAO;

  @Override
  public int create(WriteVO writeVO) {
    int count = writeDAO.create(writeVO);
    return count;
  }

  @Override
  public List<WriteVO> list_by_somoimno(int somoimno) {
    List<WriteVO> list = writeDAO.list_by_somoimno(somoimno);
    return list;
  }

  @Override
  public WriteVO read(int writeno) {
    WriteVO writeVO = writeDAO.read(writeno);
    return writeVO;
  }

  @Override
  public int update(WriteVO writeVO) {
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
