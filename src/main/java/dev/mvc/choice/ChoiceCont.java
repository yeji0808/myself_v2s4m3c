package dev.mvc.choice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import dev.mvc.b_write.WriteVO;
import dev.mvc.rec.RecProcInter;
import dev.mvc.rec.RecVO;
import dev.mvc.rec_img.Rec_imgProcInter;
import dev.mvc.rec_img.Rec_imgVO;
import dev.mvc.w_attach.W_attachVO;



@Controller 
public class ChoiceCont {
  @Autowired
  @Qualifier("dev.mvc.choice.ChoiceProc") // 이름 지정 
  private ChoiceProcInter choiceProc;
  @Autowired
  @Qualifier("dev.mvc.rec.RecProc") // 이름 지정 
  private RecProcInter recProc;
  @Autowired
  @Qualifier("dev.mvc.rec_img.Rec_imgProc")
  private Rec_imgProcInter rec_imgProc;
  
  public ChoiceCont() {
    System.out.println("--> ChoiceCont created.");
  }
  
  /** 
   * 등록폼
   * @return
   */
  // http://localhost:9090/team1/choice/create.do?boardno=5
  @RequestMapping(value="/choice/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    

    mav.setViewName("/choice/create");
    
    
    return mav; 
  }
  /**
   * 등록 처리
   * @param ra
   * @param choiceVO
   * @return
   */
  @RequestMapping(value="/choice/create.do", method=RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                        ChoiceVO choiceVO) {
    ModelAndView mav = new ModelAndView();

    int count = choiceProc.create(choiceVO);
    int cho_no = choiceVO.getCho_no();
    if(count ==1) {
    /*boardProc.increaseCnt(choiceVO.getBoardno());*/
    System.out.println(cho_no);
    ra.addAttribute("count", count);
    ra.addAttribute("cho_no",cho_no);
    }
    mav.setViewName("redirect:/choice/create_msg.jsp");
    
    
    return mav;
  }
  /**
   * 목록
   * http://localhost:9090/team1/choice/list.do
   * http://localhost:9090/team1/choice/list.do
   * http://localhost:9090/team1/choice/list.do
   * 
   * @return
   */
  @RequestMapping(value = "/choice/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
 
    List<ChoiceVO> list = choiceProc.list();
    mav.addObject("list", list);
    // /webapp/contents/list.jsp 


    mav.setViewName("/choice/list"); // 카테고리 그룹별 목록

    return mav;
  }
  
  /**
   * 조회 http://localhost:9090/team1/choice/read.do?cho_no=1
   * @param cho_no
   * @param recVO
   * @param recom_no
   * @return
   */
  @RequestMapping(value = "/choice/read.do", method = RequestMethod.GET)
  public ModelAndView read(int cho_no, RecVO recVO) {
    ModelAndView mav = new ModelAndView();
    
    ChoiceVO choiceVO = choiceProc.read(cho_no);
    mav.addObject("choiceVO", choiceVO); 
    
    List<RecVO> list_recom= recProc.list_by_cho_no(cho_no);
    
    mav.addObject("list_recom",list_recom);
    mav.setViewName("/choice/read");

    return mav;
  }
  
  /**
   * 수정
   * @param wno
   * @return
   */
  @RequestMapping(value = "/choice/update.do", method = RequestMethod.GET)
  public ModelAndView update(int cho_no) {
    ModelAndView mav = new ModelAndView();

    ChoiceVO choiceVO = choiceProc.read(cho_no);
    mav.addObject("choiceVO", choiceVO);

    mav.setViewName("choice/update"); // /webapp/contents/update.jsp

    return mav;
  }
  
  /**
   * 수정 처리
   * @param writeVO
   * @return
   */
  @RequestMapping(value = "/choice/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,
                                        ChoiceVO choiceVO) {
    ModelAndView mav = new ModelAndView();
    int count = choiceProc.update(choiceVO);

    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    ra.addAttribute("count", count);
    ra.addAttribute("memberno", choiceVO.getMemberno());
    ra.addAttribute("cho_no", choiceVO.getCho_no());
    
    mav.setViewName("redirect:/choice/update_msg.jsp");

    return mav;
  }
  
  /** 삭제 폼 */
  //http://localhost:9090/team1/choice/delete.do?wno=1
 @RequestMapping(value = "/choice/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete(int cho_no) {
   ModelAndView mav = new ModelAndView();


   ChoiceVO choiceVO = choiceProc.read(cho_no);
   mav.addObject("choiceVO", choiceVO);
   
   // FK wno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_contentsno" 
  /* int count_by_wno = w_attachProc.count_by_wno(cho_no);
   mav.addObject("count_by_wno", count_by_wno);   */
   
   mav.setViewName("/choice/delete"); // /webapp/contents/delete.jsp

   return mav;
 }
  
  /**
   * 한건 삭제 처리
   * @param cho_no
   * @return
   */
  @RequestMapping(value = "/choice/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(RedirectAttributes ra ,int cho_no) {
    ModelAndView mav = new ModelAndView();
  
    int count = choiceProc.delete(cho_no);
    
    ra.addAttribute("count", count);
    
    mav.setViewName("redirect:/choice/delete_msg.jsp");

    return mav;
  }
  
  /** 추천항목 삭제
   * http://localhost:9090/team1/rec/delete.do?cho_no=1&recom_no=5
   * {"delete_count":1,"count":1}
   * {"delete_count":1,"count":1}
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/choice/recom_delete.do", 
                              method = RequestMethod.POST,
                              produces = "text/plain;charset=UTF-8")
  public String recom_delete(int recom_no) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("recom_no", recom_no);
     System.out.println("recom_no : " + recom_no);
    /*int count = wreplyProc.checkPasswd(map); // 패스워드 검사*/
    int delete_count = recProc.delete(recom_no);
    /*if (count == 1) {
      delete_count = wreplyProc.delete(wreplyno); // 댓글 삭제
    }*/
    
    JSONObject obj = new JSONObject();
    obj.put("delete_count", delete_count);
    
    return obj.toString();
  }
 
}
