<%@ page  import = "com.aspire.cake.bean.GetProducts"  import = "com.aspire.cake.database.LoginDao" import ="java.sql.*"
 language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%String email = (String) session.getAttribute("email"); 
try
{
	if(email.equals(null))
	{
		//
	}
}
catch(Exception e)
{
	response.sendRedirect("../html/loginPopUp.jsp");
}
LoginDao loginDao = new LoginDao();
loginDao.loadDriver(loginDao.databaseDriver);
String query = "SELECT ORDERSID FROM USER WHERE EMAIL='"+email+"' ";
Connection connection = loginDao.getConnection();
ResultSet result = null;
ResultSet resultSet = null;
try {
	Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
	Statement statement2 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
	result = statement.executeQuery(query);
	resultSet = statement2.executeQuery("SELECT ORDERID, QUERY, RESPONCE FROM ORDERS WHERE EMAIL ='"+email+"'");
} catch (SQLException e) {
	e.printStackTrace();
}
result.next();
%>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/user.css">
		 <link rel="stylesheet" type="text/css" href="../css/cart.css">
		 <link rel="stylesheet" type="text/css" href="../css/admin.css"> 
		 <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"> 
		  <title>Help</title>
    </head>
    <body>
    <div id= "bar">
		<ul>
		<li><a href="../html/user.jsp">Home</a></li>
		<li><a href="../html/design.jsp" class="design">Design Cake</a></li>
	
			<li>
				<div class="dropdown">
					<a href="#" class="accountdropbtn">Account <% out.print("("+session.getAttribute("name")+")"); %> </a>
					<div class="account-content">
						<a href="../html/profile.jsp">Profile</a> <a
							href="../html/orders.jsp">Orders</a> <a href="../html/cart.jsp">Cart</a>
						
						 <a href="../html/clearData.jsp">Logout</a>
					</div>
				</div>
			</li>
			<li><a href="../html/about.jsp" class="about">About</a>
			</li>
		</ul>
	</div>
          <div class = "function">
        <br><br><br>
	        <h1>Help Page</h1>
	        <h2>New Request</h2><br><br>
	        <form action="../html/addQuery.jsp">
	        <select name  = 'ordersID' id= "ordersID">
        	<option value="none">Select OrderID</option>
        	<%
        	String[] list = result.getString(1).split("@");
        		for(String order: list)
        		{
        			out.println("<option value='"+order+"'>"+order+"</option>");
        		}
        	%>
        	</select>
        	<br><br>
        	<input  type="text" name="querytext" id="querytext" placeholder="Add Your Query" required>  
        	<br><br>
        	<input type="submit" name="submitQuery" id="submitQuery" value="Submit">  
		   <br><br>
		   </form>
		   <br><br>
		   <h2>Older Requests</h2><br><br>
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
			   out.println("<tr><td>"+id+"<td>"+req+"</td><td>"+res+"</td></tr>");
		   }
		   
		   %>
		  
		  </table>
        </div>
	       
    </body>
</html>