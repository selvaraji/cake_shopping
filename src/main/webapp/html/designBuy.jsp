<%@ page import ="com.aspire.cake.database.LoginDao" 
import ="java.sql.*"
import = "java.util.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    String[] array = request.getParameter("pic").split("~");
    String upper =".."+array[0].substring(35);
    String side =".."+array[1].substring(35);
   
    
    request.setAttribute("upper", upper);
    request.setAttribute("side", side);
    
    
	String email = (String) session.getAttribute("email");
	LoginDao loginDao = new LoginDao();
	loginDao.loadDriver(loginDao.databaseDriver);
	String cartIDData = "";
	String finalCart = "";
	String query1 = "SELECT CARTID FROM USER WHERE EMAIL = '"+email+"';";
	//
    %>