package dev.mvc.b_write;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.board.BoardProc;
import dev.mvc.board.BoardProcInter;
import dev.mvc.board.BoardVO;
import dev.mvc.w_attach.W_attachProc;
import dev.mvc.w_attach.W_attachVO;

@Controller 
public class WriteCont {

  @Autowired
  @Qualifier("dev.mvc.b_write.WriteProc") // �̸� ���� 
  private WriteProcInter writeProc;
  @Autowired
  @Qualifier("dev.mvc.board.BoardProc") // �̸� ���� 
  private BoardProc boardProc;
  @Autowired
  @Qualifier("dev.mvc.w_attach.W_attachProc") // �̸� ���� 
  private W_attachProc w_attachProc;
  
  public WriteCont() {
    System.out.println("--> WriteCont created.");
  }
  /**
   * �����
   * @param boardno
   * @return
   */
  // http://localhost:9090/team1/write/create.do
  @RequestMapping(value="/b_write/create.do", method=RequestMethod.GET)
  public ModelAndView create(int boardno) {
    ModelAndView mav = new ModelAndView();
    
    BoardVO boardVO = boardProc.read(boardno); 
    mav.addObject("boardVO", boardVO);

    mav.setViewName("/b_write/create");
    
    
    return mav; 
  }
  /**
   * ��� ó��
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
    boardProc.increaseCnt(writeVO.getBoardno());
    wno = writeVO.getWno();
    System.out.println("wno = " + wno);
    ra.addAttribute("count", count);
    ra.addAttribute("wno",wno);
    ra.addAttribute("boardno", writeVO.getBoardno());
    }
    mav.setViewName("redirect:/b_write/create_msg.jsp");
    
    
    return mav;
  }
  
  /**
   * ���� �׷캰 ���
   * http://localhost:9090/team1/write/list.do?boardno=1
   * http://localhost:9090/team1/write/list.do?boardno=2
   * http://localhost:9090/team1/write/list.do?boardno=3
   * 
   * @param boardno
   * @return
   */
  @RequestMapping(value = "/b_write/list.do", method = RequestMethod.GET)
  public ModelAndView list(int boardno) {
    ModelAndView mav = new ModelAndView();

    List<WriteVO> list = writeProc.list(boardno);
    mav.addObject("list", list);
    // /webapp/contents/list.jsp 

    BoardVO boardVO = boardProc.read(boardno);
    mav.addObject("boardVO", boardVO);

    mav.setViewName("/b_write/list"); // ī�װ� �׷캰 ���

    return mav;
  }
  
  /**
   * ��ȸ http://localhost:9090/ojt/contents/read.do?contentsno=1
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/b_write/read.do", method = RequestMethod.GET)
  public ModelAndView read(int wno) {
    ModelAndView mav = new ModelAndView();

    
    WriteVO writeVO = writeProc.read(wno);
    mav.addObject("writeVO", writeVO);

    BoardVO boardVO = boardProc.read(writeVO.getBoardno());
    mav.addObject("boardVO", boardVO);
    
    List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
    mav.addObject("w_attach_list", w_attach_list);
    
    mav.setViewName("/b_write/read");

    return mav;
  }
  
  @RequestMapping(value = "/b_write/update.do", method = RequestMethod.GET)
  public ModelAndView update(int boardno, int wno) {
    ModelAndView mav = new ModelAndView();

    BoardVO boardVO = boardProc.read(boardno);
    mav.addObject("boardVO", boardVO);

    WriteVO writeVO = writeProc.read(wno);
    mav.addObject("writeVO", writeVO);

    mav.setViewName("/b_write/update"); // /webapp/contents/update.jsp

    return mav;
  }

  /**
   * ���� ó��
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
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
    ra.addAttribute("count", count);
    ra.addAttribute("boardno", writeVO.getBoardno());
    ra.addAttribute("memberno", writeVO.getMemberno());
    ra.addAttribute("wno", writeVO.getWno());
    
    mav.setViewName("redirect:/b_write/update_msg.jsp");

    return mav;
  }

  /** ���� �� */
  //http://localhost:9090/ojt/write/delete.do?boardno=1&wno=1
 @RequestMapping(value = "/b_write/delete.do", 
                            method = RequestMethod.GET)
 public ModelAndView delete(int boardno, int wno) {
   ModelAndView mav = new ModelAndView();

   BoardVO boardVO = boardProc.read(boardno);
   mav.addObject("boardVO", boardVO);

   WriteVO writeVO = writeProc.read(wno);
   mav.addObject("writeVO", writeVO);
   
   /*// FK wno �÷� ���� ���� ���ڵ� ���� ����: id="count_by_contentsno" 
   int count_by_contentsno = attachfileProc.count_by_contentsno(contentsno);
   mav.addObject("count_by_contentsno", count_by_contentsno);*/
   
   
   
   mav.setViewName("/b_write/delete"); // /webapp/contents/delete.jsp

   return mav;
 }
 
 /**
  * �Ѱ� ���� ó��
  * @param ra
  * @param categrpno
  * @param contentsno
  * @return
  */
 @RequestMapping(value = "/b_write/delete.do", 
                            method = RequestMethod.POST)
 public ModelAndView delete(RedirectAttributes ra,
                                      int boardno, int wno) {
   ModelAndView mav = new ModelAndView();
 
   int count = writeProc.delete(wno);
   
   if(count==1) {
     boardProc.decreaseCnt(boardno);
   }
   ra.addAttribute("count", count);
   ra.addAttribute("boardno", boardno);
   ra.addAttribute("wno", wno);
   
   mav.setViewName("redirect:/b_write/delete_msg.jsp");

   return mav;
 }
 
 /**
  * FK �÷����� �̿��� ���ڵ� ���� ó��
  * @param ra
  * @param boardno
  * @return
  */
 @RequestMapping(value = "/b_write/delete_by_boardno.do", 
                            method = RequestMethod.POST)
 public ModelAndView delete_by_boardno(RedirectAttributes ra,
                                           int boardno) {
   ModelAndView mav = new ModelAndView();
   
   int count = writeProc.delete_by_boardno(boardno);
   if (count > 0) { // FK �÷� ���� ���� ���������� �����Ǿ��ٸ� cnt �÷� 0���κ���
     boardProc.cnt_zero(boardno);
   }
   System.out.println("coutn --" + count);
   ra.addAttribute("count", count); // ������ ���ڵ� ����
   ra.addAttribute("boardno", boardno);
   
   mav.setViewName("redirect:/b_write/delete_by_boardno_msg.jsp");

   return mav;
 }
 
 /**
  * ÷�� ���� 1�� ���� ��
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

   BoardVO boardVO = boardProc.read(writeVO.getBoardno());
   mav.addObject("boardVO", boardVO);
   
   List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
   mav.addObject("w_attach_list", w_attach_list);
   
   mav.setViewName("/b_write/file_delete"); // file_delete.jsp

   return mav;
 }
 /**
  * ÷�� ���� 1�� ���� ó��
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

   BoardVO boardVO = boardProc.read(writeVO.getBoardno());
   mav.addObject("boardVO", boardVO);

   // 1���� ���� ����
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
   System.out.println("increase_recomȣ���");
   
   int count = writeProc.increase_recom(wno);
   WriteVO writeVO = writeProc.read(wno);
   int wrecom = writeVO.getWrecom();
   JSONObject obj = new JSONObject();
   obj.put("wrecom", wrecom);
   obj.put("count", count);
   
   return obj.toString();
   
 }

 
}
