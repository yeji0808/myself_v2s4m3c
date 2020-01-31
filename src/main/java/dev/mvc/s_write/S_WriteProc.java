package dev.mvc.s_write;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.s_write.WriteProc")
public class S_WriteProc implements S_WriteProcInter {
  @Autowired
  private S_WriteDAOInter writeDAO;

  @Override
  public int create(S_WriteVO writeVO) {
    int count = writeDAO.create(writeVO);
    return count;
  }

  @Override
  public List<S_WriteVO> list_by_somoimno(int somoimno) {
    List<S_WriteVO> list = writeDAO.list_by_somoimno(somoimno);
    return list;
  }

  @Override
  public S_WriteVO read(int writeno) {
    S_WriteVO writeVO = writeDAO.read(writeno);
    return writeVO;
  }

  @Override
  public int update(S_WriteVO writeVO) {
    int count = writeDAO.update(writeVO);
    return count;
  }

  @Override
  public int delete(int writeno) {
    int count = writeDAO.delete(writeno);
    return count;
  }

  @Override
  public int count_by_somoimno(int somoimno) {
    int count = writeDAO.count_by_somoimno(somoimno);
    return count;
  }

  @Override
  public int delete_by_somoimno(int somoimno) {
    int count = writeDAO.delete_by_somoimno(somoimno);
    return count;
  }

  /**
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� ���� ������: 11 / 22 [����] 11 12 13 14 15 16 17
   * 18 19 20 [����]
   *
   * @param listFile     ��� ���ϸ�
   * @param somoimno    �Ҹ��ӹ�ȣ
   * @param search_count �˻�(��ü) ���ڵ��
   * @param nowPage      ���� ������
   * @param word         �˻���
   * @return ����¡ ���� ���ڿ�
   */
  @Override
  public String pagingBox(String listFile, int somoimno, int search_count, int nowPage, String word) {
    int totalPage = (int) (Math.ceil((double) search_count / S_Write.RECORD_PER_PAGE)); // ��ü ������
    int totalGrp = (int) (Math.ceil((double) totalPage / S_Write.PAGE_PER_BLOCK));// ��ü �׷�
    int nowGrp = (int) (Math.ceil((double) nowPage / S_Write.PAGE_PER_BLOCK)); // ���� �׷�
    int startPage = ((nowGrp - 1) * S_Write.PAGE_PER_BLOCK) + 1; // Ư�� �׷��� ������ ��� ����
    int endPage = (nowGrp * S_Write.PAGE_PER_BLOCK); // Ư�� �׷��� ������ ��� ����

    StringBuffer str = new StringBuffer();

    str.append("<style type='text/css'>");
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}");
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}");
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}");
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}");
    str.append("  .span_box_1{");
    str.append("    text-align: center;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/");
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/");
    str.append("  }");
    str.append("  .span_box_2{");
    str.append("    text-align: center;");
    str.append("    background-color: #668db4;");
    str.append("    color: #FFFFFF;");
    str.append("    font-size: 1em;");
    str.append("    border: 1px;");
    str.append("    border-style: solid;");
    str.append("    border-color: #cccccc;");
    str.append("    padding:1px 6px 1px 6px; /*��, ������, �Ʒ�, ����*/");
    str.append("    margin:1px 2px 1px 2px; /*��, ������, �Ʒ�, ����*/");
    str.append("  }");
    str.append("</style>");
    str.append("<DIV id='paging'>");
//    str.append("���� ������: " + nowPage + " / " + totalPage + "  "); 

    // ���� 10�� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // ���� 2�׷��� ���: (2 - 1) * 10 = 1�׷��� 10
    // ���� 3�׷��� ���: (3 - 1) * 10 = 2�׷��� 20
    int _nowPage = (nowGrp - 1) * S_Write.PAGE_PER_BLOCK;
    if (nowGrp >= 2) {
      str.append("<span class='span_box_1'><A href='" + listFile + "?&word=" + word + "&nowPage=" + _nowPage
          + "&somoimno=" + somoimno + "'>����</A></span>");
    }

    for (int i = startPage; i <= endPage; i++) {
      if (i > totalPage) {
        break;
      }

      if (nowPage == i) {
        str.append("<span class='span_box_2'>" + i + "</span>"); // ���� ������, ����
      } else {
        // ���� �������� �ƴ� ������
        str.append("<span class='span_box_1'><A href='" + listFile + "?word=" + word + "&nowPage=" + i + "&somoimno="
            + somoimno + "'>" + i + "</A></span>");
      }
    }

    // 10�� ���� �������� �̵�
    // nowGrp: 1 (1 ~ 10 page), nowGrp: 2 (11 ~ 20 page), nowGrp: 3 (21 ~ 30 page)
    // ���� 1�׷��� ���: (1 * 10) + 1 = 2�׷��� 11
    // ���� 2�׷��� ���: (2 * 10) + 1 = 3�׷��� 21
    _nowPage = (nowGrp * S_Write.PAGE_PER_BLOCK) + 1;
    if (nowGrp < totalGrp) {
      str.append("<span class='span_box_1'><A href='" + listFile + "?&word=" + word + "&nowPage=" + _nowPage
          + "&somoimno=" + somoimno + "'>����</A></span>");
    }
    str.append("</DIV>");

    return str.toString();
  }

  @Override
  public ArrayList<S_WriteVO> list_by_somoimno_search_paging(HashMap<String, Object> map) {
    /*
     * ���������� ����� ���� ���ڵ� ��ȣ ��� ���ذ�, nowPage�� 1���� ���� 1 ������: nowPage = 1, (1 - 1) * 10
     * --> 0 2 ������: nowPage = 2, (2 - 1) * 10 --> 10 3 ������: nowPage = 3, (3 - 1) *
     * 10 --> 20
     */
    int beginOfPage = ((Integer) map.get("nowPage") - 1) * S_Write.RECORD_PER_PAGE;

    // ���� rownum, 1 ������: 1 / 2 ������: 11 / 3 ������: 21
    int startNum = beginOfPage + 1;
    // ���� rownum, 1 ������: 10 / 2 ������: 20 / 3 ������: 30
    int endNum = beginOfPage + S_Write.RECORD_PER_PAGE;
    /*
     * 1 ������: WHERE r >= 1 AND r <= 10 2 ������: WHERE r >= 11 AND r <= 20 3 ������: WHERE
     * r >= 21 AND r <= 30
     */
    map.put("startNum", startNum);
    map.put("endNum", endNum);

    ArrayList<S_WriteVO> list = writeDAO.list_by_somoimno_search_paging(map);

    return list;
  }

  @Override
  public int search_count(HashMap hashMap) {
    int count = writeDAO.search_count(hashMap);
    return count;
  }

}
