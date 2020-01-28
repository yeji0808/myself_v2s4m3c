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
   * 기본 생성자
   */
  public CalendarDAO() {
    dbopen = new DBOpen();
    dbclose = new DBClose();
  }

  /**
   * 한건의 데이터를 추가합니다.
   * @param dto 저장할 객체
   * @return 1: 추가 성공, 2: 추가 실패
   * @throws SQLException
   *           DBMS Error
   */
  public int create(CalendarDTO dto) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null; // SQL 실행 객체
    ResultSet rs = null; // SELECT 결과 저장 객체
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

    // 추가한 레코드의 1이 retVal 변수에 저장
    count = pstmt.executeUpdate();

    dbclose.close(con, pstmt, rs);

    return count; // 1 or 0
  }

  /**
   * 페이지와 그룹번호에 의해서 전체 목록을 가져옵니다.
   * @throws SQLException
   */
  public ArrayList<CalendarDTO> list(int somoimno) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null;
    ArrayList<CalendarDTO> list = null; // dto 목록을 저장

    list = new ArrayList<CalendarDTO>();

    sql = new StringBuffer();

    sql.append(" SELECT calendarno, labeldate, label, title, content, cnt, regdate ");
    sql.append(" FROM calendar");
    sql.append(" WHERE somoimno=?");
    sql.append(" ORDER BY calendarno DESC");

    pstmt = con.prepareStatement(sql.toString());
    pstmt.setInt(1, somoimno);    
    
    rs = pstmt.executeQuery(); // SELECT 쿼리 실행

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
   * 달력 날짜에 해당하는 레코드를 추출합니다.
   * 
   * @param pdsgrpno
   *          그룹번호
   * @return 검색 목록
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

    rs = pstmt.executeQuery(); // SELECT 쿼리 실행
    
    while (rs.next() == true) {
      CalendarDTO dto = new CalendarDTO();

      dto.setSomoimno(rs.getInt("somoimno"));
      dto.setCalendarno(rs.getInt("calendarno"));// DBMS --> JAVA
      dto.setLabeldate(rs.getString("labeldate")); // 달력 출력용 날짜
      dto.setLabel(rs.getString("label")); // 출력할 문자열

      list.add(dto);

    }

    dbclose.close(con, pstmt, rs);

    return list;
  }
  
  /**
   * 글번호를 이용하여 글을 가져옵니다.
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
    pstmt.setInt(1, calendarno); // 첫번째 ?표로 글번호를 할당

    rs = pstmt.executeQuery();

    if (rs.next()) { // 레코드 포인터를 첫번째 레코드로 이동
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
   * 글을 수정합니다.
   * 
   * @param dto
   *          글 객체
   * @return 1: 성공적으로 수정, 0: 수정 실패
   */
  public int update(CalendarDTO dto) throws SQLException {
    Connection con = dbopen.getConnection();
    PreparedStatement pstmt = null;
    StringBuffer sql = null;

    int cnt = 0; // 수정한 레코드 갯수 저장

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
   * 하나의 데이터를 삭제합니다.
   * 
   * @return 정상적인 삭제는 true를 실패는 false를 리턴합니다.
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

    // 삭제한 레코드의 수 저장
    cnt = pstmt.executeUpdate();

    dbclose.close(con, pstmt);

    return cnt;

  }
}


