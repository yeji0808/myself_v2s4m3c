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
  @Qualifier("dev.mvc.atcfile.AtcfileProc") // 이름 지정
  private AtcfileProcInter atcfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.somoim.SomoimProc") // 이름 지정
  private SomoimProcInter somoimProc;
  
  @Autowired
  @Qualifier("dev.mvc.s_write.WriteProc") // 이름 지정
  private WriteProcInter writeProc;
  
  public AtcfileCont() {
    System.out.println("--> AtcfileCont() created");
  }
  
  /**
   * 파일 등록폼
   * @param somoimno 카테고리 그룹 FK
   * @param writeno 컨텐츠 번호 FK
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
   * 파일 등록 처리
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
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int writeno = atcfileVO.getWriteno(); // 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/atcfile/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = atcfileVO.getFnamesMF(); 
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
      for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
        fsize = multipartFile.getSize();  // 파일 크기
        if (fsize > 0) { // 파일 크기 체크
          fname = multipartFile.getOriginalFilename(); // 원본 파일명
          fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          
          if (Tool.isImage(fname)) { // 이미지인지 검사
            thumb = Tool.preview(upDir, fupname, 120, 80); // thumb 이미지 생성
          }
        }
        AtcfileVO vo = new AtcfileVO();
        vo.setWriteno(writeno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + atcfileProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("somoimno", somoimno);
    ra.addAttribute("writeno", atcfileVO.getWriteno());
    
    mav.setViewName("redirect:/atcfile/create_msg.jsp");
    return mav;
  }
  
  /**
   * 목록
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
   * ZIP 압축 후 파일 다운로드
   * @param request
   * @param write 파일 목록을 가져올때 사용할 글번호
   * @return
   */
  @RequestMapping(value = "/atcfile/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView download(HttpServletRequest request, int writeno) {
    ModelAndView mav = new ModelAndView();
    
    // 글번호에 해당하는 파일 목록 산출
    List<AtcfileVO> atcfile_list = atcfileProc.list_by_writeno(writeno);
    
    // 실제 저장된 파일명만 추출
    ArrayList<String> files_array = new ArrayList<String>();
    for(AtcfileVO atcfileVO:atcfile_list) {
      files_array.add(atcfileVO.getFupname());
    }
    
    String dir = "/atcfile/storage";
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
   * FK 컬럼값을 이용한 레코드 삭제 처리
   * @param ra
   * @param somoimno
   * @return
   */
  @RequestMapping(value = "/atcfile/delete_by_writeno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_writeno(RedirectAttributes ra, int somoimno, int writeno) {
    ModelAndView mav = new ModelAndView();

    int count = atcfileProc.delete_by_writeno(writeno);
    
    ra.addAttribute("count", count); // 삭제된 레코드 갯수
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
    // 파일 삭제
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
