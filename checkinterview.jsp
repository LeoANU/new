<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background:url(image/2.jpg) ;background-size:1000px 540px; background-position-x:50%">
<a href="CandidateServlet" style="position:absolute;left:1;top:1; color:#292421" ><center><img src="image/0.jpg" style="opacity:0.6" width=30px><br>Back</center></a>

<center>
		<br>
		<br>
		<br>
		<br>
		<h1 style="color:red;font-size:42px">Interview</h1>
		<table border="6">
		<%int i=1; %>
		  <tr>
		    <th>Interviewer</th>
		    <th>Date</th>
		    <th>Start time</th>
		    <th>End time</th>
		    <th>Location</th>
		    <th>Comment</th>
		  </tr>
		
		  <c:forEach items="${mylist}" var="my" >
			<%if(i%6==1){ %>
			<tr>
			<%} %>
			<td>${my}</td>
			<%
			if(i%6==0){ %>
			</tr>
			<%} 
			i++;%>
		  </c:forEach>
		 </table>
</center>



</body>
</html>