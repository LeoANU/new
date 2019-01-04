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
			
			

			 String sql="SELECT distinct interviewer,candidate,email,time,resume from process";
			 ResultSet rs=st.executeQuery(sql);
			 while(rs.next()){
				 String candidate=rs.getString(2);
				 String email=rs.getString(3);
				 String time=rs.getString(4);
				 String resume=rs.getString(5);
				 String interviewer=rs.getString(1);
				 list.add(candidate);
				 list.add(email);
				 list.add(time);
				 list.add(resume);
				 list.add(interviewer);
				 
			 }

		} catch (Exception e) {

			e.printStackTrace();

		}

		request.setAttribute("plist",list);


		request.getRequestDispatcher("/Home2.jsp?uname="+uname+"").forward(request, response);



	}

}
