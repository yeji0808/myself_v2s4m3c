package dev.mvc.rec_img;

import java.util.List;

public interface Rec_imgProcInter {
  /**
   * <xmp>
   *   <!-- 추천 항목에 대한 IMG첨부 등록 -->
  <insert id="create" parameterType="Rec_imgVO">
  </xmp>
   * @param Rec_imgVO
   * @return
   */
  public int create(Rec_imgVO rec_imgVO);
  /**
   * 추천 항목에 대한 IMG첨부파일 목록
   * <select id="list_by_recom_no" resultType="W_attachVO" parameterType="int">
   * @param recom_no
   * @return
   */
  public List<Rec_imgVO> list_by_recom_no(int recom_no);
 
  /** 첨부 이미지 목록
   *  <select id="list" resultType="Rec_Rec_ImgVO">
   * @return
   */
  public List<Rec_Rec_ImgVO> list();
}
