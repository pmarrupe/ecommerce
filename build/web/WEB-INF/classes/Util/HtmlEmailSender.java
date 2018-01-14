/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.util.Properties;
import javax.mail.Address;
 
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class HtmlEmailSender {
 
    public static void sendHtmlEmail(String to, String from, String subject, String body, boolean bodyIsHTML) throws AddressException,MessagingException 
    
    {
 
       
      Properties props=new Properties();
                props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");      

                 Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("prashanth.rock2010@gmail.com", "Ross@123");
			}
		  });

                 session.setDebug(true);

      Message message= new MimeMessage(session);
      message.setSubject(subject);
     
      if(bodyIsHTML){
      
          message.setContent(body, "text/html");
      }
      
      else{
      message.setText(body);
      }
      
      Address fromAddress=new InternetAddress(from);
      Address toAddress=new InternetAddress(to);
      
      message.setFrom(fromAddress);
      message.setRecipient(Message.RecipientType.TO, toAddress);
     
      Transport.send(message);
 
    }
}