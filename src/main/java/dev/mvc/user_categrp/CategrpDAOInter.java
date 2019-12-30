package dev.mvc.user_categrp;

import java.util.List;

// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
public interface CategrpDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
  
  /**
   * <Xmp>
   * ī�װ� �׷� ���
   * <insert id="create" parameterType="CategrpVO"> 
   * </Xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int create(CategrpVO categrpVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list" resultType="CategrpVO">
   * </xmp> 
   * @return
   */
  public List<CategrpVO> list_categrpno_asc();
  
  /**
   * ��ȸ
   * <xmp>
   *   <select id="read" resultType="CategrpVO" parameterType="int">
   * </xmp>  
   * @param userno
   * @return
   */
  public CategrpVO read(int userno);
  
  
  /**
   * ���� ó��
   * <xmp>
   *   <update id="update" parameterType="CategrpVO"> 
   * </xmp>
   * @param categrpVO
   * @return ó���� ���ڵ� ����
   */
  public int update(CategrpVO categrpVO);
  
  /**
   * ���� ó��
   * <xmp>
   *   <delete id="delete" parameterType="int">
   * </xmp> 
   * @param userno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int userno);
}







