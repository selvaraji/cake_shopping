<%@ page import="com.aspire.cake.database.*" import="java.sql.*"
		language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%

LoginDao loginDao = new LoginDao();
loginDao.loadDriver(loginDao.databaseDriver);
String address = "$"+ request.getParameter("address");
String phoneNumber = "$"+ request.getParameter("phoneNumber");
System.out.println(phoneNumber);
String email = (String) session.getAttribute("email");
String[] array1 = {address, phoneNumber};
String[] array2 = {"address", "pno"};

try {
	Connection connection = loginDao.getConnection();
	Statement statement;
	statement = connection.createStatement();
	
	ResultSet resultSet;
	for(int i=0;  i<array1.length; i++)
	{
		if(!array1[i].equals("$")) 
		{
			String query = "UPDATE USER SET "+array2[i]+" = '"+array1[i].substring(1)+"' WHERE EMAIL = '"+email+"';";
			statement.execute(query);
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../html/cart.jsp");

%>