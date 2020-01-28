package dev.mvc.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//빈의 이름 지정
@Component("dev.mvc.menu.MenuProc")
public class MenuProc implements MenuProcInter{
  @Autowired
  private MenuDAOInter menuDAO; 
  
  @Override
  public int create(MenuVO menuVO) {
    int count = menuDAO.create(menuVO);
    
    return count;
  }
 
  @Override
  public List<MenuVO> read(int restno) {
    List<MenuVO> menuVO = menuDAO.read(restno);
    
    return menuVO;
  }
  
  @Override
  public int update(MenuVO menuVO) {
    int count = menuDAO.update(menuVO);
    
    return count;
  }


}
