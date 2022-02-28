package com.aspire.cake;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.aspire.cake.database.LoginDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UserServlet() {
        super();

    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String cartID = request.getParameter("buynow");
		String addtoCartId = request.getParameter("addtocart");
		try 
		{
		if(!addtoCartId.equals(null))
		{
			HttpSession session = request.getSession();
			String email = (String) session.getAttribute("email");
			LoginDao loginDao = new LoginDao();
			loginDao.loadDriver(loginDao.databaseDriver);
			String cartIDData = "";
			String finalCart = "";
			String query1 = "SELECT CARTID FROM USER WHERE EMAIL = '"+email+"';";
			
			try {
				Connection connection = loginDao.getConnection();
				Connection connection2 = loginDao.getConnection();
				Statement statement1, statement2;
				statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
				statement2 = connection2.createStatement();
				ResultSet resultSet = statement1.executeQuery(query1);
				resultSet.first();
				cartIDData = resultSet.getString(1);
				
				if(cartIDData.equals("xxxx"))
				{
					finalCart = addtoCartId;
				}
				else
					finalCart = cartIDData+"@"+addtoCartId;
				String query2 = "UPDATE USER SET CARTID ='"+finalCart+"' where email = '"+email+"';";
				HttpSession ses = request.getSession();
				ses.setAttribute("finalCart", finalCart);
				statement2.execute(query2);
				String stock;
				String stockQuery1 = "SELECT STOCK FROM PRODUCT WHERE PRODUCTID = '"+addtoCartId+"';";//4
				ResultSet resultSetStock = statement1.executeQuery(stockQuery1);
				resultSetStock.first();
				stock = resultSetStock.getString(1);
				String stockQuery2 = "UPDATE PRODUCT SET STOCK ='"+(Integer.parseInt(stock)-1)+"' WHERE PRODUCTID = '"+addtoCartId+"';";
				statement2.execute(stockQuery2);
				
			} catch (Exception ea) {
				ea.printStackTrace();
			}

			response.sendRedirect("html/productView.jsp#popup1");
			return;
		}
			
		}
		catch(Exception e)
		{
			HttpSession session = request.getSession();
			
			String email = (String) session.getAttribute("email");
			LoginDao loginDao = new LoginDao();
			loginDao.loadDriver(loginDao.databaseDriver);
			String cartIDData = "";
			String finalCart = "";
			
			String query1 = "SELECT CARTID FROM USER WHERE EMAIL = '"+email+"';";
			
			try {
				Connection connection = loginDao.getConnection();
				Connection connection2 = loginDao.getConnection();
				Statement statement1, statement2;
				statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
				statement2 = connection2.createStatement();
				ResultSet resultSet = statement1.executeQuery(query1);
				resultSet.first();
				cartIDData = resultSet.getString(1);
				
				
				if(cartIDData.equals("xxxx") )
				{
					finalCart = cartID;
				}
				else
					finalCart = cartIDData+"@"+cartID;
				String query2 = "UPDATE USER SET CARTID ='"+finalCart+"' where email = '"+email+"';";
				HttpSession ses = request.getSession();
				ses.setAttribute("finalCart", finalCart);
				statement2.execute(query2);
				String stock;
				String stockQuery1 = "SELECT STOCK FROM PRODUCT WHERE PRODUCTID = '"+cartID+"';";//4
				ResultSet resultSetStock = statement1.executeQuery(stockQuery1);
				resultSetStock.first();
				stock = resultSetStock.getString(1);
				String stockQuery2 = "UPDATE PRODUCT SET STOCK ='"+(Integer.parseInt(stock)-1)+"' WHERE PRODUCTID = '"+cartID+"';";
				statement2.execute(stockQuery2);
			} catch (Exception ea) {
				ea.printStackTrace();
			}
			response.sendRedirect("html/cart.jsp");
		}
		
		
	}
	
	
}
