<%@ page language="java"import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
     <%
			String User=session.getAttribute("user");
			String Pass=session.getAttribute("pass");
			String Host=session.getAttribute("server");
			String Port=session.getAttribute("port");
							
			Class.forName("com.mysql.jdbc.Driver");        
			Connection con=DriverManager.getConnection("jdbc:mysql://"+Host +":" + Port,User,Pass);                             
   %>