package dev.mvc.menu;

import java.util.List;

public interface MenuProcInter {

  /**
   * �޴� ���
   */
  public int create(MenuVO menuVO);
  
  /**
   * �޴� ��ȸ
   */
  public List<MenuVO> read(int restno);
  
  /**
   * �޴� ����
   */
  public int update(MenuVO menuVO);
}