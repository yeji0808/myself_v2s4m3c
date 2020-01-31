package dev.mvc.rec_member;

import java.util.HashMap;
import java.util.List;

public interface RecMemberProcInter {

  /**
   * <insert id="create" parameterType="HashMap">
   * @return
   */
  public int create(HashMap<Object, Object> map );
  /**
   * <select id="list" resultType="RecMemberVO">
   * @return
   */
  public List<RecMemberVO> list();
  /**
   * <select id="list" resultType="RecMemberVO">
   * @return
   */
  public List<RecMemberVO> list_by_recom_no(int recom_no);
  /**
   * <delete id="delete" parameterType="int">
   * @return
   */
  public int delete(int RecMemberNo);
}
