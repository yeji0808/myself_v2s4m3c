package dev.mvc.rest_categrp;

import java.util.List;

public interface RestCategrpProcInter {
  /**
   * <Xmp>
   * 음식 카테고리 그룹 등록
   * <insert id="create" parameterType="RestCategrpVO"> 
   * </Xmp>
   * @param restcategrpVO
   * @return 처리된 레코드 갯수
   */
  public int create(RestCategrpVO restcategrpVO);
  
  /**
   * 목록
   * <xmp>
   * <select id="list" resultType="RestCategrpVO">
   * </xmp> 
   * @return
   */
  public List<RestCategrpVO> list_categrpno_asc();
  
  /**
   * 조회
   * @param contentsno
   * @return
   */
  public RestCategrpVO read(int rcateno);
  
  /**
   * 수정
   * @param contentsVO
   * @return 수정된 레코드 갯수
   */
  public int update(RestCategrpVO restcategrpVO);
  
  /**
   * 삭제 처리
   * @param rcateno
   * @return 처리된 레코드 갯수
   */
  public int delete(int rcateno);
  
  /**
   * 음식점 수 증가
   */
  public int increaseCnt(int rcateno);
  
  /**
   * 음식점 수 감소
   */
  public int decreaseCnt(int rcateno);

  /**
   * 음식점 수 0  
   */
  public int cnt_zero(int rcateno);

  
}



