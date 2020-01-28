package nation.web.calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import nation.web.tool.DBClose;
import nation.web.tool.DBOpen;

public class CalendarDAO {
  private DBOpen dbopen = null;
  private DBClose dbclose = null;

  /**
   * �⺻ ������
   */
  public CalendarDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * �Ѱ��� �����͸� �߰��մϴ�.
   * @param dto ������ ��ü
   * @return 1: �߰� ����, 2: �߰� ����
   * @throws SQLException
   *           DBMS Error
   */
  public int create(CalendarDTO dto) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null; // SQL ���� ��ü
    ResultSet rs = null; // SELECT ��� ���� ��ü
    int count = 0;

    StringBuffer sql = new StringBuffer();

    // MySQL
    sql.append(" INSERT INTO calendar(calendarno,");
    sql.append("                             somoimno, labeldate, label, title, content, cnt, regdate)");
    sql.append(" VALUES((SELECT NVL(MAX(calendarno), 0)+1 as calendarno FROM calendar),");
    sql.append("            ?, ?, ?, ?, ?, 0, sysdate)");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, dto.getSomoimno());
    pstmt.setString(2, dto.getLabeldate());
    pstmt.setString(3, dto.getLabel());
    pstmt.setString(4, dto.getTitle());
    pstmt.setString(5, dto.getContent());

    // �߰��� ���ڵ��� 1�� retVal ������ ����
    count = pstmt.executeUpdate();

    dbclose.close(con, pstmt, rs);

    return count; // 1 or 0
  }

  /**
   * �������� �׷��ȣ�� ���ؼ� ��ü ����� �����ɴϴ�.
   * @throws SQLException
   */
  public ArrayList<CalendarDTO> list(int somoimno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null;
    ArrayList<CalendarDTO> list = null; // dto ����� ����

    list = new ArrayList<CalendarDTO>();

    sql = new StringBuffer();

    sql.append(" SELECT calendarno, labeldate, label, title, content, cnt, regdate ");
    sql.append(" FROM calendar");
    sql.append(" WHERE somoimno=?");
    sql.append(" ORDER BY calendarno DESC");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, somoimno);    
    
    rs = pstmt.executeQuery(); // SELECT ���� ����

    while (rs.next() == true) {
      CalendarDTO dto = new CalendarDTO();

      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setLabeldate(rs.getString("labeldate"));
      dto.setLabel(rs.getString("label"));
      dto.setTitle(rs.getString("title"));
      dto.setContent(rs.getString("content"));
      dto.setCnt(rs.getInt("cnt"));
      dto.setRegdate(rs.getString("regdate"));

      list.add(dto);

    }

    dbclose.close(con, pstmt, rs);

    return list;
  }

  /**
   * �޷� ��¥�� �ش��ϴ� ���ڵ带 �����մϴ�.
   * 
   * @param pdsgrpno
   *          �׷��ȣ
   * @return �˻� ���
   * @throws SQLException
   */
  public ArrayList<CalendarDTO> listLabel(String date, int somoimno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = new StringBuffer();
    ArrayList<CalendarDTO> list = new ArrayList<CalendarDTO>();

    sql.append(" SELECT somoimno, calendarno, labeldate, label");
    sql.append(" FROM calendar");
    sql.append(" WHERE labeldate=? AND somoimno=?");  // 2019-12-25
    
    pstmt = con.prepareStatement(sql.toString());
    pstmt.setString(1, date);
    pstmt.setInt(2, somoimno);

    rs = pstmt.executeQuery(); // SELECT ���� ����
    
    while (rs.next() == true) {
      CalendarDTO dto = new CalendarDTO();

      dto.setSomoimno(rs.getInt("somoimno"));
      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setLabeldate(rs.getString("labeldate")); // �޷� ��¿� ��¥
      dto.setLabel(rs.getString("label")); // ����� ���ڿ�

      list.add(dto);

    }

    dbclose.close(con, pstmt, rs);

    return list;
  }
  
  /**
   * �۹�ȣ�� �̿��Ͽ� ���� �����ɴϴ�.
   */
  public CalendarDTO read(int calendarno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null;

    CalendarDTO dto = null;

    sql = new StringBuffer();

    sql.append(" SELECT calendarno, labeldate, label, title, content, cnt, regdate ");
    sql.append(" FROM calendar");
    sql.append(" WHERE calendarno=?");
    
    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, calendarno); // ù��° ?ǥ�� �۹�ȣ�� �Ҵ�

    rs = pstmt.executeQuery();

    if (rs.next()) { // ���ڵ� �����͸� ù��° ���ڵ�� �̵�
      dto = new CalendarDTO();

      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setLabeldate(rs.getString("labeldate"));
      dto.setLabel(rs.getString("label"));
      dto.setTitle(rs.getString("title"));
      dto.setContent(rs.getString("content"));
      dto.setCnt(rs.getInt("cnt"));
      dto.setRegdate(rs.getString("regdate"));

    }

    dbclose.close(con, pstmt, rs);

    return dto;
  }

  /**
   * ���� �����մϴ�.
   * 
   * @param dto
   *          �� ��ü
   * @return 1: ���������� ����, 0: ���� ����
   */
  public int update(CalendarDTO dto) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    StringBuffer sql = null;

    int cnt = 0; // ������ ���ڵ� ���� ����

    sql = new StringBuffer();
    sql.append(" UPDATE calendar");
    sql.append(" SET labeldate=?, label=?, title=?, content=?");
    sql.append(" WHERE calendarno = ?");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setString(1, dto.getLabeldate());
    pstmt.setString(2, dto.getLabel());
    pstmt.setString(3, dto.getTitle());
    pstmt.setString(4, dto.getContent());
    pstmt.setInt(5, dto.getCalendarno());

    cnt = pstmt.executeUpdate();

    dbclose.close(con, pstmt);

    return cnt;
  }

  /**
   * �ϳ��� �����͸� �����մϴ�.
   * 
   * @return �������� ������ true�� ���д� false�� �����մϴ�.
   */
  public int delete(int calendarno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    StringBuffer sql = null;

    int cnt = 0;

    sql = new StringBuffer();
    sql.append(" DELETE FROM calendar");
    sql.append(" WHERE calendarno = ?");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, calendarno);

    // ������ ���ڵ��� �� ����
    cnt = pstmt.executeUpdate();

    dbclose.close(con, pstmt);

    return cnt;

  }
}


