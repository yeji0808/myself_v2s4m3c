package dev.mvc.wreply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import nation.web.tool.Tool;

@Component("dev.mvc.wreply.WreplyProc")
public class WreplyProc implements WreplyProcInter {

  @Autowired
  private WreplyDAOInter wreplyDAO;
  @Override
  public int create(WreplyVO wreplyVO) {
    int count = wreplyDAO.create(wreplyVO);
    return count;
  }
  @Override
  public List<WreplyVO> list() {
    List<WreplyVO> list = wreplyDAO.list();
    return list;
  }
  @Override
  public List<WreplyVO> list_by_wno(int wno) {
    List<WreplyVO> list = wreplyDAO.list_by_wno(wno);
    String content = "";
    
    // 특수 문자 변경
    for (WreplyVO wreplyVO:list) {
      content = wreplyVO.getRcontent();
      content = Tool.convertChar(content);
      wreplyVO.setRcontent(content);
    }
    return list;
  }
  @Override
  public List<WreplyMembersVO> list_by_wno_join(int wno) {
    List<WreplyMembersVO> list = wreplyDAO.list_by_wno_join(wno);
    String content = "";
    
    // 특수 문자 변경
    for (WreplyMembersVO wreplyMemberVO:list) {
      content = wreplyMemberVO.getRcontent();
      content = Tool.convertChar(content);
      wreplyMemberVO.setRcontent(content);
    }
    return list;
  }
  @Override
  public int checkPasswd(Map<String, Object> map) {
    int count = wreplyDAO.checkPasswd(map);
    return count;
  }
  @Override
  public int delete(int wreplyno) {
    int count = wreplyDAO.delete(wreplyno);
    return count;
  }
  
 
}
