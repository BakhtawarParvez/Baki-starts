<%@page import="beans.Student" %>
<img src="image-slider-1.jpg" alt="image not found" width="1500" height="200" border="3" align="top" />
<br>
<br>

<jsp:useBean id="s" class="beans.Student"  scope="session"/>

<%
session.invalidate();
%>

<jsp:forward page="index.html"/>
