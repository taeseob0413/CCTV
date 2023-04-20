package com.firstclass.childrenctv.util.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

@Service
public class GmailServiceImpl implements GmailService { 
	
	private String pw = createKey();
	
    @Value("${gmail.email}")
    private String user;
    @Value("${gmail.password}")
    private String password;
    @Override
    public void send(String email, String title, String text) {
        Properties prop = getProperties();
        Session session = getSession(prop);

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject(title);
            message.setContent(text, "text/html; charset=utf-8");
            Transport.send(message);
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


    private Session getSession(Properties prop) {
        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, password);
            }
        });
        return session;
    }
    
    private static Properties getProperties(){
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", 465);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        return prop;
    }
	
    public String send1(String email) {
	    System.out.println(this.user);
        System.out.println(this.password);
        System.out.println("인증 번호 : "+  pw);
        Properties prop = getProperties();
        Session session = getSession(prop);

        try {
        	MimeMessage message = new MimeMessage(session);   
        	message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));           
            message.setSubject("회원가입 인증 코드: ");
            String msg="";
    		msg += "<h1 style=\"font-size: 30px; padding-right: 30px; padding-left: 30px;\">이메일 주소 확인</h1>";
    		msg += "<p style=\"font-size: 17px; padding-right: 30px; padding-left: 30px;\">아래 확인 코드를 회원가입 화면에서 입력해주세요.</p>";
    		msg += "<div style=\"padding-right: 30px; padding-left: 30px; margin: 32px 0 40px;\"><table style=\"border-collapse: collapse; border: 1; background-color: #F4F4F4; height: 70px; table-layout: fixed; word-wrap: break-word; border-radius: 6px;\"><tbody><tr><td style=\"text-align: center; vertical-align: middle; font-size: 30px;\">";
    		msg += pw;
    		msg += "</td></tr></tbody></table></div>";
            message.setText(msg, "utf-8", "html");
            Transport.send(message);
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return pw;
    }
    
	//인증코드
	public static String createKey() {
        StringBuffer key = new StringBuffer();
        Random rnd = new Random();

        for (int i = 0; i < 6; i++) { // 인증코드 6자리
            key.append((rnd.nextInt(10)));
	        }
        return key.toString();
	}
		
}

