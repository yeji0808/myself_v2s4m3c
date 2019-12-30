package dev.mvc.w_attach;

import java.util.List;



public interface W_attachDAOInter {

  /**
   * <xmp>
   *   <!-- ����÷�� ��� -->
  <insert id="create" parameterType="W_attachVO">
  </xmp>
   * @param w_attachVO
   * @return
   */
  public int create(W_attachVO w_attachVO);
  /**
   * ���� ���
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
   * ����
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public int delete(int w_attachno);

  /**
   * wno�� ÷������ ���� 
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
