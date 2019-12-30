package dev.mvc.b_write;

import java.util.List;

public interface WriteDAOInter {
  
  /** ���
   * <xmp>
   * <insert id="create" parameterType="WriteVO">
   * </xmp>
   * @param writeVO
   * @return
   */
  public int create(WriteVO writeVO);
  /** ���
   * <xmp>
   * <select id="list" resultType="WriteVO" parameterType="int">
   * </xmp>
   * @return
   */
  public List<WriteVO> list(int boardno);
  /**��ȸ
   * <xmp>
   * <select id="read" resultType="WriteVO" parameterType="int">
   * </xmp>
   * @param wno
   * @return
   */
  public WriteVO read(int wno);
  
  
  /** ����
   * <xmp>
   * <!-- ����, id: update, �Է�: writeVO, ����: ������ ����    -->
   * </xmp>
   * @param WriteVO
   * @return
   */
  public int update(WriteVO writeVO);
  
  /** �� ���� write ����
   * <xmp>
   * <delete id="delete" parameterType="int" >
   * </xmp>
   * @param wno
   * @return
   */
  public int delete(int wno);
  
  /**<xmp>
   * <!-- FK �÷� ���� ���� ���ڵ� ���� ����: id="count_by_boardno" -->
   * </xmp>
   * @return
   */
  public int count_by_boardno(int boardno);
 
 /**<xmp>
  * <!-- FK �÷� ���� ���� ���ڵ� ����: id="delete_by_boardno" -->
  * </xmp>
  * @param boardno
  * @return
  */
 public int delete_by_boardno(int boardno);
 /** ��õ�� ����
  * <xmp>
  * <update id="increase_recom" parameterType="int">
  * </xmp>
  * @param wno
  * @return
  */
 public int increase_recom(int wno);
}
