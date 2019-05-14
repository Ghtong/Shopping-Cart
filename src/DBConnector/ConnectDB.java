package DBConnector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	public static Connection connect() {
		String driver = "com.mysql.cj.jdbc.Driver";
	    String connection = "jdbc:mysql://localhost:3306/project1?allowPublicKeyRetrieval=true&useSSL=false";
	    String username = "root";
	    String password = "root";
	    try {
			Class.forName(driver);
		} catch (ClassNotFoundException e2) {
			System.out.println(e2);
		}
	    Connection con = null;
		try {
			con = DriverManager.getConnection(connection, username, password);
		} catch (SQLException e2) {
			System.out.println(e2);
		}
		return con;
	} 
}
