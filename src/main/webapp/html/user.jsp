
<%@ page import="com.aspire.cake.bean.GetProducts" import="java.sql.*"
		import = "java.util.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%
	GetProducts getProducts = new GetProducts();
	ResultSet resultSet = getProducts.products();
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
	String name = (String) session.getAttribute("name");
	String age = (String) session.getAttribute("age");
	String phoneNumber = (String) session.getAttribute("phoneNumber");
	int categoryCount = 0;
	String categoryName="";
	ArrayList<String> arrayList = new ArrayList<>();
	Set<String> set = new HashSet<>();
	while (resultSet.next())
	{
		categoryName = resultSet.getString(9);
		set.add(categoryName);
	}
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main</title>
<link rel="stylesheet" type="text/css" href="../css/user.css">
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<link rel="stylesheet" type="text/css" href="../css/footer.css">
 <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
 <script>
 <% 
 for(String category:set)
	{
		String functionName = (category.substring(0, 1).toLowerCase())+(category.substring(1)).replaceAll("\\s", "");
	
		 out.println("function "+functionName+"(){\n"+
		 
					"var category= document.getElementById('cat"+categoryCount+"');\n"+
		    		"category.style.display ='block';\n"+
					"hideothers("+categoryCount+"); "+
			"\n}");
		categoryCount++;
	}
 out.println("function hideothers(num) \n{\n"+
		 "var item= document.getElementById('welcome');\n"+
	     "item.style.display ='none';\n"+
	     "var item2 = document.getElementById('offer');\n"+
	     "item2.style.display ='none';\n"+
	"for(let i=0;i<"+set.size()+";i++)\n {\n"+
		 "if(num!=i){\n"+
				"let str = 'cat'+i\n"+
				"var item= document.getElementById(str);\n"+
		    	"item.style.display ='none';"+
		    "\n}"+
		"else {\n"+
			"let str = 'cat'+i\n"+
			"var item= document.getElementById(str);\n"+
		    "item.style.display ='block';"+
		"}\n"+
		"\n}"+
	"\n}");
 categoryCount=0;
 %>
 
</script>
</head>
<body onload="listhide()">
	<ul id="mainul">
		<li>
			<div class="dropdown">
				<a href="#" class="categorydropbtn">Category</a>
				<div class="category-content">
				
					<%
					for(String category:set)
					{
						arrayList.add(category);
						String functionName = (category.substring(0, 1).toLowerCase())+(category.substring(1)).replaceAll("\\s", "");
						out.println("<a href='#' onclick='"+functionName+"()"+"'>"+category+"</a>");
						categoryCount++;
					}
						categoryCount = 0;
						resultSet.absolute(0);
					%>
								
				</div>
			</div>
		</li>
		<li><a href="../html/design.jsp" class="design">Design Cake</a></li>
		<li>
			<div class="dropdown">
				<a class="accountdropbtn">Account <% out.print("("+name+")"); %> </a>
				<div class="account-content">
					<a href="../html/profile.jsp">Profile</a> <a
						href="../html/orders.jsp">Orders</a> <a href="../html/cart.jsp">Cart</a>
					<a href="../html/help.jsp">Help</a> <a href="../html/clearData.jsp">Logout</a>
				</div>
			</div>
		</li>
		<li><a href="../html/about.jsp" class="about">About</a>
		</li>
		<li class='search'>
		 <input type ='button' id='searchButton'  onclick="search()" >
		</li>
		<li class='search'>
		<input type='text' id='search' placeholder="choco">
		</li>
	</ul>
	<br>
	<br><br><br>
	<div id="sliced">
	<ul>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=butterscotch'" ><img src = "../photos/slicedCakes/butterscotch_0.jpg" ></a>
		<h3 id = "text1" >Butterscotch</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=blackforest'" ><img src = "../photos/slicedCakes/black_forest_0.jpg"></a>
		<h3 id = "text2" >Black Forest</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=chocolate'" ><img src = "../photos/slicedCakes/chocolate_2.jpg"></a>
		<h3 id = "text3">Chocolate</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=fruit'" ><img src = "../photos/slicedCakes/fruit_0.jpg"></a>
		<h3 id = "text4">Fruit</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=kitkat'" ><img src = "../photos/slicedCakes/kit_kat_0.jpg"></a>
		<h3 id = "text5"> Kit Kat</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=pineapple'" ><img src = "../photos/slicedCakes/pineapple_0.jpg"></a>
		<h3 id = "text6">Pineapple</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=redvelvet'" ><img src = "../photos/slicedCakes/red_velvet_0.jpg"></a>
		<h3 id = "text7">Red Velvet</h3>
	</li>
	<li>
		<a href='#' onclick="location.href='../html/search.jsp?search=vanilla'" ><img src = "../photos/slicedCakes/vanilla_0.jpg"></a>
		<h3 id = "text8">Vanilla</h3>
	</li>
	</ul>
	</div>
	
	<div id="welcome">
		<div class="mySlides">
		<a href="../html/search.jsp?search=cho">
		  <img id="image" src="../photos/slide/slide 1.jpg" style="width:100%"></a>
		</div>
		
		<div class="mySlides">
		<a href="../html/search.jsp?search=red">
		  <img id="image"  src="../photos/slide/slide 2.jpg"  style="width:100%"></a>
		</div>
		
		<div class="mySlides">
		<a href="../html/search.jsp?search=but">
		  <img id="image"  src="../photos/slide/slide 3.jpg"  style="width:100%"></a>
		</div>
		
		</div>
		<br>
		
