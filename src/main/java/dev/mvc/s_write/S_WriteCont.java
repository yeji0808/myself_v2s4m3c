package dev.mvc.s_write;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import dev.mvc.atcfile.AtcfileProcInter;
import dev.mvc.atcfile.AtcfileVO;
import dev.mvc.s_reply.S_ReplyProcInter;
import dev.mvc.somoim.SomoimProcInter;
import dev.mvc.somoim.SomoimVO;
import nation.web.tool.Tool;

@Controller
public class S_WriteCont {
  @Autowired
  @Qualifier("dev.mvc.s_write.WriteProc")
  private S_WriteProcInter writeProc;

  @Autowired
  @Qualifier("dev.mvc.somoim.SomoimProc")
  private SomoimProcInter somoimProc;
  
  @Autowired
  @Qualifier("dev.mvc.atcfile.AtcfileProc") // �̸� ����
  private AtcfileProcInter atcfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.s_reply.S_ReplyProc") // �̸� ����
  private S_ReplyProcInter s_replyProc;

  public S_WriteCont() {
    System.out.println("--> WriteCont created.");
  }

  /**
   * �� ���
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

    mav.setViewName("/s_write/create"); // /webapp/s_write/create.jsp

    return mav;
  }

  /**
   * �� ��� ó��
   * 
   * @param ra
   * @param writeVO
   * @return
   */
  @RequestMapping(value = "/s_write/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, S_WriteVO writeVO) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.create(writeVO);

    /*
     * if (count == 1) { somoimProc.increaseCnt(writeVO.getSomoimno()); // ī�װ� �ۼ�
     * ���� }
     */

    ra.addAttribute("count", count); // redirect parameter ����
    ra.addAttribute("somoimno", writeVO.getSomoimno());
    /* redirectAttributes.addAttribute("somoimno", writeVO.getSomoimno()); */

    mav.setViewName("redirect:/s_write/create_msg.jsp");

    return mav;
  }

  /**
   * ��ü ���
   * 
   * @return
   */
  /*
  @RequestMapping(value = "/s_write/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_somoimno(int somoimno) {
    ModelAndView mav = new ModelAndView();

    List<S_WriteVO> list = writeProc.list_by_somoimno(somoimno);
    mav.addObject("list", list);
    mav.setViewName("/s_write/list_all"); // /webapp/write/list_all.jsp

    return mav;
  }*/

  @RequestMapping(value = "/s_write/read.do", method = RequestMethod.GET)
  public ModelAndView read(int writeno) {
    ModelAndView mav = new ModelAndView();

    S_WriteVO writeVO = writeProc.read(writeno);
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

    S_WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    mav.setViewName("/s_write/update"); // /webapp/write/update.jsp

    return mav;
  }

  /**
   * ���� ó��
   * 
   * @param ra
   * @param writeVO
   * @return
   */
  @RequestMapping(value = "/s_write/update.do", method = RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, S_WriteVO writeVO) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.update(writeVO);

    // mav.setViewName("/write/create"); // /webapp/write/create.jsp
    // redirect: form���� ���� ������ ��� ������, ���ΰ�ħ �ߺ� ��� ������.
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

    S_WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    
     // FK writeno �÷� ���� ���� ���ڵ� ���� ����: id="count_by_writeno" int
     int count_by_writeno = atcfileProc.count_by_writeno(writeno);
     mav.addObject("count_by_writeno", count_by_writeno);
     

    mav.setViewName("/s_write/delete"); // /webapp/write/delete.jsp

