<%@ page import = "com.aspire.cake.database.LoginDao" import = "com.aspire.cake.bean.GetProducts" language="java" contentType="text/html; charset=ISO-8859-1"
    import = "java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	 <link rel="stylesheet" type="text/css" href="../css/user.css">
	 <title>All Models</title>
	 <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"> 
</head>
<body>
	 <div class= "function">
	        <h1>All Cake Models</h1><%  %>
	        
	        <hr>
	       
	        <h1>Products</h1>
	        <ul>
	        <%
	        GetProducts getProducts = new GetProducts();
	        ResultSet resultSet = getProducts.products();
	        int totalItems = 0; double totalPrice = 0;
	        
	        int count =1;
	        while (resultSet.next()) {
				String productID = resultSet.getString(1);
				String price = resultSet.getString(2);
				String weight = resultSet.getString(3);
				String stock = resultSet.getString(4);
				String title = resultSet.getString(5);
				String description = resultSet.getString(6);
				String photoURL = resultSet.getString(7);
				String info = resultSet.getString(8);
				String category = resultSet.getString(9);
				
				
				out.println("<li>");
				out.println("<div class='product-card'>");
				out.println("<div class='product-tumb'>");
				out.println("<h4 id ='stock'>"+stock+" Items left"+" - ID = "+productID+"</h4>");
				out.println("<img id = 'cake'  src=" + photoURL + " alt=''>");
				out.println("</div>");
				out.println("<div class='product-details'>");
				out.println("<span class='product-catagory' style='margin-top:10px'>" + title + "</span>");
				out.println("<p >"+ category + "</p>");
				out.println("<p><b>" + weight + "kgs</b></p>");
				out.println("<div class='product-bottom-details'>");
				out.println("<div class='product-price'>"+"RS."
				+ price + "</div>");
				out.println("<div class='product-links'>");
				//out.println("<a href='../html/updateCake.jsp'><button >temp</button></a>");
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("</div>");
				out.println("</li>");
			}
			resultSet.absolute(1);
			%>
	        </ul>
</div>
</body>
</html>