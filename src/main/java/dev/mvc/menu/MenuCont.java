package dev.mvc.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.rest_categrp.RestCategrpVO;
import dev.mvc.restrnts.RestrntsProcInter;
import dev.mvc.restrnts.RestrntsVO;

@Controller
public class MenuCont {
  @Autowired
  @Qualifier("dev.mvc.menu.MenuProc") // 이름 지정
  private MenuProcInter menuProc;
  
  @Autowired
  @Qualifier("dev.mvc.restrnts.RestrntsProc") // 이름 지정
  private RestrntsProcInter restrntsProc;
  
//등록 폼
 
 
//등록 처리
@RequestMapping(value="/menu/create_menu.do", method=RequestMethod.POST)
public ModelAndView create(RedirectAttributes ra, MenuVO menuVO, int restno, int rcateno) {
  ModelAndView mav = new ModelAndView();
  
  int count = 0;

  String[] mname = menuVO.getMname().split(",");
  String[] mprice = menuVO.getMprice().split(",");
  
  for( int i = 0; i < mname.length; i++) {
    menuVO.setMname(mname[i]);
    menuVO.setMprice(mprice[i]);
    
    count = menuProc.create(menuVO);
  }
  
  if (count == 1) { 
    ra.addAttribute("restno", restno); 
    mav.setViewName("redirect:/rattachfile/create.jsp?restno="+restno+"&rcateno="+rcateno);
  } 
  
  return mav;
}

//수정 처리
@RequestMapping(value = "/menu/update_menu.do", method = RequestMethod.POST)
public ModelAndView update(RedirectAttributes ra, RestrntsVO restrntsVO) {
  ModelAndView mav = new ModelAndView();
  
      int count = restrntsProc.update(restrntsVO);

      ra.addAttribute("count", count);
      ra.addAttribute("rcateno", restrntsVO.getRcateno());
      ra.addAttribute("restno", restrntsVO.getRestno());
      
      mav.setViewName("redirect:/menu/update.jsp");

      return mav;
  
}
 
}
