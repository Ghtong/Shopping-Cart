package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnector.ConnectDB;
import Module.CartBean;
import Module.FoodBean;

public class CartDAO {
	static Connection con = ConnectDB.connect();
	static PreparedStatement preRead;
	public static void addToCart(CartBean cart) {
		try {
			preRead = con.prepareStatement("insert into cart values (?,?,?,?,?,?);");
			preRead.setInt(1, cart.getCustId());
			preRead.setInt(2, cart.getItemId());
			preRead.setString(3, cart.getItemName());
			preRead.setInt(4, cart.getPrice());
			preRead.setString(5, cart.getImg());
			preRead.setInt(6, cart.getQuantity());
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
	public static List<CartBean> getCart(int custId) {
		List<CartBean> cartList = new ArrayList<>();
		try {
			preRead = con.prepareStatement("select * from cart where cust_id = ?;");
			preRead.setInt(1, custId);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				CartBean cart = new CartBean();
				int itemId = rs.getInt("item_id");
				String itemName = rs.getString("item_name");
				String img = rs.getString("img");
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				cart.setCustId(custId);
				cart.setItemId(itemId);
				cart.setItemName(itemName);
				cart.setImg(img);
				cart.setPrice(price);
				cart.setQuantity(count);
				cartList.add(cart);
			}
		} catch (SQLException e) {
			System.out.println(e);
		} 
		return cartList;
	}
	public static void delete(int custId, int foodId) {
		try {
			preRead = con.prepareStatement("delete from cart where cust_id = ? and item_id = ?;");
			preRead.setInt(1, custId);
			preRead.setInt(2, foodId);
			preRead.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	public static void update (int newCount, int custId, int foodId) {
		try {
			preRead = con.prepareStatement("update cart set count = ? where cust_id = ? and item_id = ?;");
			preRead.setInt(1, newCount);
			preRead.setInt(2, custId);
			preRead.setInt(3, foodId);
			preRead.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	public static int getTotal(int custId) {
		int total = 0;
		try {
			preRead = con.prepareStatement("select price, count from cart where cust_id = ?;");
			preRead.setInt(1, custId);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				int price = rs.getInt("price");
				int count = rs.getInt("count");
				total += price * count;
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return total;
	}
	public static void deleteByCustId(int custId) {
		try {
			preRead = con.prepareStatement("delete from cart where cust_id = ?;");
			preRead.setInt(1, custId);
			preRead.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	public static List<Integer> getFoodList(int custId) {
		List<Integer> foodList = new ArrayList<>();
		try {
			preRead = con.prepareStatement("select item_id from cart where cust_id = ?;");
			preRead.setInt(1, custId);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				int foodId = rs.getInt("item_id");
				foodList.add(foodId);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return foodList;
	}
	public static List<Integer> getCountList(int custId) {
		List<Integer> countList = new ArrayList<>();
		try {
			preRead = con.prepareStatement("select count from cart where cust_id = ?;");
			preRead.setInt(1, custId);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				int count = rs.getInt("count");
				countList.add(count);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return countList;
	}
}
