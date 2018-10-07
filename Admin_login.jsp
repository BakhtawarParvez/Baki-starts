<%@ page import=" java.sql.*"%>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>

<%
String  name=request.getParameter("uname");
String pass=request.getParameter("pass");

String driver_name="com.mysql.jdbc.Driver";
String user="root";
String password="root";
String url="jdbc:mysql://localhost:3306/data";
	Class.forName(driver_name);
	Connection con=DriverManager.getConnection(url,user,password);
	Statement stmt=con.createStatement();
	String query="select * from admin where uname='"+name+"'";
	ResultSet rs =stmt.executeQuery(query);
	   if(rs.next()) 
			{
				if(pass.equals(rs.getString(2))==true)
				{
		 %>
		 <jsp:forward page="Awelcome.jsp"/>
		 <% 
				}
				else
					{
					out.println("Wrong password");
				     %>
				     <a href="index.html">TRY AGAIN</a>
				     <% 
					}
			}
			else
			{
				out.println(" user not found register first");
				%>
				<a href="Sign_up.html">Sign up</a>
				
				<% 
			}
		con.close();
	    
%>