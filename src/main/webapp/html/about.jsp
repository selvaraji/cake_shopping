<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Project Name : Online Cake Shopping System
	 Author Name  : Selvaraji a
	 Started At   : 12-12-2021
	 Updated At   : 31-01-2022 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
<link rel="stylesheet" type="text/css" href="../css/admin.css">
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
					<a href="../html/profile.jsp">Profile</a> <a
						href="../html/orders.jsp">Orders</a> <a href="../html/cart.jsp">Cart</a>
					<a href="../html/help.jsp">Help</a> <a href="../html/clearData.jsp">Logout</a>
				</div>
			</div>
		</li>
	</ul>
</div>

	<div class="profile">
		<h1>Online Cake Shopping System</h1>
		<br><br><br>
		<h2>Author Name : Selvaraji A</h2>
		<h2>Started At : 12-12-2021</h2>
		<h2>Updated At : 31-01-2022</h2>
		<h2>IDE : Eclipse IDE for Java Developers - 2021-03</h2>
		<h2>Server : Tomcat Version 10.0</h2>
		<h2>Database : Mysql Workbench CE 8.0</h2>
	</div>
</body>
</html>