package dev.mvc.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.board.BoardProc")
public class BoardProc implements BoardProcInter {
  @Autowired
  private BoardDAOInter boardDAO; 
  
  @Override
  public int create(BoardVO boardVO) {
    int count = boardDAO.create(boardVO);
    return count;
  }

  @Override
  public List<BoardVO> list_boardno_asc() {
    List<BoardVO> list=boardDAO.list_boardno_asc();
    return list;
  }


  @Override
  public BoardVO read(int boardno) {
    BoardVO boardVO = boardDAO.read(boardno);
    return boardVO;
  }
  
  @Override
  public int update(BoardVO boardVO) {
    int count = boardDAO.update(boardVO);
    
    return count;
  }

  @Override
  public int delete(int boardno) {
    int count = boardDAO.delete(boardno);
    
    return count;
  }

  @Override
  public int cnt_zero(int boardno) {
    int count = boardDAO.cnt_zero(boardno);
    return count;
  }

  @Override
  public int increaseCnt(int boardno) {
    int count = boardDAO.increaseCnt(boardno);
    return count;
  }

  @Override
  public int decreaseCnt(int boardno) {
    int count = boardDAO.decreaseCnt(boardno);
    return count;
  }


}
