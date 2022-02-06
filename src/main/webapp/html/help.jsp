<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../css/user.css"> 
    	<link rel="stylesheet" type="text/css" href="../css/admin.css">  
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
	        </div>
    </body>
</html>