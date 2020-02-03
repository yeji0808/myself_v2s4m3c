package dev.mvc.s_write;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface S_WriteProcInter {
  
  /**
   * 글 등록
   * @param writeVO
   * @return
   */
  public int create (S_WriteVO writeVO);

  /**
   * 전체목록
   * @param somoimno
   * @return
   */
  public List<S_WriteVO> list_by_somoimno(int somoimno);
  
  /**
   * 글 읽기
   * @param writeno
   * @return
   */
  public S_WriteVO read(int writeno);
  
  /**
   * 글 수정
   * @param writeVO
   * @return
   */
  public int update(S_WriteVO writeVO);
  
  /**
   * 글 삭제
   * @param writeno
   * @return
   */
  public int delete(int writeno);
  
  /**
   * FK 컬럼 값이 사용된 레코드 갯수 산출
   * @param somoimno
   * @return
   */
  public int count_by_somoimno(int somoimno);
  
  /**
   * FK 컬럼 값이 사용된 레코드 삭제
   * @param somoimno
   * @return
   */
  public int delete_by_somoimno(int somoimno);
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param categrpno 카테고리번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @param word 검색어
   * @return
   */
  public String pagingBox(String listFile, int somoimno, int search_count, int nowPage, String word);
   
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_categrpno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public ArrayList<S_WriteVO> list_by_somoimno_search_paging(HashMap<String, Object> map);
  
}
