package dev.mvc.user_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CategrpCont {
  @Autowired
  @Qualifier("dev.mvc.user_categrp.CategrpProc") // 이름 지정
  private CategrpProcInter categrpProc;
  
  public CategrpCont() {
    System.out.println("--> CategrpCont created.");
  }
  
  // 등록 폼
  @RequestMapping(value="/user_categrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/user_categrp/create"); // /webapp/categrp/create.jsp
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value="/user_categrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(CategrpVO categrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = categrpProc.create(categrpVO);

    if (count == 0) {
      mav.setViewName("redirect:/user_categrp/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/user_categrp/list.do"); // list.jsp X
    }
        
    return mav;
  }
  
 // 목록
  @RequestMapping(value="/user_categrp/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<CategrpVO> list = categrpProc.list_categrpno_asc();
    
    mav.addObject("list", list);
    mav.setViewName("/user_categrp/list"); // /webapp/categrp/list.jsp

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
        
    return mav;
  }
  
//수정폼 + 조회
 @RequestMapping(value="/user_categrp/update.do", method=RequestMethod.GET)
 public ModelAndView update(int userno) {
   ModelAndView mav = new ModelAndView();
   
   CategrpVO categrpVO = categrpProc.read(userno);
   
   mav.addObject("categrpVO", categrpVO);
   mav.setViewName("/user_categrp/update"); // /webapp/categrp/update.jsp

   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
       
   return mav;
 }

 // 수정 처리
 @RequestMapping(value="/user_categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update(CategrpVO categrpVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = categrpProc.update(categrpVO);
   String url = "redirect:/user_categrp/update_msg.jsp?count=" + count +
                     "&userno=" + categrpVO.getUserno();
   mav.setViewName(url);
                              
   return mav;
 }
 
 // 삭제폼
 @RequestMapping(value="/user_categrp/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int userno) {
   ModelAndView mav = new ModelAndView();
   
   CategrpVO categrpVO = categrpProc.read(userno);

   mav.addObject("categrpVO", categrpVO);
   mav.setViewName("/user_categrp/delete"); // /webapp/categrp/delete.jsp

   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
       
   return mav;
 }
 
 // 삭제 처리
 @RequestMapping(value="/user_categrp/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int userno) {
   ModelAndView mav = new ModelAndView();
   
   int count = categrpProc.delete(userno);
   String url = "redirect:/user_categrp/delete_msg.jsp?count=" + count +
                     "&userno=" + userno;
   mav.setViewName(url);
                              
   return mav;
 }
}





