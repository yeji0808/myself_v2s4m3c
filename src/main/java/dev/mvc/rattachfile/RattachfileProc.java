package dev.mvc.rattachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.attachfile.AttachfileProc")
public class RattachfileProc implements RattachfileProcInter {
  @Autowired
  private RattachfileDAOInter attachfileDAO; 
  
  @Override
  public int create(RattachfileVO attachfileVO) {
    int count = attachfileDAO.create(attachfileVO);
    return count;
  }

  @Override
  public List<RattachfileVO> list_by_contentsno(int contentsno) {
    List<RattachfileVO> list = attachfileDAO.list_by_contentsno(contentsno);
    return list;
  }

  @Override
  public int delete(int attachfileno) {
    int count = attachfileDAO.delete(attachfileno);
    return count;
  }

  @Override
  public int count_by_contentsno(int contentsno) {
    int count = attachfileDAO.count_by_contentsno(contentsno);
    return count;
  }

  @Override
  public int delete_by_contentsno(int contentsno) {
    int count = attachfileDAO.delete_by_contentsno(contentsno);
    return count;
  }

}




