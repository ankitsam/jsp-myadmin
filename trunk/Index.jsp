<%@ page language="java" pageEncoding="ISO-8859-1" errorPage="error.jsp" contentType="text/html"%>
<%@page import="java.util.*"%>
<%
//
String t=new GregorianCalendar().getTime().toString();
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

  
 

        

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>JSPMyAdmin 1.0</title>
    
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
				
				
				if(objForm.user.value.length==0){
				alert("Please enter username!");
					objForm.user.focus();
					return false;
				}
				
				if(objForm.pass.value.length==0){
					alert("Please enter password!");
					objForm.pass.focus();
					return false;
				}
				if(objForm.server.value.length==0){
					alert("Please enter Host Name!");
					objForm.server.focus();
					return false;
				}
				
				if(objForm.port.value.length==0){
					alert("Please enter port name!");
					objForm.port.focus();
					return false;
				}
				<%
					if (request.getMethod().equals("post"))
					{
		     			session.setAttribute("user",request.getParameter("user"));
						session.setAttribute("pass",request.getParameter("pass"));
						}

				%>
				
				return true;
			}
          </script>
  </head>
  
  <body bgcolor="#d0dce0">
  <table>
  <tr>
  <td style="background-color: White; width:1700px">
<img class="icon" src="./Images/logo.png" alt="-">
</td>
</tr>
</table>
<center style="text-align: center;"><%=t%></center>
 <form action="Main.jsp" method="post" name="login" onSubmit="return validate(this)"> 
<table align=center bgcolor="#f5f5f5" style="width: 316px; height: 100px">
            <tr>
                <td style="width: 184px;">
                    Username</td>
                <td style="width: 5px">
                <input type="text" name="user" style="width: 226px"></td>
                
            </tr>
            <tr>
                <td style="width: 184px; height: 1px;">
  Password</td>
                <td style="width: 5px; height: 1px">
                <input type="password" name="pass" style="width: 226px"></td>
                
            </tr>
            <tr>
                <td style="width: 184px;">
  Server 
                </td>
                <td style="width: 5px">
                <input type="text" name="server" style="width: 227px"></td>
               
            </tr>
            <tr>
                <td style="width: 184px; height: 3px;">
  Port</td>
                <td style="width: 5px; height: 3px">
                <input type="text" name="port" style="width: 226px"></td>
               
            </tr>
            <tr>
                <td style="width: 184px; height: 3px;">
  </td>
                <td style="width: 5px; height: 3px">
                    &nbsp;<input type="submit" value="Login" name="login" style="width: 86px"></td>
               
            </tr>
        </table>
        
        </form>
        
  </body>
</html>