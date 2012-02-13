<%@ page language="java"  errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%
		String Host = null;
		try {	
			if(request.getMethod().equalsIgnoreCase("post")){
				session.setAttribute("user",request.getParameter("user"));
				session.setAttribute("pass",request.getParameter("pass"));
				session.setAttribute("host",request.getParameter("host"));
				session.setAttribute("port",request.getParameter("port"));
			} // Only if user enters the credentials otherwise it is available in the session object.		
		
			Host = (String)session.getAttribute("host");
			out.println("<title> "+ Host + " | JSPMyAdmin 1.1</title>");
		} catch (Exception e){
			out.println("<title> JSPMyAdmin 1.1</title>");			
		}		
	%>   
</head>

<% if(Host != null && !Host.equals("")){ %>

<frameset cols="220,*" rows="0" border="0" frameborder="no"> 
  <frame src="left.jsp" name="nav">
  <frame src="welcome.jsp" name="jspmain">  
</frameset>
<body bgcolor="#f5f5f5"></body>
<% } else { %>
<body bgcolor="#f5f5f5">
<script language="javascript">
	parent.location.href = 'Index.jsp';
</script>
</body>
<% } %>
</html>