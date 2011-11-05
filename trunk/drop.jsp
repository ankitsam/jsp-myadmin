<%@ page language="java" import="java.sql.*"  pageEncoding="ISO-8859-1"%>
 <%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String db=request.getParameter("db");
String table=request.getParameter("table");
String empty=request.getParameter("empty");
%>
<%
       if (empty=="" || empty==null)
       {
	       if (db!=null && table==null)
	       {
		   PreparedStatement pstm = con.prepareStatement("DROP DATABASE " + db);
	       pstm.execute();
	       out.println("Database : " + db +" Dropped Successfully!");
	       }
	       else if (table!=null)
	       {
	       PreparedStatement pstm = con.prepareStatement("USE " + db);
	       pstm.execute();
	       pstm = con.prepareStatement("DROP TABLE " + table);
	       pstm.execute();
	       out.println("Table : "+ table + " dropped Successfully!");
	       }
       }
       else
       {
       		if (db!=null && table!=null)
	       {
	       		 PreparedStatement pstm = con.prepareStatement("USE " + db);
	       		pstm.execute();
			    pstm = con.prepareStatement("DELETE FROM " + table);
		       pstm.execute();
		       out.println("Table : " + table+ " Emptied Successfully!");
	       }
       }
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Drop Database</title>
    <link href="./default.css" rel="stylesheet" type="text/css"/>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body  bgcolor="#f5f5f5">
    
  </body>
</html>
