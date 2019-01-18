<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>upload</title>
</head>
<body  style="background:url(image/6.jpg) ;background-size:1000px 540px; background-position-x:50%">
<a href="CandidateServlet" style="position:absolute;left:1;top:1; color:#FFFFFF" ><center><img src="image/0.jpg" style="opacity:0.8" width=30px><br>Back</center></a>
<br>
<br>
<br>

<center>
<h1 style="color:red;font-size:42px">New candidate</h1>

<script type="text/javascript">	
		alert("please make sure that the file name is unique")
</script>
<form method="post" action="UploadServlet" enctype="multipart/form-data">
<table>

<h1>Basic information</h1>
<tr>
<td>candidate name</td>
<td><input type="text" name="cname"/></td>
</tr>
<tr>
<td>email</td>
<td><input type="text" name="email"/></td>
</tr>
<tr>
<td>resume</td>
<td><input type="file" name="file"/></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="next"/></td>
</tr>
</table>

</form>
</center>

</body>
</html>