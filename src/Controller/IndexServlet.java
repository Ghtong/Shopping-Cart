package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.LoginDAO;

@WebServlet(urlPatterns="/index")
public class IndexServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		System.out.println("usernmae~~~~~~~: "+username);
		HttpSession session = req.getSession();
		session.setAttribute("username", username);
		session.setAttribute("custId", LoginDAO.getCustId(username));
		RequestDispatcher rd=req.getRequestDispatcher("/index.jsp");
		rd.include(req, resp); 
	}
	
}
