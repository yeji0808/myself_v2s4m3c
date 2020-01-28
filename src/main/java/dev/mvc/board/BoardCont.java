package dev.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.b_write.WriteProcInter;



@Controller
public class BoardCont {
  @Autowired
  @Qualifier("dev.mvc.board.BoardProc") // �̸� ���� 
  private BoardProcInter boardProc;
  @Autowired
  @Qualifier("dev.mvc.b_write.WriteProc") // �̸� ���� 
  private WriteProcInter writeProc; 
  
  public BoardCont() {
    System.out.println("--> BoardCont created.");
  }
  
//http://localhost:9090/team1/board/create.do
 @RequestMapping(value="/board/create.do", method=RequestMethod.GET)
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/board/create"); // /webapp/categrp/create.jsp
   
   return mav;
 }
 
/**
 * ��� ó��
 * @param boardVO
 * @return
 */
 @RequestMapping(value="/board/create.do", method=RequestMethod.POST)
 public ModelAndView create(BoardVO boardVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = boardProc.create(boardVO);
   
   // type 1
   // mav.addObject("count", count);
   // mav.setViewName("/categrp/create_msg"); // /webapp/categrp/create_msg.jsp

   // type 2
   // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
   
   // type 3: ����ó��: list.do, ������ �߻�: create_msg.jsp�� ��� 
   if (count == 0) {
     mav.setViewName("redirect:/board/create_msg.jsp?count=" + count);
     
   } else {
     mav.setViewName("/board/list"); // list.jsp X
   }
       
   return mav;
 }
 
 /**
  * ��ü ���
  * @return
  */
 @RequestMapping(value="/board/list.do", method=RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   List<BoardVO> list = boardProc.list_boardno_asc();
   
   mav.addObject("list", list);
   mav.setViewName("redirect:/board/list.jsp"); // /webapp/board/list.jsp

   // mav.setViewName("redirect:/board/board_msg.jsp?count=" + count);
       
   return mav;
 }
 /**
  * ���� ���� �� ����.
  * @param boardno
  * @return
  */
 @RequestMapping(value="/board/update.do", method=RequestMethod.GET)
 public ModelAndView update(int boardno) {
   ModelAndView mav = new ModelAndView();
   
   BoardVO boardVO = boardProc.read(boardno);
   
   mav.addObject("boardVO", boardVO);
   mav.setViewName("/board/update"); // webapp/board/update.jsp
 
   return mav;
   
 }
 /**
  * ���� ó��.
  * @param boardno
  * @return
  */
 @RequestMapping(value="/board/update.do", method=RequestMethod.POST)
 public ModelAndView update(BoardVO boardVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = boardProc.update(boardVO);
   String url = "redirect:/board/update_msg.jsp?count=" + count +
                  "&boardno=" + boardVO.getBoardno();
   mav.setViewName(url);
   
   return mav;
   
 }
  //���� ��
 @RequestMapping(value="/board/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int boardno) {
   ModelAndView mav = new ModelAndView();
   
   BoardVO boardVO = boardProc.read(boardno);
   
   int count_by_boardno = writeProc.count_by_boardno(boardno);
   mav.addObject("count_by_boardno", count_by_boardno);
   
   mav.addObject("boardVO", boardVO);
   mav.setViewName("/board/delete");
    
   return mav; 
 }
 // ���� ó��
 @RequestMapping(value="/board/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int boardno) {
   ModelAndView mav = new ModelAndView();
   
   int count = boardProc.delete(boardno);
   String url = "redirect:/board/delete_msg.jsp?count=" + count +
                     "&boardno=" + boardno;
   mav.setViewName(url);
                              
   return mav;
 }
}
