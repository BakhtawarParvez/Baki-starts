<%@ page import="beans.Student" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="s" class="beans.Student"  scope="session"/>

<b>Hello,  <jsp:getProperty property="name" name="s"/></b><br>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>
<form action="Exam.jsp" method="post">
<input type="submit" value="Java Exam" name="javaexam">
</form>
<%
if(request.getParameter("javaexam")!=null)
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
    if(rs.next()==false)
    {
   %>
   <jsp:forward page="Javaexam.html"/>
   <% 	
    }
    else
    {
    	out.println("<br>Your one attempt is over.You can't give exam again");
    }
}
%>