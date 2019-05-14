package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.FoodDAO;

@WebServlet("/getallfood")
public class GetAllFoodServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<String> foodNameList = FoodDAO.getFoodName();
		Gson gson = new Gson();
		String s = gson.toJson(foodNameList);
		resp.getWriter().write(s);
	}
	
}
