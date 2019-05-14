package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DBConnector.ConnectDB;
import Module.CustomerBean;

public class RegisterDAO {
	static Connection con = ConnectDB.connect();
	static PreparedStatement preRead;
	public static void add (CustomerBean cust) {
		try {
			preRead = con.prepareStatement("insert into customer (name,username,password,email) values (?,?,?,?);");
			preRead.setString(1, cust.getName());
			preRead.setString(2, cust.getUsername());
			preRead.setString(3, cust.getPassword());
			preRead.setString(4, cust.getEmail());
			preRead.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		} 
//		finally {
//			if (preRead != null)
//				try {
//					preRead.close();
//				} catch (SQLException e) {
//					System.out.println(e);
//				}
//			if (con != null)
//				try {
//					con.close();
//				} catch (SQLException e) {
//					System.out.println(e);
//				}
//		}
	}
}
