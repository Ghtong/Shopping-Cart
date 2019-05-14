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

@WebServlet("/deletecart")
public class DeleteCartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		int custId = Integer.parseInt(session.getAttribute("custId").toString());
		System.out.println(session.getAttribute("custId").toString());
		//String foodName = req.getParameter("foodName");
		//int foodId = FoodDAO.getFoodId(foodName);
		int foodId = Integer.parseInt(req.getParameter("deleteId"));
		System.out.println(foodId);
		System.out.println(foodId);
		CartDAO.delete(custId, foodId);
		int total = CartDAO.getTotal(custId);
		out.print(total);
	}
	
}