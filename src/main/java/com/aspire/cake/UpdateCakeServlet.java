package com.aspire.cake;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;


import com.aspire.cake.database.LoginDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/updateCake")
public class UpdateCakeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public UpdateCakeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID = request.getParameter("id");
		String price = "$"+request.getParameter("price");
		String weight = "$"+request.getParameter("weight");
		String stock = "$"+request.getParameter("stock");
		String title = "$"+request.getParameter("title");
		String description = "$"+request.getParameter("description");
		String photoURL = "$"+request.getParameter("photoURL");
		String info = "$"+request.getParameter("info");
		String keywords = "$"+request.getParameter("key");
		String query="";
		
		String[] array1 = {price, weight, stock, title, description, photoURL, info, keywords};
		String[] array2 = {"price", "weight", "stock", "title", "des", "url", "info","keywords"};
		
		LoginDao loginDao = new LoginDao();
		
		try {
			loginDao.loadDriver(loginDao.databaseDriver);
			
			Connection connection = loginDao.getConnection();
			Statement statement ;
			statement = connection.createStatement();
			for(int i=0;  i<array1.length; i++)
			{
				if(!array1[i].equals("$")) 
				{
					query = "UPDATE PRODUCT SET "+array2[i]+" = '"+array1[i].substring(1)+"' WHERE PRODUCTID = '"+productID+"';";
					statement.execute(query);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("html/admin.jsp");
	}

}
