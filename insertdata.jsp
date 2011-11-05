<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String newtblfields=request.getParameter("newtblfields");
String db=request.getParameter("db");
String table=request.getParameter("table");
boolean f=false;
String query="";
if (request.getParameter("col1")!="")
	{
		
       		
       		
       			for(int i=1;i<=Integer.parseInt(newtblfields);i++)
       			{
       				if (request.getParameter("col" + i)!= "" )
       				{
       					if (query=="")
       					{
       					query= "\"" + request.getParameter("col" + i ) + "\"";
       					}
       					else
       					{
       	  			    query=query+ ",\""+ request.getParameter("col" + i) + "\"";
       	  			    }
       	  			}
       	  			else
       	  			{
       	  				f=true;
       	  				break;
       	  				
       	  			}
       			}
       			
       			if (f==false)
       			{
       			query=" values("+ query;
       			query=query+")";
       			
       			PreparedStatement pstm = con.prepareStatement("USE " + db);
       			pstm.execute();
	   			pstm = con.prepareStatement("INSERT INTO " + table +query);
       			pstm.executeUpdate(); 
       			}      			   			
       			
	}
	else
	{
		f=true;
	}
%>
<jsp:include page="tabledata.jsp"/>
<%
    if (f==false)
    {
     out.println("<br>");
     out.println("&nbsp; &nbsp; &nbsp; &nbsp;");
     out.println("INSERT INTO " + table +query);
     out.println("<br>");
     out.println("&nbsp; &nbsp; &nbsp; &nbsp;");
     out.println("1 Row Inserted");
     }
     else
     {
     out.println("<br>");
     out.println("&nbsp; &nbsp; &nbsp; &nbsp;");
     out.println("Some fields are empty");
     }
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Insert Data</title>
    
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
