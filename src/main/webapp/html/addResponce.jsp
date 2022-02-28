<%@ page  import = "com.aspire.cake.bean.GetProducts"  import = "com.aspire.cake.database.LoginDao" import ="java.sql.*"
 language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    String id = request.getParameter("id");
    String text = request.getParameter(id);
    System.out.println(id);
    System.out.println(text);
    LoginDao loginDao = new LoginDao();
    loginDao.loadDriver(loginDao.databaseDriver);
    Connection connection = loginDao.getConnection();
    
    try {
    	Statement statement2 = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY );
    	statement2.execute("UPDATE ORDERS SET responce ='"+text+"' WHERE ORDERID ='"+id+"' ;");
    } catch (SQLException e) {
    	e.printStackTrace();
    }
    response.sendRedirect("../html/viewQueries.jsp");
    %>