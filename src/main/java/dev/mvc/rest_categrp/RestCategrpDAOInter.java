package dev.mvc.rest_categrp;

import java.util.List;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언 
public interface RestCategrpDAOInter {
  // 매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.
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

}






