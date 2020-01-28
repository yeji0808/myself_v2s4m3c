package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.user_categrp.CategrpProcInter;
import dev.mvc.user_categrp.CategrpVO;
import dev.mvc.members.MembersVO;

@Controller 
public class MembersCont {
  @Autowired
  @Qualifier("dev.mvc.members.MembersProc")
  private MembersProcInter membersProc;
  
  @Autowired
  @Qualifier("dev.mvc.user_categrp.CategrpProc") // 이름 지정
  private CategrpProcInter categrpProc;

  public MembersCont() {
    System.out.println("--> MembersCont created.");
  }
  
  /**
   * 회원 가입 폼
   * @return
   */
  // http://localhost:9090/team1/members/create.do
  @RequestMapping(value = "/members/create.do", 
                             method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/members/create"); // /webapp/members/create.jsp
    
    return mav;
  }
  
  /**
   * 중복 ID 검사
   * http://localhost:9090/ojt/members/checkId.do?id=user1
   * 결과: {"count":1}
   * @param id
   * @return
   */
  @ResponseBody 
  @RequestMapping(value = "/members/checkId.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String checkId(String id) {
    // System.out.println("--> id: " + id);
    int count = membersProc.checkId(id);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
  @RequestMapping(value="/members/create.do", 
                          method=RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                        HttpServletRequest request,
                                          MembersVO membersVO){
      ModelAndView mav = new ModelAndView();

      int count = membersProc.create(membersVO);
      ra.addAttribute("count", count); // redirect parameter 적용
      mav.setViewName("redirect:/members/create_msg.jsp");

      return mav;
  }
  
  /**
   * 회원 목록
   * @param session
   * @return
   */
  @RequestMapping(value="/members/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    List<MembersVO> list = membersProc.list();
    mav.addObject("list", list);
    mav.setViewName("/members/list"); // /webapp/member/list.jsp
    return mav;
    
  }
  
  
  /**
   * 조회
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/members/list_by_user.do", method = RequestMethod.GET)
  public ModelAndView list_by_user(int userno) {
    ModelAndView mav = new ModelAndView();

    List<MembersVO> list = membersProc.list_by_user(userno);
    mav.addObject("list", list);
    
    CategrpVO categrpVO = categrpProc.read(userno);
    mav.addObject("categrpVO", categrpVO);

    mav.setViewName("/members/list_by_user");
    return mav;
  }
  
  /**
   * 조회 http://localhost:9090/team1/members/read.do?memberno=1
   * @param memberno
   * @return
   */
  @RequestMapping(value = "/members/read.do", method = RequestMethod.GET)
  public ModelAndView read(int memberno) {
    ModelAndView mav = new ModelAndView();

    MembersVO membersVO = membersProc.read(memberno);
    mav.addObject("membersVO", membersVO);

    mav.setViewName("/members/read");
    return mav;
  }

  
//수정 처리
 @RequestMapping(value="/members/update.do", 
                             method=RequestMethod.POST)
 public ModelAndView update(RedirectAttributes ra,
                                           MembersVO membersVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = membersProc.update(membersVO);
   ra.addAttribute("count", count);
   ra.addAttribute("memberno", membersVO.getMemberno());
   mav.setViewName("redirect:/member/update_msg.jsp");
                              
   return mav;
 }
 
 /**
  * 패스워드를 변경합니다.
  * @param memberno
  * @return
  */
 @RequestMapping(value="/members/passwd_update.do",
                           method=RequestMethod.GET)
 public ModelAndView passwd_update(int memberno){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/members/passwd_update");
   
   return mav;
 }
 
 /**
  * 패스워드를 변경합니다.
  * @param memberno
  * @return
  */
 @RequestMapping(value="/members/passwd_update.do",
                           method=RequestMethod.POST)
 public ModelAndView passwd_update(RedirectAttributes ra,
                                                      int memberno, 
                                                      String passwd,
                                                      String new_passwd){
   ModelAndView mav = new ModelAndView();
   
   // 현재 패스워드 검사
   HashMap<Object, Object> map = new HashMap<Object, Object>();
   map.put("memberno", memberno);
   map.put("passwd", passwd);
   
   int count = membersProc.passwd_check(map);
   int update_count = 0; // 변경된 패스워드 수
   
   if (count == 0) { // 현재 패스워드가 일치하지 않는 경우
     ra.addAttribute("count", count);
     mav.setViewName("redirect:/members/passwd_update_fail_msg.jsp");  
   } else { // 현재 패스워드가 일치하는 경우
     map.put("passwd", new_passwd);
     update_count = membersProc.passwd_update(map);
     ra.addAttribute("update_count", update_count);
     mav.setViewName("redirect:/members/passwd_update_success_msg.jsp"); 
   }
       
   return mav;
 }
 
 @RequestMapping(value="/members/delete.do",
                            method=RequestMethod.GET)
 public ModelAndView delete(int memberno){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/members/delete");
   
   MembersVO membersVO = membersProc.read(memberno);
   mav.addObject("membersVO", membersVO);
       
   return mav;
 }
 
 @RequestMapping(value = "/members/delete.do", 
                            method = RequestMethod.POST)
 public ModelAndView delete(RedirectAttributes ra,
                                          int memberno) {
   ModelAndView mav = new ModelAndView();

   String name = membersProc.read(memberno).getName();
   ra.addAttribute("name", name);
   
   int count = membersProc.delete(memberno);
   ra.addAttribute("count", count);
   
   mav.setViewName("redirect:/members/delete_msg.jsp?count=" + count);    

   return mav;
 }
 
 /**
  * 로그인 폼
  * @return
  */
 // http://localhost:9090/ojt/members/login.do 
 @RequestMapping(value = "/members/login.do", 
                            method = RequestMethod.GET)
 public ModelAndView login(HttpServletRequest request) {
   ModelAndView mav = new ModelAndView();
   
   Cookie[] cookies = request.getCookies();
   Cookie cookie = null;

   String ck_id = ""; // id 저장 변수
   String ck_id_save = ""; // id 저장 여부를 체크하는 변수
   String ck_passwd = ""; // passwd 저장 변수
   String ck_passwd_save = ""; // passwd 저장 여부를 체크하는 변수

   if (cookies != null) {
     for (int i=0; i < cookies.length; i++){
       cookie = cookies[i]; // 쿠키 객체 추출
       
       if (cookie.getName().equals("ck_id")){
         ck_id = cookie.getValue(); 
       }else if(cookie.getName().equals("ck_id_save")){
         ck_id_save = cookie.getValue();  // Y, N
       }else if (cookie.getName().equals("ck_passwd")){
         ck_passwd = cookie.getValue();         // 1234
       }else if(cookie.getName().equals("ck_passwd_save")){
         ck_passwd_save = cookie.getValue();  // Y, N
       }
     }
   }
   
   mav.addObject("ck_id", ck_id);
   mav.addObject("ck_id_save", ck_id_save);
   mav.addObject("ck_passwd", ck_passwd);
   mav.addObject("ck_passwd_save", ck_passwd_save);
   
   mav.setViewName("/members/login_ck_form");
   return mav;
 }
 
 /**
  * 로그인 처리
  * @return
  */
 // http://localhost:9090/ojt/members/login.do 
 @RequestMapping(value = "/members/login.do", 
                            method = RequestMethod.POST)
 public ModelAndView login_proc(HttpServletRequest request,
                                                HttpServletResponse response,
                                                HttpSession session,
                                                String id, String passwd,
                                                @RequestParam(value="id_save", defaultValue="") String id_save,
                                                @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
   ModelAndView mav = new ModelAndView();
   Map<Object, Object> map = new HashMap<Object, Object>();
   map.put("id", id);
   map.put("passwd", passwd);
   
   int count = membersProc.login(map);
   if (count == 1) { // 로그인 성공
     // System.out.println(id + " 로그인 성공");
     MembersVO memberVO = membersProc.readById(id);
     session.setAttribute("memberno", memberVO.getMemberno());
     session.setAttribute("id", memberVO.getId());
     session.setAttribute("name", memberVO.getName());
     
     // -------------------------------------------------------------------
     // id 관련 쿠기 저장
     // -------------------------------------------------------------------
     if (id_save.equals("Y")) { // id를 저장할 경우
       Cookie ck_id = new Cookie("ck_id", id);
       ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
       response.addCookie(ck_id);
     } else { // N, id를 저장하지 않는 경우
       Cookie ck_id = new Cookie("ck_id", "");
       ck_id.setMaxAge(0);
       response.addCookie(ck_id);
     }
     // id를 저장할지 선택하는  CheckBox 체크 여부
     Cookie ck_id_save = new Cookie("ck_id_save", id_save);
     ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
     response.addCookie(ck_id_save);
     // -------------------------------------------------------------------

     // -------------------------------------------------------------------
     // Password 관련 쿠기 저장
     // -------------------------------------------------------------------
     if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
       Cookie ck_passwd = new Cookie("ck_passwd", passwd);
       ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
       response.addCookie(ck_passwd);
     } else { // N, 패스워드를 저장하지 않을 경우
       Cookie ck_passwd = new Cookie("ck_passwd", "");
       ck_passwd.setMaxAge(0);
       response.addCookie(ck_passwd);
     }
     // passwd를 저장할지 선택하는  CheckBox 체크 여부
     Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
     ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
     response.addCookie(ck_passwd_save);
     // -------------------------------------------------------------------
     
     mav.setViewName("redirect:/index.jsp");  
   } else {
     mav.setViewName("redirect:/members/login_fail_msg.jsp");
   }
       
   return mav;
 }
 
 /**
  * 로그아웃 처리
  * @param session
  * @return
  */
 @RequestMapping(value="/members/logout.do", 
                            method=RequestMethod.GET)
 public ModelAndView logout(HttpSession session){
   ModelAndView mav = new ModelAndView();
   session.invalidate(); // 모든 session 변수 삭제
   
   mav.setViewName("redirect:/members/logout_msg.jsp");
   
   return mav;
 }
}