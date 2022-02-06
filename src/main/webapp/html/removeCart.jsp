<%@ page import="com.aspire.cake.database.*" import="java.sql.*"
		language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%

LoginDao loginDao = new LoginDao();
loginDao.loadDriver(loginDao.databaseDriver);
String removeID = request.getParameter("remove");
System.out.println(removeID);
String finalCart = "";
String email = (String) session.getAttribute("email");
String query1 = "SELECT CARTID FROM USER WHERE EMAIL = '"+email+"';";

try {
	Connection connection = loginDao.getConnection();
	Connection connection2 = loginDao.getConnection();
	Statement statement1, statement2;
	statement1 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
	statement2 = connection2.createStatement();
	ResultSet resultSet = statement1.executeQuery(query1);
	resultSet.first();
	String[] cartIDData = (resultSet.getString(1)).split("@");
	int count = 0;
	int flag = 0;
	for(String temp : cartIDData)
	{
		flag++;
		if(temp.equals(removeID))
		{
			count++;
			continue;
		}
		finalCart += temp+"@";
		
	}
	if(flag== count)
	{
		finalCart = "xxxx";
	}
	String query2 = "UPDATE USER SET CARTID ='"+finalCart+"' where email = '"+email+"';";
	statement2.execute(query2);
} catch (Exception ea) {
	ea.printStackTrace();
}

response.sendRedirect("../html/cart.jsp");

%>