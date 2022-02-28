<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>    
<html>    
<head>    
	<meta charset="ISO-8859-1">
    <title>Admin</title>    
    <link rel="stylesheet" type="text/css" href="../css/style.css">    
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico"> 
</head>    
<body>
    <script src="../javascript/script.js"></script>    
    <div class="admin">    
    <h2 id ="admin">Admin</h2><br>    
    <form id="admin" method="get" action="">      
        <input type="button"  id="button" value="View All Orders" 
        onclick="location.href='../html/orders.jsp'">     
        <%
        String ordersID = null;
        session.setAttribute("ordersID", ordersID);%>
        <br><br>
        <input type="button"  id="button" value="View All Cake Models"
        onclick="location.href='../html/viewAll.jsp'"> 
        <br><br>
        <input type="button"  id="button" value="Add New Cake Model"
        onclick="location.href='../html/addCake.jsp'">  
        <br><br>
        <input type="button"  id="button" value="Update cake Model"
        onclick="location.href='../html/updateCake.jsp'">  
        
        <br><br>
        <input type="button"  id="button" value="View Queries"
        onclick="location.href='../html/viewQueries.jsp'">  
        <br><br>
    </form>     
</div> 
</body>    
</html> 