package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;
import DAO.FoodDAO;

@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		int custId = Integer.parseInt(session.getAttribute("custId").toString());
		List<Integer> foodList = CartDAO.getFoodList(custId);
		List<Integer> countList = CartDAO.getCountList(custId);
		List<Integer> stockList = new ArrayList<>();
		for (int i = 0; i < foodList.size(); ++i) {
			int stock = FoodDAO.getStock(foodList.get(i));
			stockList.add(stock);
		}
		List<Integer> newStockList = new ArrayList<>();
		for (int i = 0; i < countList.size(); ++i) {
			int newStock = (stockList.get(i) - countList.get(i));
			newStockList.add(newStock);
		}
		for (int i = 0; i < newStockList.size(); ++i) {
			int newStock = newStockList.get(i);
			int foodId = foodList.get(i);
			FoodDAO.updateStock(newStock, foodId);
		}
		CartDAO.deleteByCustId(custId);
		RequestDispatcher rd=req.getRequestDispatcher("/checkout.jsp");
		rd.include(req, resp);
	}
	
}
