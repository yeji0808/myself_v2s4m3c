package dev.mvc.rattachfile;

import java.util.List;

public interface RattachfileDAOInter {
  
  /**
   * <xmp>
   * 파일 등록
   * <insert id="create" parameterType="AttachfileVO">
   * </xmp>
   * @param attachfileVO
   * @return
   */
  public int create(RattachfileVO attachfileVO);
  
  /**
   * contentsno별 첨부 파일 목록 
   * @param contentsno
   * @return
   */
  public List<RattachfileVO> list_by_contentsno(int contentsno);
  
  /**
   * 번호에따른 파일 삭제 
   * @param attachfileno
   * @return 삭제된 레코드 갯수
   */
  public int delete(int attachfileno); 
  
  /**
   * contentsno 별 레코드 갯수
   * @param contentsno
   * @return 레코드 갯수
   */
  public int count_by_contentsno(int contentsno);
  
  /**
   * contentsno 별 레코드 삭제
   * @param contentsno
   * @return 레코드 갯수
   */
  public int delete_by_contentsno(int contentsno);
  
}






