package com.kh.khis.login_join_mypage.util;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class EmailService {
	@Autowired
	private JavaMailSender javaMailSender;

	@RequestMapping("/simplemail")
	public void simpleMailSend(String to, String subject, String text) {
//		emailServiceImpl.sendSimpleMessage("jalve1521@gmail.com","홀리몰리", "깔끔쓰");
		try {
			MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    messageHelper.setFrom("khis.manager1@gmail.com"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo(to); // 받는사람 이메일
		    messageHelper.setSubject(subject); // 메일제목
		    messageHelper.setText(text); // 메일 내용
 
		    javaMailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
