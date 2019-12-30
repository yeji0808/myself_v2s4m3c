package dev.mvc.user_categrp;

import java.util.List;

public interface CategrpProcInter {
  
  /**
   * <Xmp>
   * 카테고리 그룹 등록
   * <insert id="create" parameterType="CategrpVO"> 
   * </Xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int create(CategrpVO categrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="CategrpVO">
   * </xmp> 
   * @return
   */
  public List<CategrpVO> list_categrpno_asc();
 
  /**
   * 조회
   * <xmp>
   *   <select id="read" resultType="CategrpVO" parameterType="int">
   * </xmp>  
   * @param userno
   * @return
   */
  public CategrpVO read(int userno);
  
  /**
   * 수정 처리
   * <xmp>
   *   <update id="update" parameterType="CategrpVO"> 
   * </xmp>
   * @param categrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(CategrpVO categrpVO);
  
  /**
   * 삭제 처리
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param userno
   * @return 처리된 레코드 갯수
   */
  public int delete(int userno);
}



