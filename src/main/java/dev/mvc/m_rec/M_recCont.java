package dev.mvc.m_rec;

import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dev.mvc.restrnts.RestrntsProcInter;
import dev.mvc.restrnts.RestrntsVO;

@Controller
public class M_recCont {
  @Autowired
  @Qualifier("dev.mvc.m_rec.M_recProc") // 이름 지정
  private M_recProcInter m_recProc;
  
  @Autowired
  @Qualifier("dev.mvc.restrnts.RestrntsProc") // 이름 지정
  private RestrntsProcInter restrntsProc;

  public M_recCont() {
    System.out.println("--> M_recCont created.");
  }
  
  /**
   * http://localhost:9090/team1/rec/increase_cnt.do?recom_no=27
   * @param wno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/m_rec/increase_recom.do", 
                          method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String increase_recom(int restno, int memberno) { 
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("restno", restno);
    map.put("memberno", memberno);
    
    int check_cnt = m_recProc.checkRecom(map); //추천이력 확인
    int like = 0;
    
    if(check_cnt == 0) { //추천한 적 없으면,
      m_recProc.create_rec(map); //추천 만듦
      m_recProc.increaseRecom(restno); //추천 수 증가
      like = 1;
    
    }else {                  //추천한 적 있으면,
      m_recProc.delete_rec(map); //추천 삭제
      m_recProc.decreaseRecom(restno); //추천 수 감소
      like = 0;
    }
    
    RestrntsVO restrntsVO = restrntsProc.read(restno);

    JSONObject obj = new JSONObject();
    obj.put("like", like);
    obj.put("rrecom", restrntsVO.getRrecom());
    
    return obj.toString();
  }
}
