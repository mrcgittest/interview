package database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DatabaseHandler {
	private DatabaseConnection conn;
	
	public DatabaseHandler() {
		conn = new DatabaseConnection();
	}
	
	public Result exec(String command, Properties prop) {
		if(command == null) {
			return null;
		}
		
		Connection dbCon = null;
		
		dbCon = conn.getDatabaseConnection();
		
		Result res = null;
		
		try {
			if(command.equals("QUERY_DATA")) {
				String query = "select * from customers";
				
				Statement stmt = dbCon.createStatement();
				
				ResultSet rs = stmt.executeQuery(query);
				
				StringBuilder customerNums = new StringBuilder();
				StringBuilder customerNames = new StringBuilder();
				StringBuilder amountsDue = new StringBuilder();
				
				while(rs.next()) {
					String customerNumber = rs.getString("CNUM");
					String customerName = rs.getString("CNAME");
					String amountDue = rs.getString("AMTDU");
					
					if(customerNums.length() > 0) {
						customerNums.append(":");
					}
					
					if(customerNames.length() > 0) {
						customerNames.append(":");
					}
					
					if(amountsDue.length() > 0) {
						amountsDue.append(":");
					}
					
					customerNums.append(customerNumber);
					customerNames.append(customerName);
					amountsDue.append(amountDue);
				}
				
				Properties retProp = new Properties();
				retProp.put("customerNumbers", customerNums.toString());
				retProp.put("customerNames", customerNames.toString());
				retProp.put("amountsDue", amountsDue.toString());
				
				res = new Result(retProp);
				
				stmt.close();
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return new Result(1);
		}
		
		return res;
	}
}
