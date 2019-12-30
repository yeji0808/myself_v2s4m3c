package dev.mvc.rattachfile;

import java.util.List;

public interface RattachfileDAOInter {
  
  /**
   * <xmp>
   * ���� ���
   * <insert id="create" parameterType="AttachfileVO">
   * </xmp>
   * @param attachfileVO
   * @return
   */
  public int create(RattachfileVO attachfileVO);
  
  /**
   * contentsno�� ÷�� ���� ��� 
   * @param contentsno
   * @return
   */
  public List<RattachfileVO> list_by_contentsno(int contentsno);
  
  /**
   * ��ȣ������ ���� ���� 
   * @param attachfileno
   * @return ������ ���ڵ� ����
   */
  public int delete(int attachfileno); 
  
  /**
   * contentsno �� ���ڵ� ����
   * @param contentsno
   * @return ���ڵ� ����
   */
  public int count_by_contentsno(int contentsno);
  
  /**
   * contentsno �� ���ڵ� ����
   * @param contentsno
   * @return ���ڵ� ����
   */
  public int delete_by_contentsno(int contentsno);
  
}






