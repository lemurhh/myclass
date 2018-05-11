import java.sql.*;
public class Student {
    private static MySQL handler = new MySQL();
    private static String table = "student";
    private long id;
    private String name;
    private String number;
    private String sex;
    private String className;

    Student(String name, String number, String sex, String className) {
	this.name = name;
	this.number = number;
	this.sex = sex;
	this.className = className;
    }
    static ResultSet searchByname(String name) {
	String sql = "SELECT * FROM "+table+" WHERE name="+"'"+name+"'";
	return handler.executeQuery(sql);
    }
    static ResultSet searchByNumber(String number) {
	String sql = "SELECT * FROM "+table+" WHERE number="+"'"+number+"'";
	return handler.executeQuery(sql);
    }
    static ResultSet searchBySex(String sex) {
	String sql = "SELECT * FROM "+table+" WHERE sex="+"'"+sex+"'";
	return handler.executeQuery(sql);
    }
    static ResultSet searchByClassName(String className) {
	String sql = "SELECT * FROM "+table+" WHERE clasName="+"'"+className+"'";
	return handler.executeQuery(sql);
    }
    public void insert() {
	String sql = "INSERT INTO "+table+" (name, sex, number, className) VALUES("+"'"+name+"'"+","+"'"+sex+"'"+","+"'"+number+"'"+","+"'"+className+"'"+")";
	handler.executeUpdate(sql);
    }
    public void delete() {
	String sql = "DELETE FROM "+table+" WHERE number="+"'"+number+"'";
	handler.executeUpdate(sql);
    }
    public void update(String name, String number, String sex, String className) {
	String sql = "UPDATE "+table+" SET name="+"'"+name+"'"+","+"number="+"'"+number+"'"+","+"sex="+"'"+sex+"'"+","+"className="+"'"+className+"'"+" WHERE number="+"'"+this.number+"'";
	handler.executeUpdate(sql);
	this.name = name;
	this.number = number;
	this.sex = sex;
	this.className = className;
    }
	
    
}
    
