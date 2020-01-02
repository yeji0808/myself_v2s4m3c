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
  @Qualifier("dev.mvc.somoim.SomoimProc") // �̸� ����
  private SomoimProcInter somoimProc;

  @Autowired
  @Qualifier("dev.mvc.s_write.WriteProc") // �̸� ����
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

  // ��� ó��
  @RequestMapping(value = "/somoim/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra, HttpServletRequest request, SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0; // ���� ������
    String thumb = ""; // Preview �̹���

    String upDir = Tool.getRealPath(request, "/somoim/storage");
    // ���� ������ ����� fnameMF ��ü�� ������
    MultipartFile fnameMF = somoimVO.getFnameMF();
    fsize = fnameMF.getSize(); // ���� ũ��

    if (fsize > 0) { // ���� ũ�� üũ
      fname = fnameMF.getOriginalFilename(); // ���� ���ϸ�
      fupname = Upload.saveFileSpring(fnameMF, upDir); // ���� ����

      if (Tool.isImage(fname)) { // �̹������� �˻�
        thumb = Tool.preview(upDir, fupname, 480, 300); // thumb �̹��� ����
      }
    }
    somoimVO.setFname(fname);
    somoimVO.setFupname(fupname);
    somoimVO.setThumb(thumb);
    somoimVO.setFsize(fsize);
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------

    int count = somoimProc.create(somoimVO);

    ra.addAttribute("count", count); 
    mav.setViewName("redirect:/somoim/create_msg.jsp?count=" + count);

    return mav;
  }

  // ���
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
   * ��ȸ http://localhost:9090/ojt/somoim/read.do?somoimno=1
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

  //������ + ��ȸ
  @RequestMapping(value = "/somoim/update.do", method = RequestMethod.GET)
  public ModelAndView update(int somoimno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);

    mav.addObject("somoimVO", somoimVO);
    mav.setViewName("/somoim/update"); // /webapp/somoim/update.jsp

    return mav;
  }

  // ���� ó��
  @RequestMapping(value = "/somoim/update.do", method = RequestMethod.POST)
  public ModelAndView update(SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();

    int count = somoimProc.update(somoimVO);
    String url = "redirect:/somoim/update_msg.jsp?count=" + count + "&somoimno=" + somoimVO.getSomoimno();
    mav.setViewName(url);

    return mav;
  }
  
  /**
   * �����̹��� ���� ��
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
   * �����̹��� ����ó��
   * @param somoimVO
   * @return
   */
  @RequestMapping(value = "/somoim/update_image.do", method = RequestMethod.POST)
  public ModelAndView update_image(RedirectAttributes ra, HttpServletRequest request, SomoimVO somoimVO) {
    ModelAndView mav = new ModelAndView();
    
    // -----------------------------------------------------
    // ���� ����
    // -----------------------------------------------------
    String upDir = Tool.getRealPath(request, "/somoim/storage");
    SomoimVO somoimVO_file = somoimProc.read(somoimVO.getSomoimno());
    Tool.deleteFile(upDir + somoimVO_file.getFupname());    
    Tool.deleteFile(upDir + somoimVO_file.getThumb());    
    // -----------------------------------------------------
    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0; // ���� ������
    String thumb = ""; // Preview �̹���

    // ���� ������ ����� fnameMF ��ü�� ������
    MultipartFile fnameMF = somoimVO.getFnameMF();
    fsize = fnameMF.getSize(); // ���� ũ��

    if (fsize > 0) { // ���� ũ�� üũ
      fname = fnameMF.getOriginalFilename(); // ���� ���ϸ�
      fupname = Upload.saveFileSpring(fnameMF, upDir); // ���� ����

      if (Tool.isImage(fname)) { // �̹������� �˻�
        thumb = Tool.preview(upDir, fupname, 480, 300); // thumb �̹��� ����
      }
    }
    somoimVO.setFname(fname);
    somoimVO.setFupname(fupname);
    somoimVO.setThumb(thumb);
    somoimVO.setFsize(fsize);
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------

    int count = somoimProc.update_image(somoimVO);
    ra.addAttribute("count", count); 
    String url = "redirect:/somoim/update_image_msg.jsp?count=" + count + "&somoimno=" + somoimVO.getSomoimno();
    mav.setViewName(url);

    return mav;
  }

  // ������
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

  // ���� ó��
  @RequestMapping(value = "/somoim/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(int somoimno) {
    ModelAndView mav = new ModelAndView();

    int count = somoimProc.delete(somoimno);
    String url = "redirect:/somoim/delete_msg.jsp?count=" + count + "&somoimno=" + somoimno;
    mav.setViewName(url);

    return mav;
  }

}
