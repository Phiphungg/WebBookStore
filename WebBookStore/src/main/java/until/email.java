package until;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class email {
	// pw: giaf fwqp yoex stlq
	// email: piniepinie0102@gmail.com
	static final String from = "piniepinie0102@gmail.com";
	static final String password = "bxup wrvw sdou dbun";

	public static boolean sendEmail(String to, String content, String subject) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
		props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		// create Authenticator
		Authenticator auth = new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(from, password);
			}
		};

		// Phien lam viec
		Session session = Session.getInstance(props, auth);

		// gui email
//		final String to = "pipo010201@gmail.com";

		// tao mot tin nhan moi
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.setFrom(from);
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
			msg.setSubject(subject);
			msg.setSentDate(new Date());
			// nhan email phan hoi
			// msg.setReplyTo(InternetAddress.parse(from, false));

			// noi dung
			msg.setContent(content, "text/HTML");

			// gui mail
			Transport.send(msg);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static void main(String[] args) {
		email.sendEmail("pipo010201@gmail.com", "Dy la phan noi dung", "Test Email");
	}
}
