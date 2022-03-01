package com.aspire.cake;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.internet.*;
import com.aspire.cake.database.LoginDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.aspire.cake.bean.*;


@WebServlet("/checkOut")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email = request.getParameter("email");
		String query = "UPDATE USER SET CARTID = 'xxxx' where email = '"+email+"';";
		HttpSession ses = request.getSession();
		LoginDao loginDao = new LoginDao();
		loginDao.loadDriver(loginDao.databaseDriver);
		Connection connection = loginDao.getConnection();
		Statement statement1;
		try {
			statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
			statement1.execute(query);
			String query2 = "SELECT ORDERSID FROM USER WHERE EMAIL='"+email+"';";
			ResultSet resultSet = statement1.executeQuery(query2);
			String ordersID="";
			String order="";
			while(resultSet.next())
			{
				ordersID = resultSet.getString(1);
			}
			int left = 65;
			int right = 90;
			int length = 5;
			Random random = new Random();
			
			String temp =(String) ses.getAttribute("finalCart");
			String [] cartProducts = temp.split("@");
			for(String iter: cartProducts)
			{
				order = random.ints(left, right+1).limit(length).collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
				
				ordersID +="@"+order;
				ses.setAttribute("ordersID", ordersID);
				String query3 = "UPDATE USER SET ordersID = '"+ordersID+"' where email = '"+email+"';";
				statement1.execute(query3);
				String query4 = "INSERT INTO ORDERS VALUES('"+order+"','"+ses.getAttribute("name")+"','"+email+"','"+ses.getAttribute("phoneNumber")+"','"+ses.getAttribute("address")+"','"+iter+"','"+"PROCESSING"+"',' ', ' ');";
				statement1.execute(query4);
			}
			
			//
			Email mail = new Email();
			mail.sendMail(email, "Order Successfully placed("+ordersID+")");
			response.sendRedirect("html/orderPlaced.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
