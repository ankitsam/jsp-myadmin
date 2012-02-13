<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ include file="login.jsp" %>
    <%
    String server=Host;
	PreparedStatement pstm = con.prepareStatement("SHOW STATUS");
    ResultSet rst = pstm.executeQuery();
    DatabaseMetaData dbmd = con.getMetaData();
    String i="1";
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link href="./default.css" rel="stylesheet" type="text/css"/>


<script language="javascript">
			function validate(objForm){
				
				
				if(objForm.newdbname.value.length==0){
				alert("Please enter Database Name!");
					objForm.newdbname.focus();
					return false;
				}
				}
</script>
</head>

<body bgcolor="#f5f5f5">
<form action="createdb.jsp?mknewdb=<%=i %>" method="post" name="newdbname" onSubmit="return validate(this)"> 

<table width="856" height="399">
<tr>

<td>


<h2  style="color: #0066AC">My SQL Information</h2><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9"> Server Version : <%=dbmd.getDatabaseProductVersion() %> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9"> Server : <%=dbmd.getDatabaseProductName()%><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9"> User : <%=dbmd.getUserName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <br><br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;  <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9"> Create New Database<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
<input type="text" name="newdbname" maxlength=<%=dbmd.getMaxTableNameLength() %> >&nbsp;&nbsp;&nbsp;
<input type="submit" value="Create" name="create"><br><br><br> 
 </form>
 <br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;
 
 <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9" ><a href="createuser.jsp"  >Create User</a>
  <br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;  &nbsp;&nbsp;  &nbsp;&nbsp;
 <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9" ><a href="tabledata.jsp?server=localhost&db=mysql&table=user"><span>Privileges</span></a>

 </td>
 </tr>
 <tr>
<td align="right">
<br /><br />
<h2  style="color: #0066AC">JSP MyAdmin Information</h2><br />
Version :&nbsp; 1.1<br />
<a href="http://code.google.com/p/jsp-myadmin/" target="_blank">Google Code Project</a>
<br /><br /><br />
Contributer: <br /> <font size="+1">Jaswant Singh</font> <br /> Email: bagheljas@yahoo.com<br /> LinkedIn: <a href="http://www.linkedin.com/in/jaswantsingh" target="_blank">www.linkedin.com/in/jaswantsingh</a>
<br /><br />
Creator: <br /><font size="+1">Ankit Sharma</font> <br /> Email: ankit_sam2001@yahoo.com<br /> LinkedIn: <a href="http://in.linkedin.com/in/ankitsharma2001" target="_blank">in.linkedin.com/in/ankitsharma2001</a>
</td>

</tr>
</table>



</body>
</html>
