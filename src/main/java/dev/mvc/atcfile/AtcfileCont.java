package dev.mvc.atcfile;

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

import dev.mvc.atcfile.AtcfileVO;
import dev.mvc.s_write.WriteProcInter;
import dev.mvc.somoim.SomoimVO;
import dev.mvc.somoim.SomoimProcInter;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class AtcfileCont {
  @Autowired
  @Qualifier("dev.mvc.atcfile.AtcfileProc") // �̸� ����
  private AtcfileProcInter atcfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.somoim.SomoimProc") // �̸� ����
  private SomoimProcInter somoimProc;
  
  @Autowired
  @Qualifier("dev.mvc.s_write.WriteProc") // �̸� ����
  private WriteProcInter writeProc;
  
  public AtcfileCont() {
    System.out.println("--> AtcfileCont() created");
  }
  
  /**
   * ���� �����
   * @param somoimno ī�װ� �׷� FK
   * @param writeno ������ ��ȣ FK
   * @return
   */
  // http://localhost:9090/team1/atcfile/create.do?somoimno=1&writeno=1
  @RequestMapping(value = "/atcfile/create.do", method = RequestMethod.GET)
  public ModelAndView create(int somoimno, int writeno) {
    ModelAndView mav = new ModelAndView();

    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    mav.setViewName("/atcfile/create"); // /webapp/atcfile/create.jsp

    return mav;
  }
  
  /**
   * ���� ��� ó��
   * @param ra
   * @param request
   * @param atcfileVO
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/atcfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           AtcfileVO atcfileVO,
                                           int somoimno) {
    // System.out.println("--> somoimno: " + somoimno);
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int writeno = atcfileVO.getWriteno(); // �θ�� ��ȣ
    String fname = ""; // ���� ���ϸ�
    String fupname = ""; // ���ε�� ���ϸ�
    long fsize = 0;  // ���� ������
    String thumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
    
    String upDir = Tool.getRealPath(request, "/atcfile/storage");
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = atcfileVO.getFnamesMF(); 
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
        AtcfileVO vo = new AtcfileVO();
        vo.setWriteno(writeno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + atcfileProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("somoimno", somoimno);
    ra.addAttribute("writeno", atcfileVO.getWriteno());
    
    mav.setViewName("redirect:/atcfile/create_msg.jsp");
    return mav;
  }
  
  /**
   * ���
   * http://localhost:9090/ojt/atcfile/list.do
   * 
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/atcfile/list.do", method = RequestMethod.GET)
  public ModelAndView list(int somoimno) {
    ModelAndView mav = new ModelAndView();

    List<AtcfileVO> list = atcfileProc.list();
    mav.addObject("list", list);
    
    SomoimVO somoimVO = somoimProc.read(somoimno);
    mav.addObject("somoimVO", somoimVO);

    mav.setViewName("/atcfile/list");

    return mav;
  }
  
  /**
   * ZIP ���� �� ���� �ٿ�ε�
   * @param request
   * @param write ���� ����� �����ö� ����� �۹�ȣ
   * @return
   */
  @RequestMapping(value = "/atcfile/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView download(HttpServletRequest request, int writeno) {
    ModelAndView mav = new ModelAndView();
    
    // �۹�ȣ�� �ش��ϴ� ���� ��� ����
    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    
    // ���� ����� ���ϸ� ����
    ArrayList<String> files_array = new ArrayList<String>();
    for(AtcfileVO atcfileVO:atcfile_list) {
      files_array.add(atcfileVO.getFupname());
    }
    
    String dir = "/atcfile/storage";
    String upDir = Tool.getRealPath(request, dir); // ���� ���
    
    // ����� ���ϸ�, ���� ������ �ٿ�ε��� �浹 ó��
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // ���� ������ŭ �迭 ����
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // ���� ��� ����      
    }
 
    byte[] buffer = new byte[4096]; // 4 KB
    
    try {
      ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zip_filename));
      
      for(int index=0; index < zip_src.length; index++) {
        FileInputStream in = new FileInputStream(zip_src[index]);
        
        Path path = Paths.get(zip_src[index]);
        String zip_src_file = path.getFileName().toString();
        // System.out.println("zip_src_file: " + zip_src_file);
        
        ZipEntry zipEntry = new ZipEntry(zip_src_file);
        zipOutputStream.putNextEntry(zipEntry);
        
        int length = 0;
        // 4 KB�� �о buffer �迭�� ������ ���� ����Ʈ���� length�� ����
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // ����� ����, ���뿡���� ���� ��ġ, ����� ����
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " ���� �Ϸ�");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " ������ �����߽��ϴ�.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download ���� ����
    mav.setViewName("redirect:/download?dir=" + dir + "&filename=" + zip);    
    
    return mav;
  }
  
  /**
   * FK �÷����� �̿��� ���ڵ� ���� ó��
   * @param ra
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/atcfile/delete_by_writeno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_writeno(RedirectAttributes ra, int somoimno, int writeno) {
    ModelAndView mav = new ModelAndView();

    int count = atcfileProc.delete_by_writeno(writeno);
    
    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("writeno", writeno);
    ra.addAttribute("somoimno", somoimno);
    
    mav.setViewName("redirect:/atcfile/delete_by_writeno_msg.jsp");

    return mav;
  }
  
  @RequestMapping(value = "/atcfile/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int atcfileno) {
    ModelAndView mav = new ModelAndView();
    
    AtcfileVO atcfileVO = atcfileProc.read(atcfileno);
    mav.addObject("atcfileVO", atcfileVO);
  
    mav.setViewName("/atcfile/delete");
    return mav;
  }
  
  @RequestMapping(value = "/atcfile/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(HttpServletRequest request, int atcfileno) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ����
    // -----------------------------------------------------
    String upDir = Tool.getRealPath(request, "/atcfile/storage");
    AtcfileVO atcfileVO_file = atcfileProc.read(atcfileno);
    Tool.deleteFile(upDir + atcfileVO_file.getFupname());    
    Tool.deleteFile(upDir + atcfileVO_file.getThumb());    
    
    int count = atcfileProc.delete(atcfileno);
    mav.addObject("count", count);
  
    mav.setViewName("redirect:/atcfile/delete_msg.jsp");
    return mav;
  }

  
  
}
