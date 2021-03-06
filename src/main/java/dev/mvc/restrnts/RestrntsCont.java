package dev.mvc.restrnts;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.m_rec.M_recProcInter;
import dev.mvc.m_rec.M_recVO;
import dev.mvc.menu.MenuProcInter;
import dev.mvc.menu.MenuVO;
import dev.mvc.rattachfile.RattachfileProcInter;
import dev.mvc.rattachfile.RattachfileVO;
import dev.mvc.rec.RecVO;
import dev.mvc.rest_categrp.RestCategrpProcInter;
import dev.mvc.rest_categrp.RestCategrpVO;
import dev.mvc.review.ReviewProcInter;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class RestrntsCont {
  @Autowired
  @Qualifier("dev.mvc.m_rec.M_recProc") // 이름 지정
  private M_recProcInter m_recProc;
  
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc") // 이름 지정
  private ReviewProcInter reviewProc;
  
  @Autowired
  @Qualifier("dev.mvc.rest_categrp.RestCategrpProc") // 이름 지정
  private RestCategrpProcInter restcategrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.rattachfile.RattachfileProc") // 이름 지정
  private RattachfileProcInter rattachfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.menu.MenuProc") // 이름 지정
  private MenuProcInter menuProc;
  
  @Autowired
  @Qualifier("dev.mvc.restrnts.RestrntsProc") // 이름 지정
  private RestrntsProcInter restrntsProc;
  
  public RestrntsCont() {
    System.out.println("--> RestrntsCont created.");
  }
  
  // 등록 폼
  // http://localhost:9090/team/restrnts/create.do
  @RequestMapping(value="/restrnts/create_info.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
    List<RestCategrpVO> list = restcategrpProc.list_categrpno_asc();
    mav.addObject("list", list);
    
    mav.setViewName("/restrnts/create"); // /webapp/rest_categrp/create.jsp
    
    return mav;
  }
  
  // 등록 처리
  @RequestMapping(value = "/restrnts/create_info.do", method = RequestMethod.POST)
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
        thumb = Tool.preview(upDir, fupname, 222, 350); // thumb 이미지 생성
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
      int restno = restrntsProc.lastnum();

      restrntsVO.setRestno(restno);
      
      if(count == 1) {
        restcategrpProc.increaseCnt(restrntsVO.getRcateno());
        mav.setViewName("redirect:/menu/create.jsp?restno="+restno+"&rcateno="+restrntsVO.getRcateno());
      }
      
      
    return mav; 
  }
 
  // 전체 목록 (지도 출력)
  // http://localhost:9090/team/rest_map/map.do
  @RequestMapping(value="/rest_map/map.do", method=RequestMethod.GET)
  public ModelAndView list_map() {
    ModelAndView mav = new ModelAndView();
    
    List<RestrntsVO> list = restrntsProc.list_map();   
    mav.addObject("list", list);
    
    mav.setViewName("/rest_map/map"); //
        
    return mav;
  }
  
  // 카테고리 그룹별 목록
  @RequestMapping(value = "/restrnts/list_cate.do", method = RequestMethod.GET)
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
  
  //한건 삭제폼
  @RequestMapping(value = "/restrnts/delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView delete(int rcateno, int restno) {
    ModelAndView mav = new ModelAndView();

    RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
    mav.addObject("restcategrpVO", restcategrpVO);

    RestrntsVO restrntsVO = restrntsProc.read(restno);
    mav.addObject("restrntsVO", restrntsVO);
    
    int count_by_restno = rattachfileProc.count_by_restno(restno);
    mav.addObject("count_by_restno", count_by_restno);
    
    mav.setViewName("/restrnts/delete"); // /webapp/contents/delete.jsp

    return mav;
  }
  
  // 한건 삭제 처리
  @RequestMapping(value = "/restrnts/delete.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session,
                                           RedirectAttributes ra,
                                            int rcateno,
                                            int restno) {
    ModelAndView mav = new ModelAndView();

   // int memberno = (Integer)session.getAttribute("memberno");
 /*   // 현재 로그인한 사용자와 글 등록자가 같은지 검사
    if (memberno == contentsProc.read(contentsno).getMemberno()) {
    */
      int count = restrntsProc.delete(restno);
      if (count == 1) {
        restcategrpProc.decreaseCnt(rcateno);
      }

      ra.addAttribute("count", count);
      ra.addAttribute("rcateno", rcateno);
      ra.addAttribute("restno", restno);
      
      mav.setViewName("redirect:/restrnts/delete_msg.jsp");
   /* } else {
      ra.addAttribute("categrpno", categrpno);
      mav.setViewName("redirect:/contents/auth_fail_msg.jsp");
    }*/

    return mav;
  }
 
  // 조회 http://localhost:9090/team/restrnts/read.do?restno=1
  @RequestMapping(value = "/restrnts/read_login.do", method = RequestMethod.GET)
  public ModelAndView read_login(int restno, int memberno) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("restno", restno);
    map.put("memberno", memberno);
    
    int check_cnt = m_recProc.checkRecom(map); //추천이력 확인
    if(check_cnt > 0) {
    M_recVO m_recVO = m_recProc.read(map);
    mav.addObject("m_recVO", m_recVO);
    }
    
    RestrntsVO restrntsVO = restrntsProc.read(restno);
    mav.addObject("restrntsVO", restrntsVO);

    RestCategrpVO restcategrpVO = restcategrpProc.read(restrntsVO.getRcateno());
    mav.addObject("restcategrpVO", restcategrpVO);
    
    List<RattachfileVO> attachfile_list = rattachfileProc.list_by_restno(restno);
    mav.addObject("attachfile_list", attachfile_list);
    
    List<MenuVO> menu_list = menuProc.read(restno);
    mav.addObject("menu_list", menu_list);
    
    restrntsProc.increaseCnt(restno);
    mav.setViewName("/restrnts/read");

    return mav;
  }
 
  //조회 (로그인없이)
  @RequestMapping(value = "/restrnts/read.do", method = RequestMethod.GET)
  public ModelAndView read(int restno) {
    ModelAndView mav = new ModelAndView();

    RestrntsVO restrntsVO = restrntsProc.read(restno);
    mav.addObject("restrntsVO", restrntsVO);

    RestCategrpVO restcategrpVO = restcategrpProc.read(restrntsVO.getRcateno());
    mav.addObject("restcategrpVO", restcategrpVO);
    
    List<RattachfileVO> attachfile_list = rattachfileProc.list_by_restno(restno);
    mav.addObject("attachfile_list", attachfile_list);
    
    List<MenuVO> menu_list = menuProc.read(restno);
    mav.addObject("menu_list", menu_list);
    
    restrntsProc.increaseCnt(restno);
    mav.setViewName("/restrnts/read");

    return mav;
  }
  
  //글 수정
 @RequestMapping(value = "/restrnts/update_info.do", method = RequestMethod.GET)
 public ModelAndView update(int rcateno, int restno) {
   ModelAndView mav = new ModelAndView();

   RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
   mav.addObject("restcategrpVO", restcategrpVO);
   
   RestrntsVO restrntsVO = restrntsProc.read(restno);
   mav.addObject("restrntsVO", restrntsVO);
   
   mav.setViewName("/restrnts/update"); // /webapp/contents/update.jsp

   return mav;
 }

 //글 수정 처리
 @RequestMapping(value = "/restrnts/update_info.do", method = RequestMethod.POST)
 public ModelAndView update(RedirectAttributes ra, HttpServletRequest request, RestrntsVO restrntsVO) {
   ModelAndView mav = new ModelAndView();
   
       int count = restrntsProc.update(restrntsVO);

       ra.addAttribute("rcateno", restrntsVO.getRcateno());
       ra.addAttribute("restno", restrntsVO.getRestno());
       
       List<MenuVO> menuVO = menuProc.read(restrntsVO.getRestno());
       
       for(int i = 0 ; i < menuVO.size() ; i++) {
         ra.addAttribute("mname", ((MenuVO) menuVO).getMname());
         ra.addAttribute("mprice", ((MenuVO) menuVO).getMprice());
       }
       
       if(count ==1) {
       mav.setViewName("redirect:/menu/update.jsp");
       }

       return mav;

 }
 
 //대표사진 수정폼
 @RequestMapping(value="/restrnts/update_img.do", method=RequestMethod.GET)
 public ModelAndView update(int restno) {
   ModelAndView mav = new ModelAndView();
   
   RestrntsVO restrntsVO = restrntsProc.read(restno);
   mav.addObject("restrntsVO", restrntsVO);
   
   mav.setViewName("/restrnts/update_img"); // /webapp/contents/update.jsp
   

   return mav;
 }

 //대표사진 수정처리
 @RequestMapping(value = "/restrnts/update_img.do", method = RequestMethod.POST)
 public ModelAndView update_image(RedirectAttributes ra, HttpServletRequest request, RestrntsVO restrntsVO) {
   ModelAndView mav = new ModelAndView();
   
   // -----------------------------------------------------
   // 파일 삭제
   // -----------------------------------------------------
   String upDir = Tool.getRealPath(request, "/restrnts/storage");
   RestrntsVO restrntsVO_img = restrntsProc.read(restrntsVO.getRestno());
   Tool.deleteFile(upDir + restrntsVO_img.getFupname());    
   Tool.deleteFile(upDir + restrntsVO_img.getThumb());    
   // -----------------------------------------------------
   
   // -----------------------------------------------------
   // 파일 전송 코드 시작
   // -----------------------------------------------------
   String fname = ""; // 원본 파일명
   String fupname = ""; // 업로드된 파일명
   long fsize = 0; // 파일 사이즈
   String thumb = ""; // Preview 이미지

   // 전송 파일이 없어서도 fnameMF 객체가 생성됨
   MultipartFile fnameMF = restrntsVO.getFnameMF();
   fsize = fnameMF.getSize(); // 파일 크기

   if (fsize > 0) { // 파일 크기 체크
     fname = fnameMF.getOriginalFilename(); // 원본 파일명
     fupname = Upload.saveFileSpring(fnameMF, upDir); // 파일 저장

     if (Tool.isImage(fname)) { // 이미지인지 검사
       thumb = Tool.preview(upDir, fupname, 222, 350); // thumb 이미지 생성
     }
   }
   restrntsVO.setFname(fname);
   restrntsVO.setFupname(fupname);
   restrntsVO.setThumb(thumb);
   restrntsVO.setFsize(fsize);
   // -----------------------------------------------------
   // 파일 전송 코드 종료
   // -----------------------------------------------------

   int count = restrntsProc.update_img(restrntsVO);
   ra.addAttribute("count", count); 
   ra.addAttribute("restno", restrntsVO.getRestno());
   
   mav.setViewName("redirect:/restrnts/update_img_msg.jsp");
   
   return mav;
 }
 
 /**
  * http://localhost:9090/ojt/contents/reply_delete.do?replyno=1&passwd=1234
  * {"delete_count":0,"count":0}
  * {"delete_count":1,"count":1}
  * @param replyno
  * @param passwd
  * @return
  */
 @ResponseBody
 @RequestMapping(value = "/restrnts/review_delete.do", 
                             method = RequestMethod.POST,
                             produces = "text/plain;charset=UTF-8")
 public String review_delete(int reviewno, String passwd) {
   Map<String, Object> map = new HashMap<String, Object>();
   map.put("reviewno", reviewno);
   map.put("passwd", passwd);
   
   int count = reviewProc.checkPasswd(map); // 패스워드 검사
   int delete_count = 0;
   if (count == 1) {
     delete_count = reviewProc.delete(reviewno); // 댓글 삭제
   }
   
   JSONObject obj = new JSONObject();
   obj.put("count", count);
   obj.put("delete_count", delete_count);
   
   return obj.toString();
 }
 
 /**
  * 목록 + 검색 + 페이징 지원
  * @return
  */
 @RequestMapping(value = "/restrnts/list.do", method = RequestMethod.GET)
 public ModelAndView list_by_rcateno_search_paging(
     @RequestParam(value="rcateno", defaultValue="1") int rcateno,
     @RequestParam(value="rword", defaultValue="") String rword,
     @RequestParam(value="nowPage", defaultValue="1") int nowPage
     ) { 
   System.out.println("--> nowPage: " + nowPage);
   
   ModelAndView mav = new ModelAndView();
   // /contents/list_by_categrpno_search_paging.jsp
   mav.setViewName("/restrnts/list_by_rcateno_search_paging");   
   
   // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("rcateno", rcateno); // #{rcateno}
   map.put("rword", rword);     // #{word}
   map.put("nowPage", nowPage);       
   
   // 검색 목록
   List<RestrntsVO> list = restrntsProc.list_by_rcateno_search_paging(map);
   mav.addObject("list", list);
   
   // 검색된 레코드 갯수
   int search_count = restrntsProc.search_count(map);
   mav.addObject("search_count", search_count);
 
   RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
   mav.addObject("restcategrpVO", restcategrpVO);
   
   /*
    * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
    * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
    * 
    * @param listFile 목록 파일명 
    * @param categrpno 카테고리번호 
    * @param search_count 검색(전체) 레코드수 
    * @param nowPage     현재 페이지
    * @param word 검색어
    * @return 페이징 생성 문자열
    */ 
   String paging = restrntsProc.pagingBox("list.do", rcateno, search_count, nowPage, rword);
   mav.addObject("paging", paging);
 
   mav.addObject("nowPage", nowPage);
   
   return mav;
 }    
   
 
}
  
 

