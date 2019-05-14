package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;
import DAO.FoodDAO;

@WebServlet("/updatecart")
public class UpdateCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		int newCount = Integer.parseInt(req.getParameter("newCount"));
		int custId = Integer.parseInt(session.getAttribute("custId").toString());
		String foodName = req.getParameter("foodName");
		int foodId = FoodDAO.getFoodId(foodName);
		int stock = FoodDAO.getStock(foodId);
		if (newCount <= stock) {
			CartDAO.update(newCount, custId, foodId);
//			int price = FoodDAO.getFoodPrice(foodName);
//			int subTotal = newCount * price;
			int total = CartDAO.getTotal(custId);
			String result = newCount + "," + total;
			out.print(result);
		}
		else {
			out.print("No enough in stock");
			RequestDispatcher rd=req.getRequestDispatcher("/cart.jsp");
			rd.include(req, resp);
		}
	}
	
}
