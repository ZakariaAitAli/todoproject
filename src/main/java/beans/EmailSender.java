package beans;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    public void sendEmail(String to, String subject, String body) {
        // Configuration SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.example.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "587");

        // Créez une session SMTP avec authentification
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("votre_email", "votre_mot_de_passe");
            }
        });

        try {
            // Créez un message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("votre_email"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);

            // Envoyer le message
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        }
        }
    }
}