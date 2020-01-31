package dev.mvc.s_write;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface S_WriteProcInter {
  
  /**
   * �� ���
   * @param writeVO
   * @return
   */
  public int create (S_WriteVO writeVO);

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
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap hashMap);
  
  /**
   * ������ ��� ���ڿ� ����, Box ����
   * @param listFile ��� ���ϸ� 
   * @param categrpno ī�װ���ȣ
   * @param search_count �˻� ����
   * @param nowPage ���� ������, nowPage�� 1���� ����
   * @param word �˻���
   * @return
   */
  public String pagingBox(String listFile, int somoimno, int search_count, int nowPage, String word);
   
  /**
   * <xmp>
   * �˻� + ����¡ ���
   * <select id="list_by_categrpno_search_paging" resultType="ContentsVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public ArrayList<S_WriteVO> list_by_somoimno_search_paging(HashMap<String, Object> map);
  
}
