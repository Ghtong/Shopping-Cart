package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.RegisterDAO;
import Module.CustomerBean;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("full_name");
        String email = request.getParameter("email_address");
        CustomerBean cust = new CustomerBean(fullname, username, password, email);
        RegisterDAO.add(cust);
    	RequestDispatcher rd=request.getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
 
        out.close();
	}
	
}
