package dev.mvc.somoim;

import java.util.List;

public interface SomoimDAOInter {
  
  /**
   * �Ҹ��� ���(����)
   * <xmp>
   * <insert id="create" parameterType="SomoimVO">
   * </xmp>
   * @param SomoimVO
   * @return
   */
  public int create(SomoimVO somoimVO);
  
  /**
   * ���
   * <xmp>
   * <select id="list_somoimno_asc" resultType="SomoimVO">
   * </xmp> 
   * @return
   */
  public List<SomoimVO> list_somoimno_asc();
 
  /**
   * ��ȸ
   * <xmp>
   * <select id="read" resultType="SomoimVO" parameterType="int">
   * </xmp>
   * @param somoimno
   * @return
   */
  public SomoimVO read(int somoimno);
  
  /**
   * ����ó��
   * <xmp>
   * <update id="update" parameterType="SomoimVO">
   * </xmp>
   * @param somoimVO
   * @return
   */
  public int update(SomoimVO somoimVO);
  
  /**
   * �Ҹ��� �׷� ����
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param somoimno
   * @return
   */
  public int delete(int somoimno);
  
}
