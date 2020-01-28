package dev.mvc.s_reply;

import java.util.List;
import java.util.Map;

public interface S_ReplyProcInter {

  /**
   * ����ۼ�
   * @param s_replyVO
   * @return
   */
  public int create(S_ReplyVO s_replyVO);
  
  /**
   * ��ü���
   * @return
   */
  public List<S_ReplyVO> list();
  
  /**
   * list_by_writeno�� ���
   * @param writeno
   * @return
   */
  public List<S_ReplyVO> list_by_writeno(int writeno);
  
  /**
   * list_by_writeno�� ���
   * @param writeno
   * @return
   */
  public List<S_ReplyMemberVO> list_by_writeno_join(int writeno);
  
  /**
   * checkPasswd
   * @param replyno
   * @param passwd
   * @return
   */
  public int checkPasswd(Map<String, Object> map);
  
  /**
   * ��� ����
   * @param replyno
   * @return
   */
  public int delete(int replyno);
  
  /**
   * ��� ����
   * @param s_replyVO
   * @return
   */
  public int update(S_ReplyVO s_replyVO);
}
