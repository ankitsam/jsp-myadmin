<%@ page language="java" import="java.sql.*"  pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String db=request.getParameter("db");
String table=request.getParameter("table");
%>
<%
 		if (db!=null & db!="")
	       {
	       if (table!=null && table!="")
		       {
			   PreparedStatement pstm = con.prepareStatement("USE " + db);
		       pstm.execute();
		       String s="SELECT * INTO OUTFILE \'c:\\\\" +table+".txt\' FROM " + table;
		      pstm = con.prepareStatement(s);
		       pstm.execute();
		       
		       out.println("Table : " + table + " outputed to C:\\"+table + ".txt Successfully!");
		       }
		       else
			    {
			        out.println("Please Select table then click on export");
			    }
		       
	       }
	    else
	    {
	        out.println("Please Select Database then click on export");
	    }

 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
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
