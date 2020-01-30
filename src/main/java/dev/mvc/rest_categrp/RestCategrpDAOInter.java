package dev.mvc.rest_categrp;

import java.util.List;

// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
public interface RestCategrpDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
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
   * <Xmp>
   * <select id="list" resultType="RestCategrpVO">
   * </Xmp> 
   * @return
   */
  public List<RestCategrpVO> list_categrpno_asc();

  /**
   * ��ȸ
   * @param rcateno
   * @return
   */
  public RestCategrpVO read(int rcateno);
  
  /**
   * ����
   * @param restcategrpVO
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






