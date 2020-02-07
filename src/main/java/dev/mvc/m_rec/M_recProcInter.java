package dev.mvc.m_rec;

import java.util.Map;


public interface M_recProcInter {
  /**
   * 추천수 증가
   */
  public int increaseRecom(int restno);
  
  /**
   * 추천수 감소
   */
  public int decreaseRecom(int restno);
  
  /**
   * 추천유무 확인
   */
  public int checkRecom(Map<String, Object> map);
  
  /**
   * 추천 생성
   */
  public int create_rec(Map<String, Object> map);
  
  /**
   * 추천 삭제
   */
  public int delete_rec(Map<String, Object> map);
  
  /**
   * 조회
   */
  public M_recVO read(Map<String, Object> map);

}
