package dev.mvc.s_reply;

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
public class S_ReplyCont {
  @Autowired
  @Qualifier("dev.mvc.s_reply.S_ReplyProc") // �̸� ����
  private S_ReplyProcInter s_replyProc;
  
  public S_ReplyCont() {
    System.out.println("--> S_ReplyCont Created");
  }
  
  @ResponseBody
  @RequestMapping(value = "/s_reply/create.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String create(S_ReplyVO s_replyVO) {
    // System.out.println("--> id: " + id);
    int count = s_replyProc.create(s_replyVO);

    JSONObject obj = new JSONObject();
    obj.put("count", count);

    return obj.toString(); // {"count":1}

  }
  
  @RequestMapping(value = "/s_reply/list.do", method = RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();

    // if (adminProc.isAdmin(session)) {
    List<S_ReplyVO> list = s_replyProc.list();
    
    mav.addObject("list", list);
    mav.setViewName("/s_reply/list"); // /webapp/reply/list.jsp
    // } else {
    //  mav.setViewName("redirect:/admin/login_need.jsp");
    // }
    
    return mav;
  }
  
  /**
   * http://localhost:9090/team1/s_reply/list_by_writeno.do?writeno=1
   * ���� �ִ� ���: {"list":[{"memberno":1,"passwd":"1234","rdate":"2019-12-18 16:49:00","replyno":3,"content":"���3","writeno":1},
   *                            {"memberno":1,"passwd":"1234","rdate":"2019-12-18 16:48:53","replyno":2,"content":"���2","writeno":1},
   *                            {"memberno":1,"passwd":"1234","rdate":"2019-12-18 16:48:45","replyno":1,"content":"���1","writeno":1}]}
   * ���� ���� ���: {"list":[]}
   * @param writeno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/s_reply/list_by_writeno.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String list_by_writeno(int writeno) {
    // System.out.println("--> id: " + id);
    List<S_ReplyVO> list = s_replyProc.list_by_writeno(writeno);

    JSONObject obj = new JSONObject();
    obj.put("list", list);

    return obj.toString(); // {"count":1}

  }
  
  /**
   * http://localhost:9090/team1/s_reply/list_by_writeno_join.do?writeno=1
   * @param writeno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/s_reply/list_by_writeno_join.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String list_by_writeno_join(int writeno) {
    // String msg = "JSON ���";
    // return msg;

    List<S_ReplyMemberVO> list = s_replyProc.list_by_writeno_join(writeno);

    JSONObject obj = new JSONObject();
    obj.put("list", list);

    return obj.toString(); // {"count":1}

  }

}
