<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String db=request.getParameter("db");
String table=request.getParameter("table");
String server=request.getParameter("server");
%>
 <%@ include file="header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="./default.css" rel="stylesheet" type="text/css"/>
	
	<script language="javascript">
			function validate(objForm){
				
				
				if(objForm.textarea.value.length==0){
				alert("Please enter SQL Query!");
					objForm.textarea.focus();
					return false;
				}
				}
</script>

  </head>
  
  <body  bgcolor="#f5f5f5"><br>
  &nbsp;&nbsp;&nbsp;
  Run SQL query/queries on database : <%=db %>
  <form action="tabledata.jsp?db=<%=db %>" method="post" onSubmit="return validate(this)">
     &nbsp;&nbsp;&nbsp;<textarea id="query" name="textarea" cols="0" rows="0" style="width: 600px; position: static;
        height: 191px; left: 2px; overflow: auto; top: 42px;" ></textarea><br><br>
        &nbsp;&nbsp;&nbsp;<input type="submit" value="Go" name="go">
        </form>
  </body>
</html>
