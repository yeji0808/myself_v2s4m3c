package dev.mvc.s_write;

import java.util.List;

public interface WriteDAOInter {
  
  /**
   * 글 등록
   * @param writeVO
   * @return
   */
  public int  create(WriteVO writeVO);

  /**
   * 전체목록
   * @param somoimno
   * @return
   */
  public List<WriteVO> list_by_somoimno(int somoimno);
  
  /**
   * 글 읽기
   * @param writeno
   * @return
   */
  public WriteVO read(int writeno);
  
  /**
   * 글 수정
   * @param writeVO
   * @return
   */
  public int update(WriteVO writeVO);
  
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

}
