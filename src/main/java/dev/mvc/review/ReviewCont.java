package dev.mvc.review;

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

/*import dev.mvc.admin.AdminProcInter;
import dev.mvc.rest_categrp.RestCategrpProcInter;
import dev.mvc.member.MemberVO;*/

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc") // �̸� ����
  private ReviewProcInter reviewProc;
  
/*  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // �̸� ����
  private AdminProcInter adminProc;*/
  
  public ReviewCont(){
    System.out.println("--> ReviewCont created.");
  }
  
  @RequestMapping(value = "/review/create.do",
                            method = RequestMethod.POST,
                            produces = "text/plain;charset=UTF-8")
  public String create(ReviewVO reviewVO) {
    int count = reviewProc.create(reviewVO);
    
    JSONObject obj = new JSONObject();
    obj.put("count",count);
 
    return obj.toString(); // {"count":1}

  }
  
/*  @RequestMapping(value="/review/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<ReviewVO> list = reviewProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/review/list"); // /webapp/review/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }*/

  /**
   <xmp>
   http://localhost:9090/ojt/review/list_by_contentsno.do?contentsno=1
   ���� ���� ���: {"list":[]}
   ���� �ִ� ���
   {"list":[
            {"memberno":1,"rdate":"2019-12-18 16:46:43","passwd":"123","reviewno":3,"content":"��� 3","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:39","passwd":"123","reviewno":2,"content":"��� 2","contentsno":1}
            ,
            {"memberno":1,"rdate":"2019-12-18 16:46:35","passwd":"123","reviewno":1,"content":"��� 1","contentsno":1}
            ] 
   }
   </xmp>  
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/review/list_by_contentsno.do",
                            method = RequestMethod.GET,
                            produces = "text/plain;charset=UTF-8")
  public String list_by_restno(int restno) {
    List<ReviewVO> list = reviewProc.list_by_restno(restno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString(); 

  }
  
  /**
   * {"list":[
          {"memberno":1,
        "rdate":"2019-12-18 16:46:35",
      "passwd":"123",
      "reviewno":1,
      "id":"user1",
      "content":"���&nbsp;1",
      "contentsno":1}
    ,
        {"memberno":1,
       "rdate":"2019-12-18 16:46:35",
       "passwd":"123",
       "reviewno":1,
       "id":"user1",
       "content":"���&nbsp;1",
       "contentsno":1}
    ]
}
   * http://localhost:9090/ojt/review/list_by_contentsno_join.do?contentsno=1
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/review/list_by_contentsno_join.do",
                              method = RequestMethod.GET,
                              produces = "text/plain;charset=UTF-8")
  public String list_by_restno_join(int restno) {
    // String msg="JSON ���";
    // return msg;
    
    List<ReviewMemberVO> list = reviewProc.list_by_restno_join(restno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
 
    return obj.toString();     
  }
  
}


