<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>    
<html>    
<head>    
	<meta charset="ISO-8859-1">
    <title>Sign Up</title>    
    <link rel="stylesheet" type="text/css" href="../css/style.css">  
     <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
</head>    
<body>    
    <h1>Sign up Page</h1>
    <div class="SignUp">    
	    <form id="SignUp" action= "../signup" method = "post">      
	        <label><b>Name   
	        </b><br>
	        </label>    
	        <input type="text" name="name" id="name" placeholder="Example" required maxlength="20">    
	        <br>
	        
	        <label><b>Age   
	        </b><br>
	        </label>    
	        <input  type="number" name="age" id="age" placeholder="Age" required min="16">     
	        <br>
	        <label><b>Phone Number  
	        </b><br>
	        </label>    
	        <input type="text" name="phoneNumber" id="phoneNumber" placeholder="Phone Number" required minlength = '10' maxlength = "10">    
	        <br>
	        <label><b>Email 
	        </b><br>
	        </label>    
	        <input type="email" name="email" id="email" placeholder="example@gmail.com" required maxlength="25">    
	        <br>
	        <label><b>Password     
	        </b>    
	        </label>    
	        <input  type="Password" name="Pass" id="Pass" placeholder="Password"  required minlength = '8' maxlength="20">    
	        <br>  
	        <label><b>Confirm Password     
	        </b>    
	        </label>    
	        <input  type="Password" id="Pass2" placeholder="Confirm Password"  required minlength = '8' maxlength="20">    
	        <br>  
	        <label><b>Address     
	        </b><br>
	        </label>    
	        <input type="text" name="address" id="address" placeholder="Address"  required maxlength="50">    
	        <br><br>    
	        <input type="submit" name="signUp" id="signUp" value="SignUp">  
	    </form>     
	</div>    
    <script src="../javascript/script.js"></script>
</body>    
</html>  
