package com.itwillbs.service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;
import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Service;

@Service
public class EmailService {

    private Session mailSession;

    public EmailService() {
        Properties properties = System.getProperties();
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");

        Authenticator authenticator = new GoogleSMTPAuth();
        this.mailSession = Session.getDefaultInstance(properties, authenticator);
    }

    public void sendEmail(String sender, String receiver, String title, String content) {
        try {
            Message mailMessage = new MimeMessage(mailSession);
            Address sender_address = new InternetAddress(sender, "발신자");
            Address receiver_address = new InternetAddress(receiver);

            mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
            mailMessage.setFrom(sender_address);
            mailMessage.addRecipient(Message.RecipientType.TO, receiver_address);
            mailMessage.setSubject(title);
            mailMessage.setContent(content, "text/html; charset=UTF-8");
            mailMessage.setSentDate(new Date());

            Transport.send(mailMessage);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    private static class GoogleSMTPAuth extends Authenticator {
        private String email;
        private String password;

        public GoogleSMTPAuth() {
            this.email = System.getenv("MAIL_USER");
            this.password = System.getenv("MAIL_PASSWORD");
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(email, password);
        }
    }

}
