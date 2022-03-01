<%@ page  import="com.aspire.cake.database.*" import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
    <%
    String email = request.getParameter("email");
    String otp = request.getParameter("otp");
    
    String password = request.getParameter("Pass");
    String otpUser = request.getParameter("userotp");
   // System.out.println(otp+" "+email+" "+password+" "+otpUser+" ");
    if(otp.equals(otpUser))
    {
    	LoginDao loginDao = new LoginDao();
    	loginDao.loadDriver(loginDao.databaseDriver);
    	String query = "UPDATE USER SET PASS= '"+password+"' WHERE EMAIL = '"+email+"';";
    	try
    	{
    		Connection connection = loginDao.getConnection();
    		Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
    		statement.execute(query);
    		out.println("<script> alert('Password Successfully Changed'); document.location.href='../index.jsp';</script>");
    		//response.sendRedirect("../index.jsp");
    	}
    	catch(Exception e)
    	{
    		System.out.println(e);
    		out.println("<script> alert('Something Went wrong try Again'); document.location.href='../index.jsp';</script>");
    		//response.sendRedirect("../index.jsp");
    	}
    }
    else
    {
    	out.println("<script> alert('Otp MisMatch plaese try Again'); document.location.href='../index.jsp';</script>");
    }
    
    %>