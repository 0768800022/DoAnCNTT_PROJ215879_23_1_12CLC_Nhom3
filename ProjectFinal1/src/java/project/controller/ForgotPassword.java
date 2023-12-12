package project.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null || !email.equals("")) {
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String to = email;
            Properties pr = new Properties();
            pr.put("mail.smtp.host", "smtp.gmail.com");
            pr.put("mail.smtp.socketFactory.port", "465");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            pr.put("mail.smtp.auth", "true");
            pr.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(pr, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("huycuong140203@gmail.com", "yquaqxoqimnxcvbm");
                }
            });

            try {
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("You can get this code so as to getting your password");
                message.setText("Your OTP is: " + otpvalue);
                Transport.send(message);
                System.out.println("Message sent successfully");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }
            dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
            request.setAttribute("message", "OTP is sent to your email");
            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
        }
    }
}
