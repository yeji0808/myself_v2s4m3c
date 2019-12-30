package dev.mvc.atcfile;

import java.util.List;

public interface AtcfileDAOInter {

  public int create(AtcfileVO atcfileVO);
  
  public List<AtcfileVO> list();
  
  public List<AtcfileVO> list_by_writeno(int writeno);
  
  public int delete(int atcfileno);
  
  public int count_by_writeno(int writeno);
  
  public int delete_by_writeno(int writeno);
  
  public AtcfileVO read(int atcfileno);
  
}
