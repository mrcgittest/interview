package database;

import java.util.Properties;

public class Result {
	private boolean result = false;
	private int errorCode;
	private Properties prop;
	
	public Result(Properties prop) {
		result = true;
		this.prop = prop;
	}
	
	public Result(int errorCode) {
		this.errorCode = errorCode;
	}
	
	public boolean getResult() {
		return result;
	}
	
	public Properties getProperties() {
		return prop;
	}
}
