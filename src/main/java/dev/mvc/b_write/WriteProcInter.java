package dev.mvc.b_write;

import java.util.List;

public interface WriteProcInter {

  /** 등록
   * <xmp>
   * <insert id="create" parameterType="WriteVO">
   * </xmp>
   * @param writeVO
   * @return
   */
  public int create(WriteVO writeVO);
  /** 목록
   * <xmp>
   * <select id="list" resultType="WriteVO" parameterType="int">
   * </xmp>
   * @return
   */
  public List<WriteVO> list();
  /**조회
   * <xmp>
   * <select id="read" resultType="WriteVO" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public WriteVO read(int wno);
  
  
  /** 수정
   * <xmp>
   * <!-- 수정, id: update, 입력: writeVO, 리턴: 수정된 갯수    -->
   * </xmp>
   * @param WriteVO
   * @return
   */
  public int update(WriteVO writeVO);
  
  /** 한 건의 write 삭제
   * <xmp>
   * <delete id="delete" parameterType="int" >
   * </xmp>
   * @param wno
   * @return
   */
  public int delete(int wno);
  
 /** 추천수 증가
  * <xmp>
  * <update id="increase_recom" parameterType="int">
  * </xmp>
  * @param wno
  * @return
  */
 public int increase_recom(int wno);
 /** 댓글수 증가
  * <xmp>
  * <update id="increase_wreplycnt" parameterType="int">
  * </xmp>
  * @param wno
  * @return
  */
 public int increase_wreplycnt(int wno);
}
