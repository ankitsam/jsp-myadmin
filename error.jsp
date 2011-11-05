<%@ page isErrorPage="true" import="java.util.*" %> 
<html>
<head>
<title>Error</title></head>
<table border="0" cellspacing="0" cellpadding="5" width="631" align="left" height="98">
<tr>

<td align="left"><div align="left"> <b>Error :<br></b></div> </td>
</tr>
<tr> 

<td align="left">The exception was: <font color="red"><b><%=exception.toString()%></b></font></td>
</tr>
<tr> 

<td align="left">The exception class was : <font color="red"><b><%=exception.getClass()%></b></font></td>
</tr>
</table> 
<body><div align="left"><br></div><div align="left"><br></div></body>
</html>
<%
/*PrintWriter tr = new PrintWriter(out);                        
exception.printStackTrace(tr);*/

application.log(request.getRequestURI()+request.getQueryString(), exception);
%>