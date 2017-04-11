package cn.edu.dhu;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

public class DB {
	
	private static Connection conn = null;
	private static int num;
	
	public static Connection getConn(){		
		try {
			String url = "jdbc:mysql://localhost:3306/jsgl";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, "root", "guanyanran");
			return conn;

		} catch (Exception e) {
			System.err.println("数据库连接异常:" + e.getMessage());
			return null;
		}
	}
	
	public static Statement createStmt(Connection conn){
		Statement stmt = null;
		try {
			stmt= conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	//注册
	public static int executeUpdate(Statement stmt, String sql){
		try {
			num = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return num;		
	}
	
	public static ResultSet executeQuery(Statement stmt,String sql) {
		ResultSet rs =null;
		try {
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static void close(Connection conn) {
		if(conn !=null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn=null;
		}
	}
	
	public static void close(Statement stmt) {
		if(stmt !=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			stmt=null;
		}
	}
	
	public static void close(ResultSet rs) {
		if(rs !=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			rs=null;
		}
	}
}
