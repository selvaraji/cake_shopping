<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%
    session.setAttribute("categoryTemp",request.getParameter("categoryName"));
    response.sendRedirect("../html/addCake.jsp");
    %>