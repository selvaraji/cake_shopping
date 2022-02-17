<%@ page import="com.aspire.cake.bean.GetProducts" import="java.sql.*"
		import = "java.util.*"  language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>    
<html>    
<head>    
	<meta charset="ISO-8859-1">
    <title>Update Cake</title>    
    <link rel="stylesheet" type="text/css" href="../css/style.css">   
    <link rel="stylesheet" type="text/css" href="../css/admin.css">   
<body>
    <div class="admin">    
    <h2 id ="admin">update Cake</h2><br>    
    <form id="admin" method="post" onsubmit = "return updatecake()" action="../updateCake">          
        
        <select name = 'id' id= "id">
        	<option value="none">Select ProductID</option>
        	<%
        	GetProducts getProducts = new GetProducts();
        	ResultSet resultSet = getProducts.products();
        	ArrayList<String> arrayList = new ArrayList<>();
        	while (resultSet.next())
        	{
        		arrayList.add(resultSet.getString(1));
        	}
        	Collections.sort(arrayList);
        	for(String id: arrayList)
        		{
        			out.println("<option value='"+id+"'>"+id+"</option>");
        		}
        	%>
        </select>
        
        <br><br>
        <input type="text" name="price" id="price" placeholder="Price">    
        <br><br>
        <input type="text" name="weight" id="weight" placeholder="Weight" >    
        <br><br>
        <input type="text" name="stock" id="stock" placeholder="Stock Available">    
        <br><br>
        <input type="text" name="title" id="title" placeholder="Name Of The Product" >    
        <br><br>
        <input type="text" name="description" id="description" placeholder="Description" >    
        <br><br>
        <input type="text" name="photoURL" id="photoURL" placeholder="Image Location URL" >    
        <br><br>
        <input type="text" name="info" id="info" placeholder="Short Description" >    
        <br><br>
        <input type="text" name="key" id="key" placeholder="Keywords (Separat by Comma)">    
        <br><br>
        
        <input type="submit"  id = "button" value="Update Cake" >  
        <br><br>
    </form>     
</div> 
    <script src="../javascript/script.js"></script>    

</body>    
</html> 