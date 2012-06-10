<%@ page language="java" import="java.sql.*,java.lang.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
   <%@ include file="login.jsp"%> 
    <%@ include file="functions.jsp"%>
    
    
    <%
    
    String db=request.getParameter("db");  
    String server=request.getParameter("server");
    DatabaseMetaData dbmd = con.getMetaData();
    
     %>
     <%@ include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tables</title>
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
		    else if (objForm.newtblname.value.length == 0) 
		      {
		      alert("Please Enter Table Name!");
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
<link href="./default.css" rel="stylesheet" type="text/css"/>
<body  bgcolor="#f5f5f5">
 <%
 				String[] tablelist= null;
 				PreparedStatement pstm = con.prepareStatement("SHOW TABLES FROM "+db);
                 ResultSet rst = pstm.executeQuery();
                tablelist= new String[mysql_num_rows(rst)];
                int num_tables=0;        
                while (rst.next()) {
                             tablelist[num_tables]=rst.getString(1);
                             num_tables++;
                }
               
           %>

           <table style="width: 800px">
            <tr>
            <td style="width: 50px"></td>
                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    Table</td>
                <td style="width: 400px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                    Action</td>
                <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    Records</td>
                     <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                         Type</td>
                     <td style="width: 200px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                         Collation</td>
            </tr>
            
           <%
           
        for(int m=0; m<num_tables; m++)
               {
                String localtable = tablelist[m];
    %>
    
      
        
      
         <tr>
         
         <td><input type="checkbox" name="kk"></td>
                <td style="width: 300px;text-align: left;background-color:#f5f5f5">
                
                    <a href="tabledata.jsp?server=<%=server%>&db=<%=db%>&table=<%=localtable%>" target="jspmain"><%=localtable%></a></td>
                <td style="width: 400px;text-align: left;background-color:#f5f5f5">
                	<center>
                	
                	<a href="tabledata.jsp?server=<%=server%>&db=<%=db%>&table=<%=localtable%>" target="jspmain"><img class="icon" src="./Images/browse.png" alt="Browse Table"/></a>
                	
                	<a href="createtbl.jsp?newtblname=<%=localtable %>&db=<%=db %>&alter=yes"> <img class="icon" src="./Images/edit.png" alt="Drop Table" /></a>
                	<a href="drop.jsp?table=<%=localtable %>&db=<%=db %>&empty=yes"> <img class="icon" src="./Images/empty.png" alt="Drop Table" /></a>
                	<a href="drop.jsp?table=<%=localtable %>&db=<%=db %>"> <img class="icon" src="./Images/delete.png" alt="Drop Table" /></a>
                	</center>
                    </td>
                <td style="width: 200px; text-align: left; background-color:#f5f5f5">
                <%
                pstm = con.prepareStatement("USE `"+db+"`");
                pstm.execute();
                pstm = con.prepareStatement("SELECT COUNT(*) \"count\" FROM "+localtable);
                 rst = pstm.executeQuery();
                 String rows="";
                 while (rst.next())
                 {
               		rows=rst.getString(1);
               }
//                 String rows=rst.getString(0);
                  %>
                    <center> <%=rows %> </center>
                    </td>
                     <td style="width: 200px; text-align: left; background-color:#f5f5f5">
                     	<%
                     	pstm = con.prepareStatement("USE `"+db+"`");
                		pstm.execute();
                		pstm = con.prepareStatement("SHOW TABLE STATUS");
                 		rst = pstm.executeQuery();
                 		
                 		rows="";
                 		while (rst.next())
                 		{
               				rows=rst.getString(2);
               			}
                     	 %>
                     	<center> <%=rows %> </center>
                         </td>
                     <td style="width: 200px; text-align: left; background-color:#f5f5f5">
                     
                     <%
                     	pstm = con.prepareStatement("USE `"+db+"`");
                		pstm.execute();
                		pstm = con.prepareStatement("SHOW TABLE STATUS");
                 		rst = pstm.executeQuery();
                 		
                 		rows="";
                 		while (rst.next())
                 		{
               				rows=rst.getString(15);
               			}
                     	 %>
                     	<center> <%=rows %> </center>
                         </td>
            </tr>
       <%
    }
   %>
  				
            <tr>
            	<td style="width: 50px"></td>
                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    <%=num_tables%>  table(s)</td>
                <td style="width: 400px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                    </td>
                <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    </td>
                     <td style="width: 200px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                         </td>
                     <td style="width: 200px; font-family: Calibri;font-weight: bold;text-align: center; background-color: #d0dce0">
                         </td>
            </tr>
</table>
<form action="createtbl.jsp?db=<%=db %>" method="post" onSubmit="return validate(this)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
    
     <img class="icon" src="./Images/arrow.png" alt="-" width="5" height="9"> Create New Table<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name <input type="text" name="newtblname" maxlength=<%=dbmd.getMaxTableNameLength() %> >&nbsp; No. of Fields&nbsp; <input type="text" name="newtblfields" maxlength=<%=String.valueOf(dbmd.getMaxColumnsInTable()).length() %>> &nbsp; 
	 <input type="submit" value="Create" name="create">
	 
	 </form>
</body>
</html>