package dev.mvc.rattachfile;


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

import dev.mvc.rest_categrp.RestCategrpProcInter;
import dev.mvc.rest_categrp.RestCategrpVO;
import dev.mvc.restrnts.RestrntsProcInter;
import dev.mvc.restrnts.RestrntsVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class RattachfileCont {

  @Autowired
  @Qualifier("dev.mvc.rattachfile.RattachfileProc") // �̸� ����
  private RattachfileProcInter rattachfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.restrnts.RestrntsProc") // �̸� ����
  private RestrntsProcInter restrntsProc;
  
  public RattachfileCont(){
    System.out.println("--> RattachfileCont created.");
  }
 
  
  @RequestMapping(value = "/rattachfile/create_ratf.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           RattachfileVO rattachfileVO,
                                           int rcateno, int restno) {
    
    ModelAndView mav = new ModelAndView();
    int cnt = 0;
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
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
    if(upload_count > 0) {
      cnt = 1;
    }
    ra.addAttribute("cnt", cnt);
    ra.addAttribute("restno", restno);
    mav.setViewName("redirect:/rattachfile/create_msg.jsp");
    return mav;
  }
  
}




