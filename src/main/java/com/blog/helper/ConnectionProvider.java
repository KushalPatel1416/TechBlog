package com.blog.helper;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection(){
		try {
		
		if(con==null) {
			//Driver
			Class.forName("com.mysql.jdbc.Driver");
			
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","happysql754516");
		
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
