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
import Module.CartBean;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		PrintWriter out = resp.getWriter();
		if (session.getAttribute("username") != null) {
			String img = req.getParameter("img");
			String itemName = req.getParameter("item_name");
			//String sPrice = req.getParameter("price");
			int price = FoodDAO.getFoodPrice(itemName);
			String sCount = req.getParameter("item_count");
			int stockCount = Integer.parseInt(sCount);
			int itemId = FoodDAO.getFoodId(itemName);
			int custId = Integer.parseInt(session.getAttribute("custId").toString());
			int buyCount = Integer.parseInt(req.getParameter("buy_count"));
			if (buyCount - stockCount > 0) {
				out.println("Sorry, we dont't have enough in inventory");
				RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
				rd.include(req, resp);
			} else {
				CartBean cart = new CartBean(custId, itemId, itemName, price, img, buyCount);
				CartDAO.addToCart(cart);
				RequestDispatcher rd=req.getRequestDispatcher("index.jsp");
				rd.forward(req, resp);
			}
		} else {
			out.println("Please login first");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		}
	}
	
}
