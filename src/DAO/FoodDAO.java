package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnector.ConnectDB;
import Module.FoodBean;

public class FoodDAO {
	static Connection con = ConnectDB.connect();
	static PreparedStatement preRead;
	public static int getFoodId(String foodname) {
		int foodId = 0;
		try {
			preRead = con.prepareStatement("select * from item_details where item_name = ?;");
			preRead.setString(1, foodname);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				foodId = rs.getInt("item_id");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return foodId;
	}
	public static int getFoodPrice(String foodname) {
		int foodPrice = 0;
		try {
			preRead = con.prepareStatement("select * from item_details where item_name = ?;");
			preRead.setString(1, foodname);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				foodPrice = rs.getInt("price");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return foodPrice;
	}
	public static List<String> getFoodName() {
		List<String> foodNameList = new ArrayList<>();
		try {
			preRead = con.prepareStatement("select item_name from item_details;");
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				String foodName = rs.getString("item_name");
				foodNameList.add(foodName);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return foodNameList;
	}
	public static List<FoodBean> getFood() {
		List<FoodBean> foodList = new ArrayList<>();
		try {
			preRead = con.prepareStatement("select * from item_details;");
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				FoodBean food = new FoodBean();
				int itemId = rs.getInt("item_id");
				String itemName = rs.getString("item_name");
				String img = rs.getString("img");
				int price = rs.getInt("price");
				int categoryId = rs.getInt("category_id");
				int count = rs.getInt("item_count");
				food.setItemId(itemId);
				food.setItemName(itemName);
				food.setImg(img);
				food.setPrice(price);
				food.setCategoryId(categoryId);
				food.setItemCount(count);
				foodList.add(food);
			}
		} catch (SQLException e) {
			System.out.println(e);
		} 
		return foodList;
	}
	public static void add(FoodBean food) {
		try {
			preRead = con.prepareStatement("insert into item_details (item_name,img,price,category_id,item_count) values (?,?,?,?,?);");
			preRead.setString(1, food.getItemName());
			preRead.setString(2, food.getImg());
			preRead.setInt(3, food.getPrice());
			preRead.setInt(4, food.getCategoryId());
			preRead.setInt(5, food.getItemCount());
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
	public static void delete(int foodId) {
		try {
			preRead = con.prepareStatement("delete from item_details where item_id = ?;");
			preRead.setInt(1, foodId);
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
	public static int getStock(int foodId) {
		int stock = 0;
		try {
			preRead = con.prepareStatement("select item_count from item_details where item_id = ?;");
			preRead.setInt(1, foodId);
			ResultSet rs = preRead.executeQuery();
			while (rs.next()) {
				stock = rs.getInt("item_count");
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		return stock;
	}
	public static void deleteByFoodId(int foodId) {
		try {
			preRead = con.prepareStatement("delete from item_details where item_id = ?;");
			preRead.setInt(1, foodId);
			preRead.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	public static void updateStock(int newStock, int foodId) {
		try {
			preRead = con.prepareStatement("update item_details set item_count = ? where item_id = ?;");
			preRead.setInt(1, newStock);
			preRead.setInt(2, foodId);
			preRead.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
}
