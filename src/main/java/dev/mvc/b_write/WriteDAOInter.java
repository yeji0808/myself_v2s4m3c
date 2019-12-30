package dev.mvc.b_write;

import java.util.List;

public interface WriteDAOInter {
  
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
  public List<WriteVO> list(int boardno);
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
  
  /**<xmp>
   * <!-- FK 컬럼 값이 사용된 레코드 갯수 산출: id="count_by_boardno" -->
   * </xmp>
   * @return
   */
  public int count_by_boardno(int boardno);
 
 /**<xmp>
  * <!-- FK 컬럼 값이 사용된 레코드 삭제: id="delete_by_boardno" -->
  * </xmp>
  * @param boardno
  * @return
  */
 public int delete_by_boardno(int boardno);
 /** 추천수 증가
  * <xmp>
  * <update id="increase_recom" parameterType="int">
  * </xmp>
  * @param wno
  * @return
  */
 public int increase_recom(int wno);
}
