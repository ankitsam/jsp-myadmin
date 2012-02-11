<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
     <%
			String User=(String)session.getAttribute("user");
			String Pass=(String)session.getAttribute("pass");
			String Host=(String)session.getAttribute("server");
			String Port=(String)session.getAttribute("port");
							
			Class.forName("com.mysql.jdbc.Driver");        
			Connection con=DriverManager.getConnection("jdbc:mysql://"+Host +":" + Port,User,Pass);                             
   %>