package com.aspire.cake.bean;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import javax.mail.Session;
import javax.mail.Transport;

public class Email {
	public void sendMail(String email, String text)
	{
	      String recipient = email;
	      String username = "2k18cse091@kiot.ac.in";
	      String password = "2k18cse091";
	      String host = "localhost";
	      String subject = "Online Cake Shopping System";
	      Properties prop = new Properties();
	      prop.put("mail.smtp.auth", true);
	      prop.put("mail.smtp.starttls.enable", "true");
	      prop.put("mail.smtp.host", "smtp.gmail.com");
	      prop.put("mail.smtp.port", "25");
	      prop.put("mail.smtp.socketFactory.port", "465");    
          prop.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          prop.put("mail.smtp.auth", "true");    
          prop.put("mail.smtp.port", "465");    
	      prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	      
	      Session session = Session.getInstance(prop, new Authenticator() {
	    	    @Override
	    	    protected PasswordAuthentication getPasswordAuthentication() {
	    	        return new PasswordAuthentication(username, password);
	    	    }
	    	});
	      
	      try
	      {
	    	  Message message = new MimeMessage(session);
	    	  message.setFrom(new InternetAddress(username));
	    	  message.setRecipients(
	    	    Message.RecipientType.TO, InternetAddress.parse(recipient));
	    	  message.setSubject(subject);

	    	  String msg = text;

	    	  MimeBodyPart mimeBodyPart = new MimeBodyPart();
	    	  mimeBodyPart.setContent(msg, "text/html; charset=utf-8");

	    	  Multipart multipart = new MimeMultipart();
	    	  multipart.addBodyPart(mimeBodyPart);

	    	  message.setContent(multipart);

	    	  Transport.send(message);
	    	  //System.out.println("Email Successfully forwared");
	      }
	      catch(Exception e)
	      {
	    	  System.out.println(e);
	      }
	}
}
