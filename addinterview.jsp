<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>add</title>
</head>
<body>


<%
String interviewer=request.getParameter("interviewer");
String cname=request.getParameter("cname");
String email=request.getParameter("email");
String fname=request.getParameter("fname");
String time=request.getParameter("time");

Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/interview", "root", "123456");
Statement stmt=conn.createStatement();
String mysql="update process set id=id+1";
stmt.executeUpdate(mysql);
String sql="insert into process(interviewer,candidate,email,time,id,resume) values('"+interviewer+"','"+cname+"','"+email+"','"+time+"','1','"+fname+"')";
stmt.executeUpdate(sql);
stmt.close();
conn.close();
 %>
 <a href="interview.jsp?cname=<%=cname%>&email=<%=email%>&fname=<%=fname%>">more interview</a>
 <br>
 <a href="CandidateServlet">finish</a>
 </body>
 </html>