<%@ page import="java.sql.*"%>
<%@ page import="beans.Student" %>
<jsp:useBean id="s" class="beans.Student"  scope="session"/>

<b>Hello,  <jsp:getProperty property="name" name="s"/></b><br>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>
<%
if(request.getParameter("java")==null)
{
	out.println("<form action='Report.jsp' method='post'><br><input type='submit' name='java' value='Java Report'></form> ");
}
if(request.getParameter("java")!=null)
{
	String driver_name="com.mysql.jdbc.Driver";
    String user="root";
    String password="root";
    String url="jdbc:mysql://localhost:3306/data";
    Class.forName(driver_name);
    Connection con=DriverManager.getConnection(url,user,password);
    String query="select * from jreport where uname like '"+s.getName()+"'";
    Statement stmt =con.createStatement();
    ResultSet rs=stmt.executeQuery(query);
    if(rs.next()==true)
     {
    	out.println("<br><h1>YOUR REPORT</h1><br>");
        out.println("<br><b>Total number of questions:   </b>"+rs.getInt(6));
        out.println("<br><b>Number of questions attempted:   </b>"+rs.getInt(2));
        out.println("<br><b>Correct question:   </b>"+rs.getInt(3));
        out.println("<br><b>Total marks:   </b>"+rs.getInt(5));
     }
    else
    {
    	out.println("<br>Sorry,You didn't gave the exam.");
    	
    }
    con.close();
}
%>

