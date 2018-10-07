<%@ page import=" java.sql.*"%>
<%@page import="beans.Student" %>

<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>

<%
String  name=request.getParameter("uname");
String pass1=request.getParameter("pass");
%>

<jsp:useBean id="s" class="beans.Student"  scope="session"/>
<jsp:setProperty  name="s" property="name" value="<%=name%>"/>
<% 
String driver_name="com.mysql.jdbc.Driver";
String user="root";
String password="root";
String url="jdbc:mysql://localhost:3306/data";
	Class.forName(driver_name);
	Connection con=DriverManager.getConnection(url,user,password);
	Statement stmt=con.createStatement();
	String query="select * from student where user_name='"+name+"'";
	ResultSet rs =stmt.executeQuery(query);
	    if(rs.next()) 
		{
			if(pass1.equals(rs.getString(2))==true)
			{
	 %>
	 <jsp:forward page="Welcome.jsp"/>
	 <% 
			}
			else
				{
				out.println("Wrong password");
			     %>
			     <a href="Student_login.html">TRY AGAIN</a>
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
