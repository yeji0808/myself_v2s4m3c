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
   * 파일 등록폼
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
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int wno = w_attachVO.getWno(); // 부모글 번호
    String w_attachname = ""; // 원본 파일명
    String w_attachupfile = ""; // 업로드된 파일명
    long w_attachfsize = 0;  // 파일 사이즈
    String w_attachthumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
     
    String upDir = Tool.getRealPath(request, "/w_attach/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = w_attachVO.getFnamesMF();
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        w_attachfsize = multipartFile.getSize();  // 파일 크기
        if (w_attachfsize > 0) { // 파일 크기 체크
          w_attachname = multipartFile.getOriginalFilename(); // 원본 파일명
          w_attachupfile = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          
          if (Tool.isImage(w_attachname)) { // 이미지인지 검사
            w_attachthumb = Tool.preview(upDir, w_attachupfile, 120, 80); // thumb 이미지 생성
          }
        }
        W_attachVO vo = new W_attachVO();
        vo.setWno(wno);
        vo.setW_attachname(w_attachname);  
        vo.setW_attachupfile(w_attachupfile);
        vo.setW_attachthumb(w_attachthumb);
        vo.setW_attachfsize(w_attachfsize);
        
        upload_count = upload_count + w_attachProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("wno", w_attachVO.getWno());
    
    mav.setViewName("redirect:/w_attach/create_msg.jsp");
    return mav;
  }
  
  /**
   * 목록
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
   * ZIP 압축 후 파일 다운로드
   * @param request
   * @param contentsno 파일 목록을 가져올때 사용할 글번호
   * @return
   */
  @RequestMapping(value = "/w_attach/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int wno) {
    ModelAndView mav = new ModelAndView();
    
    // 글번호에 해당하는 파일 목록 산출
    List<W_attachVO> w_attach_list = w_attachProc.list_by_wno(wno);
    
    // 실제 저장된 파일명만 추출
    ArrayList<String> files_array = new ArrayList<String>();
    for(W_attachVO w_attachVO:w_attach_list) {
      files_array.add(w_attachVO.getW_attachupfile());
    }
    
    String dir = "/w_attach/storage";
    String upDir = Tool.getRealPath(request, dir); // 절대 경로
    
    // 압축될 파일명, 동시 접속자 다운로드의 충돌 처리
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // 파일 갯수만큼 배열 선언
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // 절대 경로 조합      
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
        // 4 KB씩 읽어서 buffer 배열에 저장후 읽은 바이트수를 length에 저장
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // 기록할 내용, 내용에서의 시작 위치, 기록할 길이
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " 압축 완료");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " 파일을 삭제했습니다.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download 서블릿 연결
    mav.setViewName("redirect:/download?dir=" + dir + "&filename=" + zip);    
    
    return mav;
  }
  
  /**
   * FK wno 컬럼값을 이용한 레코드 삭제 처리
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

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("wno", wno);
    
    mav.setViewName("redirect:/w_attach/delete_by_wno_msg.jsp");

    return mav;
  }
  
}
