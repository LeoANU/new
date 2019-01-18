package servlet;



import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.Statement;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CandidateServlet2")
@MultipartConfig
public class CandidateServlet2 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private static String jdbcDriver = "com.mysql.jdbc.Driver";

	public static String jdbcUrl = "jdbc:mysql://localhost:3306/interview";

	public static String jdbcUser = "root";

	public static String jdbcPwd = "123456";

	private static Connection conn;

	public static Statement st;

	

	static {

		try {

			Class.forName(jdbcDriver);

			conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);

			st = conn.createStatement();

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) //

			throws ServletException, IOException {

        List<String> list=new ArrayList<String>();
        String uname=request.getParameter("uname");
		try {
			 String sql="SELECT interviewer,candidate,email,date,start,end,location,id,resume,comment from process where interviewer like'%*"+uname+"%'";
			 ResultSet rs=st.executeQuery(sql);
			 while(rs.next()){
				 String interviewer=rs.getString(1);
				 String candidate=rs.getString(2);
				 String email=rs.getString(3);
				 String date=rs.getString(4);
				 String start=rs.getString(5);
				 String end=rs.getString(6);
				 String location=rs.getString(7);
				 String id=rs.getString(8);
				 String resume=rs.getString(9);
				 String comment=rs.getString(10);
				 list.add(candidate);
				 list.add(email);
				 list.add(date);
				 list.add(start);
				 list.add(end);
				 list.add(location);
				 list.add(interviewer);	
				 list.add(resume);
				 list.add(comment);
				 list.add(id);
				 			 
			 }

		} catch (Exception e) {

			e.printStackTrace();

		}

		request.setAttribute("plist",list);


		request.getRequestDispatcher("/Home2.jsp?uname="+uname+"").forward(request, response);



	}

}
