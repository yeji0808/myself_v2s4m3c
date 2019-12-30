package dev.mvc.s_write;

import java.util.List;

public interface WriteDAOInter {
  
  /**
   * �� ���
   * @param writeVO
   * @return
   */
  public int  create(WriteVO writeVO);

  /**
   * ��ü���
   * @param somoimno
   * @return
   */
  public List<WriteVO> list_by_somoimno(int somoimno);
  
  /**
   * �� �б�
   * @param writeno
   * @return
   */
  public WriteVO read(int writeno);
  
  /**
   * �� ����
   * @param writeVO
   * @return
   */
  public int update(WriteVO writeVO);
  
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
