package dev.mvc.w_attach;

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

import nation.web.tool.Tool;
import nation.web.tool.Upload;


@Controller
public class W_attachCont {

  @Autowired
  @Qualifier("dev.mvc.w_attach.W_attachProc")
  private W_attachProcInter w_attachProc;
  
  public W_attachCont(){
    System.out.println("--> W_attachCont created.");
  }
  
 
  /**
   * ���� �����
   * @param boardno
   * @param wno
   * @return
   */
  //http://172.16.12.7:9090/team1/w_attach/create.do?boardno=5&wno=1
  @RequestMapping(value="/w_attach/create.do", method=RequestMethod.GET)
  public ModelAndView create(int wno) {
    ModelAndView mav = new ModelAndView();


    mav.setViewName("/w_attach/create"); // /webapp/w_attach/create.jsp

    return mav;
  }
  
  @RequestMapping(value = "/w_attach/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           W_attachVO w_attachVO) {
    // System.out.println("--> boardno: " + boardno);
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    int wno = w_attachVO.getWno(); // �θ�� ��ȣ
    String w_attachname = ""; // ���� ���ϸ�
    String w_attachupfile = ""; // ���ε�� ���ϸ�
    long w_attachfsize = 0;  // ���� ������
    String w_attachthumb = ""; // Preview �̹���
    int upload_count = 0; // ����ó���� ���ڵ� ����
     
    String upDir = Tool.getRealPath(request, "/w_attach/storage");
    // ���� ������ ����� fnamesMF ��ü�� ������.
    List<MultipartFile> fnamesMF = w_attachVO.getFnamesMF();
    int count = fnamesMF.size(); // ���� ���� ����
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // ���� ����
        w_attachfsize = multipartFile.getSize();  // ���� ũ��
        if (w_attachfsize > 0) { // ���� ũ�� üũ
          w_attachname = multipartFile.getOriginalFilename(); // ���� ���ϸ�
          w_attachupfile = Upload.saveFileSpring(multipartFile, upDir); // ���� ����
          
          if (Tool.isImage(w_attachname)) { // �̹������� �˻�
            w_attachthumb = Tool.preview(upDir, w_attachupfile, 120, 80); // thumb �̹��� ����
          }
        }
        W_attachVO vo = new W_attachVO();
        vo.setWno(wno);
        vo.setW_attachname(w_attachname);  
        vo.setW_attachupfile(w_attachupfile);
        vo.setW_attachthumb(w_attachthumb);
        vo.setW_attachfsize(w_attachfsize);
        
        upload_count = upload_count + w_attachProc.create(vo); // ���� 1�� ��� ���� dbms ����
      }
    }    
    // -----------------------------------------------------
    // ���� ���� �ڵ� ����
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("wno", w_attachVO.getWno());
    
    mav.setViewName("redirect:/w_attach/create_msg.jsp");
    return mav;
  }
  
  /**
   * ���
   * http://localhost:9090/team1/w_attach/list.do
   * 
   * 
   * @return
   */
  @RequestMapping(value = "/w_attach/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    List<Write_W_attachVO> list = w_attachProc.list();
    mav.addObject("list",list);
    
    mav.setViewName("/w_attach/list");
    return mav;
  }
  
  /**
   * ZIP ���� �� ���� �ٿ�ε�
   * @param request
   * @param contentsno ���� ����� �����ö� ����� �۹�ȣ
   * @return
   */
  @RequestMapping(value = "/w_attach/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int wno) {
    ModelAndView mav = new ModelAndView();
    
    // �۹�ȣ�� �ش��ϴ� ���� ��� ����
    List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
    
    // ���� ����� ���ϸ� ����
    ArrayList<String> files_array = new ArrayList<String>();
    for(W_attachVO w_attachVO:w_attach_list) {
      files_array.add(w_attachVO.getW_attachupfile());
    }
    
    String dir = "/w_attach/storage";
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
   * FK wno �÷����� �̿��� ���ڵ� ���� ó��
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/w_attach/delete_by_wno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_wno(RedirectAttributes ra,
                                                                 int wno) {
    ModelAndView mav = new ModelAndView();

    int count = w_attachProc.delete_by_wno(wno); 

    ra.addAttribute("count", count); // ������ ���ڵ� ����
    ra.addAttribute("wno", wno);
    
    mav.setViewName("redirect:/w_attach/delete_by_wno_msg.jsp");

    return mav;
  }
  
}
