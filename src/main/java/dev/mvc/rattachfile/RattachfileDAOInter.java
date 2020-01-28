package dev.mvc.rattachfile;

import java.util.List;

public interface RattachfileDAOInter {
  
  /**
   * <xmp>
   * 파일 등록
   * <insert id="create" parameterType="RattachfileVO">
   * </xmp>
   * @param rattachfileVO
   * @return
   */
  public int create(RattachfileVO rattachfileVO);
  
  /**
   * 번호에따른 파일 삭제 
   * @param attachfileno
   * @return 삭제된 레코드 갯수
   */
  public int delete(int attachfileno); 
  
  /**
   * restno별 첨부 파일 목록 
   * @param restno
   * @return
   */
  public List<RattachfileVO> list_by_restno(int restno);
  
  /**
   * contentsno 별 레코드 갯수
   * @param contentsno
   * @return 레코드 갯수
   */
  public int count_by_restno(int restno);

  
}






