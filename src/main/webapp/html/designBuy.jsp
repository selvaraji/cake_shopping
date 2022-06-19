<%@ page import ="com.aspire.cake.database.LoginDao" 
import ="java.sql.*"
import = "java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    String[] array = request.getParameter("pic").split("~");
    String upper = array[0];
    String side = array[1];
   
    
    request.setAttribute("upper", upper);
    request.setAttribute("side", side);
    
    String[] topName = upper.split("/");
    String[] sideName = side.split("/");
	String[] top = topName[8].split("");
	String[] sid = sideName[8].split("");
	
	//
    %>
    <head>
	<meta charset="ISO-8859-1">
	<title>Design Buy</title>
	<link rel="stylesheet" type="text/css" href="../css/productView.css">
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
	<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
	</head>
	
    <body>
			<div class="popup" id = "pop" style =" width: 500px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 20px;  
        background-color: #37bdf1d1;
        border-radius: 15px ;  
        box-shadow: 10px 10px 20px #000000; ">
        
				<h2>Design Cake Buy View </h2>
				<h3>Price : R.S 1000</h3>
				<h3></h3>
				<%out.println("<a href ='../html/addCardDesign.jsp?top="+top[0]+"&side="+sid[0]+"'><input type='button' id='cart' value='Add To Cart'></a>");%>
				<a href = '../html/design.jsp' ><input type='button' id='buy' value='Cancel'></a>
				<h3> </h3>
				<h2>Disclaimer :</h2>
				<h3>Price include all processing charges</h3>
			</div>
	</body>
	
	