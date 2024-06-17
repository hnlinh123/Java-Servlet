/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;


import dao.UsersDAO;
import model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import utils.Utility;


/**
 *
 * @author dell
 */
public class EmailController {
    
    Utility utility = new Utility();
    

    public boolean sendEmail(String subject, String toAddress, String token, String message) throws AddressException, MessagingException, javax.mail.MessagingException {
        try {

            final String userName = "learnsoon123@gmail.com";
            final String password = "okiecheck1";

            String host = "smtp.gmail.com", port = "587";

            // sets SMTP server properties
            Properties properties = new Properties();
            properties.put("mail.transport.protocol", "smtp");
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", port);
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");

            // creates a new session with an authenticator
            Authenticator auth = new Authenticator() {

                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(userName, password);
                }
            };

            Session session = Session.getInstance(properties, auth);

            // creates a new e-mail message
            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress(userName));
            InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
            msg.setRecipients(Message.RecipientType.TO, toAddresses);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(message);

            // sends the e-mail
            Transport.send(msg);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }


    
    public void sendCaptcha(String captcha, String email) throws MessagingException{
        String subject = "Verify Captcha";
        String message = "Verfity code: "+ captcha;
        sendEmail(subject, email, utility.createCaptcha(), message);
    }
   

}
