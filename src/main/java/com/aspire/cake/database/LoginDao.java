package com.aspire.cake.database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginDao {
	
	 public String databaseDriver = "com.mysql.cj.jdbc.Driver";
	 public String databaseUserName = "root";
	 public String databasePassword = "tamilanda";
	 public String databaseURL = "jdbc:mysql://localhost:3377/web";
	
	public void loadDriver(String databaseDriver)
	{
		try {
			Class.forName(databaseDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(databaseURL, databaseUserName, databasePassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
	public void validate(String email, String password, HttpServletRequest request, HttpServletResponse response ) {
		loadDriver(databaseDriver);
		String query = "SELECT * FROM USER WHERE EMAIL = ? 	AND PASS = ?";
		Connection connection = getConnection();
		PreparedStatement preparedStatement;
		ResultSet resultSet = null;
		
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			
			resultSet = preparedStatement.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(resultSet.next())
			{
				if(resultSet.getString(9).equals("admin"))
				{
					response.sendRedirect("html/admin.jsp");
				}
				else
				{
					
					String name = resultSet.getString(3);
					String age = resultSet.getString(4);
					String phoneNumber = resultSet.getString(5);
					String ordersID = resultSet.getString(10);
					String address = resultSet.getString(6);
					String finalCart = resultSet.getString(8);
					
					HttpSession ses = request.getSession();
					ses.setAttribute("email", email);
					ses.setAttribute("name", name);
					ses.setAttribute("age", age);
					ses.setAttribute("phoneNumber", phoneNumber);
					ses.setAttribute("ordersID", ordersID);
					ses.setAttribute("address", address);
					response.sendRedirect("html/user.jsp");
					ses.setAttribute("finalCart", finalCart);

				}
			} 
			else
			{
				System.out.println("Invalid Data");
				response.sendRedirect("html/validate.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	} 
	
	public void signup(String email, String password, String name, String age, String phoneNumber, String address, String payment,String cart, String type, String order)
	{
		loadDriver(databaseDriver);
		String query = "INSERT INTO USER VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Connection connection = getConnection();
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			preparedStatement.setString(3, name);
			preparedStatement.setString(4, age);
			preparedStatement.setString(5, phoneNumber);
			preparedStatement.setString(6, address);
			preparedStatement.setString(7, payment);
			preparedStatement.setString(8, cart);
			preparedStatement.setString(9, type);
			preparedStatement.setString(10, order);
			
			
			preparedStatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public  String cartLoad(String email)
	{
		String cartIDData = "";
		String query1 = "SELECT CARTID FROM USER WHERE EMAIL = '"+email+"';";
		try {
			LoginDao loginDao = new LoginDao();
			loginDao.loadDriver(loginDao.databaseDriver);
			Connection connection = loginDao.getConnection();
			Statement statement1;
			statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
			ResultSet resultSet = statement1.executeQuery(query1);
			resultSet.first();
			cartIDData = resultSet.getString(1);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return cartIDData;
	}
	
}