    return mav;
  }

  /**
   * �Ѱ� ���� ó��
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
   * FK �÷����� �̿��� ���ڵ� ���� ó��
   * 
   * @param ra
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/s_write/delete_by_somoimno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_somoimno(RedirectAttributes ra, int somoimno) {
    ModelAndView mav = new ModelAndView();

    int count = writeProc.delete_by_somoimno(somoimno);
   
    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("somoimno", somoimno);

    mav.setViewName("redirect:/s_write/delete_by_somoimno_msg.jsp");

    return mav;
  }
  
  /**
   * ÷�� ���� 1�� ���� ��
   * 
   * @param writeno
   * @return
   */
  @RequestMapping(value = "/s_write/file_delete.do", method = RequestMethod.GET)
  public ModelAndView file_delete(int writeno) {
    ModelAndView mav = new ModelAndView();

    S_WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    SomoimVO somoimVO = somoimProc.read(writeVO.getSomoimno());
    mav.addObject("somoimVO", somoimVO);

    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    mav.addObject("atcfile_list", atcfile_list);

    mav.setViewName("/s_write/file_delete"); // file_delete.jsp

    return mav;
  }

  /**
   * ÷�� ���� 1�� ���� ó��
   * 
   * @param writeno
   * @return
   */
  @RequestMapping(value = "/s_write/file_delete_proc.do", method = RequestMethod.GET)
  public ModelAndView file_delete_proc(HttpServletRequest request, int writeno, int atcfileno) {
    ModelAndView mav = new ModelAndView();

    S_WriteVO writeVO = writeProc.read(writeno);
    mav.addObject("writeVO", writeVO);

    SomoimVO somoimVO = somoimProc.read(writeVO.getSomoimno());
    mav.addObject("somoimVO", somoimVO);
    
    // -----------------------------------------------------
    // ���� ����
    // -----------------------------------------------------
    String upDir = Tool.getRealPath(request, "/atcfile/storage");
    AtcfileVO atcfileVO_file = atcfileProc.read(atcfileno);
    Tool.deleteFile(upDir + atcfileVO_file.getFupname());    
    Tool.deleteFile(upDir + atcfileVO_file.getThumb());    

    // 1���� ���� ����
    atcfileProc.delete(atcfileno);

    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    mav.addObject("atcfile_list", atcfile_list);

    mav.setViewName("/s_write/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * ��� ������
   * http://localhost:9090/ojt/write/reply_delete.do?replyno=1&passwd=1
   * @param replyno
   * @param passwd
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/s_write/s_reply_delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String reply_delete(int replyno, String passwd) {
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("replyno", replyno);
    map.put("passwd", passwd);
  
        
    int count = s_replyProc.checkPasswd(map);
    int delete_count = 0;
    
    // �н����� ��ġ ����
    if (count == 1) {
      delete_count = s_replyProc.delete(replyno);
    } 
    
    JSONObject obj = new JSONObject();
    obj.put("count", count);
    obj.put("delete_count", delete_count);
    
    return obj.toString();
  }
  
  /**
   * ��� + �˻� + ����¡ ����
   * http://localhost:9090/ojt/s_write/list.do
   * http://localhost:9090/ojt/s_write/list.do?somoimno=1&word=������&nowPage=1
   * @param somoimno
   * @param word
   * @param nowPage
   * @return
   */
  @RequestMapping(value = "/s_write/list.do", 
                                       method = RequestMethod.GET)
  public ModelAndView list_by_somoimno_search_paging(
      @RequestParam(value="somoimno", defaultValue="1") int somoimno,
      @RequestParam(value="word", defaultValue="") String word,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage
      ) { 
    System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    // /write/list_by_somoimno_search_paging.jsp
    mav.setViewName("/s_write/list_by_somoimno_search_paging");   
    
    // ���ڿ� ���ڿ� Ÿ���� �����ؾ������� Obejct ���
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("somoimno", somoimno); // #{somoimno}
    map.put("word", word);     // #{word}
    map.put("nowPage", nowPage);       
    
    // �˻� ���
    List<S_WriteVO> list = writeProc.list_by_somoimno_search_paging(map);
    mav.addObject("list", list);
    
    // �˻��� ���ڵ� ����
    int search_count = writeProc.search_count(map);
    mav.addObject("search_count", search_count);
  
    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    /*
     * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
     * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
     * 
     * @param listFile ��� ���ϸ� 
     * @param somoimno ī�װ���ȣ 
     * @param search_count �˻�(��ü) ���ڵ�� 
     * @param nowPage     ���� ������
     * @param word �˻���
     * @return ����¡ ���� ���ڿ�
     */ 
    String paging = writeProc.pagingBox("list.do", somoimno, search_count, nowPage, word);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }  

}
