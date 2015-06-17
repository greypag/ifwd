package com.ifwd.fwdhk.mailutility;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SendMail {
	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;

	public void mailsend(String userName,String data) throws AddressException,
			MessagingException {
		SendMail javaEmail = new SendMail();

		javaEmail.setMailServerProperties();
		javaEmail.createEmailMessage(userName,data);
		javaEmail.sendEmail();
	}

	public void setMailServerProperties() {

		String emailPort = "587";//gmail's smtp port

		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");

	}

	public void createEmailMessage(String userName,String data) throws AddressException,MessagingException 
	{
		String[] toEmails = { userName };
		String emailSubject = "Your Password";
		String emailBody = "This is an email sent by Admin on your Mail ID  "+userName+" Refer : "+data;

		mailSession = Session.getDefaultInstance(emailProperties, null);
		emailMessage = new MimeMessage(mailSession);
		
		
		for (int i = 0; i < toEmails.length; i++) {
			emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmails[i]));
		}

		emailMessage.setSubject(emailSubject);
		emailMessage.setContent(emailBody, "text/html");//for a html email
		//emailMessage.setText(emailBody);// for a text email

	}

	public void sendEmail() throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "testmailsp77@gmail.com";//just the demo id 
		String fromUserEmailPassword = "suraj777";

		Transport transport = mailSession.getTransport("smtp");

		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		transport.close();
		
		
	}
}
