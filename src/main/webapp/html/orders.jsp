<%@ page import = "com.aspire.cake.database.LoginDao" import = "java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/user.css">
		 <link rel="stylesheet" type="text/css" href="../css/cart.css">
		 <link rel="stylesheet" type="text/css" href="../css/admin.css">
		  <title>Orders</title>
		 <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"> 
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
						<a href="../html/profile.jsp">Profile</a> 
						<a href="../html/cart.jsp">Cart</a>
						<a href="../html/help.jsp">Help</a> <a href="../html/clearData.jsp">Logout</a>
					</div>
				</div>
			</li>
			<li><a href="../html/about.jsp" class="about">About</a>
			</li>
		</ul>
	</div>
    <div class = "function">
     <br> <br> <br>
        <h1>Orders page</h1>
        <br>
        <table>
        <tr>
         
         <%
         	boolean flag = false;
         	String ordersID = (String) session.getAttribute("ordersID");
				String query="";
				try
				{
					if(ordersID.equals(""))
					{
					}
					else
					{
						query = "SELECT * FROM ORDERS WHERE EMAIL ='"+(session.getAttribute("email"))+"';";
						out.println("<th><h1>OrderID<h1></th>");
					}
				}
				catch(Exception e)
				{
					out.println("<th><h1>OrderID<h1></th>");
					out.println("<th><h1>Name<h1></th>");
					out.println("<th><h1>Email<h1></th>");
					
				}%>
		<th><h1>Product Name</h1></th>
         <th ><h1>Price</h1></th>
         <th ><h1>Address</h1></th>
         <th ><h1>Phone Number</h1></th>
         <th><h1>Status</h1></th>
        </tr>
		       <%
		       
		        LoginDao loginDao = new LoginDao();
				loginDao.loadDriver(loginDao.databaseDriver);
				Connection connection = loginDao.getConnection();
				
				
				
				try{
					
					Statement statement = connection.createStatement();
					ResultSet resultSet = statement.executeQuery(query);
					while(resultSet.next())
			        {
						if(ordersID.contains( resultSet.getString(1)))
						{
					        String productID = resultSet.getString(6);
					        String orderID= resultSet.getString(1);
					        String status = resultSet.getString(7);
					        
					        String phoneNumber = resultSet.getString(4);
					        String address = resultSet.getString(5);
							String query2 = "SELECT * FROM PRODUCT WHERE PRODUCTID ='"+productID+"';";
					        Statement statement2 = connection.createStatement();
					  		ResultSet resultSet2  = statement2.executeQuery(query2);
					  		while(resultSet2.next())
					        {
					  			String price = resultSet2.getString(2);
					  			String name = resultSet2.getString(5);
					  			out.println("<tr>");
					  			out.println("<td ><h3>"+orderID+"</h3>");
					  			out.println("<td><h3>"+name+"</h3>");
					  			out.println("<td><h3>"+price+"</h3>");
					  			out.println("<td><h3>"+address+"</h3>");
					  			out.println("<td><h3>"+phoneNumber+"</h3>");
					  			out.println("<td><h3>"+status+"</h3>");
					  			out.println("</tr>");
					        }
			        }
			        }
					
				}
				catch(Exception e)
				{
					String type ="";
					try{
						Statement statement1 = connection.createStatement();
						ResultSet resultSet1 = statement1.executeQuery("SELECT TYPE FROM USER WHERE EMAIL ='"+session.getAttribute("email")+"';");
						resultSet1.next();
						type = resultSet1.getString(1);
					}
					catch(Exception s)
					{
						System.out.println(s);
					}
					Statement statement = connection.createStatement();
					ResultSet result = statement.executeQuery("SELECT * FROM ORDERS");
					if(type.equals("admin"))
					{
					while(result.next())
			        {
					        String productID = result.getString(6);
					        String name = result.getString(2);
					        String orderID= result.getString(1);
					        String email = result.getString(3);
					        String status = result.getString(7);
					        String phoneNumber = result.getString(4);
					        String address = result.getString(5);
							String query2 = "SELECT * FROM PRODUCT WHERE PRODUCTID ='"+productID+"';";
					        Statement statement2 = connection.createStatement();
					  		ResultSet resultSet2  = statement2.executeQuery(query2);
					  		while(resultSet2.next())
					        {
					  			String price = resultSet2.getString(2);
					  			String title = resultSet2.getString(5);
					  			out.println("<tr>");
					  			out.println("<td ><h3>"+orderID+"</h3>");
					  			out.println("<td><h3>"+name+"</h3>");
					  			out.println("<td ><h3>"+email+"</h3>");
					  			out.println("<td ><h3>"+title+"</h3>");
					  			out.println("<td ><h3>"+price+"</h3>");
					  			out.println("<td ><h3>"+address+"</h3>");
					  			out.println("<td ><h3>"+phoneNumber+"</h3>");
					  			out.println("<td><h3>"+status+"</h3>");
					  			out.println("<form action='../html/updateStatus.jsp' >");
					  			out.println("<input type = 'text' id = 'status' name='"+orderID+
					  			"' placeholder = 'Update Status' required>");
					  			out.println("<input type ='Submit' id = 'update' name = 'update' value = '"+orderID+"'>");
					  			out.println("</form>");
					  			out.println("</tr>");
					        }
			        }
					}
				}
		       %>
		       </table>
        </div>
        <script src="javascript/script.js"></script> 
    </body>
</html>