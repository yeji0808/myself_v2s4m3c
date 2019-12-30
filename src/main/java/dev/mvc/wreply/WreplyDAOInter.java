package dev.mvc.wreply;

import java.util.List;

public interface WreplyDAOInter {

  /** 댓글 등록
   * <xmp>
   *   <insert id="create">
   * </xmp>
   * @return
   */
  public int create(WreplyVO wreplyVO);

  /**목록
   * <xmp>
   * <select id="list" resultType="WreplyVO">
   * </xmp>
   * @return
   */
  public List<WreplyVO> list();
}
