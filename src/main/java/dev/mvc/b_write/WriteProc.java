package dev.mvc.b_write;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.b_write.WriteProc")
public class WriteProc implements WriteProcInter {
  
  @Autowired
  private WriteDAOInter writeDAO;
  
  @Override
  public int create(WriteVO writeVO) {
    int count = writeDAO.create(writeVO);
    return count;
  }
  
  @Override
  public List<WriteVO> list(int boardno) {
    List<WriteVO> list = writeDAO.list(boardno);
    return list;
  }

  @Override
  public WriteVO read(int wno) {
    WriteVO writeVO = writeDAO.read(wno);
    return writeVO;
  }

  @Override
  public int update(WriteVO writeVO) {
    int count = writeDAO.update(writeVO);
    return count;
  }

  @Override
  public int delete(int wno) {
    int count = writeDAO.delete(wno);
    return count;
  }

  @Override
  public int count_by_boardno(int boardno){
    int count = writeDAO.count_by_boardno(boardno);
    return count;
  }

  @Override
  public int delete_by_boardno(int boardno) {
    int count = writeDAO.delete_by_boardno(boardno);
    return count;
  }

  @Override
  public int increase_recom(int wno) {
    int count = writeDAO.increase_recom(wno);
    return count;
  }


}
