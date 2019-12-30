package dev.mvc.atcfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.atcfile.AtcfileProc")
public class AtcfileProc implements AtcfileProcInter {
  @Autowired
  private AtcfileDAOInter atcfileDAO;

  @Override
  public int create(AtcfileVO atcfileVO) {
    int count = atcfileDAO.create(atcfileVO);
    return count;
  }

  @Override
  public List<AtcfileVO> list() {
    List<AtcfileVO> list = atcfileDAO.list();
    return list;
  }

  @Override
  public List<AtcfileVO> list_by_writeno(int writeno) {
    List<AtcfileVO> list = atcfileDAO.list_by_writeno(writeno);
    return list;
  }

  @Override
  public int delete(int atcfileno) {
    int count = atcfileDAO.delete(atcfileno);
    return count;
  }

  @Override
  public int count_by_writeno(int writeno) {
    int count = atcfileDAO.count_by_writeno(writeno);
    return count;
  }

  @Override
  public int delete_by_writeno(int writeno) {
    int count = atcfileDAO.delete_by_writeno(writeno);
    return count;
  }

  @Override
  public AtcfileVO read(int atcfileno) {
    AtcfileVO atcfileVO = atcfileDAO.read(atcfileno);
    return atcfileVO;
  }
  
}
