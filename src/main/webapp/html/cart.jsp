
<%@ page import = "com.aspire.cake.database.LoginDao" import = "com.aspire.cake.bean.GetProducts" language="java" contentType="text/html; charset=ISO-8859-1"
    import = "java.sql.*" pageEncoding="ISO-8859-1"%>
    <%String email =(String) session.getAttribute("email");
    %>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="ISO-8859-1">
		 <link rel="stylesheet" type="text/css" href="../css/user.css">
		 <link rel="stylesheet" type="text/css" href="../css/cart.css">
		 <link rel="stylesheet" type="text/css" href="../css/admin.css">
		 <title>Cart</title>
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
		</ul>
	</div>
	
	
    <br>
        <div class = "function">
        <br><br>
	        <h1>Cart Page</h1>
	        <h1>Order Summary</h1>
	        <hr>
	        <div class = "product" >
	        <h1>Products</h1>
	        <ul>
	        <%
	        LoginDao loginDao = new LoginDao();
	        String ids = loginDao.cartLoad(email);
	        GetProducts getProducts = new GetProducts();
	        ResultSet resultSet = getProducts.products();
	        int totalItems = 0; double totalPrice = 0;
	        
	        int count =1;
	        while(resultSet.next())
	        {
	        	String productID = resultSet.getString(1);
	        	if(ids.equals("xxxx"))
	        	{
	        		out.println("<br><br><br><br>");
		        	out.println("<h1>Card Is Empty !!</h1>");
		        	return;
	        	}
	        	
		        if(ids.contains(productID))
		        {
		        	count++;
		        	totalItems++;
		        	String price = resultSet.getString(2);
		        	String weight = resultSet.getString(3);
		        	String stock = resultSet.getString(4);
		        	String title = resultSet.getString(5);
		        	String description = resultSet.getString(6);
		        	String photoURL = resultSet.getString(7);
		        	String info = resultSet.getString(8);
		        	totalPrice += Double.parseDouble(price);
			        out.println("<li>");
			        out.println("<div class='product-card'>");
			        out.println("<div class='product-tumb'>");
			        		out.println("<img id = 'cake'  src="+photoURL+" alt=''>");
			        		out.println("</div>");
			        		out.println("<div class='details'>");
			        		out.println("<span class='product-catagory'>"+title+"</span>");
			        		out.println("<div class='product-price'>"+"RS."+price+"</div>");
			        		String link = "../html/removeCart.jsp?remove="+productID;
			        		out.println("<a href = "+link+"><button id='remove' >Remove</button></a>");
			        		out.println("<div class='product-links'>");
			        		out.println("</div>");
			        		out.println("</div>");
			        		out.println("</div>");
			        		out.println("</li>");
		        		}
	        }
	        %>
	        </ul>
	        </div>
	        
	        <div class = "details">
		        <form action ="../checkOut"  method = "post">
			        <input type = "hidden" name = "email" value =<%=email %> >
			        <h2>Total Items : </h2>
			        <h2 id = "totalitems"><%=totalItems %></h2>
			        <br> <br>
			        <h2>Total Price :</h2>
			        <h2 id = "totalprice">RS : <%=totalPrice %></h2>
			        <br> <br>
			        <input id = "cardNumber" type ="text" placeholder = "Card number" required minlength="14" maxlength = "16">
			        <br> <br>
			        <input id = "cardName" type ="text" placeholder = "Card Holder Name" required>
			        <br> <br>
			        <input id = "valid" type ="text" placeholder = "Valid upto (mm/yy)" required minlength ="5" maxlength="5">
			        <br> <br>
			        <input id = "cvv" type ="text" placeholder = "CVV" required minlength ="3" maxlength= "3" >
			        <br> <br>
			        <input type = "submit" value = "Proceed To Checkout" id = "button">
		        </form>
	        </div>
        </div>
        
        <script src="../javascript/paymentValitation.js"></script>
    </body>
</html>