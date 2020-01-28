package dev.mvc.rec_img;

import java.util.List;

public interface Rec_imgProcInter {
  /**
   * <xmp>
   *   <!-- ��õ �׸� ���� IMG÷�� ��� -->
  <insert id="create" parameterType="Rec_imgVO">
  </xmp>
   * @param Rec_imgVO
   * @return
   */
  public int create(Rec_imgVO rec_imgVO);
  /**
   * ��õ �׸� ���� IMG÷������ ���
   * <select id="list_by_recom_no" resultType="W_attachVO" parameterType="int">
   * @param recom_no
   * @return
   */
  public List<Rec_imgVO> list_by_recom_no(int recom_no);
 
  /** ÷�� �̹��� ���
   *  <select id="list" resultType="Rec_Rec_ImgVO">
   * @return
   */
  public List<Rec_Rec_ImgVO> list();
}
