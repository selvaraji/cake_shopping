<!-- Project Name : Online Cake Shopping System
	 Author Name  : Selvaraji A
	 Started At   : 12-12-2021
	 Updated At   : 31-01-2022
product view page
ratings, specification, reviews, -->



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Welcome</title>    
    <link rel="stylesheet" type="text/css" href="css/style.css">   
     <link rel="shortcut icon" type="image/x-icon" href="favicon.ico"> 
</head>
<body>
	<h1 id="welcometxt">Welcome To Online Cake Shopping</h1>

    <br>
    <div class="login">
		<form id="login" method="post" action="login">      
	        <label><b>Email     
	        </b><br>
	        </label>    
	        <input type="email"  name ="email" id="email" placeholder="Email" required>    
	        <br>
	        <label><b>Password     
	        </b>    
		    </label>    
		    <input type="Password"  name = "Pass" id="Pass" placeholder="Password" required>    
		    <br><br>   
		    <input type="submit" name="log" id="log" value="Log In" >     
		    <br><br>
		    <input type="button" name="signUp" id="signUp" value="SignUp" onclick="location.href='html/signup.jsp'">  
		    <br><br>    
		    <label><b> Forgot Password</b></label> 
	    </form>     
	</div>    
<script src="javascript/script.js"></script>  
</body>
</html>