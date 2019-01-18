<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in for administrator</title>
</head>
<body  style="background:url(image/3.jpg) ;background-size:1000px 540px; background-position-x:50%">
<a href="login.jsp" style="position:absolute;left:1;top:1; color:#FFFFFF" ><center><img src="image/0.jpg" style="opacity:0.8" width=30px><br>Back</center></a>
<br>
<br>
<br>
<br>
<br>
<br>
	<center>
		<h1 style="color:red;font-size:44px">Admin</h1>
		
		
		<form action="admincheck.jsp" method="post">
		<table border="0">
		<tr>
			<td>Account:</td>
			<td><input type="text" name="account" style="width:165px"  maxlength="30" ></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input type="password" name="password" style="width:165px" maxlength="16" ></td>
		</tr>

		</table>
			<input type="submit" value="    login    ">
			<input type="reset" value="    reset    ">
		</form>
			
	</center>


</body>
</html>