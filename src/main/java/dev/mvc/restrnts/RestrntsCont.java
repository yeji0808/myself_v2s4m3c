package dev.mvc.restrnts;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.rest_categrp.RestCategrpProcInter;
import dev.mvc.rest_categrp.RestCategrpVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class RestrntsCont {
  @Autowired
  @Qualifier("dev.mvc.restrnts.RestrntsProc") // 이름 지정
  private RestrntsProcInter restrntsProc;
  
  @Autowired
  @Qualifier("dev.mvc.rest_categrp.RestCategrpProc") // 이름 지정
  private RestCategrpProcInter restcategrpProc;
  
  public RestrntsCont() {
    System.out.println("--> RestrntsCont created.");
  }
  
  // 등록 폼
  // http://localhost:9090/team/restrnts/create.do
  @RequestMapping(value="/restrnts/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/restrnts/create"); // /webapp/rest_categrp/create.jsp
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value = "/restrnts/create.do", method = RequestMethod.POST)
public ModelAndView create(RedirectAttributes ra, HttpServletRequest request, RestrntsVO restrntsVO) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    
    String upDir = Tool.getRealPath(request, "/restrnts/storage");
    // 전송 파일이 없어서도 fnameMF 객체가 생성됨
    MultipartFile fnameMF = restrntsVO.getFnameMF();
    fsize = fnameMF.getSize();  // 파일 크기
    
    if (fsize > 0) { // 파일 크기 체크
      fname = fnameMF.getOriginalFilename(); // 원본 파일명
      fupname = Upload.saveFileSpring(fnameMF, upDir); // 파일 저장
          
      if (Tool.isImage(fname)) { // 이미지인지 검사
        thumb = Tool.preview(upDir, fupname, 480, 300); // thumb 이미지 생성
      }
    }
      
        restrntsVO.setFname(fname);
        restrntsVO.setFupname(fupname);
        restrntsVO.setThumb(thumb);
        restrntsVO.setFsize(fsize);
        // -----------------------------------------------------
        // 파일 전송 코드 종료
        // -----------------------------------------------------

      int count = restrntsProc.create(restrntsVO);

      ra.addAttribute("count", count);
      ra.addAttribute("rcateno", restrntsVO.getRcateno()); 
      mav.setViewName("redirect:/restrnts/create_msg.jsp");

    return mav; 
  }

  // 전체 목록 (지도 출력)
  // http://localhost:9090/team/rest_map/list_map.do
  @RequestMapping(value="/rest_map/list_map.do", method=RequestMethod.GET)
  public ModelAndView list_map() {
    ModelAndView mav = new ModelAndView();
    
    List<RestrntsVO> list = restrntsProc.list_map();   
    mav.addObject("list", list);
    
    mav.setViewName("/rest_map/list_map"); //
        
    return mav;
  }
  
  // 카테고리 그룹별 목록
  @RequestMapping(value = "/restrnts/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_rcateno(int rcateno) {
    ModelAndView mav = new ModelAndView();

    List<RestrntsVO> list = restrntsProc.list_by_rcateno(rcateno);
    mav.addObject("list", list);
    // /webapp/contents/list.jsp

    RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
    mav.addObject("restcategrpVO", restcategrpVO);

    mav.setViewName("/restrnts/list"); // 카테고리 그룹별 목록

    return mav;
  }
  
  /**
   * 한건 삭제폼
   * @param categrpno
   * @param contentsno
   * @return
   */
  // http://localhost:9090/ojt/contents/delete.do?categrpno=1&contentsno=1
  @RequestMapping(value = "/restrnts/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int rcateno, int restno) {
    ModelAndView mav = new ModelAndView();

    RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
    mav.addObject("restcategrpVO", restcategrpVO);

    RestrntsVO restrntsVO = restrntsProc.read(restno);
    mav.addObject("restrntsVO", restrntsVO);
    
    mav.setViewName("/contents/delete"); // /webapp/contents/delete.jsp

    return mav;
  }
  
  /**
   * 한건 삭제 처리
   * @param ra
   * @param categrpno
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/contents/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session,
                                           RedirectAttributes ra,
                                            int categrpno,
                                            int contentsno) {
    ModelAndView mav = new ModelAndView();

    int memberno = (Integer)session.getAttribute("memberno");
 /*   // 현재 로그인한 사용자와 글 등록자가 같은지 검사
    if (memberno == contentsProc.read(contentsno).getMemberno()) {
      int count = contentsProc.delete(contentsno);
      if (count == 1) {
        categrpProc.decreaseCnt(categrpno);
      }

      ra.addAttribute("count", count);*/
      ra.addAttribute("categrpno", categrpno);
      ra.addAttribute("contentsno", contentsno);
      
      mav.setViewName("redirect:/contents/delete_msg.jsp");
   /* } else {
      ra.addAttribute("categrpno", categrpno);
      mav.setViewName("redirect:/contents/auth_fail_msg.jsp");
    }*/

    return mav;
  }
 
  /**
   * 조회 http://localhost:9090/ojt/restrnts/read.do?restno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/restrnts/read.do", method = RequestMethod.GET)
  public ModelAndView read(int restno) {
    ModelAndView mav = new ModelAndView();
    
    RestrntsVO restrntsVO = restrntsProc.read(restno);
    mav.addObject("restrntsVO", restrntsVO);
    
    RestCategrpVO restcategrpVO = restcategrpProc.read(restrntsVO.getRestno());
    mav.addObject("restcategrpVO", restcategrpVO);
    
    mav.setViewName("/restrnts/read");

    return mav;
  }
  
 /*//수정폼 + 조회
 @RequestMapping(value="/rest_categrp/update.do", method=RequestMethod.GET)
 public ModelAndView update(int rcateno) {
   ModelAndView mav = new ModelAndView();
   
   RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
   
   mav.addObject("restcategrpVO", restcategrpVO);
   mav.setViewName("/rest_categrp/update"); // /webapp/categrp/update.jsp

   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
       
   return mav;
 }

 // 수정 처리
 @RequestMapping(value="/rest_categrp/update.do", method=RequestMethod.POST)
 public ModelAndView update(RestCategrpVO restcategrpVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = restcategrpProc.update(restcategrpVO);
   String url = "redirect:/rest_categrp/update_msg.jsp?count=" + count +
                     "&rcateno=" + restcategrpVO.getRcateno();
  
   mav.setViewName(url);
                              
   return mav;
 }*/
 

}
  
 

