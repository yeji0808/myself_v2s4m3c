package dev.mvc.w_attach;

import java.util.List;



public interface W_attachDAOInter {

  /**
   * <xmp>
   *   <!-- 파일첨부 등록 -->
  <insert id="create" parameterType="W_attachVO">
  </xmp>
   * @param w_attachVO
   * @return
   */
  public int create(W_attachVO w_attachVO);
  /**
   * 파일 목록
   * @return
   */
  public List<Write_W_attachVO> list();
  /**
   * <select id="list_by_wno" resultType="W_attachVO" parameterType="int">
   * @param wno
   * @return
   */
  public List<W_attachVO> list_by_wno(int wno);
 
  /**
   * 삭제
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public int delete(int w_attachno);

  /**
   * wno별 첨부파일 갯수 
   * <xmp>
   * <select id="count_by_wno" resultType="int" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public int count_by_wno(int wno);
  
  /**
   * <xmp>
   * <delete id="delete_by_wno" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public int delete_by_wno(int wno);
}
