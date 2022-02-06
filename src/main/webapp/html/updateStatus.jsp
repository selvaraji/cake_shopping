<%@ page import = "com.aspire.cake.database.LoginDao" import = "com.aspire.cake.bean.GetProducts" language="java" contentType="text/html; charset=ISO-8859-1"
    import = "java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <% String orderId = request.getParameter("update");
     String status =request.getParameter(orderId);
    System.out.println(orderId+status);
    LoginDao loginDao = new LoginDao();
	loginDao.loadDriver(loginDao.databaseDriver);
	String query = "UPDATE ORDERS SET STATUS = '"+status+"' WHERE ORDERID='"+orderId+"';";
	Connection connection = loginDao.getConnection();
	Statement statement;
	statement = connection.createStatement();
	statement.execute(query);
	
    %>
    
     	<script>
     			alert("Updated");
     			window.location.href = "../html/orders.jsp";</script>