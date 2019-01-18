<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>add</title>
</head>
<body  style="background:url(image/6.jpg) ;background-size:1000px 540px; background-position-x:50%">

<%
String interviewer=request.getParameter("interviewer");
String cname=request.getParameter("cname");
String email=request.getParameter("email");
String fname=request.getParameter("fname");
String date=request.getParameter("date");
String start=request.getParameter("start");
String end=request.getParameter("end");
String location=request.getParameter("location");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "123456");
Statement stmt=conn.createStatement();
String mysql="update process set id=id+1";
stmt.executeUpdate(mysql);
String sql="insert into process(interviewer,candidate,email,date,start,end,location,id,resume) values('"+interviewer+"','"+cname+"','"+email+"','"+date+"','"+start+"','"+end+"','"+location+"','1','"+fname+"')";
stmt.executeUpdate(sql);
stmt.close();
conn.close();
 %>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <center>
 <a style="font-size:20px" href="Send?cname=<%=cname%>&fname=<%=fname%>&email=<%=email%>&location=<%=location%>&date=<%=date%>&start=<%=start%>&end=<%=end%>&interviewer=<%=interviewer%>">more interview</a>
 <br>
 <br>
 <a style="font-size:25px" href="Send2?email=<%=email%>&location=<%=location%>&date=<%=date%>&start=<%=start%>&end=<%=end%>&interviewer=<%=interviewer%>">finish</a>
 </center>
 </body>
 </html>