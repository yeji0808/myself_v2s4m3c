package dev.mvc.restrnts;

import java.util.List;

public interface RestrntsProcInter {
  /**
   * <Xmp>
   * 음식점 등록
   * <insert id="create" parameterType="RestrntsVO"> 
   * </Xmp>
   * @param restrntsVO
   * @return 처리된 레코드 갯수
   */
  public int create(RestrntsVO restrntsVO);
  
  /**
   * 전체 목록 
   * 
   * @return
   */
  public List<RestrntsVO> list_map();
  
  /**
   * rcateno별 목록
   *
   * @return
   */
  public List<RestrntsVO> list_by_rcateno(int rcateno);

  /**
   * 조회
   * @param contentsno
   * @return
   */
  public RestrntsVO read(int restno);
  
  /**
   * 삭제 처리
   * @param rcateno
   * @return 처리된 레코드 갯수
   */
  public int delete(int restno);
  
  /**
   * 수정
   * @param restrntsVO
   * @return 수정된 레코드 갯수
   */
  public int update(RestrntsVO restrntsVO);
  
  /**
   * 사진 수정
   * @param restrntsVO
   * @return 수정된 레코드 갯수
   */
  public int update_img(RestrntsVO restrntsVO);

  // 마지막 restno
  public int lastnum();
  
  /**
   * 조회수 증가
   */
  public int increaseCnt(int restno);

  
}