<form action="../user" method="post">
	<div class = "function" id = "offer">
	<h1>Trending Cakes</h1>
	<% 
	//String[] list = {, , , , , , , , , , , };
	int count = 0;
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

					if (count > 11 && count < 23) {
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
						count++;
					}
					count++;
					
				}
				resultSet.absolute(0);
	%>
	</div>
	</form>
	
	
	
	<form action="../user" method="post">
		<input type="hidden" name="email" value=<%=email%>> <input
			type="hidden" name="name" value=<%=name%>> <input
			type="hidden" name="age" value=<%=age%>> <input
			type="hidden" name="phoneNumber" value=<%=phoneNumber%>>
			<input type="hidden" name="categoryCount" id="categoryCount" value = <%=arrayList.size() %>>
		<% 
		
			out.println("<br>");
			for(; categoryCount<arrayList.size(); categoryCount++)
			{
				out.println("<div class='function' id='cat"+categoryCount+"'>");
				
				out.println("<h1>"+arrayList.get(categoryCount)+"</h1>");
			
				out.println("<br>");
				out.println("<ul>");
				
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

					if (arrayList.get(categoryCount).equals(categoryna)) {
						out.println("<li>");
						out.println("<div class='product-card'>");
						out.println("<a href=\"../html/productView.jsp?id="+productID+"\" target='_blank'>");
						out.println("<h4 id ='stock'>"+stock+" left"+"</h4>");
						out.println("<div class='product-tumb'>");
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
				resultSet.absolute(1);
				out.println("</ul>");
				out.println("</div>");
			}
		%>
		
	</form>
	<br>
		<footer class="footer_main">

			<div class="footer-left">
				<img src="../photos/test1.png">
				<p class="footer-company-name">Online Cake Shopping © 2022</p>
			</div>

			<div class="footer-center">
				<div>
					<h3><span>Kakapalayam</span> Salem , Tamilnadu</h3>
				</div>
				<div>
					<p>+91 99999 99999</p>
				</div>
				<div>
					<p><a href="mailto:support@cake.com">support@cake.com</a></p>
				</div>
			</div>
			<div class="footer-right">
			<h3>follow us on</h3>
			<img src = "../photos/icons/facebook.png">
			<img src = "../photos/icons/youtube.png">
			<img src = "../photos/icons/twitter.png">
			<img src = "../photos/icons/instagram.png">
			</div>
		</footer>
		
		<!-- popup -->

		<div id="popup1" class="overlay">
			<div class="popup" id = "pop">
				<h2>Item Successfully Added To Cart</h2>
				<a class="close" href="#">&times;</a>
			</div>
		</div>
		
	<script src="../javascript/script.js"></script>
	<script src="../javascript/user.js"></script>
</body>
</html>
