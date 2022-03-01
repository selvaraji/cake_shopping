
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String email = (String) session.getAttribute("email");
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
    String name = (String) session.getAttribute("name"); %>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type ="text/css" href ="../css/user.css">
		<link rel="stylesheet" type ="text/css" href ="../css/admin.css">
		
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
						
						<a href="../html/orders.jsp">Orders</a> <a href="../html/cart.jsp">Cart</a>
						<a href="../html/help.jsp">Help</a> <a href="../html/clearData.jsp">Logout</a>
					</div>
				</div>
			</li>
			<li><a href="../html/about.jsp" class="about">About</a>
			</li>
		</ul>
	</div>
	
    <div class = "profile">
        <h1 id = "tag" >Profile</h1>
        <br>
        <h2>Name : <%out.println(session.getAttribute("name"));%><br>
        Email : <%out.println(session.getAttribute("email"));%><br>
       Age : <% out.println(session.getAttribute("age"));%><br>
       Address : <% out.println(session.getAttribute("address"));%><br>
        Mobile number : <%out.println(session.getAttribute("phoneNumber"));%></h2>
        
        </div>
    </body>
</html>