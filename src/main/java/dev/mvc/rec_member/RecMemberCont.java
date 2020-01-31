package dev.mvc.rec_member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.choice.ChoiceVO;


@Controller
public class RecMemberCont {
  @Autowired
  @Qualifier("dev.mvc.rec_member.RecMemberProc") // 이름 지정 
  private RecMemberProcInter recMemberProc;

  
  /**
   * 목록
   * http://localhost:9090/myself/rec_member/list.do
   * 
   * 
   * @return 
   */
  @RequestMapping(value = "/rec_member/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
 
    List<RecMemberVO> list = recMemberProc.list();
    mav.addObject("list", list);
    // /webapp/contents/list.jsp 
    for(int i=0; i<list.size();i++)
    System.out.println(list.get(i).getMemberno());
    
    mav.setViewName("/rec_member/list"); // 카테고리 그룹별 목록

    return mav;
  }
  
  /**
   * 한건 삭제 처리
   * @param cho_no
   * @return
   */
  @RequestMapping(value = "/rec_member/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int RecMemberNo) {
    ModelAndView mav = new ModelAndView();
  
    int count = recMemberProc.delete(RecMemberNo);
    
    mav.addObject("count", count);
    
    mav.setViewName("/rec_member/list.jsp");

    return mav;
  }
}
