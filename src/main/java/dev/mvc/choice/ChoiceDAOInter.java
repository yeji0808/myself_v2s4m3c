package dev.mvc.choice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ChoiceDAOInter {
  
  /**
   * <xmp>
   * <!-- ��� -->
   * <insert id="create" parameterType="ChoiceVO">
   * </xmp>
   * @param choiceVO
   * @return
   */
  public int create(ChoiceVO choiceVO);
  
  /**
   * <xmp>
   * <!-- ��� -->
   *<select id="list" resultType="ChoiceVO" >
   * </xmp>
   * @return
   */
  public List<ChoiceVO> list();
  
  /**����
   * <xmp>
   * <update id="update" parameterType="ChoiceVO">
   * </xmp>
   * @param choiceVO
   * @return
   */
  public int update(ChoiceVO choiceVO);
  
  /**��ȸ
   * <xmp>
   * <select id="read" parameterType="int" resultType="ChoiceVO">
   * </xmp>
   * @param cho_no
   * @return
   */
  public ChoiceVO read (int cho_no);
  

  /**����
   * <xmp>
   *   <delete id="delete" parameterType="int" >
   * </xmp>
   * @param cho_no
   * @return
   */
  public int delete(int cho_no);
 
 
}
