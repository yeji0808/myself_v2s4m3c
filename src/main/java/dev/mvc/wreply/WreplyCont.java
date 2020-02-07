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

import dev.mvc.b_write.WriteProcInter;



@Controller
public class WreplyCont {
  @Autowired
  @Qualifier("dev.mvc.wreply.WreplyProc") // 이름 지정
  private WreplyProcInter wreplyProc;
  @Autowired
  @Qualifier("dev.mvc.b_write.WriteProc") // 이름 지정
  private WriteProcInter writeProc;
  
  public WreplyCont(){
    System.out.println("--> WreplyCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/wreply/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(WreplyVO wreplyVO) {
    int count = wreplyProc.create(wreplyVO);
     
    writeProc.increase_wreplycnt(wreplyVO.getWno());
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  @RequestMapping(value="/review/list2.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
      List<WreplyVO> list = wreplyProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/review/list2"); // /webapp/reply/list.jsp

    
    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value = "/reply/list_by_wno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_contentsno(int wno) {
    List<WreplyVO> list = wreplyProc.list_by_wno(wno);
    
    JSONObject obj = new JSONObject(); 
    obj.put("list", list);
 
    return obj.toString(); 
  }
  /**
  * http://localhost:9090/team1/wreply/list_by_wno_join.do?wno=1
    * @param wno
    * @return
    */
   @ResponseBody
   @RequestMapping(value = "/wreply/list_by_wno_join.do",
                               method = RequestMethod.GET,
                               produces = "text/plain;charset=UTF-8")
   public String list_by_contentsno_join(int wno) {
     // String msg="JSON 출력";
     // return msg;
      
     List<WreplyMembersVO> list = wreplyProc.list_by_wno_join(wno);
     
     JSONObject obj = new JSONObject();
     obj.put("list", list);
  
     return obj.toString();     
   }
   
   
}
