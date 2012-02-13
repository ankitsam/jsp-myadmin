<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1" %>

<%
	session.setAttribute("user","");
	session.setAttribute("pass","");	
	session.setAttribute("host","");
	session.setAttribute("port","");
	response.sendRedirect("Index.jsp");
%>
