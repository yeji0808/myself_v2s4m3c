package dev.mvc.rattachfile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

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
public class RattachfileCont {
  @Autowired
  @Qualifier("dev.mvc.rest_categrp.RestCategrpProc") // �̸� ����
  private RestCategrpProcInter restcategrpProc;

  @Autowired
  @Qualifier("dev.mvc.rattachfile.RattachfileProc") // �̸� ����
  private RattachfileProcInter rattachfileProc;
  
  public RattachfileCont(){
    System.out.println("--> RattachfileCont created.");
  }
  
  /**
   * ���� �����
   * @param categrpno ī�װ� �׷� FK
   * @param contentsno ������ ��ȣ FK
   * @return
   */
  // http://localhost:9090/ojt/rattachfile/create.do?rcateno=1&restno=1
  @RequestMapping(value = "/rattachfile/create.do", method = RequestMethod.GET)
  public ModelAndView create(int rcateno, int restno) {
    ModelAndView mav = new ModelAndView();

    RestCategrpVO restcategrpVO = restcategrpProc.read(rcateno);
    mav.addObject("restcategrpVO", restcategrpVO);

    mav.setViewName("/rattachfile/create"); // /webapp/rattachfile/create.jsp

    return mav;
  }
  
  @RequestMapping(value = "/rattachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           RattachfileVO rattachfileVO,
                                           int rcateno) {
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int restno = rattachfileVO.getRestno(); // �θ�� ��ȣ
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/rattachfile/storage");
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = rattachfileVO.getFnamesMF();
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        fsize = multipartFile.getSize();  // ���� ũ��
        if (fsize > 0) { // ���� ũ�� üũ
          fname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          fupname = Upload.saveFileSpring(multipartFile, upDir); // ���� ����
          
          if (Tool.isImage(fname)) { // �̹������� �˻�
            thumb = Tool.preview(upDir, fupname, 120, 80); // thumb �̹��� ����
          }
        }
        RattachfileVO vo = new RattachfileVO();
        vo.setRestno(restno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + rattachfileProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("rcateno", rcateno);
    ra.addAttribute("restno", rattachfileVO.getRestno());
    
    mav.setViewName("redirect:/rattachfile/create_msg.jsp");
    return mav;
  }
  
}




