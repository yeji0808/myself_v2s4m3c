package dev.mvc.members;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dev.mvc.members.MembersVO;

public interface MembersDAOInter {
  /**
   * �ߺ� ���̵� �˻�
   * @param id ���̵�
   * @return �ߺ� ���̵� ����
   */
  public int checkId(String id);
  
  /**
   * ȸ�� ����
   * @param membersVO
   * @return ���Ե� ȸ�� ��
   */
  public int create(MembersVO membersVO); 
  
  /**
   * ���
   * @return
   */
  public List<MembersVO> list();
  
  /**
   * ������ ��ȸ
   * @param userno
   * @return
   */
  public List<MembersVO> list_by_user(int userno);
  
  /**
   * ȸ�� ��ȣ�� ���� ��ȸ
   * @param memberno ȸ�� ��ȣ
   * @return
   */
  public MembersVO read(int memberno);
  

  
  /**
   * ���̵� ���� ��ȸ
   * @param id ���̵�
   * @return
   */
  public MembersVO readById(String id);
  
  /**
   * ȸ�� ���� ����
   * @param membersVO
   * @return ������ ȸ�� ��
   */
  public int update(MembersVO membersVO);
  
  /**
   * �н����� �˻�
   * @param map
   * @return 0: ��ġ���� ����, 1: ��ġ��
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * �н����� ����
   * @param map
   * @return ����� �н����� ����
   */
  public int passwd_update(HashMap<Object, Object> map);
 
  /**
   * ȸ�� ����
   * @param memberno
   * @return ������ ȸ����
   */
  public int delete(int memberno);
  
  /**
   * �α���
   * @param map
   * @return
   */
  public int login(Map<Object, Object> map);
}
