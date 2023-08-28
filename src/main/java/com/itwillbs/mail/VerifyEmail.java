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

public class VerifyEmail {
	
    // 랜덤 인증번호 생성 메서드
    public static String generateVerificationCode() {
        Random random = new Random();
        int randomNumber = random.nextInt(9000) + 1000; // 범위: 1000 ~ 9999
        String randomNumberString = String.valueOf(randomNumber);
        return randomNumberString;
    }

	static String sender = "qkznlajrjd@gmail.com";
	static String receiver = "qkznlajrjd@gmail.com";
	static String title = "팜타스틱에서 보낸 인증번호 메일입니다.";
	static String content = generateVerificationCode();
		
	public String sendEmail(String receiverEmail) {
			
        // 자바 메일 세션 생성 및 인증 정보 설정
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("qkznlajrjd@gmail.com", "tamtjspkgwbfvwbb");
            }
        });
		
		try {
			// Message 객체 생성 및 속성 설정
			Message mailMessage = new MimeMessage(session);
			
			// 발신자 정보 설정
			Address sender_address = new InternetAddress(sender, "아이티윌");
			
			// 수신자 정보 설정
			Address receiver_address = new InternetAddress(receiverEmail);
			
			mailMessage.setHeader("content-type", "text/html; charset=UTF-8");
			mailMessage.setFrom(sender_address);
			mailMessage.addRecipient(RecipientType.TO, receiver_address);
			mailMessage.setSubject(title);
			mailMessage.setContent(content, "text/html; charset=UTF-8");
			mailMessage.setSentDate(new Date());
			
			// 메일 전송
			Transport.send(mailMessage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			return content;
		}
		
}

// 자바 메일 기능 사용 시 메일 서버 인증을 위한 인증 정보를 관리하는
// javax.mail.Authenticator 클래스를 상속받는 서브클래스 정의
class GoogleSMTPAuth extends Authenticator {
	// 인증 정보(아이디, 패스워드)를 관리할  
	// javax.mail.PasswordAuthentication 클래스 타입 변수 선언
	PasswordAuthentication passwordAuthentication;
	
	// 기본 생성자 정의	
	public GoogleSMTPAuth() {
		
		// 인증에 사용할 아이디와 패스워드 정보를 갖는 PasswordAuthentication 객체 생성
		// => 파라미터로 계정명과 패스워드 전달
		// => Gmail 기준 2단계 인증 미사용 시 Gmail 계정명, 패스워드 전달
		// => Gmail 기준 2단계 인증 사용 시 Gmail 계정명과 함께 패스워드 대신
		//    2단계 인증을 우회하는 앱비밀번호 전달
		//    (구글 계정 설정 - 보안 - Google 에 로그인 항목의 앱 비밀번호 설정 필요)
		//    (생성 항목 : 앱 선택 = 메일, 기기선택 = Windows 컴퓨터)
		//    => 생성 완료 시 나타나는 앱 비밀번호를 사용해야함
		// rwmqhdfknawxqnhx
		passwordAuthentication = new PasswordAuthentication(
				"qkznlajrjd@gmail.com", "rwmqhdfknawxqnhx");
	}

	// 인증 정보를 관리하는 PasswordAuthenticatin 객체를 외부로 리턴하는
	// getPasswordAuthentication() 메서드 오버라이딩
	// => 주의! Getter 메서드 정의 시 변수명에 따라 메서드명이 달라질 수 있으므로
	//    직접 정의하지 말 것!!
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
	
	
	
}


