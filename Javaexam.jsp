<%@ page import=" java.sql.*"%>
<%@page import="beans.Student" %>
<jsp:useBean id="s" class="beans.Student" scope="session"/>

<img src="F:\pics\Pictures\image-slider-1.jpg"/>
<b>Hello,   <jsp:getProperty property="name" name="s"/></b><br>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>
<%
String driver_name="com.mysql.jdbc.Driver";
String user="root";
String password="root";
String url="jdbc:mysql://localhost:3306/data";
	Class.forName(driver_name);
	Connection con=DriverManager.getConnection(url,user,password);
	Statement stmt=con.createStatement();
	  ResultSet rs1 =stmt.executeQuery("select count(*) from java_question");
  	rs1.next();
  	int toq=rs1.getInt(1);
  	session.setAttribute("toq",toq);
	String query="select question,option1,option2,option3,option4,qno,right_ans from java_question";
	ResultSet rs=stmt.executeQuery(query);
	
	rs.next();
	        out.println("Qno"+rs.getInt(6)+"<br>");		
	        out.println(rs.getString(1)+"<br>");
			out.println("<form action='Jexam.jsp' method='post'><br><input type='radio' name='option' value='option1'>"+rs.getString(2)+"<br><input type='radio' name='option' value='option2'>"+rs.getString(3)+"<br><input type='radio' name='option' value='option3'>"+rs.getString(4)+"<br><input type='radio' name='option' value='option4'>"+rs.getString(5)+"<br><input type='submit' name='submit' value='Save'>      <input type='submit' name='next' value='Next'></form>");
	        out.println("<br>==================================================================================<br>");
	
	      
	        
int noa=0;
int marks=0;
session.setAttribute("noa",noa);
session.setAttribute("obj",rs);
session.setAttribute("con",con);
session.setAttribute("marks",marks);

%>
