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

}






