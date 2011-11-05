<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String db=request.getParameter("db");
String table=request.getParameter("table");
String field=request.getParameter("field");
String val=request.getParameter("val");

				PreparedStatement pstm = con.prepareStatement("USE " + db);
       			pstm.execute();
	   			pstm = con.prepareStatement("DELETE FROM " + table + " WHERE "+ field + "='" + val +"'");
       			pstm.executeUpdate();
%>
<jsp:include page="tabledata.jsp"/>
<%
   
     out.println("<br>");
     out.println("&nbsp; &nbsp; &nbsp; &nbsp;");
     out.println("1 Row Deleted");
     
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deletedata.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  </body>
</html>
