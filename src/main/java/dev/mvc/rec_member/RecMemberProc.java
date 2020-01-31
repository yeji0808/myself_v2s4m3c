/**
 * 
 */
package dev.mvc.rec_member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.rec_member.RecMemberProc")
public class RecMemberProc implements RecMemberProcInter {

  @Autowired
  private RecMemberDAOInter recMemberDAO;
  
  @Override
  public int create(HashMap<Object, Object> map ) {
    int count = recMemberDAO.create(map); 
    return count;
  }

  @Override
  public List<RecMemberVO> list() {
    List<RecMemberVO> list = recMemberDAO.list();
    return list;
  }

  @Override
  public int delete(int RecMemberNo) {
    int count = recMemberDAO.delete(RecMemberNo);
    return count;
  }

  @Override
  public List<RecMemberVO> list_by_recom_no(int recom_no) {
    List<RecMemberVO> list = recMemberDAO.list_by_recom_no(recom_no);
    return list;
  }
}
