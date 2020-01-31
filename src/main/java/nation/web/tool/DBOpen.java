package nation.web.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
  /*
   * public Connection getConnection() { Connection con = null; // DBMS ���� //
   * String className = "org.gjt.mm.mysql.Driver"; // MySQL ���� Drvier // String
   * url =
   * "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr";
   * String className = "oracle.jdbc.driver.OracleDriver"; // Oracle ���� Drvier //
   * String url = "jdbc:oracle:thin:@localhost:1521:XE"; String url =
   * "jdbc:oracle:thin:@127.0.0.1:1521:XE";
   * 
   * String user = "ai"; String password = "1234";
   * 
   * try { // blog_v2jq �� web.xml�� registerPool ������ ���̾�� �� //
   * <param-name>registerPool</param-name> <!-- ������ --> //
   * <param-value>blog_v2jc</param-value> <!-- ������ --> String poolName =
   * "jdbc:apache:commons:dbcp:calendar_v3jc"; con =
   * DriverManager.getConnection(poolName); System.out.println("DBCP: " +
   * con.hashCode()); } catch (SQLException e) { e.printStackTrace(); }
   * 
   * return con; }
   */

  public Connection getConnection() {
    Connection con = null; // DBMS ����
    // String className = "org.gjt.mm.mysql.Driver"; // MySQL ���� Drvier
    // String url =
    // "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=euckr";
    String className = "oracle.jdbc.driver.OracleDriver"; // Oracle ���� Drvier
    // String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";

    String user = "ai";
    String password = "1234";

    try {
      Class.forName(className);
      // con = new Connection(... ) // ERROR
      con = DriverManager.getConnection(url, user, password); // Oracle ����
      System.out.println("Normal: " + con.hashCode());
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      e.printStackTrace();
    }

    return con;
  }

}
