package dev.mvc.rec_img;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.rec.RecVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;


@Controller
public class Rec_imgCont {
  
  @Autowired
  @Qualifier("dev.mvc.rec_img.Rec_imgProc")
  private Rec_imgProcInter rec_imgProc;
  
  
  public Rec_imgCont() {
    System.out.println("--> Rec_imgCont create");
  }
  
  /**
   * 파일 등록폼
   * @param recom_no
   * @return
   */
  //http://172.16.12.7:9090/team1/rec_img/create.do?recom_no=5&wno=1
  @RequestMapping(value="/rec_img/create.do", method=RequestMethod.GET)
  public ModelAndView create(int recom_no) {
    ModelAndView mav = new ModelAndView();


    mav.setViewName("/rec_img/create"); // /webapp/w_attach/create.jsp

    return mav;
  }
  
  @RequestMapping(value = "/rec_img/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           Rec_imgVO rec_imgVO,
                                           int cho_no) {
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int recom_no = rec_imgVO.getRecom_no(); // 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/rec_img/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = rec_imgVO.getFnamesMF();
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
        Rec_imgVO vo = new Rec_imgVO();
        vo.setRecom_no(recom_no);
        vo.setFname(fname);
        vo.setFupname(fupname);
        vo.setThumb(thumb);
        vo.setFsize(fsize);
        
        upload_count = upload_count + rec_imgProc.create(vo); // 파일 1건 등록 정도 dbms 저장
      }
    }     
    // -----------------------------------------------------
    // 파일 전송 코드 종료
    // -----------------------------------------------------
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("recom_no", rec_imgVO.getRecom_no());
    ra.addAttribute("cho_no", cho_no);
    
    mav.setViewName("redirect:/rec_img/create_msg.jsp");
    return mav;
  }
  
  /**
   * 목록
   * http://localhost:9090/team1/rec_img/list.do
   * 
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/rec_img/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<Rec_Rec_ImgVO> list = rec_imgProc.list();
    mav.addObject("list", list);

    mav.setViewName("/rec_img/list");

    return mav;
  }
  
  /**
   {"list":[
             {"img_no":2,"fname":"padding.jpg","fsize":24411,"thumb":"padding_t.jpg","recom_no":28,"fupname":"padding.jpg"}
           ]
   }
   * http://localhost:9090/team1/rec_img/list_by_recom_no.do?recom_no=28
   * http://localhost:9090/team1/write/list.do?boardno=2
   * http://localhost:9090/team1/write/list.do?boardno=3
   * 
   * @param boardno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/rec_img/list_by_recom_no.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String list_by_cho_no(int recom_no) {
    List<Rec_imgVO> list = rec_imgProc.list_by_recom_no(recom_no);
    JSONObject obj = new JSONObject(); 
    obj.put("list", list);

    return obj.toString(); 
  }
  
  
}
