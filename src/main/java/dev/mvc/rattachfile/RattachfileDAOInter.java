package dev.mvc.rattachfile;

import java.util.List;

public interface RattachfileDAOInter {
  
  /**
   * <xmp>
   * ���� ���
   * <insert id="create" parameterType="RattachfileVO">
   * </xmp>
   * @param rattachfileVO
   * @return
   */
  public int create(RattachfileVO rattachfileVO);
  
  /**
   * ��ȣ������ ���� ���� 
   * @param attachfileno
   * @return ������ ���ڵ� ����
   */
  public int delete(int attachfileno); 
  
  /**
   * restno�� ÷�� ���� ��� 
   * @param restno
   * @return
   */
  public List<RattachfileVO> list_by_restno(int restno);
  
  /**
   * contentsno �� ���ڵ� ����
   * @param contentsno
   * @return ���ڵ� ����
   */
  public int count_by_restno(int restno);

  
}






