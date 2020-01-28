package dev.mvc.choice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.choice.ChoiceProc")
public class ChoiceProc implements ChoiceProcInter {
  
  @Autowired
  private ChoiceDAOInter choiceDAO;
  
  @Override
  public int create(ChoiceVO choiceVO) {
    int count = choiceDAO.create(choiceVO);
    return count;
  }

  @Override
  public List<ChoiceVO> list() {
    List<ChoiceVO> list = choiceDAO.list();
    return list;
  }

  @Override
  public int update(ChoiceVO choiceVO) {
     int count = choiceDAO.update(choiceVO);
     return count;
  }

  @Override
  public ChoiceVO read(int cho_no) {
    ChoiceVO choiceVO = choiceDAO.read(cho_no);
    return choiceVO;
  }

  @Override
  public int delete(int cho_no) {
    int count = choiceDAO.delete(cho_no);
    return count;
  }

}
