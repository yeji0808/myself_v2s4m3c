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
  @Qualifier("dev.mvc.rattachfile.RattachfileProc") // 이름 지정
  private RattachfileProcInter rattachfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.restrnts.RestrntsProc") // 이름 지정
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
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/rattachfile/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = rattachfileVO.getFnamesMF();
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
        RattachfileVO vo = new RattachfileVO();
        vo.setRestno(restno);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + rattachfileProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }    
    // -----------------------------------------------------
    // 파일 전송 코드 종료
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




