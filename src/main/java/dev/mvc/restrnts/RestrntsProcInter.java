package dev.mvc.restrnts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param rcateno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int rcateno, int search_count, int nowPage, String word);
   
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<RestrntsVO> list_by_rcateno_search_paging(HashMap<String, Object> map);
  

 
  
}



