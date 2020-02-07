package dev.mvc.restrnts;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// MyBATIS�� <mapper namespace="dev.mvc.categrp.CategrpDAOInter">�� ���� 
public interface RestrntsDAOInter {
  // ���ۿ� ���� �޼ҵ���� MyBATIS�� XML ���Ͼ��� id�� �����ؾ��մϴ�.
  /**
   * <Xmp>
   * ������ ���
   * <insert id="create" parameterType="RestrntsVO"> 
   * </Xmp>
   * @param restrntsVO
   * @return ó���� ���ڵ� ����
   */
  public int create(RestrntsVO restrntsVO);
  
  /**
   * ��ü ��� 
   * 
   * @return
   */
  public List<RestrntsVO> list_map();
  
  /**
   * rcateno�� ���
   *
   * @return
   */
  public List<RestrntsVO> list_by_rcateno(int rcateno);

  /**
   * ��ȸ
   * @param contentsno
   * @return
   */
  public RestrntsVO read(int restno);
  
  /**
   * ���� ó��
   * @param rcateno
   * @return ó���� ���ڵ� ����
   */
  public int delete(int restno);
  
  
  /**
   * ����
   * @param restrntsVO
   * @return ������ ���ڵ� ����
   */
  public int update(RestrntsVO restrntsVO);
  
  /**
   * ���� ����
   * @param restrntsVO
   * @return ������ ���ڵ� ����
   */
  public int update_img(RestrntsVO restrntsVO);
  
  // ������ restno
  public int lastnum();
  
  /**
   * ��ȸ�� ����
   */
  public int increaseCnt(int restno);
  
  /**
   * ī�װ��� �˻� ���
   * @param hashMap
   * @return
   */
  public List<RestrntsVO> list_by_rcateno_search(HashMap<String, Object> hashMap);
  
  /**
   * ī�װ��� �˻� ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * �˻� + ����¡ ���
   * @param map
   * @return
   */
  public ArrayList<RestrntsVO> list_by_rcateno_search_paging(HashMap<String, Object> map);
  

}






