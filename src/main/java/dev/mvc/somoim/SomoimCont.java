package dev.mvc.somoim;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.s_write.WriteProcInter;
import dev.mvc.s_write.WriteVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class SomoimCont {
  @Autowired
  @Qualifier("dev.mvc.somoim.SomoimProc") // 이름 지정
  private SomoimProcInter somoimProc;

  @Autowired
  @Qualifier("dev.mvc.s_write.WriteProc") // 이름 지정
  private WriteProcInter writeProc;

  public SomoimCont() {
    System.out.println("--> SomoimCont created.");
  }

  // http://localhost:9090/team1/somoim/create.do
  @RequestMapping(value = "/somoim/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/somoim/create"); // /webapp/somoim/create.jsp

    return mav;
  }

  // 등록 처리
  @RequestMapping(value = "/somoim/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, HttpServletRequest request, SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0; // 파일 사이즈
    String thumb = ""; // Preview 이미지

    String upDir = Tool.getRealPath(request, "/somoim/storage");
    // 전송 파일이 없어서도 fnameMF 객체가 생성됨
    MultipartFile fnameMF = somoimVO.getFnameMF();
    fsize = fnameMF.getSize(); // 파일 크기

    if (fsize > 0) { // 파일 크기 체크
      fname = fnameMF.getOriginalFilename(); // 원본 파일명
      fupname = Upload.saveFileSpring(fnameMF, upDir); // 파일 저장

      if (Tool.isImage(fname)) { // 이미지인지 검사
        thumb = Tool.preview(upDir, fupname, 480, 300); // thumb 이미지 생성
      }
    }
    somoimVO.setFname(fname);
    somoimVO.setFupname(fupname);
    somoimVO.setThumb(thumb);
    somoimVO.setFsize(fsize);
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------

    int count = somoimProc.create(somoimVO);

    ra.addAttribute("count", count); 
    mav.setViewName("redirect:/somoim/create_msg.jsp?count=" + count);

    return mav;
  }

  // 목록
  @RequestMapping(value = "/somoim/list.do", method = RequestMethod.GET)
  public ModelAndView list_somoimno_asc() {
    ModelAndView mav = new ModelAndView();

    List<SomoimVO> list = somoimProc.list_somoimno_asc();

    mav.addObject("list", list);
    mav.setViewName("/somoim/list"); // /webapp/categrp/list.jsp

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);

    return mav;
  }

  /**
   * 조회 http://localhost:9090/ojt/somoim/read.do?somoimno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/somoim/read.do", method = RequestMethod.GET)
  public ModelAndView read(int somoimno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    List<WriteVO> list = writeProc.list_by_somoimno(somoimno);
    mav.addObject("list", list);

    mav.setViewName("/somoim/read");

    return mav;
  }

  //수정폼 + 조회
  @RequestMapping(value = "/somoim/update.do", method = RequestMethod.GET)
  public ModelAndView update(int somoimno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);

    mav.addObject("somoimVO", somoimVO);
    mav.setViewName("/somoim/update"); // /webapp/somoim/update.jsp

    return mav;
  }

  // 수정 처리
  @RequestMapping(value = "/somoim/update.do", method = RequestMethod.POST)
  public ModelAndView update(SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();

    int count = somoimProc.update(somoimVO);
    String url = "redirect:/somoim/update_msg.jsp?count=" + count + "&somoimno=" + somoimVO.getSomoimno();
    mav.setViewName(url);

    return mav;
  }
  
  /**
   * 메인이미지 수정 폼
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/somoim/update_image.do", method = RequestMethod.GET)
  public ModelAndView update_image(int somoimno) {
    ModelAndView mav = new ModelAndView();
    
    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);
    mav.setViewName("/somoim/update_image"); // /webapp/somoim/update.jsp
    
    return mav;
  }
  
  /**
   * 메인이미지 수정처리
   * @param somoimVO
   * @return
   */
  @RequestMapping(value = "/somoim/update_image.do", method = RequestMethod.POST)
  public ModelAndView update_image(RedirectAttributes ra, HttpServletRequest request, SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();
    
    // -----------------------------------------------------
    // 파일 삭제
    // -----------------------------------------------------
    String upDir = Tool.getRealPath(request, "/somoim/storage");
    SomoimVO somoimVO_file = somoimProc.read(somoimVO.getSomoimno());
    Tool.deleteFile(upDir + somoimVO_file.getFupname());    
    Tool.deleteFile(upDir + somoimVO_file.getThumb());    
    // -----------------------------------------------------
    
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0; // 파일 사이즈
    String thumb = ""; // Preview 이미지

    // 전송 파일이 없어서도 fnameMF 객체가 생성됨
    MultipartFile fnameMF = somoimVO.getFnameMF();
    fsize = fnameMF.getSize(); // 파일 크기

    if (fsize > 0) { // 파일 크기 체크
      fname = fnameMF.getOriginalFilename(); // 원본 파일명
      fupname = Upload.saveFileSpring(fnameMF, upDir); // 파일 저장

      if (Tool.isImage(fname)) { // 이미지인지 검사
        thumb = Tool.preview(upDir, fupname, 480, 300); // thumb 이미지 생성
      }
    }
    somoimVO.setFname(fname);
    somoimVO.setFupname(fupname);
    somoimVO.setThumb(thumb);
    somoimVO.setFsize(fsize);
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------

    int count = somoimProc.update_image(somoimVO);
    ra.addAttribute("count", count); 
    String url = "redirect:/somoim/update_image_msg.jsp?count=" + count + "&somoimno=" + somoimVO.getSomoimno();
    mav.setViewName(url);

    return mav;
  }

  // 삭제폼
  @RequestMapping(value = "/somoim/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int somoimno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);

    int count_by_somoimno = writeProc.count_by_somoimno(somoimno);
    mav.addObject("count_by_somoimno", count_by_somoimno);

    mav.addObject("somoimVO", somoimVO);
    mav.setViewName("/somoim/delete"); // /webapp/somoim/delete.jsp

    return mav;
  }

  // 삭제 처리
  @RequestMapping(value = "/somoim/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(int somoimno) {
    ModelAndView mav = new ModelAndView();

    int count = somoimProc.delete(somoimno);
    String url = "redirect:/somoim/delete_msg.jsp?count=" + count + "&somoimno=" + somoimno;
    mav.setViewName(url);

    return mav;
  }

}
