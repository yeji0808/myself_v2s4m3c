package dev.mvc.s_write;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.atcfile.AtcfileProcInter;
import dev.mvc.atcfile.AtcfileVO;
import dev.mvc.somoim.SomoimProcInter;
import dev.mvc.somoim.SomoimVO;

@Controller
public class WriteCont {
  @Autowired
  @Qualifier("dev.mvc.s_write.WriteProc")
  private WriteProcInter writeProc;

  @Autowired
  @Qualifier("dev.mvc.somoim.SomoimProc")
  private SomoimProcInter somoimProc;
  
  @Autowired
  @Qualifier("dev.mvc.atcfile.AtcfileProc") // 이름 지정
  private AtcfileProcInter atcfileProc;

  public WriteCont() {
    System.out.println("--> WriteCont created.");
  }

  /**
   * 글 등록
   * 
   * @param somoimno
   * @return
   */
  // http://localhost:9090/team1/s_write/create.do?somoimno=1&memberno=1
  @RequestMapping(value = "/s_write/create.do", method = RequestMethod.GET)
  public ModelAndView create(int somoimno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    mav.setViewName("/s_write/create"); // /webapp/write/create.jsp

    return mav;
  }

  /**
   * 글 등록 처리
   * 
   * @param ra
   * @param writeVO
   * @return
   */
  @RequestMapping(value = "/s_write/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, WriteVO writeVO) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.create(writeVO);

    /*
     * if (count == 1) { somoimProc.increaseCnt(writeVO.getSomoimno()); // 카테고리 글수
     * 증가 }
     */

    ra.addAttribute("count", count); // redirect parameter 적용
    ra.addAttribute("somoimno", writeVO.getSomoimno());
    /* redirectAttributes.addAttribute("somoimno", writeVO.getSomoimno()); */

    mav.setViewName("redirect:/s_write/create_msg.jsp");

    return mav;
  }

  /**
   * 전체 목록
   * 
   * @return
   */
  @RequestMapping(value = "/s_write/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_somoimno(int somoimno) {
    ModelAndView mav = new ModelAndView();

    List<WriteVO> list = writeProc.list_by_somoimno(somoimno);
    mav.addObject("list", list);
    mav.setViewName("/s_write/list_all"); // /webapp/write/list_all.jsp

    return mav;
  }

  @RequestMapping(value = "/s_write/read.do", method = RequestMethod.GET)
  public ModelAndView read(int writeno) {
    ModelAndView mav = new ModelAndView();

    WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    SomoimVO somoimVO = somoimProc.read(writeVO.getSomoimno());
    mav.addObject("somoimVO", somoimVO);
    
    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    mav.addObject("atcfile_list", atcfile_list);
    
    mav.setViewName("/s_write/read");

    return mav;
  }

//http://localhost:9090/team1/s_write/update.do?memberno=1&somoimno=1
  @RequestMapping(value = "/s_write/update.do", method = RequestMethod.GET)
  public ModelAndView update(int somoimno, int writeno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    mav.setViewName("/s_write/update"); // /webapp/write/update.jsp

    return mav;
  }

  /**
   * 수정 처리
   * 
   * @param ra
   * @param writeVO
   * @return
   */
  @RequestMapping(value = "/s_write/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, WriteVO writeVO) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.update(writeVO);

    // mav.setViewName("/write/create"); // /webapp/write/create.jsp
    // redirect: form에서 보낸 데이터 모두 삭제됨, 새로고침 중복 등록 방지용.
    ra.addAttribute("count", count);
    ra.addAttribute("somoimno", writeVO.getSomoimno());
    ra.addAttribute("writeno", writeVO.getWriteno());

    mav.setViewName("redirect:/s_write/update_msg.jsp");

    return mav;
  }

  // http://localhost:9090/team1/s_write/delete.do?somoimno=1&writeno=1
  @RequestMapping(value = "/s_write/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int somoimno, int writeno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    
     // FK writeno 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_writeno" int
     int count_by_writeno = atcfileProc.count_by_writeno(writeno);
     mav.addObject("count_by_writeno", count_by_writeno);
     

    mav.setViewName("/write/delete"); // /webapp/write/delete.jsp

    return mav;
  }

  /**
   * 한건 삭제 처리
   * 
   * @param ra
   * @param somoimno
   * @param writeno
   * @return
   */
  @RequestMapping(value = "/s_write/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(HttpSession session, RedirectAttributes ra, int somoimno, int writeno) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.delete(writeno);

    ra.addAttribute("count", count);
    ra.addAttribute("somoimno", somoimno);
    ra.addAttribute("writeno", writeno);

    mav.setViewName("redirect:/s_write/delete_msg.jsp");

    return mav;
  }
  
  /**
   * FK 컬럼값을 이용한 레코드 삭제 처리
   * 
   * @param ra
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/s_write/delete_by_somoimno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_somoimno(RedirectAttributes ra, int somoimno) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.delete_by_somoimno(somoimno);
   
    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("somoimno", somoimno);

    mav.setViewName("redirect:/s_write/delete_by_somoimno_msg.jsp");

    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 폼
   * 
   * @param writeno
   * @return
   */
  @RequestMapping(value = "/s_write/file_delete.do", method = RequestMethod.GET)
  public ModelAndView file_delete(int writeno) {
    ModelAndView mav = new ModelAndView();

    WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    SomoimVO somoimVO = somoimProc.read(writeVO.getSomoimno());
    mav.addObject("somoimVO", somoimVO);

    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    mav.addObject("atcfile_list", atcfile_list);

    mav.setViewName("/s_write/file_delete"); // file_delete.jsp

    return mav;
  }

  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @param writeno
   * @return
   */
  @RequestMapping(value = "/s_write/file_delete_proc.do", method = RequestMethod.GET)
  public ModelAndView file_delete_proc(int writeno, int atcfileno) {
    ModelAndView mav = new ModelAndView();

    WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    SomoimVO somoimVO = somoimProc.read(writeVO.getSomoimno());
    mav.addObject("somoimVO", somoimVO);

    // 1건의 파일 삭제
    atcfileProc.delete(atcfileno);

    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    mav.addObject("atcfile_list", atcfile_list);

    mav.setViewName("/s_write/file_delete"); // file_delete.jsp

    return mav;
  }

}
