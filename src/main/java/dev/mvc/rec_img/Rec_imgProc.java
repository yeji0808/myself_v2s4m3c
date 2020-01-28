package dev.mvc.rec_img;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component("dev.mvc.rec_img.Rec_imgProc")
public class Rec_imgProc implements Rec_imgProcInter {
  @Autowired
  private Rec_imgDAOInter rec_imgDAO;

  @Override
  public int create(Rec_imgVO rec_imgVO) {
    int count = rec_imgDAO.create(rec_imgVO);
    return count;
  }

  @Override
  public List<Rec_imgVO> list_by_recom_no(int recom_no) {
    List<Rec_imgVO> list_by_recom_no =rec_imgDAO.list_by_recom_no(recom_no);
    return list_by_recom_no;
  }

  @Override
  public List<Rec_Rec_ImgVO> list() {
    List<Rec_Rec_ImgVO> list = rec_imgDAO.list();
    return list;
  }


}
