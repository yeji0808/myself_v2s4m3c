package dev.mvc.somoim;

import java.util.List;

public interface SomoimDAOInter {
  
  /**
   * 소모임 등록(생성)
   * <xmp>
   * <insert id="create" parameterType="SomoimVO">
   * </xmp>
   * @param SomoimVO
   * @return
   */
  public int create(SomoimVO somoimVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list_somoimno_asc" resultType="SomoimVO">
   * </xmp> 
   * @return
   */
  public List<SomoimVO> list_somoimno_asc();
 
  /**
   * 조회
   * <xmp>
   * <select id="read" resultType="SomoimVO" parameterType="int">
   * </xmp>
   * @param somoimno
   * @return
   */
  public SomoimVO read(int somoimno);
  
  /**
   * 수정처리
   * <xmp>
   * <update id="update" parameterType="SomoimVO">
   * </xmp>
   * @param somoimVO
   * @return
   */
  public int update(SomoimVO somoimVO);
  
  /**
   * 소모임 그룹 삭제
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param somoimno
   * @return
   */
  public int delete(int somoimno);
  
}
