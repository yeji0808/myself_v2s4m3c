package dev.mvc.admins;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.members.MembersProcInter;
import dev.mvc.members.MembersVO;

@Controller
public class AdminsCont {
  @Autowired
  @Qualifier("dev.mvc.admins.AdminsProc") // �̸� ����
  private AdminsProcInter adminProc;
  
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc") // �̸� ����
  private MembersProcInter memberProc;
  
  public AdminsCont(){
    System.out.println("--> AdminsCont created.");
  }
  
  /**
   * ������ ���
   * @return
   */
  // http://localhost:9090/team1/admins/list.do
  @ResponseBody
  @RequestMapping(value = "/admins/list.do", 
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
  public String list(String id, String passwd) {
    return adminProc.list();
  }
  
  /**
   * ������ �α��� ��
   * @return
   */
  // http://localhost:9090/team1/admins/login.do 
  @RequestMapping(value = "/admins/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("redirect:/admins/login_form");
    return mav;
  }
  
  /**
   * ������ �α��� ó��
   * @return
   */
  // http://localhost:9090/team1/admins/login.do 
  @RequestMapping(value = "/admins/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                                 HttpServletResponse response,
                                                 HttpSession session,
                                                 String id_admin, 
                                                 String passwd_admin) {
    ModelAndView mav = new ModelAndView();
    
    boolean sw = adminProc.login(id_admin, passwd_admin);
    if (sw == true) { // �α��� ����
      session.setAttribute("id_admin", id_admin);
      session.setAttribute("passwd_admin", passwd_admin);
      
      // ���� �������� 1�� ȸ�� �α��� ó��
      MembersVO memberVO = memberProc.read(1); 
      session.setAttribute("memberno", memberVO.getMemberno());
      session.setAttribute("id", memberVO.getId());
      session.setAttribute("name", memberVO.getName());
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/admins/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * ������ �α׾ƿ� ó��
   * @param session
   * @return
   */
  @RequestMapping(value="/admins/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // ��� session ���� ����
    
    mav.setViewName("redirect:/admins/logout_msg.jsp");
    
    return mav;
  }
  
}




