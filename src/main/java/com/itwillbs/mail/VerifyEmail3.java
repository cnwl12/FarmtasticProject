package com.itwillbs.mail;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class VerifyEmail3 {
    static String sender = "qkznlajrjd@gmail.com";
    static String title = "팜타스틱에서 보낸 문의 답변 메일입니다.";

    public void sendAnswerEmail(String receiverEmail, String answerContent) {

        // 답변 내용 설정
        String content = answerContent;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		// GoogleSMTPAuth3 인스턴스 생성
		GoogleSMTPAuth3 authenticator = new GoogleSMTPAuth3();
	
		Session session = Session.getInstance(props, authenticator);
			
		try {
		    Message mailMessage = new MimeMessage(session);
				
		    Address sender_address = new InternetAddress(sender, "아이티윌");	
		    Address receiver_address = new InternetAddress(receiverEmail);
				
		    mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
		    mailMessage.setFrom(sender_address);
		    mailMessage.addRecipient(RecipientType.TO, receiver_address);
		    mailMessage.setSubject(title);
		    mailMessage.setContent(content, "text/html; charset=UTF-8");
	        mailMessage.setSentDate(new Date());
				
            Transport.send(mailMessage);	
		} catch (Exception e) {
            e.printStackTrace();
		}
    }
}

class GoogleSMTPAuth3 extends Authenticator {
    PasswordAuthentication passwordAuthentication;
	
    public GoogleSMTPAuth3() {		
	passwordAuthentication =
            new PasswordAuthentication(
                // 이 부분에 실제 사용하는 Gmail 계정과 앱 비밀번호를 입력해야 합니다.
                // 2단계 인증이 설정된 경우 일반 비밀번호가 아닌 앱 비밀번호를 사용해야 합니다.
    				"qkznlajrjd@gmail.com", "tamtjspkgwbfvwbb");
     }

     @Override
     protected PasswordAuthentication getPasswordAuthentication() {
         return passwordAuthentication;
     }
}



