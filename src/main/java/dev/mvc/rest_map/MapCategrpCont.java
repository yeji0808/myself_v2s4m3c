package dev.mvc.rest_map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapCategrpCont {
  @Autowired
  @Qualifier("dev.mvc.rest_categrp.RestCategrpProc") // 이름 지정

  //http://localhost:9090/team/rest_map/map.do
  @RequestMapping(value="/rest_map/map.do", method=RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/rest_map/map"); //
        
    return mav;
  }
}



  
 

