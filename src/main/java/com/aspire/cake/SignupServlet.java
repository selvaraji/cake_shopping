package com.aspire.cake;

import java.io.IOException;

import com.aspire.cake.database.LoginDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SignupServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("Pass");
		String age = request.getParameter("age");
		String phoneNumber = request.getParameter("phoneNumber");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		LoginDao loginDao = new LoginDao();
		loginDao.signup(email, password, name, age, phoneNumber, address,"test","xxxx","user","test");
		
		response.sendRedirect("index.jsp");
	}

}
