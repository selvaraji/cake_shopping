<%@ page import="com.aspire.cake.database.*" import="java.sql.*"
		language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%
LoginDao loginDao = new LoginDao();
loginDao.loadDriver(loginDao.databaseDriver);
String ordersID = request.getParameter("ordersID");
String querytext = request.getParameter("querytext");
String email = (String) session.getAttribute("email");

try {
	Connection connection = loginDao.getConnection();
	Statement statement;
	statement = connection.createStatement();
	ResultSet resultSet;
	String query = "UPDATE ORDERS SET QUERY='"+querytext+"' WHERE EMAIL = '"+email+"' AND ORDERID='"+ordersID+"';";
	statement.execute(query);
	query = "UPDATE ORDERS SET RESPONCE=' ' WHERE EMAIL = '"+email+"' AND ORDERID='"+ordersID+"';";
	statement.execute(query);
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../html/help.jsp");

%>