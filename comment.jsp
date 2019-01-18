<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>
</head>
<body style="background:url(image/2.jpg) ;background-size:1000px 540px; background-position-x:50%">


<%
String id=request.getParameter("id");
String uname=request.getParameter("uname");
%>
<a href="CandidateServlet2?uname=<%=uname %>" style="position:absolute;left:1;top:1; color:#000000" ><center><img src="image/0.jpg" style="opacity:0.8" width=30px><br>Back</center></a>

<center>
<br>
<br>
<br>
<h1 style="color:red;font-size:42px">Comment</h1>
<form action="addcomment.jsp" method="post">
<textarea name="comment" cols="30" rows="5" align="center"></textarea>
<input type="hidden" name="uname" value=<%=uname %>>
<input type="hidden" name="id" value=<%=id %>>
<br>
<input type="submit" value="submit">
<input type="reset" value="reset">
</form>
</center>



</body>
</html>