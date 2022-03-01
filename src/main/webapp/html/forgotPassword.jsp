<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Forgot Password</title>    
    <link rel="stylesheet" type="text/css" href="../css/style.css">   
     <link rel="shortcut icon" type="image/x-icon" href="favicon.ico"> 
</head>
<body>
    <br>
    <div class="login">
		<form id="login" action= "../html/newPassword.jsp">      
	        <label><b>Email     
	        </b><br>
	        </label>    
	        <input type="email"  name ="email" id="email" placeholder="Email" required>    
	        <br><br>
	        <input type="submit" name="signUp" id="signUp" value="Send OTP" >  
		    <br><br>
		    
	    </form>     
	</div>    
</body>
</html>