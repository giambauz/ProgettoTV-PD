package com.betacom.trevisopadova.architecture.dbaccess;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBAccess {
	private static Connection conn;
	
	public static Connection getConnection() throws IOException, ClassNotFoundException {
		try {
			ClassLoader cl = Thread.currentThread().getContextClassLoader();
			InputStream input = cl.getResourceAsStream("properties/config.properties");
			Properties p = new Properties();
			p.load(input);
			Class.forName(p.getProperty("jdbcDriver"));
			conn = DriverManager.getConnection(p.getProperty("jdbcURL"),p.getProperty("username"), p.getProperty("password"));
		}catch(SQLException sql) {
			sql.printStackTrace();
			System.out.println(sql.getMessage());
		}
		return conn;
	}
	
	public static void closeConnection() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
