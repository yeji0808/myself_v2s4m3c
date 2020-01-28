package dev.mvc.wreply;

import java.util.List;
import java.util.Map;

public interface WreplyProcInter {
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
  
  /**
   * <xmp>
   * <select id="list_by_wno" resultType="WreplyVO" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public List<WreplyVO> list_by_wno(int wno);
  /**<xmp>
   *  <select id="list_by_wno_join" resultType="WreplyMembersVO" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public List<WreplyMembersVO> list_by_wno_join(int wno);
  
  public int checkPasswd(Map<String, Object> map);

  public int delete(int wreplyno);

}
