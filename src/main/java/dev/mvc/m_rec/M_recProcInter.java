package dev.mvc.m_rec;

import java.util.Map;


public interface M_recProcInter {
  /**
   * ��õ�� ����
   */
  public int increaseRecom(int restno);
  
  /**
   * ��õ�� ����
   */
  public int decreaseRecom(int restno);
  
  /**
   * ��õ���� Ȯ��
   */
  public int checkRecom(Map<String, Object> map);
  
  /**
   * ��õ ����
   */
  public int create_rec(Map<String, Object> map);
  
  /**
   * ��õ ����
   */
  public int delete_rec(Map<String, Object> map);
  
  /**
   * ��ȸ
   */
  public M_recVO read(Map<String, Object> map);

}
