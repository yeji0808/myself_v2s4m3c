package dev.mvc.s_reply;

import java.util.List;
import java.util.Map;

public interface S_ReplyProcInter {

  /**
   * 댓글작성
   * @param s_replyVO
   * @return
   */
  public int create(S_ReplyVO s_replyVO);
  
  /**
   * 전체목록
   * @return
   */
  public List<S_ReplyVO> list();
  
  /**
   * list_by_writeno별 목록
   * @param writeno
   * @return
   */
  public List<S_ReplyVO> list_by_writeno(int writeno);
  
  /**
   * list_by_writeno별 목록
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
   * 댓글 삭제
   * @param replyno
   * @return
   */
  public int delete(int replyno);
  
  /**
   * 댓글 수정
   * @param s_replyVO
   * @return
   */
  public int update(S_ReplyVO s_replyVO);
}
