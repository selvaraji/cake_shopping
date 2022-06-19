
<%@ page import = "com.aspire.cake.database.LoginDao" import = "com.aspire.cake.bean.GetProducts" language="java" contentType="text/html; charset=ISO-8859-1"
    import = "java.sql.*" pageEncoding="ISO-8859-1"%>
    <%String email =(String) session.getAttribute("email");
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
	        ResultSet addressRseultSet = loginDao.profile(email);
	        addressRseultSet.next();
	        String address = addressRseultSet.getString(6);
	        String phoneNumber = addressRseultSet.getString(5);
	        GetProducts getProducts = new GetProducts();
	        ResultSet resultSet = getProducts.products();
	        int totalItems = 0; double totalPrice = 0;
	        
	        int count =1;
	        boolean design = true;
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
		        if(ids.contains("~") && design == true)
	        	{
		        	String[] idsAll = ids.split("@");
		        	for(String id :idsAll)
		        	{
		        		if(id.contains("~"))
		        		{
		        			System.out.println(id);
		        			count++;
				        	totalItems++;
				        	String price = "1000";
				        	String weight = "1";
				        	String stock = "123";
				        	String title = "Custom Cake";
				        	char top = id.charAt(0);
				        	char side = id.charAt(2);
				        	System.out.println(id+"-"+top+" "+side);
				        	totalPrice += 1000;
					        out.println("<li>");
					        out.println("<div class='product-card'>");
					        out.println("<div class='product-tumb'>");
					        		
					        		out.println("<div class='designcart' style= position:relative;float:left:left:20px> <img id = 'cake1' style = position:absolute  src='../photos/design/round/top/"+top+".png' alt=''>");
					        		out.println("<img id = 'cake2' style = position:relative src='../photos/design/round/side/"+side+".png' alt=''> </div>");
					        		out.println("</div>");
					        		out.println("<div class='details'>");
					        		out.println("<span class='product-catagory'>"+title+"</span>");
					        		out.println("<div class='product-price'>"+"RS."+price+"</div>");
					        		String link = "../html/removeCart.jsp?remove="+id;
					        		out.println("<a href = "+link+"><button id='remove' >Remove</button></a>");
					        		out.println("<div class='product-links'>");
					        		out.println("</div>");
					        		out.println("</div>");
					        		out.println("</div>");
					        		out.println("</li>");
		        		}
		        	}
		        	design = false;
	        		
	        	}
	        }
	        %>
	        </ul>
	        </div>
	        
	        <div class = "det">
	        <br>
			        <h2>Total Items : </h2>
			        <h2 id = "totalitems"><%=totalItems %></h2>
			        <br> <br>
			        <h2>Total Price :</h2>
			        <h2 id = "totalprice">RS : <%=totalPrice %></h2>
			        <br> <br>
			        <h2>Address :</h2>
			        <br><br>
			        <h2><%=address %></h2>
			        <br><br>
			         <h2>Phone Number :</h2>
			         <br><br>
			        <h2><%=phoneNumber %></h2>
			        <br><br>
			        <h2>Update Address :</h2>
			        <br><br>
			       <form action ="../html/updateAddress.jsp?" >
			       	 <input id = "address" name = "address" type ="text" placeholder = "Add Address (Optional)"  minlength="10" >
			        <br> <br>
			        <input id = "phoneNumber" name= "phoneNumber" type ="text" placeholder = "Add Phone Number (Optional)"  minlength ="10" maxlength="10">
			        <br> <br>
			        <input type="submit" id ="updateAddress" value="Update">
			       </form>
			        
			</div>
			
			   <br>
			   <div class = "details">
			   <br>
			   <h1>Payment Details</h1>
			   <form action ="../checkOut"  method = "post">
			        <input type = "hidden" name = "email" value =<%=email %> >
			        <br> <br>
			        <input id = "cardNumber" type ="text" placeholder = "Card number" required minlength="14" maxlength = "16">
			        <br> <br>
			        <input id = "valid" type ="text" placeholder = "Valid upto (mm/yy)" required minlength ="5" maxlength="5">
			        <br> <br>
			        <input id = "cardName" type ="text" placeholder = "Card Holder Name" required>
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