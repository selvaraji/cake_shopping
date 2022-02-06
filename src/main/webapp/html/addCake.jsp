
<%@ page import="com.aspire.cake.bean.GetProducts" import="java.sql.*"
		import = "java.util.*"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	GetProducts getProducts = new GetProducts();
	ResultSet resultSet = getProducts.products();
	int categoryCount = 0;
	String categoryName="";
	ArrayList<String> arrayList = new ArrayList<>();
	Set<String> set = new HashSet<>();
	while (resultSet.next())
	{
		categoryName = resultSet.getString(9);
		set.add(categoryName);
	}
	
	for(String temp : set)
	{
		arrayList.add(temp);
	}
	
	try
	{
		if(session.getAttribute("categoryTemp").equals(null))
		{
			//
		}
		else
		{
			arrayList.add((String)session.getAttribute("categoryTemp"));
			System.out.println(session.getAttribute("categoryTemp"));
			session.setAttribute("categoryTemp",null);
		}
	}
	catch(Exception e)
	{
		
	}
	
%>
<!DOCTYPE html>    
<html>    
<head>    
	<meta charset="ISO-8859-1">
    <title>Add New Cake</title>    
    <link rel="stylesheet" type="text/css" href="../css/style.css">    
<body>
    <div class="admin">    
    <h2 id ="admin">Add New Cake</h2><br>  
       
    <form id="admin"   action="../html/addCategory.jsp">
        <input type="text" name="categoryName" id="categoryName" placeholder="category Name" required >    
        <input type="submit"  id = "buttonAddCategory" value="Add Category" > 
        
        <h4>(or)</h4>
        </form>
    <form id="admin" method="post" onsubmit= 'return addcake()' action="../addCake">          
         <select name = 'category' id= "category">
        	<option value="none">Select Category</option>
        	<%
        		for(String category: arrayList)
        		{
        			out.println("<option value='"+category+"'>"+category+"</option>");
        		}
        	%>
        </select>
        <br><br>
        <input type="text" name="productID" id="productID" placeholder="ProductID" required>    
        <br><br>
        
        <input type="text" name="price" id="price" placeholder="Price" required>    
        <br><br>
        <input type="text" name="weight" id="weight" placeholder="Weight" required>    
        <br><br>
        <input type="text" name="stock" id="stock" placeholder="Stock Available" required>    
        <br><br>
        <input type="text" name="title" id="title" placeholder="Name Of The Product" required>    
        <br><br>
        <input type="text" name="description" id="description" placeholder="Description" required>    
        <br><br>
        <input type="text" name="photoURL" id="photoURL" placeholder="Image Location URL" required>    
        <br><br>
        <input type="text" name="info" id="info" placeholder="Short Description" required>    
        <br><br>
        
        <input type="submit"  id = "button" value="Add Cake" >  
        <br><br>
    </form>     
</div> 

    <script src="../javascript/script.js"></script>    
</body>    
</html> 