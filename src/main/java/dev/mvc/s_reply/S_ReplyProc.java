package dev.mvc.s_reply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.s_reply.S_ReplyProc")
public class S_ReplyProc implements S_ReplyProcInter {
  @Autowired S_ReplyDAOInter s_replyDAO;

  @Override
  public int create(S_ReplyVO s_replyVO) {
    int count = s_replyDAO.create(s_replyVO);
    return count;
  }

  @Override
  public List<S_ReplyVO> list() {
    List<S_ReplyVO> list = s_replyDAO.list();
    return list;
  }

  @Override
  public List<S_ReplyVO> list_by_writeno(int writeno) {
    List<S_ReplyVO> list = s_replyDAO.list_by_writeno(writeno);
    return list;
  }

  @Override
  public List<S_ReplyMemberVO> list_by_writeno_join(int writeno) {
    List<S_ReplyMemberVO> list = s_replyDAO.list_by_writeno_join(writeno);
    return list;
  }

  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = s_replyDAO.checkPasswd(map);
    return count;
  }

  @Override
  public int delete(int replyno) {
    int count = s_replyDAO.delete(replyno);
    return count;
  }

  @Override
  public int update(S_ReplyVO s_replyVO) {
    int count = s_replyDAO.update(s_replyVO);
    return count;
  }
  
}
