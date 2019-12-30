package dev.mvc.wreply;

import java.util.List;

public interface WreplyDAOInter {

  /** ��� ���
   * <xmp>
   *   <insert id="create">
   * </xmp>
   * @return
   */
  public int create(WreplyVO wreplyVO);

  /**���
   * <xmp>
   * <select id="list" resultType="WreplyVO">
   * </xmp>
   * @return
   */
  public List<WreplyVO> list();
}
