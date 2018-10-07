<%@ page import=" java.sql.*"%>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>

<%
String  name=request.getParameter("uname");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String city=request.getParameter("city");

String driver_name="com.mysql.jdbc.Driver";
String user="root";
String password="root";
String url="jdbc:mysql://localhost:3306/data";
	Class.forName(driver_name);
	Connection con=DriverManager.getConnection(url,user,password);
	String query="insert into student values(?,?,?,?,?)";
	PreparedStatement ps =con.prepareStatement(query);
	ps.setString(1,name);
	ps.setString(2,pass);
	ps.setString(3,email);
	ps.setString(4,city);
	ps.setString(5,mobile);
	ps.executeUpdate();
out.println("Registered susscessfully!!!!!");
con.close();
	    
%>
<br>
Press <a href="index.html">continue</a> to procede.