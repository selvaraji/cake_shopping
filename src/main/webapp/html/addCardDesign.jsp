<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String top = request.getParameter("top");
String side = request.getParameter("side");

String link ="/user?addtocart="+top+"~"+side;
response.sendRedirect(request.getContextPath()+link);
%>