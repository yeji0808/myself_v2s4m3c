package dev.mvc.b_write;

import java.util.List;

public interface WriteProcInter {

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
  public List<WriteVO> list();
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
  
 /** ��õ�� ����
  * <xmp>
  * <update id="increase_recom" parameterType="int">
  * </xmp>
  * @param wno
  * @return
  */
 public int increase_recom(int wno);
 /** ��ۼ� ����
  * <xmp>
  * <update id="increase_wreplycnt" parameterType="int">
  * </xmp>
  * @param wno
  * @return
  */
 public int increase_wreplycnt(int wno);
}
