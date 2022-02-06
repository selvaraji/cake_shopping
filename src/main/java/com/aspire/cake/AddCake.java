package com.aspire.cake;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.aspire.cake.database.LoginDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addCake")
public class AddCake extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCake() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String productID = request.getParameter("productID");
		String price = request.getParameter("price");
		String weight = request.getParameter("weight");
		String stock = request.getParameter("stock");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String photoURL = request.getParameter("photoURL");
		String info = request.getParameter("info");
		String category = request.getParameter("category");
		
		LoginDao loginDao = new LoginDao();
		
		try {
			loginDao.loadDriver(loginDao.databaseDriver);
			String query = "INSERT INTO PRODUCT VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			Connection connection = loginDao.getConnection();
			PreparedStatement preparedStatement;
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, productID);
			preparedStatement.setString(2, price);
			preparedStatement.setString(3, weight);
			preparedStatement.setString(4, stock);
			preparedStatement.setString(5, title);
			preparedStatement.setString(6, description);
			preparedStatement.setString(7, photoURL);
			preparedStatement.setString(8, info);
			preparedStatement.setString(9, category);
			
			preparedStatement.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("html/admin.jsp");
	}

}
