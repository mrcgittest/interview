package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DatabaseConnection {
	
	public DatabaseConnection() {
		loadDriver();
	}
	
	public Connection getDatabaseConnection() {
		Connection dbCon = null;
		
		Properties prop = new Properties();
		prop.put("user", "zach");
		prop.put("password", "meyers2020");
		
		try {
			dbCon = DriverManager.getConnection("jdbc:mysql://104.12.156.217/salesdata", prop);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dbCon;
	}
	
	private void loadDriver() {
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (Exception ex) {
        	ex.printStackTrace();
        }
	}

}
