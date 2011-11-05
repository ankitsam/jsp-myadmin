<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String user=request.getParameter("user");
String pass=request.getParameter("pass");

 DatabaseMetaData dbmd = con.getMetaData();
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
	<script language="javascript">
				function validate(objForm){
					
					
					if(objForm.user.value.length==0){
					alert("Please enter User Name!");
						objForm.user.focus();
						return false;
					}
					if(objForm.pass.value.length==0){
					alert("Please enter Password!");
						objForm.pass.focus();
						return false;
					}
					}
	</script>
  </head>
  
  <body  bgcolor="#f5f5f5">
  <%
		 if (user!=null && user !="")
		{
			if (pass!=null && pass!="")
			{

				PreparedStatement pstm = con.prepareStatement("USE mysql");
	       		pstm.execute();
				pstm = con.prepareStatement("INSERT INTO user (Host,User,Password) VALUES('%','"+ user + "',PASSWORD('" + pass+ "'))");
				pstm.executeUpdate();
				
				pstm = con.prepareStatement("GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP ON *.* TO "+ user + "@'%' IDENTIFIED BY '" + pass+ "'");
				pstm.execute();
				pstm = con.prepareStatement("FLUSH PRIVILEGES");
				pstm.execute();
				out.println("User : " + user + " created Successfully with Connect And Resource Grant!");
			}
		}
        else
        {
  
   %>
   <form action="createuser.jsp" method="post" onSubmit="return validate(this)">
   <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   Enter Username and Password (Note: User will be given Select, Insert, Update, Delete, Create And Drop Grant Automatically<br>
   <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password<br>&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="user" maxlength=<%=dbmd.getMaxUserNameLength() %> >&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pass">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Create" name="create">
   <%
   }
    %>
  </body>
</html>
