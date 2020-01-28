package dev.mvc.menu;

import java.util.List;

public interface MenuDAOInter {

  /**
   * 메뉴 등록
   */
  public int create(MenuVO menuVO);

  /**
   * 메뉴 조회
   */
  public List<MenuVO> read(int restno);
  
  /**
   * 메뉴 수정
   */
  public int update(MenuVO menuVO);

  
  }
