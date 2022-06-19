<!-- Project Name : Online Cake Shopping System
	 Author Name  : Selvaraji
	 Started At   : 12-12-2021
	 Updated At   : 19-06-2022
	 git- https://github.com/selvaraji/cake_shopping.git -->



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
		    <button class='forgotPasswordBut' onclick='location.href="html/forgotPassword.jsp"'><b> Forgot Password</b></button>
	    </form>     
	</div>    
</body>
</html>