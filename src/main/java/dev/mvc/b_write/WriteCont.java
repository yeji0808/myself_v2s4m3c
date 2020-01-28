package dev.mvc.b_write;

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

import dev.mvc.w_attach.W_attachProcInter;
import dev.mvc.w_attach.W_attachVO;
import dev.mvc.wreply.WreplyProcInter;

@Controller 
public class WriteCont {

  @Autowired
  @Qualifier("dev.mvc.b_write.WriteProc") // 이름 지정 
  private WriteProcInter writeProc;
  @Autowired
  @Qualifier("dev.mvc.w_attach.W_attachProc") // 이름 지정 
  private W_attachProcInter w_attachProc;
  @Autowired
  @Qualifier("dev.mvc.wreply.WreplyProc") // 이름 지정 
  private WreplyProcInter wreplyProc;
  
  public WriteCont() {
    System.out.println("--> WriteCont created.");
  }
  /**
   * 등록폼
   * @param boardno
   * @return
   */
  // http://localhost:9090/team1/write/create.do
  @RequestMapping(value="/b_write/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    

    mav.setViewName("/b_write/create");
    
    
    return mav; 
  }
  /**
   * 등록 처리
   * @param ra
   * @param writeVO
   * @return
   */
  @RequestMapping(value="/b_write/create.do", method=RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                        WriteVO writeVO) {
    ModelAndView mav = new ModelAndView();
    int wno = 0;
    int count = writeProc.create(writeVO);
    System.out.println("selectKey: " + count);
    
    if(count ==1) {
    wno = writeVO.getWno();
    System.out.println("wno = " + wno);
    ra.addAttribute("count", count);
    ra.addAttribute("wno",wno);
    }
    mav.setViewName("redirect:/b_write/create_msg.jsp");
    
    
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
  @RequestMapping(value = "/b_write/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<WriteVO> list = writeProc.list();
    mav.addObject("list", list);
    // /webapp/contents/list.jsp 


    mav.setViewName("/b_write/list"); // 카테고리 그룹별 목록

    return mav;
  }
  
  /**
   * 조회 http://localhost:9090/ojt/contents/read.do?contentsno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/b_write/read.do", method = RequestMethod.GET)
  public ModelAndView read(int wno) {
    ModelAndView mav = new ModelAndView();

    
    WriteVO writeVO = writeProc.read(wno);
    mav.addObject("writeVO", writeVO);

    List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
    mav.addObject("w_attach_list", w_attach_list);
    
    mav.setViewName("/b_write/read");

    return mav;
  }
  
  @RequestMapping(value = "/b_write/update.do", method = RequestMethod.GET)
  public ModelAndView update(int wno) {
    ModelAndView mav = new ModelAndView();

    WriteVO writeVO = writeProc.read(wno);
    mav.addObject("writeVO", writeVO);

    mav.setViewName("/b_write/update"); // /webapp/contents/update.jsp

    return mav;
  }

  /**
   * 수정 처리
   * @param writeVO
   * @return
   */
  @RequestMapping(value = "/b_write/update.do", 
                             method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra,
                                            WriteVO writeVO) {
    ModelAndView mav = new ModelAndView();
    System.out.println("wcontent : " + writeVO.getWcontent());
    int count = writeProc.update(writeVO);

    // mav.setViewName("/contents/create"); // /webapp/contents/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    ra.addAttribute("count", count);
    ra.addAttribute("memberno", writeVO.getMemberno());
    ra.addAttribute("wno", writeVO.getWno());
    
    mav.setViewName("redirect:/b_write/update_msg.jsp");

    return mav;
  }

  /** 삭제 폼 */
  //http://localhost:9090/ojt/write/delete.do?boardno=1&wno=1
 @RequestMapping(value = "/b_write/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete(int wno) {
   ModelAndView mav = new ModelAndView();


   WriteVO writeVO = writeProc.read(wno);
   mav.addObject("writeVO", writeVO);
   
   // FK wno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_contentsno" 
   int count_by_wno = w_attachProc.count_by_wno(wno);
   mav.addObject("count_by_wno", count_by_wno);   
   
   mav.setViewName("/b_write/delete"); // /webapp/contents/delete.jsp

   return mav;
 }
 
 /**
  * 한건 삭제 처리
  * @param ra
  * @param categrpno
  * @param contentsno
  * @return
  */
 @RequestMapping(value = "/b_write/delete.do", 
                            method = RequestMethod.POST)
 public ModelAndView delete(RedirectAttributes ra,
                                      int wno) {
   ModelAndView mav = new ModelAndView();
 
   int count = writeProc.delete(wno);
   
   ra.addAttribute("count", count);
   ra.addAttribute("wno", wno);
   
   mav.setViewName("redirect:/b_write/delete_msg.jsp");

   return mav;
 }
 
 
 
 /**
  * 첨부 파일 1건 삭제 폼
  * 
  * @param wno
  * @return
  */
 @RequestMapping(value = "/b_write/file_delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView file_delete(int wno) {
   ModelAndView mav = new ModelAndView();

   WriteVO writeVO = writeProc.read(wno);
   mav.addObject("writeVO", writeVO);
   
   List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
   mav.addObject("w_attach_list", w_attach_list);
   
   mav.setViewName("/b_write/file_delete"); // file_delete.jsp

   return mav;
 }
 /**
  * 첨부 파일 1건 삭제 처리
  * 
  * @param wno
  * @return
  */
 @RequestMapping(value = "/b_write/file_delete_proc.do", 
     method = RequestMethod.GET)
 public ModelAndView file_delete_proc(int wno, int w_attachno) {
   ModelAndView mav = new ModelAndView();

   WriteVO writeVO = writeProc.read(wno);
   mav.addObject("writeVO", writeVO);

   // 1건의 파일 삭제
   w_attachProc.delete(w_attachno);

   List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
   mav.addObject("w_attach_list", w_attach_list);

   mav.setViewName("/b_write/file_delete"); // file_delete.jsp

   return mav;
 }

 /**
  * http://localhost:9090/team1/write/increase_recom.do?wno=13
  * @param wno
  * @return
  */
 @ResponseBody
 @RequestMapping(value = "/b_write/increase_recom.do", 
                         method = RequestMethod.POST,
                         produces = "text/plain;charset=UTF-8")
 public String increase_recom(int wno) {
   
   int count = writeProc.increase_recom(wno);
   WriteVO writeVO = writeProc.read(wno);
   int wrecom = writeVO.getWrecom();
   JSONObject obj = new JSONObject();
   obj.put("wrecom", wrecom);
   obj.put("count", count);
   
   return obj.toString();
   
 }
 
 /**
  * http://localhost:9090/team1/b_write/wreply_delete.do?wreplyno=1&rpasswd=1234
  * {"delete_count":1,"count":1}
  * {"delete_count":1,"count":1}
  * @param replyno
  * @param passwd
  * @return
  */
 @ResponseBody
 @RequestMapping(value = "/b_write/wreply_delete.do", 
                             method = RequestMethod.POST,
                             produces = "text/plain;charset=UTF-8")
 public String wreply_delete(int wreplyno, String rpasswd) {
   Map<String, Object> map = new HashMap<String, Object>();
   map.put("wreplyno", wreplyno);
   map.put("rpasswd", rpasswd);
    
   int count = wreplyProc.checkPasswd(map); // 패스워드 검사
   int delete_count = 0;
   if (count == 1) {
     delete_count = wreplyProc.delete(wreplyno); // 댓글 삭제
   }
   
   JSONObject obj = new JSONObject();
   obj.put("count", count);
   obj.put("delete_count", delete_count);
   
   return obj.toString();
 }


 
}
