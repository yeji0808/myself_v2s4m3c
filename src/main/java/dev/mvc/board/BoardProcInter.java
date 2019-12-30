package dev.mvc.board;

import java.util.List;

public interface BoardProcInter {
  /**<xmp>
   * <insert id="create" parameterType="BoardVO">
   * </xmp>
   * @param boardVO
   * @return
   */
  public int create(BoardVO boardVO);
  
  /**<xmp>
   * <select id="list_boardno_asc" resultType="BoardVO">
   * </xmp>
   * @resultType  BoardVO
   * @return
   */
  public List<BoardVO> list_boardno_asc();
  
  /** 한 건 조회 
   * <xmp>
   * <select id="read" resultType="BoardVO" parameterType="int">
   * </xmp>
   * @param boardno
   * @return
   */
  public BoardVO read(int boardno);
  
  /** 수정
   * <xmp>
  *  <update id="update" parameterType="BoardVO">
  * </xmp>
  * @param boardVO
  * @return
  */
 public int update(BoardVO boardVO);
 
 /**<xmp>
  * <delete id="delete" parameterType="int" >
  * </xmp
  * @param boardno
  * @return
  */
 public int delete(int boardno);
 
 /**<xmp>
  * <update id="cnt_zero" parameterType="int">
  * </xmp>
  * @param boardno
  * @return
  */
 public int cnt_zero(int boardno);
 
 /**<xmp>
  * <!-- 글 수에 따른 증가 -->
  *<update id="increaseCnt" parameterType="int">
  *</xmp>
  * @param boardno
  * @return
  */
 public int increaseCnt(int boardno);

 /**<xmp>
  *   <!-- 글 수에 따른 감소 -->
  *    <update id="decreaseCnt" parameterType="int">
  * </xmp>
  * @param boardno
  * @return
  */
 public int decreaseCnt(int boardno);
}

