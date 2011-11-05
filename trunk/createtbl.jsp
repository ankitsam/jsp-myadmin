<%@ page language="java" import="java.sql.*"  pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String db=request.getParameter("db");
String alter=request.getParameter("alter");
String newtblname=request.getParameter("newtblname");
String temp;
String newtblfields=request.getParameter("newtblfields");
DatabaseMetaData dbmd = con.getMetaData();
int m;
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="default.css">
	
	
	
  </head>
  
  <body  bgcolor="#f5f5f5">
  <%
	if (newtblname=="")
	{
		out.println("<br>");
		out.println("Please Insert Table Name");
		out.println("<br>");
     	out.println("<br>");
     	out.println("<br>");
	}
	else if (alter!="" && alter!=null)
	{
	   String columnnm;
		PreparedStatement pstm1 = con.prepareStatement("USE "+db);
        ResultSet rst =pstm1.executeQuery();
        pstm1 = con.prepareStatement("SELECT * FROM "+newtblname);
        rst= pstm1.executeQuery();
        ResultSetMetaData rsmd = rst.getMetaData();
       // for(int i=1;i<=rsmd.getColumnCount(); i++) {
         //       columnnm=rsmd.getColumnName(i).toString();
          //      rsmd.getColumnTypeName(i);
            //    rsmd.getColumnDisplaySize(i);
                
                %>
                
                <br>
  				<form action="tabledata.jsp?db=<%=db %>&table=<%=newtblname %>&newtblfields=<%=rsmd.getColumnCount() %>" method="post">
    			<table style="width: 800px">
            		<tr>
               		<td style="width: 10px"></td>
               		<td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0"> 
                    	Field</td>
                		<td style="width: 100px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                    	Type</td>
                		<td style="width: 100px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    	Length</td>
                     	<td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                         	Constraints</td>
            			</tr>
                    	<%
           
        				for(m=1; m<=rsmd.getColumnCount(); m++)
               			{
               
    					%>
    					
				    	<tr>
				         
				         		<td style="width: 10px"></td>
				                <td style="width: 300px;text-align: left;background-color:#f5f5f5">
				                    <%temp="row" + m + "col1";%>
				                    
				                    <input type="text" name=<%=temp %> style="width: 250px;"  maxlength=<%=dbmd.getMaxColumnNameLength() %> value=<%=rsmd.getColumnName(m)%> >
				                    </td>
				                <td style="width: 100px;text-align: left;background-color:#f5f5f5">
				                 <%temp="row" + m + "col2"; %>
				                <select name=<%=temp%> > <option selected="selected"><%=rsmd.getColumnTypeName(m).toString()%></option><option>VARCHAR</option><option>DATE</option><option>TINYINT</option></select>
				                <td style="width: 100px; text-align: left; background-color:#f5f5f5">
				                 <%temp="row" + m + "col3";%>
				                 <input type="text" name=<%=temp%> value=<%=rsmd.getColumnDisplaySize(m)%>>
				                    </td>
				                     <td style="width: 100px; text-align: left; background-color:#f5f5f5">
				                      <%temp="row" + m + "col4";%>
				                      <select name=<%=temp %> > <option></option><option>PRIMARY KEY</option><option>NULL</option><option>NOT NULL</option></select>
				                         </td>
				                    
				            </tr>
				            <%
						    }
						   %>
						   
						   <tr>
			            	<td style="width: 10"></td>
			                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
			                   &nbsp;</td>
			                <td style="width: 100px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
			                   &nbsp; </td>
			                <td style="width: 100px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
			                    &nbsp;</td>
			                     <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
			                         &nbsp;</td>
			                     
			            </tr>
							</table>
							<br>
							&nbsp;&nbsp;&nbsp;<input type="submit" value="Alter" name="create">
							</form>
            
                    <%  
             //   }
	}
	else if (newtblfields.length() == 0 )
	{
		out.println("<br>");
	    out.println("Please Insert Table Fields");
	    out.println("<br>");
     	out.println("<br>");
     	out.println("<br>");
	}
	else if (Integer.parseInt(newtblfields) > dbmd.getMaxColumnsInTable() )
	{
		out.println("<br>");
	    out.println("Please Enter Column No. Less than " + dbmd.getMaxColumnsInTable());
	    out.println("<br>");
     	out.println("<br>");
     	out.println("<br>");
	}
	else
	{
 %>
			 <br>
			  <form action="tabledata.jsp?db=<%=db %>&table=<%=newtblname %>&newtblfields=<%=newtblfields %>" method="post">
			    <table style="width: 800px">
            <tr>
               <td style="width: 10px"></td>
                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0"> 
                    Field</td>
                <td style="width: 100px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                    Type</td>
                <td style="width: 100px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    Length</td>
                     <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                         Constraints</td>
            </tr>
            
           
      
		         <%
		           
		        for(m=1; m<=Integer.parseInt(newtblfields); m++)
		               {
		               
		    %>
    
      
         <tr>
         
         		<td style="width: 10px"></td>
                <td style="width: 300px;text-align: left;background-color:#f5f5f5">
                    <%temp="row" + m + "col1";%>
                    
                    <input type="text" name=<%=temp %> style="width: 250px;"  maxlength=<%=dbmd.getMaxColumnNameLength() %> >
                    </td>
                <td style="width: 100px;text-align: left;background-color:#f5f5f5">
                 <%temp="row" + m + "col2"; %>
                <select name=<%=temp%>> <option>VARCHAR</option><option>DATE</option><option>TINYINT</option></select>
                <td style="width: 100px; text-align: left; background-color:#f5f5f5">
                 <%temp="row" + m + "col3";%>
                 <input type="text" name=<%=temp%>>
                    </td>
                     <td style="width: 100px; text-align: left; background-color:#f5f5f5">
                      <%temp="row" + m + "col4";%>
                      <select name=<%=temp %> > <option></option><option>PRIMARY KEY</option><option>NULL</option><option>NOT NULL</option></select>
                         </td>
                    
            </tr>
			      <%
			    }
			   %>
			  				
            <tr>
            	<td style="width: 10"></td>
                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                   &nbsp;</td>
                <td style="width: 100px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                   &nbsp; </td>
                <td style="width: 100px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    &nbsp;</td>
                     <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                         &nbsp;</td>
                     
			            </tr>
			</table>
			<br>
			&nbsp;&nbsp;&nbsp;<input type="submit" value="Create" name="create">
			</form>
<%
}
 %>
  </body>
</html>
