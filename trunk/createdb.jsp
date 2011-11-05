<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
 <%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String newdbname=request.getParameter("newdbname");
String mknewdb=request.getParameter("mknewdb");


 %>
 
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
	<link rel="stylesheet" type="text/css" href="default.css">


<script language="javascript">
  <!--
	 function IsNumeric(strString) //  check for valid numeric strings	
     {
     	if(!/\D/.test(strString)) return true;
     	else return false;
    }
    function validate(objForm){
		    if (objForm.newtblfields.value.length == 0) 
		      {
		      alert("Please Enter No. of Table Columns");
		      return false;
		      } 
		   else if (IsNumeric(objForm.newtblfields.value) == false) 
		      {
		      alert("Invalid No. of Table Columns!");
		      return false;
		      }
      }
	</script>
  </head>
  
  <body  bgcolor="#f5f5f5"><br>
  
  <%
	// if (mknewdb=="1")
     //{
 		//out.println("Please ");
	  //}
    if (newdbname=="")
    {
     out.println("<br>");
     out.println("Please Insert Database Name");
     out.println("<br>");
     out.println("<br>");
     out.println("<br>");
     
	}
	else if (newdbname!=null)
	{
	   PreparedStatement pstm = con.prepareStatement("CREATE DATABASE " + newdbname);
       pstm.execute();
       out.println("Database : " + newdbname +" Created Successfully!");
       
       
	
  %>
  
  
  <form action="createtbl.jsp?db=<%=newdbname %>" method="post" onSubmit="return validate(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
     
     <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9"> Create New Table<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name <input type="text" name="newtblname">&nbsp; No. of Fields&nbsp; <input type="text" name="newtblfields"> &nbsp; 
	 <input type="submit" value="Create" name="create">
	 
	 </form>
	 <%
	 }
	  %>
  </body>
</html>
