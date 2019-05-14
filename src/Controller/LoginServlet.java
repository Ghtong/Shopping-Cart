package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDAO;
import Module.CustomerBean;

@WebServlet(urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		boolean flag = false;
		System.out.println("~~~~~~~~~");
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		System.out.println(username);
		System.out.println(password);
		if (username != null && password != null) {
			List<CustomerBean> custList = LoginDAO.getCustomer();
			for (int i = 0; i < custList.size(); ++i) {
				String nameInDB = custList.get(i).getUsername();
				String passwordInDB = custList.get(i).getPassword();
				if (username.equals(nameInDB) && password.equals(passwordInDB)) {
					flag = true;
					break;
				}
			}
			if (flag) {
				resp.getWriter().write("1");
			} else {
//				String s = "invalid username and password";
//				out.print(s);
//				RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
//				rd.include(req, resp);
				resp.getWriter().write("0");
			}
		}
		else {
//			String s = "invalid username and password";
//			out.print(s);
//			RequestDispatcher rd=req.getRequestDispatcher("/login.jsp");
//			rd.include(req, resp);
			resp.getWriter().write("0");
		}
	}
	
}
