package dev.mvc.rest_categrp;

import java.util.List;

public interface RestCategrpProcInter {
  /**
   * <Xmp>
   * ���� ī�װ� �׷� ���
   * <insert id="create" parameterType="RestCategrpVO"> 
   * </Xmp>
   * @param restcategrpVO
   * @return ó���� ���ڵ� ����
   */
  public int create(RestCategrpVO restcategrpVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="RestCategrpVO">
   * </xmp> 
   * @return
   */
  public List<RestCategrpVO> list_categrpno_asc();
  
  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public RestCategrpVO read(int rcateno);
  
  /**
   * ����
   * @param contentsVO
   * @return ������ ���ڵ� ����
   */
  public int update(RestCategrpVO restcategrpVO);
  
  /**
   * ���� ó��
   * @param rcateno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int rcateno);
  
  /**
   * ������ �� ����
   */
  public int increaseCnt(int rcateno);
  
  /**
   * ������ �� ����
   */
  public int decreaseCnt(int rcateno);

  /**
   * ������ �� 0  
   */
  public int cnt_zero(int rcateno);

  
}



