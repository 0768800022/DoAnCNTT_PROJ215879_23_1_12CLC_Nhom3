/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project.controller;

/**
 *
 * @author nguye
 */
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpSession;
import project.business.Cart;

import project.business.Invoice;
import project.business.Invoice_detail;
import project.business.LineItem;

public class EmailCheckOut {
    public static void sendInvoiceEmail(String toEmail, Invoice invoice, Cart cart) {
        String subject = "Your Invoice for the Recent Purchase";
        String body = buildEmailBody(invoice, cart);

        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("huycuong140203@gmail.com", "yquaqxoqimnxcvbm");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("huycuong140203@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject(subject);
            message.setText(body);

            // Send message
            Transport.send(message);
            System.out.println("Invoice Email sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static String buildEmailBody(Invoice invoice, Cart cart) {
        
        List<LineItem> listitem = cart.getItems();
        StringBuilder body = new StringBuilder();
        body.append("Thank you for your purchase!\n\n");
        body.append("Invoice Date: ").append(invoice.getInvoiceDate()).append("\n");
        body.append("Total Pay: $").append(invoice.getTotalPay()).append("\n\n");
        body.append("Products:\n");

        for(int i = 0 ; i < cart.getCount(); i++){
            LineItem item = listitem.get(i);
            body.append(item.getProduct().getProductName()).append(" - ");
            body.append("Quantity: ").append(item.getQuantity()).append(", ");
            body.append("Price: $").append(item.getProduct().getProductPrice()).append(", ");
            body.append("Total: $").append(item.getTotal()).append("\n");
        }
        return body.toString();
    }
}
