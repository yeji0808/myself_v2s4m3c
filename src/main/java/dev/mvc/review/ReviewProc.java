package dev.mvc.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter {
  @Autowired
  private ReviewDAOInter reviewDAO; 
  
  @Override
  public int create(ReviewVO reviewVO) {
    int count = reviewDAO.create(reviewVO);
    return count;
  }

  @Override
  public List<ReviewVO> list() {
    List<ReviewVO> list = reviewDAO.list();
    return list;
  }

  @Override
  public List<ReviewVO> list_by_restno(int restno) {
    List<ReviewVO> list = reviewDAO.list_by_restno(restno);
    String content = "";
    
    // 특수 문자 변경
    for (ReviewVO reviewVO:list) {
      content = reviewVO.getContent();
      content = Tool.convertChar(content);
      reviewVO.setContent(content);
    }
    return list;
  }

  @Override
  public List<ReviewMemberVO> list_by_restno_join(int restno) {
    List<ReviewMemberVO> list = reviewDAO.list_by_restno_join(restno);
    String content = "";
    
    // 특수 문자 변경
    for (ReviewMemberVO reviewMemberVO:list) {
      content = reviewMemberVO.getContent();
      content = Tool.convertChar(content);
      reviewMemberVO.setContent(content);
    }
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = reviewDAO.checkPasswd(map);
    return count;
  }

  @Override
  public int delete(int reviewno) {
    int count = reviewDAO.delete(reviewno);
    return count;
  }

  @Override
  public int increaseCnt(int restno) {
    int count = reviewDAO.increaseCnt(restno);
    
    return count;
  }
  
}













