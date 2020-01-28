package dev.mvc.rattachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.rattachfile.RattachfileProc")
public class RattachfileProc implements RattachfileProcInter {
  @Autowired
  private RattachfileDAOInter rattachfileDAO; 
  
  @Override
  public int create(RattachfileVO rattachfileVO) {
    int count = rattachfileDAO.create(rattachfileVO);
    return count;
  }

  @Override
  public int delete(int rattachfileno) {
    int count = rattachfileDAO.delete(rattachfileno);
    return count;
  }
  
  @Override
  public List<RattachfileVO> list_by_restno(int restno) {
    List<RattachfileVO> list = rattachfileDAO.list_by_restno(restno);
    return list;
  }

  @Override
  public int count_by_restno(int restno) {
    int count = rattachfileDAO.count_by_restno(restno);
    return count;
  }


}




