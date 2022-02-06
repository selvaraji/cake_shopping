
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
                <div class="scrollmenu">
                    <img src = "../photos/cake 1.png" onclick="shapeClick('../photos/cake 1.png')">
                    <img src = "../photos/cake 3.png" onclick="shapeClick('../photos/cake 3.png')">
                    <img src = "../photos/cake 4.png" onclick="shapeClick('../photos/cake 4.png')">
                    <img src = "../photos/cake 5.png" onclick="shapeClick('../photos/cake 5.png')">
                    <img src = "../photos/cake 3.png" onclick="shapeClick('../photos/cake 3.png')">
                    <img src = "../photos/cake 4.png" onclick="shapeClick('../photos/cake 4.png')">
                    <img src = "../photos/cake 1.png" onclick="shapeClick('../photos/cake 1.png')">
                    <img src = "../photos/cake 5.png" onclick="shapeClick('../photos/cake 5.png')">
                </div>
                <div class="scrollmenu">
                    <img src = "../photos/cake 1.png" onclick="sideClick('../photos/cake 1.png')">
                    <img src = "../photos/cake 3.png" onclick="sideClick('../photos/cake 3.png')" >
                    <img src = "../photos/cake 4.png" onclick="sideClick('../photos/cake 4.png')" >
                    <img src = "../photos/cake 5.png" onclick="sideClick('../photos/cake 5.png')" >
                    <img src = "../photos/cake 3.png" onclick="sideClick('../photos/cake 3.png')" >
                    <img src = "../photos/cake 4.png" onclick="sideClick('../photos/cake 4.png')" >
                    <img src = "../photos/cake 1.png" onclick="sideClick('../photos/cake 1.png')" >
                    <img src = "../photos/cake 5.png" onclick="sideClick('../photos/cake 5.png')" >
                </div>
                <div class="scrollmenu">
                    <img src = "../photos/cake 1.png" onclick="topClick('../photos/cake 1.png')" >
                    <img src = "../photos/cake 3.png" onclick="topClick('../photos/cake 3.png')" >
                    <img src = "../photos/cake 4.png" onclick="topClick('../photos/cake 4.png')" >
                    <img src = "../photos/cake 5.png" onclick="topClick('../photos/cake 5.png')" >
                    <img src = "../photos/cake 3.png" onclick="topClick('../photos/cake 3.png')" >
                    <img src = "../photos/cake 4.png" onclick="topClick('../photos/cake 4.png')" >
                    <img src = "../photos/cake 1.png" onclick="topClick('../photos/cake 1.png')" >
                    <img src = "../photos/cake 5.png" onclick="topClick('../photos/cake 5.png')" >
                </div>
                <input type="button" id = "buynow" value = "Buy Now" onclick="">
            </div>
        </div>
        <div class="col-md-3">
            <div id = "output">
                <img id = "shape" src = "../photos/test2.png">
                <img id = "side" src = "../photos/test1.png">
                <img id = "upper" src = "../photos/cake 5.png">
            </div>
        </div>
    </div>
    <script src = "../javascript/design.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>