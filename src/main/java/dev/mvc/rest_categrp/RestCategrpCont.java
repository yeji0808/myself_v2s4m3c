package dev.mvc.rest_categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.rest_categrp.RestCategrpVO;

@Controller
public class RestCategrpCont {
  @Autowired
  @Qualifier("dev.mvc.rest_categrp.RestCategrpProc") // 이름 지정
  private RestCategrpProcInter restcategrpProc;
  
  // 등록 폼
  // http://localhost:9090/team/rest_categrp/create.do
  @RequestMapping(value="/rest_categrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/rest_categrp/create"); // /webapp/rest_categrp/create.jsp
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value="/rest_categrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(RestCategrpVO restcategrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = restcategrpProc.create(restcategrpVO);
    
    if (count == 0) {
      mav.setViewName("redirect:/rest_categrp/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/rest_categrp/list.do"); // list.jsp X
    }
        
    return mav;
  }

  // 목록
  // http://localhost:9090/team/rest_categrp/list.do
  @RequestMapping(value="/rest_categrp/list.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<RestCategrpVO> list = restcategrpProc.list_categrpno_asc();   
    mav.addObject("list", list);
    
    mav.setViewName("/rest_categrp/list"); //
        
    return mav;
  }
  
 //수정폼 + 조회
 @RequestMapping(value="/rest_categrp/update.do", method=RequestMethod.GET)
 public ModelAndView update(int rcateno) {
   ModelAndView mav = new ModelAndView();
   
   RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
   
   mav.addObject("restcategrpVO", restcategrpVO);
   mav.setViewName("/rest_categrp/update"); // /webapp/categrp/update.jsp

   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
       
   return mav;
 }

 // 수정 처리
 @RequestMapping(value="/rest_categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update(RestCategrpVO restcategrpVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = restcategrpProc.update(restcategrpVO);
   String url = "redirect:/rest_categrp/update_msg.jsp?count=" + count +
                     "&rcateno=" + restcategrpVO.getRcateno();
  
   mav.setViewName(url);
                              
   return mav;
 }
 
  //삭제폼
 @RequestMapping(value="/rest_categrp/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int rcateno) {
   ModelAndView mav = new ModelAndView();
  
   RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
  
   //int count_by_categrpno = restcontentsProc.count_by_categrpno(categrpno);
   //mav.addObject("count_by_categrpno", count_by_categrpno);
  
   mav.addObject("restcategrpVO", restcategrpVO);
   mav.setViewName("/rest_categrp/delete"); // /webapp/categrp/delete.jsp

   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
      
   return mav;
 }
 
 //삭제 처리
 @RequestMapping(value="/rest_categrp/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int rcateno) {
   ModelAndView mav = new ModelAndView();
  
   int count = restcategrpProc.delete(rcateno);
   String url = "redirect:/rest_categrp/delete_msg.jsp?count=" + count +
                     "&rcateno=" + rcateno;
   mav.setViewName(url);
                             
   return mav;
 }
}
  
 

