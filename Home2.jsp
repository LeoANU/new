<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>homepage</title>
</head>
<body style="background:url(image/2.jpg) ;background-size:1000px 540px; background-position-x:50%">
Hi user
<%
String uname=request.getParameter("uname");
out.print(uname);
%>
<a href="login.jsp">log out</a>
<center>
		<br>
		<br>
		<br>
		<h1 style="color:red;font-size:42px">Candidate</h1>
		<table border="6">
		<%
		int i=1;
		String pp=request.getParameter("page");
		if(pp==null){pp="1";}
		int p=Integer.parseInt(pp);
		%>
		  <tr>
		    <th>Candidate</th>
		    <th>Email</th>
		    <th>Date</th>
		    <th>Start time</th>
		    <th>End time</th>
		    <th>Location</th>
		    <th>Interviewer</th>
		    <th>Resume</th>
		    <th>comment</th>
		  </tr>
		
		  <c:forEach items="${plist}" var="pl" >
			<%if(i%10==1 & (20*p-20)<i & i<20*p+1){ %>
			<tr>
			<%} %>
			<%if(i%10==8 & (20*p-20)<i & i<20*p+1){ %>
			<td><a href="upload/${pl}">${pl}</a></td>
			<%}else if(i%10==0 & (20*p-20)<i & i<20*p+1){ %>
			<td><a href="comment.jsp?uname=<%=uname %>&id=${pl}">add comment</a></td>
			</tr>
			
			<%}else if((20*p-20)<i & i<20*p+1){ %>
			<td>${pl}</td>
			<%}  
			i++;%>
		  </c:forEach>
		 </table>
		 <br><br><br><br><br><br>
		 <a href="CandidateServlet2?page=<%=1 %>&uname=<%=uname %>">first page</a>
		 <%
		 int lastp=(int)(i+10)/20;
		 if(p>1){ %>
		 <a href="CandidateServlet2?page=<%=p-1 %>&uname=<%=uname %>">page up</a>
		 <%} %>
		 Page<%=p %>
		 <%if(p<lastp){ %>
		 <a href="CandidateServlet2?page=<%=p+1 %>&uname=<%=uname %>">page down</a>
		 <%} %>
		 <a href="CandidateServlet2?page=<%=lastp %>&uname=<%=uname %>">last page</a>
		 
</center>



</body>
</html>