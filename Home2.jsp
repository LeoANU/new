<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homepage</title>
</head>
<body>
Hi user
<%
String uname=request.getParameter("uname");
out.print(uname);
%>

<center>
		<br>
		<br>
		<h1 style="color:red">candidate</h1>
		<table border="2">
		<%int i=1; %>
		  <tr>
		    <th>Candidate</th>
		    <th>Email</th>
		    <th>Time</th>
		    <th>Resume</th>
		    <th>Interviewer</th>
		  </tr>
		
		  <c:forEach items="${plist}" var="pl" >
			<%if(i%5==1){ %>
			<tr>
			<%} %>
			<%if(i%5!=0){ %>
			<td>${pl}</td>
			<%}
			else{ %>
			</tr>
			<%}  
			i++;%>
		  </c:forEach>
		 </table>
</center>
</body>
</html>