<%@ page language="java"  errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
<%
    String server=request.getParameter("server");
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%if (server!=null){ %>
    <title><%=server%> | JSPMyAdmin 1.0</title>
    <%}else{ %>
    <title>JSPMyAdmin 1.0</title>
    <%} %>
  </head>

<frameset cols="220,*" rows="0" border="0" frameborder="no"> 
  <frame src="left.jsp" name="nav">
  <frameset cols="0" rows="*,90" border="0" frameborder="no">
  <frame src="welcome.jsp" name="jspmain">
  <frame src="footer.jsp" name="foo">
  </frameset>
</frameset>
<body bgcolor="#f5f5f5">

</body>
  
</html>
