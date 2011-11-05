<%@ page language="java"import="java.sql.*" errorPage="error.jsp" pageEncoding="ISO-8859-1"%>
     <%
     					String User="root";
                        String Pass="root";
                        String Host="localhost";
                        String Port="3306";
                            
                            
					       
							
                    Class.forName("com.mysql.jdbc.Driver");        
                    Connection con=DriverManager.getConnection("jdbc:mysql://"+Host +":" + Port,User,Pass);       
                                   
   %>
