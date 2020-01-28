package dev.mvc.review;

import java.util.List;
import java.util.Map;

public interface ReviewDAOInter {
  public int create(ReviewVO reviewVO);
  
  public List<ReviewVO> list();
  
  public List<ReviewVO> list_by_restno(int restno);
  
  public List<ReviewMemberVO> list_by_restno_join(int resetno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int reviewno);

}




