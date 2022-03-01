<%@ page  import = "com.aspire.cake.bean.GetProducts"  import = "com.aspire.cake.database.LoginDao" import ="java.sql.*"
 language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%
LoginDao loginDao = new LoginDao();
loginDao.loadDriver(loginDao.databaseDriver);
Connection connection = loginDao.getConnection();
ResultSet resultSet = null;
try {
	Statement statement2 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
	resultSet = statement2.executeQuery("SELECT ORDERID, QUERY, RESPONCE FROM ORDERS ");
} catch (SQLException e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/user.css">
		 <link rel="stylesheet" type="text/css" href="../css/cart.css">
		 <link rel="stylesheet" type="text/css" href="../css/admin.css"> 
		 <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"> 
		  <title>Queries</title>
</head>
<body>

 <div class = "function">
 <h1>All Queries</h1>
        <br><br><br>
		  <table id="helpTaple">
		  <tr>
		  <th>Order ID</th>
		  <th>Request</th>
		  <th>Responce</th>
		  </tr>
		 
		   <%
		   while(resultSet.next())
		   {
			   String req =  resultSet.getString(2);
			   String id =  resultSet.getString(1);
			   String res =  resultSet.getString(3);
			   
			   out.println("<form action='../html/addResponce.jsp' >");
			   if(res.length()>=5 && req.length()>=5)
				   out.println("<tr><td>"+id+"<td style='background-color: aquamarine'>"+req+"</td>");
			   else if(req.length()>=5)
			  	   out.println("<tr><td>"+id+"<td style='background-color: red'>"+req+"</td>");
			   else
				   out.println("<tr><td>"+id+"<td style='background-color: lightgreen'>"+req+"</td>");
			   out.println("<input type='hidden' name='id' value='"+id+"'>");
			   out.println("<td>"+res+"<input type='text' name='"+id+"'> <input type='submit' value='Update'></td></tr>");
		   	   out.println("</form>");
		   }
		   
		   %>
		  </table>
        </div>
</body>
</html>