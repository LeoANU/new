<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<br>
		<br>
		<h1 style="color:red">comment</h1>


		 
		
		  <c:forEach items="${mylist}" var="my" >
			
			<br>${my}<br>
		
		  </c:forEach>

</center>

<a href="Home.jsp">back</a>

</body>
</html>