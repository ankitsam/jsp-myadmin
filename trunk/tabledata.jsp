<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<%@ include file="login.jsp"%>
<%
String db=request.getParameter("db");  
String table=request.getParameter("table");
String query1=request.getParameter("textarea");
String newtblname=request.getParameter("table");
String newtblfields=request.getParameter("newtblfields");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

ResultSetMetaData rsmd;
%>
<%@ include file="header.jsp"%>

                 
<% int num_rows=0;
ResultSet rst;

if (request.getParameter("row1col1")!=null)
	{
		String query="";
       		
       		
       			for(int i=1;i<=Integer.parseInt(newtblfields);i++)
       			{
       				if (request.getParameter("row" +i + "col1")!="")
       				{
       					if (query=="")
       					{
       					query=request.getParameter("row" + i + "col1") + " " + request.getParameter("row" + i + "col2") + "(" + request.getParameter("row" + i + "col3") + ") " + request.getParameter("row" + i + "col4");
       					}
       					else
       					{
       	  			    query=query+ ","+ request.getParameter("row" + i + "col1") + " " + request.getParameter("row" + i + "col2") + "(" + request.getParameter("row" + i + "col3") + ") " + request.getParameter("row" + i + "col4");
       	  			    }
       	  			}
       	  			else
       	  			{
       	  				break;
       	  			}
       			}
       			query="("+ query;
       			query=query+")";
       			
       			PreparedStatement pstm = con.prepareStatement("USE " + db);
       			 rst=pstm.executeQuery();
	   			pstm = con.prepareStatement("CREATE TABLE " + newtblname +query);
       			pstm.execute();
       			
       			out.println("Table : " + newtblname +" created successfully!");
       			
       			
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script language="javascript" src="confirm.js" type="text/javascript"></script>
    <base href="<%=basePath%>">
    
    <title>Table Data</title>
  
  
  <body bgcolor="#f5f5f5">
			<%
		 		String columnnm,record;
		 		PreparedStatement pstm1 = con.prepareStatement("USE "+db);
                rst =pstm1.executeQuery();
                if (query1=="" || query1==null)
                {
 					pstm1 = con.prepareStatement("SELECT * FROM "+table);
 				}
 				else
 				{
 				pstm1 = con.prepareStatement(query1);
 				}
                 rst= pstm1.executeQuery();
                 rsmd = rst.getMetaData();
                 
                 %>
		 
                 <table style="width: 1000px">
            <tr>
            <td colspan="2" style="width: 100px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">Action</td>
            <% 
                for(int i=1;i<=rsmd.getColumnCount(); i++) {
                columnnm=rsmd.getColumnName(i).toString();
                
			%>

                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                    <%=columnnm +"  " + rsmd.getColumnTypeName(i)+ "("+rsmd.getColumnDisplaySize(i)+")"
                    %></td>
            
    			<%}%>
           </tr>
           <%
          
           	while(rst.next()) {
            %>
           <tr>
           <td colspan="2">
           <a href="javascript:dRecord('deletedata.jsp?db=<%=db%>&table=<%=table%>&field=<%=rsmd.getColumnName(1) %>&val=<%=rst.getString(1) %>')"><img class="icon" src="./Images/Delete.gif" alt="Delete Record"/></a>
           </td>           
         <% 
                for(int i=1;i<=rsmd.getColumnCount(); i++) {
                record=rst.getString(i);
			%>
         
                <td style="width: 300px;text-align: left;background-color:#f5f5f5">
                    <%=record%>
                    </td>
                    <%
                    }
                     %>
            </tr>
            <%
            num_rows++;
            }
             %>
             
             <tr>
            <td style="width: 5px"></td>
            
             <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                <%=num_rows %> Row(s)</td>
            <% 
                for(int i=1;i<rsmd.getColumnCount(); i++) {
			%>

                <td style="width: 300px;font-family: Calibri;font-weight: bold; text-align: center; background-color: #d0dce0">
                </td>
            
    			<%}%>
           </tr>
            
           </table>
            &nbsp; &nbsp; &nbsp; &nbsp;
            <input type="submit" value="Delete" name="delete"><br>
              <form method=post action="insertdata.jsp?newtblfields=<%=rsmd.getColumnCount()%>&db=<%=db %>&table=<%=table %>">
           <br>
            &nbsp; &nbsp;Insert New Row
           <br>
           &nbsp; &nbsp; &nbsp;
           <%
           		for(int i=1;i<=rsmd.getColumnCount(); i++) { 
			%>
			<input type="text" name=<%="col" + i %> style="width: 100px;" maxlength=<%=rsmd.getColumnDisplaySize(i) %> >
            
            <%
            }
             %>
             <br>
             &nbsp; &nbsp; &nbsp; &nbsp;<input type="submit" value="Insert" name="insert">
            
          </form>
  </body>
</html>
