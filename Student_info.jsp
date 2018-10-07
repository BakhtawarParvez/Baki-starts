<%@page import="java.sql.*"%>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>

<%
String driver_name="com.mysql.jdbc.Driver";
String user="root";
String password="root";
String url="jdbc:mysql://localhost:3306/data";
	Class.forName(driver_name);
	Connection con= DriverManager.getConnection(url,user,password);
	Statement stmt=con.createStatement();
	String query="select * from student";
	ResultSet rs=stmt.executeQuery(query);
	out.println("<table border='2' bordercolor='green' cellpading='5' cellspacing='5' width='50%' height='50%'><tr><th ><u>NAME</u></th><th ><u>EMAIL ID </u></th><th ><u>MOBILE NUMBER</u></th><th ><u>CITY</u></th></tr>");
	while(rs.next())
	{
		out.println("<tr><td><b>"+rs.getString(1)+"</b></td>");
		out.println("<td><b>"+rs.getString(3)+"</b></td>");
		out.println("<td><b>"+rs.getString(5)+"</b></td>");
		out.println("<td><b>"+rs.getString(4)+"</b></td></tr>");
	}
	con.close();
	
%>
