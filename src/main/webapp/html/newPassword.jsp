<%@ page  import = "com.aspire.cake.bean.*" import="java.util.Random" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String email = request.getParameter("email");
    Email mail = new Email();
    Random random = new Random();
    int length = 6;
    int left = 65;
	int right = 90;
    String otp = random.ints(left, right+1).limit(length).collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();
    String text = "Your OTP is : "+otp+"";
    mail.sendMail(email, text);
    %>
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
		<form id="login" method="post" action="../html/password.jsp">  
						<input type='hidden' id='otp' name = 'otp' value="<%=otp%>">
						<input type='hidden' id='email' name = 'email' value="<%=email%>">
						<label><b>Enter OTP  
				        </b>    
					    </label>    
					    <input type="text"  name = "userotp" id="name" placeholder="OTP (Capital Letters Only)" required  minlength = '6' maxlength="6">    
					    <br>     
						<label><b>Password     
				        </b>    
					    </label>    
					    <input type="Password"  name = "Pass" id="Pass" placeholder="Password" required minlength = '8' maxlength="20">    
					    <br>  
					    <label><b>Confirm Password     
				        </b>
				        </label>
				        <input type="Password2"  name = "Pass2" id="Pass2" placeholder="Password" required minlength = '8' maxlength="20">    
					    <br><br>  
					    <input type="submit" name="log" id="log" value="Change Password" >     
					    <br><br>
</form>
</div>
<script src="../javascript/script.js"></script>
</body>
</html>