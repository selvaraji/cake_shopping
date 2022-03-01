<%@page import="java.text.SimpleDateFormat"%>
<%@ page  import="com.aspire.cake.bean.GetProducts" import="java.sql.*"
		import = "java.util.*"  import = "java.util.Date"  import = "java.text.SimpleDateFormat" 
		language="java" contentType="text/html; charset=ISO-8859-1"
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
    SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    GetProducts getProducts = new GetProducts();
	ResultSet resultSet = getProducts.products();
	String  productID = (String) request.getParameter("id");
	String id = "";
	String price = "";
	String weight = "";
	String stock = "";
	String title = "";
	String description = "";
	String photoURL = "";
	String info = "";
	String categoryna = "";
	
	while (resultSet.next()) {
		id = resultSet.getString(1);
		price = resultSet.getString(2);
		weight = resultSet.getString(3);
		stock = resultSet.getString(4);
		title = resultSet.getString(5);
		description = resultSet.getString(6);
		photoURL = resultSet.getString(7);
		info = resultSet.getString(8);
		categoryna = resultSet.getString(9);
		
		if(id.equals(productID))
		{
			break;
		}
	}
	resultSet.absolute(0);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product view</title>
<link rel="stylesheet" type="text/css" href="../css/productView.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
</head>
<body >
<div id= "bar">
		<ul>
		<li><a href="../html/user.jsp">Home</a></li>
		<li><a href="../html/design.jsp" class="design">Design Cake</a></li>
		<li><a href="../html/cart.jsp">Cart</a></li>
			<li><a href="../html/about.jsp" class="about">About</a>
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
		</ul>
	</div>

<div class ='productView' >
<%
out.println("<img id='image' src="+photoURL+">");
String link ="../user?addtocart="+productID;
String link2 = "../user?buynow="+productID;
out.println("<br><a href ="+link+" ><input type='button' id='cart' value='add to cart'><a/>");
out.println("<a href ="+link2+"><input type='button' id='buy' value='Buy now'></a>");
out.println("<p> Delivery  Expected on "+ (Integer.parseInt(f.format(date).substring(0,2))+1)+"th, if order before "+(Integer.parseInt(f.format(date).substring(11,13))+1)+":"+f.format(date).substring(14,19)+"</p>");
//out.println(f.format(date));

%>
</div>


<div class= 'details' >
<%
out.println("<h2>"+title+"</h2>");
out.println("<div class='stars'>");
out.println("<img src='../photos/icons/star.png'>"+
"<img src='../photos/icons/star.png'>"+
"<img src='../photos/icons/star.png'>"+
"<img src='../photos/icons/star.png'>"+
"<img src='../photos/icons/star_half.png'> <span>4.5</span>");
out.println("</div>");
out.println("<h2> " + "RS." +price+"&nbsp <small>Rs."+(Double.parseDouble(price) + 100)+"</small></h2>");
out.println("<h2>Offers & Coupons</h2>");
out.println("<ul  class = 'offer'>");
out.println("<li>");
out.println("<img src ='../photos/icons/tag.png'>");
out.println("<h3>Flat 10% off on xxx bank debit and credit cards.</h3>");
out.println("</li>");
out.println("<li>");
out.println("<img src ='../photos/icons/tag.png'>");
out.println("<h3>Buy this product and get upto Rs.50 on next cake purchase.</h3>");
out.println("</li>");
out.println("</ul>");

out.println("<p>&nbsp &nbsp &nbsp &nbsp &nbsp"+description+"</p>");
out.println("<h2>Details</h2>");
out.println("<h4>Cake flavor &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;: "+title+"</h4>");

out.println("<h4>Type of Cake&nbsp; &nbsp; : Cream</h4>");
float weightFloat = Float.parseFloat(weight);
out.println("<h4>Weight &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: "+weight+" kg</h4>");
out.println("<h4>Serves&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: "+weightFloat*8+" Servings</h4>");
out.println("<h4>Size&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: "+weightFloat*10+" X "+weightFloat*10+" Inch</h4>");

out.println("<h2>Please Note</h2>");
out.println("<ul><li><p>The cake stand, cutlery & accessories used in the image are only for representation purposes. They are not delivered with the cake.</p></li>");
out.println("<li><p>This cake is hand delivered in a good quality cardboard box.</p></li></ul>");
		
out.println("<h2>Delivery Information</h2>");
out.println("<ul><li><p>Every cake we offer is handcrafted and since each chef has his/her own way of baking and designing a cake ,there might be slight variation in the product in terms of design and shape.</p></li>");
out.println("<li><p>Occasionally, substitutions of flavours/designs is necessary due to temporary and/or regional unavailability issues.</p></li>");
out.println("<li><p>The chosen delivery time is an estimate and depends on the availability of the product and the destination to which you want the product to be delivered.</p></li></ul>");

out.println("<h2>Care Instructions</h2>");
out.println("<ul><li><p>Store cream cakes in a refrigerator. Fondant cakes should be stored in an air conditioned environment.</li>"+
		"<li><p>Slice and serve the cake at room temperature and make sure it is not exposed to heat.</p></li>"+
		"<li><p>Use a serrated knife to cut a fondant cake.</p></li>"+
		"<li><p>Sculptural elements and figurines may contain wire supports or toothpicks or wooden skewers for support.</p></li>"+
		"<li><p>Please check the placement of these items before serving to small children.</p></li>"+
		"<li><p>The cake should be consumed within 24 hours.</p></li>"+
		"<li><p>Enjoy your cake!</p></li>");
out.println("");
//ingrdientss
//reviews
//related products
%>
</div>


<div class ='review'>
	<ul>
	<li>
	<img src='../photos/icons/user-male.png'>
	<br>
	<div id='star'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	</div>
	<h2>Happy Anniversary cake</h2>
	<p>&nbsp; &nbsp; I ordered this cake for last valantine's day n loved by my wife very much. so i ordered it again for my anniversary and the second was also good as first one</p>
	</li>
	
	<li>
	<img src='../photos/icons/user-female.png'>
	<br>
	<div id='star'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star_half.png'>
	</div>
	<h2>Trusty Worthy Shopping</h2>
	<p> &nbsp; &nbsp; Extraordinary service, thanking your team.I will order Again and Again</p>
	</li>
	
	<li>
	<img src='../photos/icons/user-male.png'>
	<br>
	<div id='star'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star.png'>
	<img src='../photos/icons/star_half.png'>
	</div>
	<h2>Awesome Really fabluous</h2>
	<p> &nbsp; &nbsp; its just awesome... And i was so happy to receive the cake on time</p>
	</li>
	</ul>
</div> 
<br>
<!-- popup -->

		<div id="popup1" class="overlay">
			<div class="popup" id = "pop">
				<h2>Item Successfully Added To Cart</h2>
				<a href = '../html/cart.jsp'><input type='button' id='cart' value='Go To Cart'></a>
				<a href = '../html/user.jsp' ><input type='button' id='buy' value='home'></a>
				<a class="close" href="#">&times;</a>
			</div>
		</div>

</body>
</html>