package dev.mvc.somoim;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.s_write.WriteProcInter;
import dev.mvc.s_write.WriteVO;

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
  public ModelAndView create(SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();

    int count = somoimProc.create(somoimVO);

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

  //삭제폼
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
