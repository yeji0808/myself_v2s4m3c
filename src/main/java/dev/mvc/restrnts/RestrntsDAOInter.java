package dev.mvc.restrnts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// MyBATIS의 <mapper namespace="dev.mvc.categrp.CategrpDAOInter">에 선언 
public interface RestrntsDAOInter {
  // 매퍼에 들어가는 메소드명은 MyBATIS의 XML 파일안의 id와 동일해야합니다.
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
  
  /**
   * 카테고리별 검색 목록
   * @param hashMap
   * @return
   */
  public List<RestrntsVO> list_by_rcateno_search(HashMap<String, Object> hashMap);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<RestrntsVO> list_by_rcateno_search_paging(HashMap<String, Object> map);
  

}






