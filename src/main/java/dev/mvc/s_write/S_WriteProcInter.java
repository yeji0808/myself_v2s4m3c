package dev.mvc.s_write;

import java.util.List;

public interface S_WriteProcInter {
  
  /**
   * �� ���
   * @param writeVO
   * @return
   */
  public int  create(S_WriteVO writeVO);

  /**
   * ��ü���
   * @param somoimno
   * @return
   */
  public List<S_WriteVO> list_by_somoimno(int somoimno);
  
  /**
   * �� �б�
   * @param writeno
   * @return
   */
  public S_WriteVO read(int writeno);
  
  /**
   * �� ����
   * @param writeVO
   * @return
   */
  public int update(S_WriteVO writeVO);
  
  /**
   * �� ����
   * @param writeno
   * @return
   */
  public int delete(int writeno);
  
  /**
   * FK �÷� ���� ���� ���ڵ� ���� ����
   * @param somoimno
   * @return
   */
  public int count_by_somoimno(int somoimno);
  
  /**
   * FK �÷� ���� ���� ���ڵ� ����
   * @param somoimno
   * @return
   */
  public int delete_by_somoimno(int somoimno);
  
}
