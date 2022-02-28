<%@ page  import="com.aspire.cake.bean.GetProducts" import="java.sql.*"
		import = "java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
		
		 <link rel="stylesheet" type="text/css" href="../css/user.css">
		 <link rel="stylesheet" type="text/css" href="../css/admin.css">
		 <title>Search</title>
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
							href="../html/orders.jsp">Orders</a>
						<a href="../html/help.jsp">Help</a> <a href="../html/clearData.jsp">Logout</a>
					</div>
				</div>
			</li>
			<li><a href="../html/about.jsp" class="about">About</a>
			</li>
			<li><a href="../html/about.jsp" class="about">About</a>
		</li>
		<li class='search' style='float:right;'>
		 <input type ='button' id='searchButton' onclick="search()">
		</li>
		<li class='search' style='float:right;'>
		<input type='text' id='search'>
		</li>
		</ul>
	</div>
	<br><br><br>
	<div class = "function" > 
	<ul>
	<%
	String  search = (String) request.getParameter("search");
	GetProducts getProducts = new GetProducts();
	ResultSet resultSet = getProducts.products();
	
	
	
	while (resultSet.next()) {
		String productID = resultSet.getString(1);
		String price = resultSet.getString(2);
		String weight = resultSet.getString(3);
		String stock = resultSet.getString(4);
		String title = resultSet.getString(5);
		String description = resultSet.getString(6);
		String photoURL = resultSet.getString(7);
		String info = resultSet.getString(8);
		String categoryna = resultSet.getString(9);
		String keywords = resultSet.getString(10);
		System.out.println(keywords);
		if (keywords.contains(search)) {
			out.println("<li>");
			out.println("<div class='product-card' >");
			out.println("<a href=\"../html/productView.jsp?id="+productID+"\" target='_blank'>");
			out.println("<h4 id ='stock'>"+stock+" left"+"</h4>");
			out.println("<div class='product-tumb' '>");
			out.println("<img id = 'cake'  src=" + photoURL + " alt=''>");
			out.println("</div>");
			out.println("<div class='product-details'>");
			out.println("<span class='product-catagory'>" + title + "</span>");
			out.println("<div class='product-bottom-details'>");
			out.println("<div class='product-price'><small>" + "RS." + (Float.parseFloat(price) + 100) + "</small>" + "RS."
			+ price + "</div>");
			out.println("</div>");
			out.println("</div>");
			out.println("</a>");
			out.println("</div>");
			out.println("</li>");  
		}
	}
	%>
	</ul>
	
	</div>
	<script src="../javascript/user.js"></script>
</body>
</html>