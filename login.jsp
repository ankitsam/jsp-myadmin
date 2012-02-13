<%@ page language="java" import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1" %>
     <%
			String User = null;     
            String Pass = null;
            String Host = null;
            String Port = null;     		
            Class.forName("com.mysql.jdbc.Driver");
        	Connection con=null;
        	
            try {
            		User = (String)session.getAttribute("user");
            		Pass = (String)session.getAttribute("pass");
                    Host = (String)session.getAttribute("host");
                    Port = (String)session.getAttribute("port");
              	    con=DriverManager.getConnection("jdbc:mysql://"+Host +":" + Port,User,Pass);
    		} catch (Exception e){
    			response.sendRedirect("Index.jsp");
    		}
   %>
