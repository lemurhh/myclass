import java.sql.*;
public class MySQL {
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/student";
    static final String USER = "root";
    static final String PASSWORD = "chusan1976.";

    private Connection conn = null;
    private Statement stmt = null;

    MySQL() {
	try {
	    Class.forName(JDBC_DRIVER);
	    conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
	    stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	}
	catch(Exception e) {
	    System.out.println(e);
	}
    }

    public ResultSet executeQuery(String str) {
	ResultSet re = null;
	try {
	    re =  stmt.executeQuery(str);
	}
	catch(SQLException e) {
	    System.out.println(e);
	}
	finally {
	    return re;
	}	   
    }
    public int executeUpdate(String str) {
	int re = 0;
	try {
	    re = stmt.executeUpdate(str);
	}
	catch(SQLException e) {
	    System.out.println(e);
	}
	finally {
	    return re;
	}
    }
    public void close() {
	try {
	    conn.close();
	}
	catch(SQLException e) {
	}
    }
}
    
	
    
    
