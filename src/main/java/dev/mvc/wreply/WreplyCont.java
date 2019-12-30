package dev.mvc.wreply;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class WreplyCont {
  @Autowired
  @Qualifier("dev.mvc.wreply.WreplyProc") // 이름 지정
  private WreplyProcInter wreplyProc;
  
  public WreplyCont(){
    System.out.println("--> WreplyCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/wreply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(WreplyVO wreplyVO) {
    int count = wreplyProc.create(wreplyVO);
     
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  /*
  @RequestMapping(value="/wreply/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<ReplyVO> list = replyProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/reply/list"); // /webapp/reply/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }*/
}
