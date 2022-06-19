
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>    
<html>    
<head>    
	<meta charset="ISO-8859-1">
    <title>Cake Design</title>    
    <link rel="stylesheet" type="text/css" href="../css/designStyle.css"> 
    <link rel="stylesheet" type="text/css" href="../css/user.css"> 
    <link rel="stylesheet" type="text/css" href="../css/admin.css">    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>    
<body>
<div id= "bar">
		<ul>
		<li><a href="../html/user.jsp">Home</a></li>
	
			<li>
				<div class="dropdown">
					<a href="#" class="accountdropbtn">Account <% out.print("("+session.getAttribute("name")+")"); %> </a>
					<div class="account-content">
						<a href="../html/profile.jsp">Profile</a> <a
							href="../html/orders.jsp">Orders</a> <a href="../html/cart.jsp">Cart</a>
						<a href="../html/help.jsp">Help</a> <a href="../html/clearData.jsp">Logout</a>
					</div>
				</div>
			</li>
			<li><a href="../html/about.jsp" class="about">About</a>
			</li>
		</ul>
	</div>
    <script src = "../javascript/design.js"></script>
    <div class ="row">
        <div class ="col-md-5">
            <div class = "sam">
              <br>
              	<div class="scrollmenu">
              	
              		<%for(int i=1; i<9; i++)
              			{
              				out.println("<img src = \"../photos/design/round/top/"+i+".png\" onclick=\"topClick('../photos/design/round/top/"+i+".png')\">");
              		
              			}%>
                </div>
              
              
                <div class="scrollmenu">
                
                		<%for(int i=1; i<4; i++)
              			{
              				out.println("<img src = \"../photos/design/round/side/"+i+".png\" onclick=\"sideClick('../photos/design/round/side/"+i+".png')\">");
              		
              			}%>
                
                </div>
                
                <input type="button" id = "buynow" value = "Goto Buy" onclick="buy()">
            </div>
        </div>
        <div class="col-md-3">
            <div id = "output">
                <!--  <img id = "shape" src = "../photos/test2.png">-->
                <img id = "side" src = "../photos/design/round/side/1.png">
                <img id = "upper" src = "../photos/design/round/top/1.png">
            </div>
        </div>
    </div>
    <script src = "../javascript/design.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>