package dev.mvc.choice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ChoiceDAOInter {
  
  /**
   * <xmp>
   * <!-- 등록 -->
   * <insert id="create" parameterType="ChoiceVO">
   * </xmp>
   * @param choiceVO
   * @return
   */
  public int create(ChoiceVO choiceVO);
  
  /**
   * <xmp>
   * <!-- 목록 -->
   *<select id="list" resultType="ChoiceVO" >
   * </xmp>
   * @return
   */
  public List<ChoiceVO> list();
  
  /**수정
   * <xmp>
   * <update id="update" parameterType="ChoiceVO">
   * </xmp>
   * @param choiceVO
   * @return
   */
  public int update(ChoiceVO choiceVO);
  
  /**조회
   * <xmp>
   * <select id="read" parameterType="int" resultType="ChoiceVO">
   * </xmp>
   * @param cho_no
   * @return
   */
  public ChoiceVO read (int cho_no);
  

  /**삭제
   * <xmp>
   *   <delete id="delete" parameterType="int" >
   * </xmp>
   * @param cho_no
   * @return
   */
  public int delete(int cho_no);
 
 
}
