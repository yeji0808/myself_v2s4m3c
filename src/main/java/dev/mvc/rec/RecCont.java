package dev.mvc.rec;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.b_write.WriteVO;
import dev.mvc.rec_img.Rec_imgProcInter;
import dev.mvc.rec_img.Rec_imgVO;
import dev.mvc.rec_member.RecMemberProcInter;
import dev.mvc.rec_member.RecMemberVO;


@Controller
public class RecCont {
  @Autowired
  @Qualifier("dev.mvc.rec.RecProc") 
  private RecProcInter recProc;
  @Autowired
  @Qualifier("dev.mvc.rec_img.Rec_imgProc")
  private Rec_imgProcInter rec_imgProc;
  @Autowired
  @Qualifier("dev.mvc.rec_member.RecMemberProc")
  private RecMemberProcInter recMemberProc;
 
  public RecCont() {
    System.out.println("--> RecCont create"); 
  }
  
  /** 
   * 등록폼
   * @return
   */
  // http://localhost:9090/team1/rec/create.do?cho_no=5
  @RequestMapping(value="/rec/create.do", method=RequestMethod.GET)
  public ModelAndView create(int cho_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/rec/create");
    
    
    return mav; 
  }
  /**
   * 등록 처리
   * @param recVO
   * @return
   */
  @RequestMapping(value="/rec/create.do", method=RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, RecVO recVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = recProc.create(recVO);
    
    int cho_no = recVO.getCho_no();
    int recom_no = recVO.getRecom_no();
    if(count ==1) {
    System.out.println(recom_no);
    ra.addAttribute("count", count);
    ra.addAttribute("recom_no", recom_no);
    ra.addAttribute("cho_no", cho_no);

    }
    mav.setViewName("redirect:/rec/create_msg.jsp");
    
    return mav;
  }
  
  /**
   * 수정
   * @param recom_no
   * @return
   */
  @RequestMapping(value = "/rec/update.do", method = RequestMethod.GET)
  public ModelAndView update(int recom_no) {
    ModelAndView mav = new ModelAndView();

    RecVO recVO = recProc.read(recom_no);
    mav.addObject("recVO", recVO);
    
    
    mav.setViewName("rec/update"); // /webapp/contents/update.jsp

    return mav;
  }
  
  /**
   * 수정 처리
   * @param recVO
   * @return
   */
  @RequestMapping(value = "/rec/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,
                                        RecVO recVO) {
    ModelAndView mav = new ModelAndView();
    int count = recProc.update(recVO);

    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    ra.addAttribute("count", count);
    ra.addAttribute("recom_no", recVO.getRecom_no());
    ra.addAttribute("cho_no", recVO.getCho_no());
    
    mav.setViewName("redirect:/rec/update_msg.jsp");

    return mav;
  }
  
 
  
  /**
   * 
   * http://localhost:9090/team1/write/list.do?boardno=1
   * http://localhost:9090/team1/write/list.do?boardno=2
   * http://localhost:9090/team1/write/list.do?boardno=3
   * 
   * @param boardno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/rec/list_by_cho_no.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String list_by_cho_no(int cho_no) {
    List<RecVO> list = recProc.list_by_cho_no(cho_no);
    JSONObject obj = new JSONObject(); 
    obj.put("list", list);/*
    List<Rec_imgVO> list_by_rec_img = rec_imgProc.list_by_recom_no(list.);
    System.out.println(list_by_rec_img);
    
    
    obj.put("list_by_rec_img", list_by_rec_img);*/

    return obj.toString(); 
  }
  
  /**
   * http://localhost:9090/team1/rec/increase_cnt.do?recom_no=27&memberno=2
   * @param wno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/rec/increase_cnt.do", 
                          method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String increase_cnt(int recom_no, int memberno) { 
    JSONObject obj = new JSONObject();
    
    int count = recProc.increase_cnt(recom_no);
    RecVO recVO = recProc.read(recom_no);
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("recom_no", recom_no);
    map.put("memberno", memberno);
    
    String msg = "중복 추천 할 수 없습니다.";
    int countMember=0;
    int cnt=0;
    boolean flag = false;
//    if(memberno!=list.get(2).getMemberno()) {
     
  //  }
      List<RecMemberVO> list = recMemberProc.list_by_recom_no(recom_no);
    for(int i = 0; i<list.size();i++) {
      if(memberno!=list.get(i).getMemberno()) {
        flag = true;
      } else {
        flag=false;
        break;
      }
    }
    if(flag) {
      countMember =recMemberProc.create(map);
      cnt= recVO.getCnt();

      obj.put("cnt", cnt);
      obj.put("count", count);
      obj.put("countMember", countMember);

    } else {
      obj.put("cnt", 99999); // 99999: 중복 선택 안됨.  
      obj.put("count", 0);
      obj.put("countMember", countMember);

    }
    


    return obj.toString();
   
  }
}
