package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnector.ConnectDB;
import Module.CustomerBean;

public class LoginDAO {
	static Connection con = ConnectDB.connect();
	static PreparedStatement preRead;
	public static int getCustId(String username) {
		int custId = 0;
		try {
			preRead = con.prepareStatement("select * from customer where username = ?;");
			preRead.setString(1, username);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				custId = rs.getInt("cust_id");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return custId;
	}
	public static List<CustomerBean> getCustomer() {
		List<CustomerBean> custList = new ArrayList<>();
		try {
			preRead = con.prepareStatement("select * from customer;");
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				CustomerBean cust = new CustomerBean();
				int custId = rs.getInt("cust_id");
				String name = rs.getString("name");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String email = rs.getString("email");
				cust.setCustId(custId);
				cust.setName(name);
				cust.setUsername(username);
				cust.setPassword(password);
				cust.setEmail(email);
				custList.add(cust);
			}
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
		return custList;
	}
	
	public static void delete (int custId) {
		try {
			preRead = con.prepareStatement("delete from customer where cust_id = ?;");
			preRead.setInt(1, custId);
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
