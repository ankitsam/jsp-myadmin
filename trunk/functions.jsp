<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%!
public int mysql_num_rows(ResultSet rset) throws SQLException {
        int current = 0;
        try {
        if (!rset.isBeforeFirst()) {
            current = rset.getRow();
            rset.beforeFirst();
        }
        }
        catch (Exception e) {
                return -1;
        }
        int number_of_rows=0;
        while (rset.next()) {
                number_of_rows++;
        }
        if (current!=0) {
            rset.absolute(current);
        }
        else {
            rset.beforeFirst();
        }
        return number_of_rows;
}
    %>