package servlet;


import java.util.Properties;
import java.util.UUID;
import java.security.GeneralSecurityException;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.SendFailedException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

import com.sun.mail.util.MailSSLSocketFactory;
import java.io.IOException;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.activation.*;

@WebServlet("/Meeting")

public class Meeting extends HttpServlet
{


	private static final long serialVersionUID = 1L;
	
	public static Boolean sendEmail(Message msg){
		try {
			Transport.send(msg);
			return true;
		}catch (SendFailedException e) {
			System.out.println(e);
			return false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

public void service(HttpServletRequest request, HttpServletResponse response) 

		throws ServletException, IOException {


   Object tet =request.getAttribute("tet");
   @SuppressWarnings("unchecked")
   List<String> email=(ArrayList<String>)tet;
   
   String location =request.getParameter("location");
   
   
   String st =request.getParameter("start");
   String ed =request.getParameter("end");
   String dt =request.getParameter("date");
   int s=Integer.valueOf(st).intValue();
   int e=Integer.valueOf(ed).intValue();
   int d=Integer.valueOf(dt).intValue();
   
   String start=String.format("%04d",s-800);
   String end=String.format("%04d",e-800); 
   String sdate=dt; 
   String edate=dt;
   
   
   if(s>800 ) {

   }else if(e>800) {
	   start=String.format("%04d",s+1600);

	   sdate=String.format("%08d",d-1); 

   }else {
	   start=String.format("%04d",s+1600);
	   end=String.format("%04d",e+1600); 
	   sdate=String.format("%08d",d-1); 
	   edate=String.format("%08d",d-1);
   }

   
   
   
   String from = "351526562@qq.com";

  
   Properties props = new Properties();
	props.setProperty("mail.smtp.host", "smtp.qq.com");

	props.put("mail.smtp.auth", "true");
	   
	   props.put("mail.smtp.ssl.enable", "true");
	  
	Authenticator auth = new Authenticator() {
		@Override 
		protected PasswordAuthentication getPasswordAuthentication() {
			String username = "351526562@qq.com";
			String pwd = "azwfuubluuwxbhca";
			return new PasswordAuthentication(username, pwd);
		}
		};
		Session mailSession = Session.getInstance(props, auth);
		Message msg = new MimeMessage(mailSession);
		for(int i=0;i<email.size();i++) {
			String to=email.get(i);
			try {
				

		           msg.setFrom(new InternetAddress(from));
		           msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		           msg.setSubject("Interview");

		           StringBuffer sb = new StringBuffer();
		           
		           StringBuffer buffer = sb.append("BEGIN:VCALENDAR\n" +
		                   "PRODID:-//Microsoft Corporation//Outlook 9.0 MIMEDIR//EN\n" +
		                   "VERSION:2.0\n" +
		                   "METHOD:REQUEST\n" +
		                   "BEGIN:VEVENT\n" +
		                   "TZID:Asia/Shanghai\n"+
		                   "ATTENDEE;ROLE=REQ-PARTICIPANT;RSVP=TRUE:MAILTO:"+to+"\n" +
		                   "ORGANIZER:MAILTO:"+from+"\n" +
		                   "DTSTART:"+sdate+"T"+start+"00\n" +
		                   "DTEND:"+edate+"T"+end+"00\n" +
		                   "LOCATION:"+location+"\n" +
		                   "TRANSP:OPAQUE\n" +
		                   "SEQUENCE:0\n" +
		                   "UID:"+UUID.randomUUID().toString()+"\n" +
		                   "DTSTAMP:20120114T120102Z\n" +
		                   "CATEGORIES:Meeting\n" +
		                   "DESCRIPTION:This the time of the interview.\n\n" +
		                   "SUMMARY:Interview\n" +
		                   "PRIORITY:5\n" +
		                   "CLASS:PUBLIC\n" +
		                   "BEGIN:VALARM\n" +
		                   "TRIGGER:PT1440M\n" +
		                   "ACTION:DISPLAY\n" +
		                   "DESCRIPTION:Reminder\n" +
		                   "END:VALARM\n" +
		                   "END:VEVENT\n" +
		                   "END:VCALENDAR");
		         	            
		           BodyPart messageBodyPart = new MimeBodyPart();

		           messageBodyPart.setHeader("Content-Class", "urn:content-  classes:calendarmessage");
		           messageBodyPart.setHeader("Content-ID", "calendar_message");
		           messageBodyPart.setDataHandler(new DataHandler(
		                   new ByteArrayDataSource(buffer.toString(), "text/calendar;method=REQUEST")));

		           Multipart multipart = new MimeMultipart();

		           multipart.addBodyPart(messageBodyPart);

		           msg.setContent(multipart);
		           
		           
					msg.saveChanges();
				} catch (Exception ex) {
				}
				
		}
		sendEmail(msg);
		request.getRequestDispatcher("interview.jsp").forward(request, response);
}



}